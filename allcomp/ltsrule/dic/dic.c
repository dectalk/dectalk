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
 *		1/28/97		ncs				Made one C file for multilanguages
 *		10/23/97	gl				add ENGLISH_UK support
 *      10/28/97    gl              add ir,er,ar,or,ur.df for US
 *      12/04/97    gl              add LINKRWORD for UK English
 *      06/29/98    gl              BATS#702 add DOUBLCONS for German
 */

#ifdef ENGLISH_US
#include "l_us_ph.h"
#endif

#ifdef ENGLISH_UK
#include "l_uk_ph.h"
#endif

#ifdef SPANISH
#include "l_sp_ph.h"
#define DIC_SP
#endif

#ifdef GERMAN
#include "l_gr_ph.h"
#define DIC_GR
#endif

/*
 * general defines ...
 */
                                                            
typedef struct PTAB {
	char p_graph;                /* Graphic code. */
	char p_phone;                /* Phonemic code */
} PTAB;
                          

/* Phoneme name table (again)   */                          
PTAB ptab[]  = {                     
#ifdef ENGLISH_US
	{ 'e',  EY      },
	{ 'a',  AA      },
	{ 'i',  IY      },
	{ 'E',  EH      },
	{ 'A',  AY      },
	{ 'I',  IH      },
	{ 'O',  OY      },
	{ 'o',  OW      },
	{ 'u',  UW      },
	{ '^',  AH      },
	{ 'W',  AW      },
	{ 'Y',  YU      },
	{ 'R',  RR      },
	{ 'c',  AO      },
	{ '@',  AE      },
	{ 'U',  UH      },
	{ '|',  IX      },
	{ 'x',  AX      },
	{ 'p',  P       },
	{ 't',  T       },
	{ 'k',  K       },
	{ 'f',  F       },
	{ 'T',  TH      },
	{ 's',  S       },
	{ 'S',  SH      },
	{ 'C',  CH      },
	{ 'w',  W       },
	{ 'y',  Y       },
	{ 'h',  HX      },
	{ 'l',  LL      },
	{ 'L',  EL      },
	{ 'N',  EN      },
	{ 'b',  B       },
	{ 'd',  D       },
	{ 'g',  G       },
	{ 'v',  V       },
	{ 'D',  DH      },
	{ 'z',  Z       },
	{ 'Z',  ZH      },
	{ 'J',  JH      },
	{ 'm',  M       },
	{ 'n',  N       },
	{ 'G',  NX      },
	{ 'r',  R       },
	{ 'q',  Q       },
	{ 'Q',  TX      },
	{ '&',  DX      },
        { 'F',  DF      },
        { 'B',  IR      },
        { 'K',  ER      },
        { 'P',  AR      },
        { 'M',  OR      },
        { 'j',  UR      },
#endif

#ifdef ENGLISH_UK
	{ '_', SIL		},
	{ 'i',	IY		},
	{ 'I',	IH		},
	{ 'e',	EY		},
	{ 'E',	EH		},
	{ '@',	AE		},
	{ 'a',	AA		},
	{ 'A',	AY		},
	{ 'W',	AW		},
	{ '^',	AH		},
	{ 'c',	AO		},
	{ 'o',	OW		},
	{ 'O',	OY		},
	{ 'u',	UW		},
	{ 'R',	RR		},
	{ 'Y',	YU		},
	{ 'U',	UH		},
	{ 'x',	AX		},
	{ '|',	IX		},
	{ 'w',	W		},
	{ 'y',	Y		},
	{ 'r',	R		},
	{ 'l',	LL		},
	{ 'h',	HX		},
	{ 'm',	M		},
	{ 'n',	N		},
	{ 'G',	NX		},
	{ 'L',	EL		},
	{ 'N',	EN		},
	{ 'f',	F		},
	{ 'v',	V		},
	{ 'T',	TH		},
	{ 'D',	DH		},
	{ 's',	S		},
	{ 'z',	Z		},
	{ 'S',	SH		},
	{ 'Z',	ZH		},
	{ 'p',	P		},
	{ 'b',	B		},
	{ 't',	T		},
	{ 'd',	D		},
	{ 'k',	K		},
	{ 'g',	G		},
	{ 'Q',	TX		},
	{ 'q',	Q		},
	{ 'J',	JH		},
	{ 'C',	CH		},
	{ 'F',	IR		},
	{ 'K',	ER		},
	{ 'P',	AR		},
	{ 'M',	OR		},
	{ 'j',	UR		},
	{ 'B',	OH		},
	{ 'V',	YR		},
	{ '&',	LINKRWORD		},
#endif

#ifdef SPANISH
	{ 'e',	E_E		},
	{ 'a',	E_A		},
	{ 'i',	E_I		},
	{ '2',	E_YH	},
	{ 'o',	E_O		},
	{ 'u',	E_U		},
	{ '1',	E_NH	},
	{ 'W',	E_WX	},
	{ 'Y',	E_YX	},
	{ 'R',	E_RR	},
	{ 'C',	E_CH	},
	{ 'l',	E_L		},
	{ 'p',	E_P		},
	{ 't',	E_T		},
	{ 'k',	E_K		},
	{ 'f',	E_F		},
	{ 'T',	E_TH	},
	{ 's',	E_S		},
	{ 'y',	E_Y		},
	{ 'L',	E_LL	},
	{ 'b',	E_B		},
	{ 'd',	E_D		},
	{ 'g',	E_G		},
	{ 'D',	E_DH	},
	{ 'z',	E_Z		},
	{ 'm',	E_M		},
	{ 'n',	E_N		},
	{ 'G',	E_GH	},
	{ 'r',	E_R		},
	{ 'q',	E_Q		},
	{ 'v', E_V		},
	{ 'I', E_IX		},
	{ 'M', E_MX		},
	{ 'P', E_PH		},
	{ 'N', E_NX		},
	{ 'w', E_W		},
	{ 'B',E_BH		},
	{ 'j',E_J 		},
#endif

#ifdef GERMAN
	{ 'a',A			},
	{ 'E',E			},
	{ 'V',AE		},
	{ '@',EX		},
	{ 'I',I			},
	{ 'c',O			},
	{ 'Q',OE		},
	{ 'U',U			},
	{ 'Y',UE		},
	{ '1',AH		}, 
	{ '2',EH		},
	{ '7',AEH		}, 
	{ '3',IH		},
	{ '4',OH		},
	{ 'q',OEH		},
	{ '5',UH		},
	{ 'y',UEH		},
	{ 'A',EI		},
	{ 'W',AU		},
	{ 'H',EU		},
	{ '8',AN		},
	{ '^',IM		},
	{ '9',UM		},
	{ '%',ON		},
	{ 'j',J			},
	{ 'l',L			},
	{ 'r',RR		},
	{ 'R',R			},
	{ 'h',H			},
	{ 'm',M			},
	{ 'n',N			},
	{ 'G',NG		},
	{ 'L',EL		},
	{ 'M',EM		},
	{ 'N',EN		},
	{ 'f',F			},
	{ 'v',V			},
	{ 's',S			},
	{ 'z',Z			},
	{ 'S',SH		},
	{ 'Z',ZH		},
	{ 'x',CH		},
	{ 'X',KH		},
	{ 'p',P			},
	{ 'b',B			},
	{ 'd',D			},
	{ 't',T			},
	{ 'k',K			},
	{ 'g',G			},
	{ '?',Q			},
	{ 'P',PF		},
	{ 'T',TS		},
	{ 'J',DJ		},
	{ 'C',TJ		},
	{ '?',KSX		},
	{ '&',DOUBLCONS	},
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



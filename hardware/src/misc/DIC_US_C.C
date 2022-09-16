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
 */

#include "l_us_ph.h"

/*
 * general defines ...
 */
                                                            
typedef struct PTAB {
	char p_graph;                /* Graphic code. */
	char p_phone;                /* Phonemic code */
} PTAB;
                          

/* Phoneme name table (again)   */                          
PTAB ptab[]  = {                     
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



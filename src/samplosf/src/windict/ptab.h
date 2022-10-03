/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996. All rights reserved.
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
 *		Date		Who		Description
 *		----		---		-----------
 *	001	1/28/97		ncs		Made one C file for multilanguages
 *  002	08/01/1997  MGS     Changed name to ptab.h and removed include at bottom
 * 	003	11/20/1997	MGS		Added UK phoneme tables
 *  004	10/05/2000	MGS		Redhat 6.2 and linux warning removal
 *  005 10/16/00	CAB		Changed copyright info
 */

#include "l_all_ph.h"
#if 0
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

#ifdef FRENCH
#include "l_fr_ph.h"
#define DIC_FR
#endif
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

/* MGS 11/19/1997 add UK copied from WIN32 windic */
#ifdef ENGLISH_UK
        { 'i',  UK_IY              },
        { 'I',  UK_IH              },
        { 'e',  UK_EY              },
        { 'E',  UK_EH              },
        { '@',  UK_AE              },
        { 'a',  UK_AA              },
        { 'A',  UK_AY              },
        { 'W',  UK_AW              },
        { '^',  UK_AH              },
        { 'c',  UK_AO              },
        { 'o',  UK_OW              },
        { 'O',  UK_OY              },
        { 'u',  UK_UW              },
        { 'R',  UK_RR              },
        { 'Y',  UK_YU              },
        { 'U',  UK_UH              },
        { 'x',  UK_AX              },
        { '|',  UK_IX              },
        { 'w',  UK_W               },
        { 'y',  UK_Y               },
        { 'r',  UK_R               },
        { 'l',  UK_LL              },
        { 'h',  UK_HX              },
        { 'm',  UK_M               },
        { 'n',  UK_N               },
        { 'G',  UK_NX              },
        { 'L',  UK_EL              },
        { 'N',  UK_EN              },
        { 'f',  UK_F               },
        { 'v',  UK_V               },
        { 'T',  UK_TH              },
        { 'D',  UK_DH              },
        { 's',  UK_S               },
        { 'z',  UK_Z               },
        { 'S',  UK_SH              },
        { 'Z',  UK_ZH              },
        { 'p',  UK_P               },
        { 'b',  UK_B               },
        { 't',  UK_T               },
        { 'd',  UK_D               },
        { 'k',  UK_K               },
        { 'g',  UK_G               },
        { 'Q',  UK_TX              },
        { 'q',  UK_Q               },
        { 'J',  UK_JH              },
        { 'C',  UK_CH              },
        { 'F',  UK_IR              },
        { 'K',  UK_ER              },
        { 'P',  UK_AR              },
        { 'M',  UK_OR              },
        { 'j',  UK_UR              },
        { 'B',  UK_OH              },
        { 'V',  UK_YR              },
#endif

#ifdef SPANISH
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
	{ 'y',GR_UEH		},
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


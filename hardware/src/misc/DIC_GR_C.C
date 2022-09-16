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
 *    File Name:     dic_gr_c.c
 *    Author:        JDB 
 *    Creation Date: 5/24/96
 *
 *    Functionality:
 *    Code specific to dictionary compilation for German language
 *
 ***********************************************************************
 *    Revision History:
 */

#include "l_gr_ph.h"

/*
 * general defines ...
 */

typedef struct PTAB {
	char    p_graph;                /* Graphic code.*/
	char    p_phone;                /* Phonemic code*/
} PTAB;

PTAB    ptab[]  = {                     /* Phoneme translation table    */
	{ 'a',A},
	{ 'E',E},
	{ 'V',AE},
	{ '@',EX},
	{ 'I',I},
	{ 'c',O},
	{ 'Q',OE},
	{ 'U',U},
	{ 'Y',UE},
	{ '1',AH}, 
	{ '2',EH},
	{ '7',AEH}, 
	{ '3',IH},
	{ '4',OH},
	{ 'q',OEH},
	{ '5',UH},
	{ 'y',UEH},
	{ 'A',EI},
	{ 'W',AU},
	{ 'H',EU},
	{ '8',AN},
	{ '^',IM},
	{ '9',UM},
	{ '%',ON},
	{ 'j',J},
	{ 'l',L},
	{ 'r',RR},
	{ 'R',R},
	{ 'h',H},
	{ 'm',M},
	{ 'n',N},
	{ 'G',NG},
	{ 'L',EL},
	{ 'M',EM},
	{ 'N',EN},
	{ 'f',F},
	{ 'v',V},
	{ 's',S},
	{ 'z',Z},
	{ 'S',SH},
	{ 'Z',ZH},
	{ 'x',CH},
	{ 'X',KH},
	{ 'p',P},
	{ 'b',B},
	{ 'd',D},
	{ 't',T},
	{ 'k',K},
	{ 'g',G},
	{ '?',Q},
	{ 'P',PF},
	{ 'T',TS},
	{ 'J',DJ},
	{ 'C',TJ},
	{ '?',KSX},
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

#define DIC_GR
#include "dic_comm.c"

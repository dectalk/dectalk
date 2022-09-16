/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1996, 1998, 1999     */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Digital Equipment Corporation.               */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Digital assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */

/*
 * This file is the phoneme tables to go into the dapi so that 
 * windic can return this information
 * also provides the phoneme data for hardware user-dictionary compilers
 *
 * 001	01/07/1997	MGS	File Created
 * 002  06/22/1998	Added support for SPANISH_LA
 * 003	31mar99		tek		add udic_us call for user-dictionary arpabet list
 * 004  07July99        gl              include udic_la.c for SPANISH_LA
 */


#ifdef ENGLISH_US
#include "l_us_ph.h"
#endif

/* GL 10/20/97 add UK */
#ifdef ENGLISH_UK
#include "l_uk_ph.h"
#endif

#ifdef SPANISH_SP	/* TQL: Added 04/02/97 */
#include "l_sp_ph.h"
#endif

#ifdef SPANISH_LA	/* TQL: Added 06/22/98 */
#include "l_la_ph.h"
#endif


#ifdef GERMAN	/* TQL: Added 04/02/97 */
#include "l_gr_ph.h"
#endif


// tek 31mar99 if this is a user-dictionary compile, pull in the udic_xx.c files
// to pick up the arpabet table.
#ifdef USERDIC_COMPILE
#pragma message("This is a USERDIC_COMPILE")
#ifdef ENGLISH_US
#include "udic_us.c"
#endif

/* GL 10/20/97 add UK */
#ifdef ENGLISH_UK
#include "udic_uk.c"
#endif

#ifdef SPANISH_SP
#include "udic_sp.c"
#endif

#ifdef SPANISH_LA
#include "udic_la.c"
#endif

#ifdef GERMAN	
#include "udic_gr.c"
#endif
#else
#pragma message("This is NOT a USERDIC_COMPILE")

#endif //USERDIC_COMPILE


typedef	struct	PTAB {
	char	p_graph;		/* Graphic code.		*/
	char	p_phone;		/* Phonemic code.		*/
}	PTAB;

#ifdef ENGLISH_US

static PTAB	ptab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	EY	},
	{ 'a',	AA	},
	{ 'i',	IY	},
	{ 'E',	EH	},
	{ 'A',	AY	},
	{ 'I',	IH	},
	{ 'O',	OY	},
	{ 'o',	OW	},
	{ 'u',	UW	},
	{ '^',	AH	},
	{ 'W',	AW	},
	{ 'Y',	YU	},
	{ 'R',	RR	},
	{ 'c',	AO	},
	{ '@',	AE	},
	{ 'U',	UH	},
	{ '|',	IX	},
	{ 'x',	AX	},
	{ 'p',	P	},
	{ 't',	T	},
	{ 'k',	K	},
	{ 'f',	F	},
	{ 'T',	TH	},
	{ 's',	S	},
	{ 'S',	SH	},
	{ 'C',	CH	},
	{ 'w',	W	},
	{ 'y',	Y	},
	{ 'h',	HX	},
	{ 'l',	LL	},
	{ 'L',	EL	},
	{ 'N',	EN	},
	{ 'b',	B	},
	{ 'd',	D	},
	{ 'g',	G	},
	{ 'v',	V	},
	{ 'D',	DH	},
	{ 'z',	Z	},
	{ 'Z',	ZH	},
	{ 'J',	JH	},
	{ 'm',	M	},
	{ 'n',	N	},
	{ 'G',	NX	},
	{ 'r',	R	},
	{ 'q',	Q	},
	{ 'Q',	TX	},
	{ '&',	DX	},
        { 'F',  DF      },
        { 'B',  IR      },
        { 'K',  ER      },
        { 'P',  AR      },
        { 'M',  OR      },
        { 'j',  UR      },
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

#endif

/* GL 10/20/97 add UK */
#ifdef ENGLISH_UK
static PTAB	ptab[]	= {			/* Phoneme name table (again)	*/
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

#endif



#ifdef SPANISH_SP	/* TQL: Added 04/02/97 */

static PTAB	ptab[]	= {			/* Phoneme name table (again)	*/
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

#endif


#ifdef SPANISH_LA/* TQL: Added 06/22/98 */

static PTAB	ptab[]	= {			/* Phoneme name table (again)	*/
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

#endif

#ifdef GERMAN	/* TQL: Added 04/02/97 */

static PTAB    ptab[]  = {                     /* Phoneme translation table    */
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

#endif

#define	NPTAB	(sizeof(ptab)/sizeof(struct PTAB))


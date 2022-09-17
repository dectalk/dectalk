/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: toph.c,v $
 * Revision 1.2.2.2  1994/11/07  22:54:27  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:35:15  Krishna_Mangipudi]
 *
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
#include "defs.h"
#include "l_us_ph.h"
#include "cmd.h"


typedef	struct	PTAB {
	char	p_graph;		/* Graphic code.		*/
	char	p_phone;		/* Phonemic code.		*/
}	PTAB;

PTAB	ptab[]	= {			/* Phoneme name table (again)	*/
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

#define	NPTAB	(sizeof(ptab)/sizeof(struct PTAB))

unsigned char toph(c)
char *c;
{
	int	i;	

	for(i=0;i<NPTAB;i++)
		if(*c == ptab[i].p_graph)
			return(ptab[i].p_phone);
	error_exit("Unknown phoneme found",c);
}


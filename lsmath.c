/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	lsmacth.c
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
 
#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include	"lsdef.h"
#include	"lsconst.h"

/*
 */
#ifndef SINGLE_THREADED
extern	P_PIPE	kinp;
#endif

#ifdef MATH_MODE
struct math_symbols {
	unsigned char 	sym;
	unsigned char *sym_pron;
};

const struct math_symbols math_table[] = {

	{'+',"pl'^s"},
	{'-',"m'An|s"},
	{'*',"m'^lt|plAd*bA"},
	{'/',"d|v'Ad|d*bA"},
	{'^',"tU*Dx*p'WR*xv"},
	{'<',"l'Es*DEn"},
	{'>',"gr'etR*DEn"},
	{'=',"'ikwLz"},
	{'%',"pRs'Ent"},
	{'.',"p'Ont"},
	{0,0}
};
#endif

#ifdef MATH_MODE
int do_math(unsigned char check_char)
{
	struct math_symbols *ms;

/*
 * this must be a single character and mode math must be enabled ...
 */

	if(KS.modeflag & MODE_MATH)
		{
		ms = math_table;
		while((*ms).sym)
			if((*ms).sym == check_char)
				{
				flush_ascky((*ms).sym_pron);
				return(true);
				}
			else
				ms += 1;
		}
	return(false);
}
#endif
#ifdef MATH_MODE
typedef	struct	ascky_table {
	char	p_graph;					/* Graphic code.		*/
	unsigned int	p_phone;		/* Phonemic pipe code.		*/
}	ASCKY_TAB;


const ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	(PFUSA<<PSFONT)+EY	},
	{ 'a',	(PFUSA<<PSFONT)+AA	},
	{ 'i',	(PFUSA<<PSFONT)+IY	},
	{ 'E',	(PFUSA<<PSFONT)+EH	},
	{ 'A',	(PFUSA<<PSFONT)+AY	},
	{ 'I',	(PFUSA<<PSFONT)+IH	},
	{ 'O',	(PFUSA<<PSFONT)+OY	},
	{ 'o',	(PFUSA<<PSFONT)+OW	},
	{ 'u',	(PFUSA<<PSFONT)+UW	},
	{ '^',	(PFUSA<<PSFONT)+AH	},
	{ 'W',	(PFUSA<<PSFONT)+AW	},
	{ 'Y',	(PFUSA<<PSFONT)+YU	},
	{ 'R',	(PFUSA<<PSFONT)+RR	},
	{ 'c',	(PFUSA<<PSFONT)+AO	},
	{ '@',	(PFUSA<<PSFONT)+AE	},
	{ 'U',	(PFUSA<<PSFONT)+UH	},
	{ '|',	(PFUSA<<PSFONT)+IX	},
	{ 'x',	(PFUSA<<PSFONT)+AX	},
	{ 'p',	(PFUSA<<PSFONT)+P	},
	{ 't',	(PFUSA<<PSFONT)+T	},
	{ 'k',	(PFUSA<<PSFONT)+K	},
	{ 'f',	(PFUSA<<PSFONT)+F	},
	{ 'T',	(PFUSA<<PSFONT)+TH	},
	{ 's',	(PFUSA<<PSFONT)+S	},
	{ 'S',	(PFUSA<<PSFONT)+SH	},
	{ 'C',	(PFUSA<<PSFONT)+CH	},
	{ 'w',	(PFUSA<<PSFONT)+W	},
	{ 'y',	(PFUSA<<PSFONT)+Y	},
	{ 'h',	(PFUSA<<PSFONT)+HX	},
	{ 'l',	(PFUSA<<PSFONT)+LL	},
	{ 'L',	(PFUSA<<PSFONT)+EL	},
	{ 'N',	(PFUSA<<PSFONT)+EN	},
	{ 'b',	(PFUSA<<PSFONT)+B	},
	{ 'd',	(PFUSA<<PSFONT)+D	},
	{ 'g',	(PFUSA<<PSFONT)+G	},
	{ 'v',	(PFUSA<<PSFONT)+V	},
	{ 'D',	(PFUSA<<PSFONT)+DH	},
	{ 'z',	(PFUSA<<PSFONT)+Z	},
	{ 'Z',	(PFUSA<<PSFONT)+ZH	},
	{ 'J',	(PFUSA<<PSFONT)+JH	},
	{ 'm',	(PFUSA<<PSFONT)+M	},
	{ 'n',	(PFUSA<<PSFONT)+N	},
	{ 'G',	(PFUSA<<PSFONT)+NX	},
	{ 'r',	(PFUSA<<PSFONT)+R	},
	{ 'q',	(PFUSA<<PSFONT)+Q	},
	{ 'Q',	(PFUSA<<PSFONT)+TX	},
	{ '&',	(PFUSA<<PSFONT)+DX	},
	{ ',', 	(PFUSA<<PSFONT)+COMMA	},
	{ ' ',	(PFUSA<<PSFONT)+WBOUND	},
	{ '\t',	(PFUSA<<PSFONT)+WBOUND	},
	{ '\'',	(PFUSA<<PSFONT)+S1	},
	{ '`',	(PFUSA<<PSFONT)+S2	},
	{ '"',	(PFUSA<<PSFONT)+SEMPH	},
	{ '#',	(PFUSA<<PSFONT)+HYPHEN	},
	{ '(',	(PFUSA<<PSFONT)+PPSTART },
	{ ')',	(PFUSA<<PSFONT)+VPSTART },
	{ '*',	(PFUSA<<PSFONT)+MBOUND	},
	{ '~',	(PFUSA<<PSFONT)+BLOCK_RULES },
	{ '-',	(PFUSA<<PSFONT)+SBOUND 	}
};

#define	NATAB	(sizeof(ascky_tab)/sizeof(struct ascky_table))

void flush_ascky(str)
unsigned char *str;
{
	int	i;	

	while(*str)
		{
		for(i=0;i<NATAB;i++)
			if(*str == ascky_tab[i].p_graph)
				{
#ifdef SINGLE_THREADED
				lts_loop(&ascky_tab[i].p_phone);
#else
				write_pipe(kinp,&ascky_tab[i].p_phone,1);
#endif
				break;
				}
		str += 1;
		}
}
#endif

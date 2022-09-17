#include "defs.h"
#include "l_gr_ph.h"
#include "cmd.h"


typedef	struct	PTAB {
	char	p_graph;		/* Graphic code.		*/
	char	p_phone;		/* Phonemic code.		*/
}	PTAB;

PTAB	ptab[]	= {			/* Phoneme name table (again)	*/
        { 'a',  A },
        { 'E',  E },
        { 'V',  AE },
        { '@',  EX },
        { 'I',  I },
        { 'c',  O },
        { 'Q',  OE },
        { 'U',  U },
        { 'Y',  UE },
        { '1',  AH },
        { '2',  EH },
        { '7',  AEH },
        { '3',  IH },
        { '4',  OH },
        { 'q',  OEH },
        { '5',  UH },
        { 'y',  UEH },
        { 'A',  EI },
        { 'W',  AU },
        { 'H',  EU },
        { '8',  AN },
        { '^',  IM },
        { '9',  UM },
        { '%',  ON },
        { 'j',  J },
        { 'l',  L },
        { 'r',  RR },
        { 'R',  R },
        { 'h',  H },
        { 'm',  M },
        { 'n',  N },
        { 'G',  NG },
        { 'L',  EL },
        { 'M',  EM },
        { 'N',  EN },
        { 'f',  F },
        { 'v',  V },
        { 's',  S },
        { 'z',  Z },
        { 'S',  SH },
        { 'Z',  ZH },
        { 'x',  CH },
        { 'X',  KH },
        { 'p',  P },
        { 'b',  B },
        { 't',  T },
        { 'd',  D },
        { 'k',  K },
        { 'g',  G },
        { '|',  Q },
        { 'P',  PF },
        { 'T',  TS },
        { 'J',  DJ },
        { 'C',  TJ },
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

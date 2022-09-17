/*
 *  lts rule compiler ... first include everything we need ...
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <sys\types.h>
#include <time.h>
#include "ls_defs.h"

#define FP_SEG(fp) (unsigned int)(*((unsigned _far *)&(fp)+1))
#define FP_OFF(fp) (unsigned int)(*((unsigned _far *)&(fp)))

#define	NBTAB		80000			/* Size of the "byte" table.	*/
#define	NWTAB		80000			/* Size of the "word" table.	*/
#define	NBUF		128			/* Size of random name buffer.	*/
#define	NFNAME	32				/* Size of a feature name.	*/
#define	NDJUNC	10				/* Size of disjunction buffer.	*/
#define	PATCHED	0				/* Looks.			*/

/*
 * The "lsread" routine	allocates
 * a "RULE" structure for each rule it
 * reads. The rules are kept in linked lists,
 * indexed by the rightmost grapheme. The listheads
 * live in the "lsrule" array. The 4 character
 * pointers always point into the "lsbtab"
 * array.
 */

typedef	struct	RULE_type {
	struct RULE_type 	_far *r_rulep;	/* Link to the next rule */
	short	r_line;				/* Line # of the rule 	*/
	short	r_count;			/* # of the rule usage 	*/
        short   r_lang;                 	/* Rule's language tag          */
	char 	_far *r_graphp;			/* Link to graphemes (R-to-L) */
	char 	_far *r_phonep;			/* Link to phonemes (R-to-L) */
	char 	_far *r_leftp;			/* Left context (R-to-L) */
	char 	_far *r_rightp;			/* Right context (L-to-R) */
}	RULE;

typedef	struct	RULE_data {
	short	line;				/* Line # of the rule 	*/
	char 	_far *data;			/* line data */
	struct RULE_data _far *next;		/* Link to the next rule */
};

typedef	struct	DICT_data {
	short	match;				/* match flag. set if match with rule output */
	unsigned int line;			/* Line # of the dictionary 	*/
	char 	*grapheme;			/* grapheme data */
	char 	*phoneme;			/* phoneme data */
	char 	*homoflag;			/* homograph flag */
	int 	formclass;			/* formcalss data */
	char 	*phoneme_lts;			/* phoneme data from rule engine */
	char 	_far *data;			/* line data */
	struct DICT_data _far *next;		/* Link to the next line */
};

/*
 * An environment is compiled
 * into a list of "ENODE" structures.
 * The "ENODE" list is packed into a linear
 * list of rule bytes after it is all parsed.
 * This is necessary because the left envoronment
 * has to be packed backwards. If the low and
 * high limits are both 0 => no repeat count was
 * specified in the input.
 */

typedef struct	ENODE_type	{
	short	e_type;				/* Type of node			*/
	struct ENODE_type _far *e_nextp;	/* Link to next ENODE in chain	*/
	short	e_llim;				/* Low limit			*/
	short	e_hlim;				/* High limit			*/
	short	e_mask;				/* Feature mask flags		*/
	short	e_test;				/* Feature test flags		*/
	short	_far *e_djunc[];		/* Array of disjunction ENODE	*/
} ENODE;


extern RULE _far *lsrule[];			/* RULE chain list heads.	*/
#if 0
extern char _far 	*lsbtab;		/* Byte array.			*/
extern char	_far 	*lsbp;			/* Work pointer into above.	*/
extern unsigned int 	lsb_size;		/* End pointer for bounds checks */
extern short _far 	*lswtab;		/* Word array.			*/
extern short _far 	*lswp;			/* Work pointer into above.	*/
extern unsigned int 	lsw_size;		/* End pointer for bounds checks */
extern int		line;			/* Line number, for messages.	*/
#endif

/*
 *  file names and pointers ...
 */

extern FILE	*rulFile;
extern char rulFileName[256];
extern FILE	*ltsFile;
extern char ltsFileName[256];


ENODE	 _far *ecompile(void);
ENODE  _far *efeature(void);
ENODE	 _far *edisjunc(void);
char _far *epack(ENODE _far *,short);
short featbits(char _far *);
void edump(char  *,ENODE _far *, short);
void pdump(char  *,char  *);
char ptrans(char);
void lspack();
void saveword(unsigned char _far *);
void savebyte(char);
char getnb(int);
char get(void);
void unget(char);

/*BOOL 	ltsFileOpen(void);*/
/*void FAR PASCAL fatal(char *);*/
/*void fatal(char *);*/
/*void	lsread(char *fn, int vflag);*/
void	lsread();
void	lts_main(void);


#define IDS_ERR_REGISTER_CLASS   1
#define IDS_ERR_CREATE_WINDOW    2

extern char szString[128];   /* variable to load resource strings         */
extern char szAppName[20];   /* class name for the window               */
/*extern HWND hInst;          */
/*extern HWND hWndMain;       */


#define	LTS_NO_ACNA			1
#define	LTS_ACNA			2

#define	LTS_ENGLISH			1
#define	LTS_GERMAN			2
#define	LTS_FRENCH			3
#define	LTS_SPANISH			4

/*
 * Language group identifiers.
 */

#define NAME_ENGLISH                    0
#define NAME_FRENCH                     1
#define NAME_GERMANIC                   2
#define NAME_IRISH                      3
#define NAME_ITALIAN                    4
#define NAME_JAPANESE                   5
#define NAME_SLAVIC                     6
#define NAME_SPANISH                    7

/*
 * The following masks are used in performing rule matching.
 */

#define M_R_LANG        0x7FFF          /* rule's language tag field */
#define M_R_SPECIFIC    0x8000          /* rule's specificity field */

/*
LONG FAR PASCAL WndProc(HWND, WORD, WORD, LONG);
int nCwRegisterClasses(void);
void CwUnRegisterClasses(void);
*/

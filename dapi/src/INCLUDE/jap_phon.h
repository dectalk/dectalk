/*
 *  Japanese phonemes ... non-allophonic symbols redefined to match
 *  standard control phones ...
 */

#include	"com_phon.h"

#define SIL             0
#define I               1
#define E               2
#define A               3
#define O               4
#define U               5
#define YE              6
#define YA              7
#define YO              8
#define YU              9
#define WI              10
#define WE              11
#define WA              12
#define WO              13
#define H               14
#define M               15
#define N               16
#define NX              17      /* Syllabic [ng]                        */
#define EM              18      /* Syllabic [m]                         */
#define EN              19      /* Syllabic [n]                         */
#define NV              20      /* Nasalized vowel                      */
#define BH              21      /* Labial voiced fricative              */
#define F               22      /* /h/ before /u/                       */
#define DH              23      /* Alveolar voiced fricative            */
#define S               24
#define Z               25
#define CX              26      /* Palatal voiceless fricative          */
#define SH              27
#define ZH              28
#define GH              29      /* Velar voiced fricative               */
#define R               30      /* Retroflex flap                       */
#define P               31
#define B               32
#define T               33
#define D               34
#define K               35
#define G               36
#define TS              37      /* Dental voiceless affricate           */
#define DZ              38      /* Dental voiced affricate              */
#define CH              39
#define JH              40

#define TOT_ALLOPHONES  41      /* Total number of different phones     */


#define BLOCK_RULES     41      /* Block allophone substitutions        */
#define ACCENT_RISE     42      /* Accent rise symbol '''               */
#define STRONG_RISE     43      /* Strong accent rise symbol '/'        */
#define ACCENT_FALL     44      /* Accent fall symbol '`'               */
#define STRONG_FALL     45      /* Strong accent fall symbol '\'        */
#define LONG_PHONE      46      /* Long phoneme                         */
#define NEW_PARAGRAPH   47      /* Begin new paragraph                  */
/* Note that only the one strongest of following allowed between 2 words */
#define ABOUND          48      /* Affix boundary                       */
#define WBOUND          49      /* Word boundary                        */
#define PBOUND          50      /* Phrase boundary                      */
#define CBOUND          51      /* Clause boundary                      */
#define SBOUND          52      /* Sentence boundary (statement         */
#define QBOUND          53      /* Sentence boundary (question)         */

#define PHO_SYM_TOT     54      /* # of symbols in this table           */




#ifndef PHDEFSH
#define PHDEFSH 1


#define FSTRESS           03		   /* Stress feature bits                  	*/
#define FNOSTRESS          0		   /* Value of FSTRESS if not stressed    	*/
#define FSTRESS_1         01		   /* Value of FSTRESS for primary stress 	*/
#define FSTRESS_2         02		   /* Value of FSTRESS for secondary stres 	*/
#define FEMPHASIS         03		   /* Value of FSTRESS for emphasis       	*/
#define FWINITC           04		   /* Word-initial consonant               	*/
#define FFIRSTSYL        010		   /* Value of FSYL_STRUC for first syll  	*/
#define FMONOSYL           0		   /* Value of FSYL_STRUC for monosyll    	*/
#define FSYBNEXT        0040		   /* Value of FBOUNDARY if syllable bound 	*/
#define FTYPESYL         030		   /* Syllable structure feature bits      	*/
#define FMEDIALSYL       020		   /* Value of FSYL_STRUC for medial syll 	*/
#define FFINALSYL        030		   /* Value of FSYL_STRUC for final syll  	*/
#define FBOUNDARY       0740		   /* Following boundary type feature bits 	*/
#define FNO_BOUNDARY       0		   /* Value of FBOUNDARY if rhyme not final */

/* eab 4/94 marks a sylb at word breaks too */

#define FMBNEXT         0100		   /* Value of FBOUNDARY if morpheme bound 	*/
#define FWBNEXT         0140		   /* Value of FBOUNDARY if word boundary 	*/
#define FPPNEXT         0200		   /* Value of FBOUNDARY if prep phrase   	*/
#define FVPNEXT         0240		   /* Value of FBOUNDARY if verb phrase   	*/
#define FRELNEXT        0300		   /* Value of FBOUNDARY if rel clause    	*/
#define FCBNEXT         0340		   /* Value of FBOUNDARY if comma         	*/
#define FPERNEXT        0400		   /* Value of FBOUNDARY if period        	*/
#define FQUENEXT        0440		   /* Value of FBOUNDARY if quest mark    	*/
#define FEXCLNEXT       0500		   /* Value of FBOUNDARY if excalation    	*/

#define FSENTENDS       0400		   /* Next boundary is a sentence end      	*/ 

#define FHAT_BEGINS     01000
#define FHAT_ENDS       02000

#define AT_BOTTOM_OF_HAT        1
#define AT_TOP_OF_HAT           2

#define FDUMMY_VOWEL    004000		   /* Do not count this plosive release gesture */

#define FHYPHENATED     010000

#define FBLOCK          020000

#define PHO_FEA_MAX     14			   /* # of features in struc[] structure   		*/
#define FMAXIMUM        037777		   /* Any feature > this is illegal        		*/

#define FSYLL   0000001				   /* Syllabic: vowels + /el/, /em/, /en/       */
#define FVOICD  0000002				   /* Regular, except /tq/ is [+voicd]          */
#define FVOWEL  0000004				   /* Vowels                                    */
#define FSON1   0000010				   /* [+sonor], except not /si/ and /h/         */
#define FSONOR  0000020				   /* [-obst], except /q/ is [-sonor, -obst]    */
#define FOBST   0000040				   /* Regular, except /q/ is [-obst]            */
#define FPLOSV  0000100				   /* Plosives, excluding affricates            */
#define FNASAL  0000200				   /* Nasals                                    */
#define FCONSON 0000400				   /* [-syll], except for /si/ and /q/          */
#define FSONCON 0001000				   /* Voiced liq. and glides: w, y, r, l, rx, lx*/
#define FSON2   0002000				   /* /w, y, r, l, yu/, /m, n, ng, em, en/      */
#define FBURST  0004000				   /* plosives and affricates                   */
#define FSTMARK 0010000				   /* [', `, !]                                 */
#define FSTOP   0020000				   /* Plosives, affricates, and nasals          */

#define FSBOUND 010000

#define FLABIAL 0000001				   /* p, b, m, f, v                        */
#define FDENTAL 0000002				   /* th, dh, d$                           */
#define FPALATL 0000004				   /* sh, zh, ch, jh                       */
#define FALVEL  0000010				   /* t, d, n, en, s, z, tx (not l,r,dx)   */
#define FVELAR  0000020				   /* k, g, nx                             */
#define FGLOTAL 0000040				   /* h, q, tq                             */
#define F2BACKI 0000100				   /* iy, y, yu                            */
#define F2BACKF 0000200				   /* iy, y, ey (not ay,oy)                */
 
#define IS_PLUS !=0					   /* If feature value is plus, some bit is set    */
#define IS_MINUS ==0

#define NSAMP_FRAME     64			   /* # of samples per output frame 10 KHz. */

#define VOICE_PARS      20			   /* # of words in a voice block.         */
#define SPDEF_PARS      24			   /* # of words in a speaker definition.  */

#define SYNC_PARS        0			   /* There are no sync parameters. */
#define INDEX_PARS       2			   /* # of words in an index mark block */
#define TONE_PARS        5			   /* # of words in a tone packet */

#define NPHON_MAX       300			   /* Size of phone[] and struc[] arrays.  */
#define SIZTARTAB       57			   /* # eab-fix this with sizeof later entries/param in maltar[], phrom.c    */
#define MALLINE 9					   /* # of parameters in a line of locus code(phrom.c)     */
         
#define DIV_BY8         >> 3
#define DIV_BY128       >> 7

#define MSTOFR(msec)    (((msec+4)*10)/NSAMP_FRAME)
#define frtoms(x)       ((((x) * NSAMP_FRAME)+5)/10)

#define FRAC_ONE        16384		   /* 1.0                          */
#define FRAC_HALF        8192		   /* 1.0 * 0.50                   */
#define FRAC_3_4THS     12288		   /* 1.0 * 0.75                   */
#define FRAC_3_HALVES   24567		   /* 1.0 * 1.50                   */

#define IS_AV_OR_AH             ==0
#define IS_NASAL_ZERO_FREQ      ==1
#define IS_PARALLEL_FORM_AMP    ==2
#define IS_FORM_FREQ            ==3
#define IS_FORM_BW              ==4
#define IS_FORM_FREQ_OR_BW       >2

/* Number of frames in xx milliseconds.  I.e., NF15MS is the number * of synthesizer frames in 15 msec. */

#define NF7MS           1
#define NF15MS  2
#define NF20MS  3
#define NF25MS  4
#define NF30MS  5
#define NF40MS  6
#define NF45MS  7
#define NF50MS  8
#define NF60MS  9
#define NF64MS  10
#define NF70MS  11
#define NF75MS  12
#define NF80MS  13
#define NF100MS 16
#define NF115MS 18
#define NF130MS 20
#define NF160MS 25
#define NF480MS 75
#define NF640MS 100

#define NF_COMMA        16
#define NF_PERIOD       75

/* Fraction corresponding to xx percent of (1.0 = 16384) */

#define	N5PRCNT		  	  819 		   /* 1.0 * 0.05        */
#define N8PRCNT          1311		   /* 1.0 * 0.08        */
#define N10PRCNT         1638		   /* 1.0 * 0.10        */
#define N15PRCNT         2457		   /* 1.0 * 0.15        */
#define N20PRCNT         3277		   /* 1.0 * 0.20        */
#define N25PRCNT         4096		   /* 1.0 * 0.25        */
#define	N30PRCNT	 	 4915		   /* 1.0 * 0.30        */
#define	N35PRCNT	 	 5734	 	   /* 1.0 * 0.35        */
#define	N40PRCNT	 	 6554		   /* 1.0 * 0.40        */
#define N47PRCNT   		 7700 		   /* 1.0 * 0.47		*/
#define N50PRCNT         8192		   /* 1.0 * 0.50    	*/
#define N60PRCNT         9831		   /* 1.0 * 0.60        */	
#define N65PRCNT   10650
#define N67PRCNT   10977
#define N70PRCNT        11469		   /* 1.0 * 0.70        */
#define N74PRCNT   		12124
#define N75PRCNT   12288
#define N78PRCNT   		12780
#define N80PRCNT        13108		   /* 1.0 * 0.80        */
#define N82PRCNT   		13435
#define N85PRCNT        13927		   /* 1.0 * 0.85        */
#define N87PRCNT   		14254
#define N90PRCNT        13927		   /* 1.0 * 0.90        */
#define N92PRCNT   		15073
#define N95PRCNT   		15565		   /* 1.0 * 0.95 		*/
#define N97PRCNT   		15892
#define N100PRCNT       16384		   /* 1.0               */
#define N105PRCNT  		17203
#define N107PRCNT  		17531
#define N110PRCNT       18022		   /* 1.0 * 1.10        */
#define N115PRCNT   	18841		   /* 1.0 * 1.15 		*/
#define N117PRCNT   	19169
#define N120PRCNT       19661		   /* 1.0 * 1.20        */
#define N122PRCNT  		19988
#define N125PRCNT   	20480
#define	N130PRCNT		21298		   /* 1.0 * 1.30        */
#define N132PRCNT   	21626
#define	N140PRCNT		22936	       /* 1.0 * 1.40        */
#define	N145PRCNT		23755		   /* 1.0 * 1.45        */
#define N150PRCNT       24576		   /* 1.0 * 1.50        */
#define N160PRCNT       26215		   /* 1.0 * 1.60        */
#define N175PRCNT   	28672		   /* 1.0 * 1.75 		*/
#define	N180PRCNT		29492		   /* 1.0 * 1.80        */
#define	N200PRCNT		32768		   /* 1.0 * 2.00        */



/* 
 * These definitions describe the offsets
 * for the parameters in the "param" array. Code
 * in "kl4", "kl5", and "kl6" knows the order of these
 * entries, for performance. Don't move any of these
 * or you will be sorry.
 */
#define F0      0
#define F1      1
#define F2      2
#define F3      3
#define FZ      4
#define B1      5
#define B2      6
#define B3      7
#define AV      8
#define AP      9
#define A2      10
#define A3      11
#define A4      12
#define A5      13
#define A6      14
#define AB      15
#define TILT    16

/* 
 * These definitions describe the
 * order of the frame data parameters in the
 * actual data block sent to the SPC. They may be
 * edited independently of the above def'ns.
 * Ed can rearrange the block all he wants and
 * it's no problem.
 */

#define OUT_AP  0
#define OUT_F1  1
#define OUT_A2  2
#define OUT_A3  3
#define OUT_A4  4
#define OUT_A5  5
#define OUT_A6  6
#define OUT_AB  7
#define OUT_TLT 8
#define OUT_T0  9
#define OUT_AV  10
#define OUT_F2  11
#define OUT_F3  12
#define OUT_FZ  13
#define OUT_B1  14
#define OUT_B2  15
#define OUT_B3  16

#define OUT_PH  17
#define OUT_DU  18

/* 
 * The parameter structure contains all information needed to compute
 * a synthesizer parameter.  Note, not all entries are used for all
 * parameters, but the structure is optimized for performance.
 */
typedef struct Parameters
{
	short                   tarcur;	   /* Current target value.                */
	short                   durlin;	   /* Duration of current dipthong line,   */
	/* duration of phone if not dipthong.  */
	short                   deldip;	   /* Delta-value per update interval for  */
	/* dipthong specification.             */
	short                   dipcum;	   /* Cumulative amount of dipthongization */
	/* since start of straight line.       */
	short                   ftran;	   /* Forward transition                   */
	short                   dftran;	   /* Delta-value for forward transition   */
	short                   btran;	   /* Backward transition                  */
	short                   dbtran;	   /* Delta-value for backward transition  */
	short                   tbacktr;   /* Beginning time of backward trans.,   */
	/* relative to phoneme onset.          */
	short                   tspesh;	   /* Duration of special constant value   */
	/* at beginning of phoneme.            */
	short                   pspesh;	   /* Value of special constant value at   */
	/* beginning of phoneme.               */
	short                   tarnex;	   /* Next target value                    */
	short                   tarlas;	   /* Last target value                    */
	short                   tarend;	   /* End of last phonememe target value   */
	short                  *ndip;	   /* Pointer to dipthong specification in */
	/* dipspec[] if any for this param.    */
	short                  *outp;	   /* Pointer to where the output goes.    */
}
PARAMETER;

/* 
 * NOTE:        .durlin and .deldip apply only to
 *                      F1, F2, F3, B1, B2, and B3.
 *              .tspesh and .psepsh apply only to
 *                      B1, B2, AV, AP, A2, A3, A4, A5, A6, AB
 * Parameters are stored in param[].  The following define static pointers
 * to param[].  They are in order.
 */
#define PF0     pDph_t->param[F0]
#define PF1     pDph_t->param[F1]
#define PF2     pDph_t->param[F2]
#define PF3     pDph_t->param[F3]
#define PFZ     pDph_t->param[FZ]
#define PB1     pDph_t->param[B1]
#define PB2     pDph_t->param[B2]
#define PB3     pDph_t->param[B3]
#define PAV     pDph_t->param[AV]
#define PAP     pDph_t->param[AP]
#define PA2     pDph_t->param[A2]
#define PA3     pDph_t->param[A3]
#define PA4     pDph_t->param[A4]
#define PA5     pDph_t->param[A5]
#define PA6     pDph_t->param[A6]
#define PAB     pDph_t->param[AB]
#define PTILT   pDph_t->param[TILT]

/* 8.    Speaker definitions                               */

/* 
 * This structure describes a
 * speaker. The first "SPDEF_PARS" words
 * are sent to the chip.  Note that the state
 * field is removed since the driver now appends 
 * it ... kak
 */
typedef struct
{
	short                   r4cb;	   /* Resonator 4, cascade, bandwidth      */
	short                   r4cc;	   /* center freq.    */
	short                   r5cb;
	short                   r5cc;
	short                   r4pb;	   /* Resonator 4, parallel, bandwidth     */
	short                   r5pb;
	short                   t0jit;	   /* Jitter                               */
	short                   r5ca;	   /* Resonator 5, cascade, amplitude      */
	short                   r4ca;
	short                   r3ca;
	short                   r2ca;
	short                   r1ca;
	short                   nopen1;
	short                   nopen2;
	short                   aturb;
	short                   fnscale;
	short                   afgain;
	short                   rnpgain;
	short                   azgain;
	short                   apgain;
	short                   notused;   /* was tltoff, Tilt offset      */
	short                   osgain;
	short                   speaker;
}
SP_CHIP;

#define ZAPF	6000				   /* Magic f value to zap b constant of diff eqn    */
#define ZAPB	6000				   /* Magic bw value to zap c constant of diff eqn */

#define F2max   2500				   /* Limit to keep SPC from overloading           */
#define F3max   3500				   /* Limit to keep SPC from overloading           */

#define MALE    1					   /* Value of malfem for male voice               */
#define FEMALE  0					   /* Value of malfem for female voice             */

#define NORMAL                  1	   /* Implies rule-generated f0 (default) */
#define HAT_LOCATIONS_SPECIFIED 2	   /* User specified location of hatrise/fall */
#define HAT_F0_SIZES_SPECIFIED  3	   /* User attached steps and impulses to */
				  					   /* hatrise, hatfall, and stress phones */
#define SINGING                 4	   /* Implies user-requested sung notes */
#define PHONE_TARGETS_SPECIFIED 5	   /* Implies user-spec f0 targets for phones */
#define TIME_VALUE_SPECIFIED    6	   /* Implies user-spec f0 targets at t=time */

#define SAFETY  8					   /* Offset between shared arrays such as phonemes[SAFETY] * and allophons[0] */

/* 
 * Speaker def. limit table entry.
 */
typedef struct
{
	short                   l_min;	   /* Minimum value                */
	short                   l_max;	   /* Maximum value                */
}
LIMIT;

typedef struct
{
	short                   i_offset;  /* Offset into "symbols"        */
	short                   i_type;	   /* Type, "INDEX", "INDEX_REPLY" */
	short                   i_value;   /* The value of the index       */
}
IQUEUE;

#define NIQUEUE 250					   /* # of index events            */
#define GUARD   25					   /* WBOUND => COMMA guardband    */

/* 
 *  math function prototypes ...
 */

#define klrmul(x,y)     ((x) * (y))
#define kllmul(x,y)     ((x) * (*(y)))
#define klrdiv(x,y)     ((x) / (y))
#define klldiv(x,y)     ((x) / (*(y)))
#define muldv(x,y,z)         (((x) * (y)) / (z))
#define mlsh1(x,y)         (((x) * (y)) >> 14)
#define  frac4mul(x,y)  (((x)*(S32)(y))>>12)
#define  frac1mul(x,y)  (((x)*(S32)(y))>>15)

/* moved from phmain.c */
#define isbound(ph)     ((ph)>=WBOUND  && (ph)<=VPSTART)
#define ispause(ph)     ((ph)>=VPSTART && (ph)<=EXCLAIM)
#define issmark(ph)     ((ph)>=WBOUND  && (ph)<=EXCLAIM)
#define isdelim(ph)     ((ph)>=COMMA   && (ph)<=EXCLAIM)

#endif


// eab updated for bts10187 new junk node

#include "bachus.h"

  
typedef 
struct  _phone_feature_table 
{
  GERLETTER phon;
  U16       mask;
} BACHUS_FEATURE;


#define BACHUS_GERMAN         (0x0000)               /* redefine if language bits are needed later */
#define BACHG_META            (0x0001)
#define BACHG_CONSONANT       (0x0002)
#define BACHG_GLOTTAL         (0x0004) 
#define BACHG_SYLLABIC        (0x0008)
#define BACHG_SONORANT        (0x0010)
#define BACHG_FORTIS          (0x0020)
#define BACHG_VOICED          (0x0040)
#define BACHG_NASAL           (0x0080)
#define BACHG_LATERAL         (0x0100)
#define BACHG_TENSE           (0x0200)
#define BACHG_ROUND           (0x0400)
#define BACHG_LONG            (0x0800)
#define BACHG_DIPHTHONG       (0x1000)
#define BACHG_AFFRICATE       (0x2000)
#define BACHG_STOP            (0x4000)
#define BACHG_CONTINUANT      (0x8000)



BACHUS_FEATURE  bachus_featurebits[] = {
  {'a',  (BACHUS_GERMAN + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                		 /*1 A Mann        */
  {'E',  (BACHUS_GERMAN + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                		 /*2 E englisch    */
  {'V',  (BACHUS_GERMAN + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                /*3 AE hätte      */
  {'@',  (BACHUS_GERMAN + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                		 /*4 EX schwa      */
  {'I',  (BACHUS_GERMAN + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                		 /*5 I bitte*/
  {'c',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                   /*6 O Post*/
  {'Q',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                   /*7 OE können*/
  {'U',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                   /*8 U Mund*/
  {'Y',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                   /*9 UE Lücke*/
  {'1',  (BACHUS_GERMAN + BACHG_LONG + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                /*10 AH sagen*/
  {'2',  (BACHUS_GERMAN + BACHG_LONG + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                /*11 EH geben*/
  {'7',  (BACHUS_GERMAN + BACHG_LONG + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                /*12 AEH wählen*/
  {'3',  (BACHUS_GERMAN + BACHG_LONG + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                /*13 IH lieb*/
  {'4',  (BACHUS_GERMAN + BACHG_LONG + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*14 OH Mond*/
  {'q',  (BACHUS_GERMAN + BACHG_LONG + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*15 OEH mögen*/
  {'5',  (BACHUS_GERMAN + BACHG_LONG + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*16 UH Hut*/
  {'6',  (BACHUS_GERMAN + BACHG_LONG + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*17 UEH Hüte*/
  {'A',  (BACHUS_GERMAN + BACHG_DIPHTHONG + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                					/*18 EI Kleid*/
  {'W',  (BACHUS_GERMAN + BACHG_DIPHTHONG + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                			/*19 AU Haus*/
  {'H',  (BACHUS_GERMAN + BACHG_DIPHTHONG + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},               		 	/*20 EU heute*/
  {'8',  (BACHUS_GERMAN + BACHG_DIPHTHONG + BACHG_NASAL + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                			/*21 AN Pension*/
  {'^',  (BACHUS_GERMAN + BACHG_NASAL + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                					/*22 IM Timbre*/
  {'9',  (BACHUS_GERMAN + BACHG_NASAL + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                					/*23 UM Parfum*/
  {'%',  (BACHUS_GERMAN + BACHG_NASAL + BACHG_ROUND + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                			/*24 ON Fondue*/
  {'j',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_VOICED)},               			/*25 J Ja*/
  {'l',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_LATERAL + BACHG_VOICED + BACHG_SONORANT)},                		/*26 L Luft*/
  {'r',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_FORTIS + BACHG_VOICED + BACHG_SONORANT)},     		/*27 RR rund*/
  {'R',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_VOICED)},                		/*28 R war*/
  {'h',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT)},                						/*29 H Hut*/
  {'m',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_NASAL + BACHG_SONORANT + BACHG_VOICED)},                	/*30 M Mut*/
  {'n',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_NASAL + BACHG_SONORANT + BACHG_VOICED)},                	/*31 N Nein*/
  {'G',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_NASAL + BACHG_SONORANT + BACHG_VOICED)},               	/*32 NG Ring*/
  {'L',  (BACHUS_GERMAN + BACHG_CONTINUANT + BACHG_LATERAL + BACHG_SONORANT + BACHG_SYLLABIC + BACHG_VOICED)},    /*33 EL Nabel*/
  {'M',  (BACHUS_GERMAN + BACHG_CONTINUANT + BACHG_NASAL + BACHG_SONORANT + BACHG_SYLLABIC + BACHG_VOICED)},      /*34 EM großem*/
  {'N',  (BACHUS_GERMAN + BACHG_CONTINUANT + BACHG_NASAL + BACHG_SONORANT + BACHG_SYLLABIC + BACHG_VOICED)},      /*35 EN baden*/
  {'f',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_FORTIS)},                		/*36 F Fall*/
  {'v',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_VOICED)},                                /*37 V Wasser*/
  {'s',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_FORTIS)},                                /*38 S messen*/
  {'z',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_VOICED)},                /*39 Z Dose*/
  {'S',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_FORTIS)},                /*40 SH Schule*/
  {'Z',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_VOICED)},                /*41 ZH Genie*/
  {'x',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_FORTIS)},                /*42 CH nicht*/
  {'X',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_CONTINUANT + BACHG_FORTIS)},                /*43 KH Nacht*/
  {'p',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_FORTIS + BACHG_STOP)},                	/*44 P Park*/
  {'b',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_VOICED + BACHG_STOP)},                	/*45 B Ball*/
  {'d',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_VOICED + BACHG_STOP)},                	/*46 D dort*/
  {'t',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_FORTIS + BACHG_STOP)},                	/*47 T Turm*/
  {'k',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_FORTIS + BACHG_STOP)},                	/*48 K kalt*/
  {'g',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_VOICED + BACHG_STOP)},                	/*49 G Gast*/
  {'|',  (BACHUS_GERMAN + BACHG_CONSONANT + BACHG_STOP + BACHG_GLOTTAL)},               			/*50 Q be_amted*/
  {'P',  (BACHUS_GERMAN + BACHG_AFFRICATE + BACHG_CONSONANT)},                		/*51 PF Pferd*/
  {'T',  (BACHUS_GERMAN + BACHG_AFFRICATE + BACHG_CONSONANT)},                		/*52 TS Zahl*/
  {'J',  (BACHUS_GERMAN + BACHG_AFFRICATE + BACHG_CONSONANT + BACHG_VOICED)},              /*53 DJ Matsch*/
  {'C',  (BACHUS_GERMAN + BACHG_AFFRICATE + BACHG_CONSONANT)},                		/*54 TJ no*/
  {'K',  (BACHUS_GERMAN + BACHG_AFFRICATE + BACHG_CONSONANT)},                		/*55 KSK no*/
  {'i',  (BACHUS_GERMAN + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},               		/*56 I1 mit*/
  {'e',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*57 E1 lebendig */
  {'o',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*58 o1 botanisch*/
  {'u',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*59 u1 Butan*/
  {'y',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*60 y1 Zypern*/
  {'0',  (BACHUS_GERMAN + BACHG_ROUND + BACHG_TENSE + BACHG_SYLLABIC + BACHG_VOICED + BACHG_SONORANT)},                	/*61 q1 Ökonom*/
  {'B',  (BACHUS_GERMAN + BACHG_SYLLABIC + BACHG_VOICED)},              	 		 	                /*61 ER der*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	   	 /*62 COMMA 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	    	/*63 WBOUND 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	    	/*64 WBOUND 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	    	/*65 S1 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	    	/*66 S2 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	    	/*67 SEMPH 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},            	    	/*68 HYPHEN 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)},             	   	/*69 PPSTART 0*/
  {'.',  (BACHUS_GERMAN + BACHG_META)}  };          	    	/*70 VPSTART 0*/


#define BACHUS_FEATURE_TABLE_LENGTH 71

#define BACHUS_MORPH_BOUNDARY  '+'
#define BACHUS_WORD_BOUNDARY '#'
#define BACHUS_SYLL_BOUNDARY '='
#define BACHUS_STRESS1_MARKER '\''
#define BACHUS_STRESS2_MARKER '`'

#define GERUML_A  'Ä'
#define GERUML_O  'Ö'
#define GERUML_U  'Ü'
#define GERUML_a  'ä'
#define GERUML_o  'ö'
#define GERUML_u  'ü'
#define GERUML_sz 'ß'

/* def UML_A  Ä    196 */
/* def UML_O  Ö    214 */
/* def UML_U  Ü    220 */
/* def UML_a  ä    228 */
/* def UML_o  ö    246 */
/* def UML_u  ü    252 */
/* def UML_sz ß    223 */


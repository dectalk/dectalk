#include "bachus.h"
#include <string.h>
#include <stdio.h>

/* This file contains the allphonic rules that are used in the morphemizer */

/*
We have the following rules sofar:

1)  Hardening rule   /z/ -> /s/ etc if no vowel follows
2)  /R/ rule         /R/ becomes /r/ if a wowel follows
3)  /g/ rule         /G/ becomes /Gk/ if at word end (if we decide so)
4)  /ig/ becomes  ix if at word end and ig if a morpheme foollows that starts with an unstressed vowel.
5)  /v/ final becomes /f/ if vowel follows  is actually a special case of 1. 
6)  v becomes /f/ but if /E/ follows, it becomes /v/
7)  deals with a c in syllable initial position: if an E follows it becomes s, otherwize k/ see allonsets.pho
//8)  harding rule inverse: Used for coda: if the initial consonant of a coda is one of /b,d,g,z/ and if 
//    the coda is short enough, a vowel that follows may influence its proncounciation. 
//    ga=bel:  versus gab. The hardening rule applies to the coda b if it is at the end of a word or
//    if it is followed by additional consonants, e.g., gibs. 
9)  deals with the rules of a vowel length depending on the environment. Used only in the junknode.
10) deals with the /x/X/ allophony. Used in the coda or the junknode

13) deals or will in the future deal with zieh versus ziehen in emphasised words. (h silent or not)
Other rules are considered but are actually only fixes for deficiencies, in case a wrong 
decomposition can be saved:

The word boundary marker is sometimes wrongly assumed if a complex word gets aanalsysed somewhat crummy
So we invent here the rule that a '#' (pound sign) is replaced simply by a '+' and in
the case that a complex vowel sequence, or a tense vowel or a diphthong follows AND that 
it (the pound sign) is preceeded by a lax vowel, that we then change it into a glottal stop!!!
*/

/* test program for feature bits */


#include "bachusfeatures.h"

BOOL is_bachus_phoneme(GERLETTER c)
{
  int i;
    for (i=0; i< BACHUS_FEATURE_TABLE_LENGTH ; i++)
    {
      if (bachus_featurebits[i].phon == c) return 1;
    }
  return 0;
}

U16 bachus_phoneme_features(GERLETTER c)
{
  int i;
  
  for (i=0; i< BACHUS_FEATURE_TABLE_LENGTH ; i++)
    {
      if (bachus_featurebits[i].phon == c) return bachus_featurebits[i].mask;
    }
  return 0;
}


BOOL has_the_feature(GERLETTER c, U16 mask)
     /* a lot of hoopla to test a goddam bit */
{
  U16 featurebits, op;

  featurebits = bachus_phoneme_features(c);

  if (featurebits==0) return 0;
  else
    {
      op = featurebits & mask;
      if (op) return 1;
      else return 0;
    }
}

BOOL does_not_have_the_feature(GERLETTER c, U16 mask) 
     /* a bit anal retentive I guess ... */
{
  U16 featurebits;

  featurebits = bachus_phoneme_features(c);

  if (featurebits==0) return 0;
  else
    return ((featurebits & mask) == 0);
}


BOOL is_a_vowel(GERLETTER c)
     /* 
	have this function since the defintion of a vowel is defined now as exactly not consonant 
	... yeah right, write another twenty of this hideous little bit testers .... 
     */
{
  U16 featurebits;
  
  featurebits = bachus_phoneme_features(c);
  
  if (featurebits==0) return 0;
  else
    //    return ( (featurebits & (BACHG_SYLLABIC | BACHG_SONORANT)) != 0);
    return ( (featurebits & BACHG_CONSONANT) == 0  &&  (featurebits & (BACHG_SYLLABIC | BACHG_SONORANT )) != 0 ); 
}

BOOL is_morpheme_boundary(GERLETTER c)
{
  return (c == '+');
}

BOOL is_stress_marker(GERLETTER c)
{
  return (c=='\'' || c =='`');
}


BOOL  correct_unstressed_longvowels(GERLETTER *phonemes)
{
  int i,len,stress;
  BOOL any;

  /* method: Go from left to right, find a stress marker which sets stress to 2. 
     only the next vowel can set it then to 1 and only the next consonant to 0
     if it is 1. If a vowel appears while stress is 0, if the vowel is long 
     is is replaced by its shortened version.
  */
  //  printf("correct in %s\n",phonemes);
  stress=0;
  any = 0;
  len = strlen(phonemes);
  
  for (i = 0; i<len; i++)
    {
      if (phonemes[i] == '\'' || phonemes[i] == '`') any = 1;
    }

  if (any == 1) return any;       // just forget about it since we know stress.

  if (any == 0) stress = 2;       // if we know there is now stress, initial is stressed. 
                                  // needs to insert later a stress symbol

  for (i = 0; i<len; i++)
    {
      if (phonemes[i] == '\'' || phonemes[i] == '`') {stress = 2; any=1;}
      if (is_a_vowel(phonemes[i]))
	{
	  if (stress==2)
	    {
	      stress = 1;      // a vowel can set it back to 1
	    }
	  else if (stress == 0)
	    {
	      /* look if this is a long vowel */
	      if (has_the_feature(phonemes[i], BACHG_LONG) && i < len-2 && i > 0 )   /* keep last one or first one long even if not stressed */
		{
		  if (!is_a_vowel(phonemes[i-1]) && !is_a_vowel(phonemes[i+1]))     /* only  if embedded by consonants */
		    {
//		      printf("applies to %c \n",phonemes[i]);
		      switch (phonemes[i])
			{
			case '1': phonemes[i] = 'a'; break;
			case '2': phonemes[i] = 'e'; break;
			case '3': phonemes[i] = 'i'; break;
			case '4': phonemes[i] = 'o'; break;
			case '5': phonemes[i] = 'u'; break;
			case '6': phonemes[i] = 'y'; break;
			case 'q': phonemes[i] = 'Q'; break;
			case '7': phonemes[i] = '7'; break;   // don't shorten umlaut a - don't have a better lax 
			}
		    }
		}
	    }
	}
      else 
	{
	  if (stress==1)        // reset by a consonant.
	    {
	      stress = 0;       // ready again if a consonant arrives.
	    }
	}
    }
  return any;
}
	  
	    

void find_prev_phoneme(Morpheme *llM, Morpheme *lM,BOOL *wordstart, GERLETTER *lphon)
{
  int len;
  *lphon='\0';
  *wordstart=1;

  if (lM == (Morpheme *)NULL)  return;
  if (lM->phonemepart==NULL) return;

  len = strlen(lM->phonemepart);
  if (is_bachus_phoneme(lM->phonemepart[len-1]))
    {
      *lphon=lM->phonemepart[len-1];
      *wordstart=0;
      return;
    }

  /* nothing so far found, so we take the thing before */
  
  if (llM == (Morpheme *)NULL)  return;
  if (llM->phonemepart==NULL) return;

  len = strlen(llM->phonemepart);
  if (is_bachus_phoneme(llM->phonemepart[len-1]))
    {
      *lphon=llM->phonemepart[len-1];
      *wordstart=0;
      return;
    }
}

void find_next_phonemes(Morpheme *rM, Morpheme *rrM,BOOL *wordend, BOOL *stressfollows,
			BOOL *boundary,GERLETTER *rphon, GERLETTER *rrphon, Morpheme **right)
     /* this is called to provide the next two phonemes that are handed down in a sequence of morphems. 
	it's use is only to avoid the complication in process_rule  below */

{
  GERLETTER nc;
  Morpheme *R;
  
  *right = (Morpheme *) NULL;
  *wordend=0;
  *stressfollows=0;
  *boundary =0;
  *rphon = '\0';
  *rrphon = '\0';
  R = (Morpheme *) NULL;

  if (rM == (Morpheme *) NULL)  
    {
      *wordend=1;
      return;
    }
  if (rM->phonemepart == NULL)
    {
      return;
    }

  nc = rM->phonemepart[0];
  
  // printf("takin nc: this here %s\n",rM->phonemepart);

  /* problematic here: The normal parser inserts special stress markers often as
     special morphems of length 1. The other part (path finding) puts them in
     as part of an actual phoneme. So it becomes complicated to find what is the next
     phoneme in initial position of a chunk.
  */

  if (nc=='#' || nc=='+')
    {
      *boundary = 1;
      R = rrM;
    }
  else if (nc==':' || nc=='*' || nc=='.')
    {
       // printf("this here %s\n",rM->phonemepart);
     if (rM->phonemepart[1]=='\0')
       { 
	  *boundary =1;
	  if (rrM)  R = rrM;
	  // printf("this here is SHORT %s\n",rM->phonemepart);
       }
     else
       {
	 R=rM;
       }
    }
  else
    {
      R = rM;
    }

  if (R==(Morpheme *) NULL)  return;
  if (R->phonemepart == NULL) return;

  // printf("next morph: %s\n",R->phonemepart);

  *right=R;

  *rphon = R->phonemepart[0];
  if (*rphon == '\0') return;
  
  // printf("R->phonemepart is now: %s, and *rphon is %c\n",R->phonemepart, *rphon);

  // update: we have two fixed stress markers, the old ones, for primary and secondary stress
  // usually coming from a dictionary, and in addition now '*' for must be primary stress,
  // ':' for can be primary stress, and '.' never stressed
  if (   *rphon==BACHUS_STRESS1_MARKER 
	 || *rphon ==  BACHUS_STRESS2_MARKER
	 || *rphon ==  '*'
	 || *rphon ==  ':'
	 || *rphon ==  '.')
    {
      //  printf("did it ever get here ???\n");
      *stressfollows=1;   // no stress marker
      *rphon=R->phonemepart[1];
      if (*rphon == '\0') return;
      *rrphon = R->phonemepart[2];
    }
  else
    {
      *rrphon = R->phonemepart[1];
    }
  return;
}


int left_number_of_Cs(Morpheme *llM, Morpheme *lM)
     /* this is a cludge program: Since for now I have to
	write immediately working code, I avoid building a
	more elaborate and more generally applicable
	structure (the multi-tiered replacement rule system)
	and write stupid code. So this thing finds out in
	how many consonants the preceeding morphme ends
	This is stored in nccs
     */
{
  Morpheme *L;
  int len,i;
  int nccs = 0;

  L = lM;
  if (L == (Morpheme *) NULL) 
    {
      return 0;
    }
 
  if (L->phonemepart[0] == '=') return 0;

  len = strlen(L->phonemepart);

  for (i=len; i>0; i--)
    {
      if (has_the_feature(L->phonemepart[i-1],BACHG_CONSONANT))
	{
	  nccs += 1;
	}
      else return nccs;
    }
  return nccs;

}

BOOL is_double_consonant(GERLETTER c)
{
  switch (c)
    {
    case 'x':
    case 'X':
    case 'P':
    case 'T':
    case 'C':
    case 'J':
    case 'K':
    case 'S':
    case 'r':
      return 1;
    default: 
      return 0;
    }
}



int right_number_of_Cs(Morpheme *rM, Morpheme *rrM)
     /* same comment as left_number_of_CCS.
     */
{
  Morpheme *R;
  int len,i;
  int nccs = 0;

  R = rM;
  if (R == (Morpheme *) NULL) 
    {
      return 0;
    }
  
  if (R->phonemepart[0]=='=') return 0;

  len = strlen(R->phonemepart);

  /* look for the subsequent consonant(s) and use an ugly trick to
     find if there are double consonants that follow the vowel */


  for (i=0; i<len; i++)
    {
      if (has_the_feature(R->phonemepart[i],BACHG_CONSONANT))
	{
	  nccs += 1;
	  if (is_double_consonant(R->phonemepart[i])) nccs += 1;
	  else 
	    {
	      if (strlen(R->wordpart)>1)
		{
		  if (( R->wordpart[0] == R->wordpart[1]) || (R->wordpart[0]=='c' && R->wordpart[1]=='k') || (R->wordpart[0]=='d' && R->wordpart[1]=='t')) nccs +=1;
		}
	      else
		if (rrM)
		  {
		    if (rrM->wordpart)
		      if(rrM->wordpart[0]==R->wordpart[0]) nccs += 1;
		  }
	    }
	}
      else return nccs;
    }
  return nccs;
}

char vowel_duration_stupid(Morpheme *llM, Morpheme *lM, Morpheme *rM, Morpheme *rrM)
     
     /* The third (?) in a series of cludges: determine vowel length dependin 
	on how long the consonant clusters are left and right.
     */
{
  int lnccs, rnccs;

/*


      |  right-> 
left  |  0      1      2       
------------------------
0     | 'L'    'M'    'S'
1     | 'L'    'L'    'S'
2     | 'M'    'L'    'S'
3     | 
*/


  lnccs = left_number_of_Cs(llM, lM);
  rnccs = right_number_of_Cs(rM,rrM);
  //  printf("left %d right %d\n",lnccs,rnccs);

  switch (lnccs)
    {
    case 0:
      switch (rnccs)
	{
	case 0: return 'L'; break; 
	case 1: return 'M'; break; 
	case 2: return 'S'; break; 
	default: return 'S'; break; 
	}
    case 1:
      switch (rnccs)
	{
	case 0: return 'L'; break; 
	case 1: return 'L'; break; 
	case 2: return 'S'; break; 
	default: return 'S'; break; 
	}
    case 2:
    case 3:
      switch (rnccs)
	{
	case 0: return 'M'; break; 
	case 1: return 'L'; break; 
	case 2: return 'S'; break; 
	default: return 'S'; break; 
	}
    default:
      if ((lnccs > 2) && (rnccs < 2)) return 'L';
	  else return 'S';
    }
} 

void process_rule(Morpheme *llM, Morpheme *lM, Morpheme *Morph, Morpheme *rM, Morpheme *rrM) 
    /* llM means left left neighbor, lM left neighbor, rM
       right neighbor and rrM right right neighbor. */
{
  int len,i;
  GERLETTER phon, rphon,rrphon;    // this phone and right next phone and the next after that
  GERLETTER lphon;                 // the last one to the left 
  char lengthdescript;
  Morpheme *right;
  BOOL wordend =0;
  BOOL wordstart=0;
  BOOL stressfollows=0;
  BOOL stressed =0;
  BOOL boundary;
  U16 rulenumber;
  phon = rphon = lphon = rrphon = '\0';

  /* determine the right neighboring phoneme, possibly across a boundary : */
  find_next_phonemes(rM, rrM, &wordend, &stressfollows, &boundary, &rphon, &rrphon, &right);
  find_prev_phoneme(llM,lM, &wordstart, &lphon);
  
  // printf("wordstart %i\n",wordstart);

  // printf("wordend=%2i stress=%2i boundary=%2i [%c][%c]\n",wordend, stressfollows, boundary, rphon, rrphon);

  if (Morph)
    {
      rulenumber = Morph->rulenumber;
      if (rulenumber==0 && Morph->phonemepart[0] != '\0')
	{
	  switch (Morph->phonemepart[0])
	    {
	    case '#':
	      rulenumber = 20;
	      break;
	    case '=':
	      rulenumber = 21;
	      break;
	    case '+':
	      rulenumber = 22;
	      break;
	    default: rulenumber=0;
	      break;
	    }
	}
    }
  else
    {
      rulenumber = 0;
    }

  //if (rulenumber == 0) return;
  
  if (!Morph) return;

  /* after this mess we have either a word end or we know the next phone in rphon */

  if (Morph->phonemepart == NULL) return;
  len = strlen(Morph->phonemepart);
  if (len==0) return;      // nix or what?


  /* Glottal stop remove rule :
     if a morph starts with a glottal stop, this is removed in
     the case that the previous morph ended already in a stop or 
     other unvoiced consonant */

  if (strstr(Morph->phonemepart,"|"))
    {
      if (has_the_feature(lphon,BACHG_CONSONANT) || has_the_feature(lphon,BACHG_CONTINUANT))
	{
	  // printf("Glottal stop Should be removed \n");
	  // printf("[%c] [%c] [%c] [%c] \n",lphon,phon,rphon,rrphon);
	  // printf("Morph: %s \n",Morph->phonemepart);
	  if(Morph->phonemepart[0] =='|')
	    {
	      // printf("Glottal stop is now removed \n");
	      for (i=1; i<=len; i++) Morph->phonemepart[i-1] = Morph->phonemepart[i];   // copy also final null
	    }
	  else if(Morph->phonemepart[1] =='|')
	    {
	      // printf("Glottal stop is now removed from second position \n");
	      for (i=2; i<=len; i++) Morph->phonemepart[i-1] = Morph->phonemepart[i];   // copy also final null
	    }
	}
    }

 
  switch (rulenumber)
    {
    case 0: break;

    case 1:
    case 5:
      // printf("Hardening Rule\n");
      /* it applies to 'd','b','g', and 'z', and to 'v': see also rule 5
	 if a word boundary follows, then these consonants become unvoiced
	 So we first look if there is a word boundary to the right, and if 
	 not, we look if there is a morpheme boundary to the right. In case there
	 is a morpheme boundary, it is important to check if the following morpheme
	 (rrM) starts with a vowel or not. The interesting story to tell here
	 is that there are cases in which the morphemeboundary is stronger:
	 ab+arbeiten: here the b is still pronounced as p. Hopefully, bachus
	 has figured out that it's a prefix and the prefix morpheme ab
	 should not call this rule. It's all in the letter trie files.

      */
      phon = Morph->phonemepart[len-1];     // the last in the string.
      
      // printf("phon=%c rphon=%c rrphon=%c\n",phon,rphon,rrphon);
      
      if (wordend 
	  || has_the_feature(rphon,BACHG_CONSONANT)
	  || (rphon == '|')
	  )
	{
	  switch (phon)
	    {
	    case 'b':   Morph->phonemepart[len-1] = 'p'; break;
	    case 'd':   Morph->phonemepart[len-1] = 't'; break;
	    case 'g':   Morph->phonemepart[len-1] = 'k'; break;
	    case 'z':   Morph->phonemepart[len-1] = 's'; break;
	    case 'v':   Morph->phonemepart[len-1] = 'f'; break;
	    default:    Morph->phonemepart[len-1] = phon; break;
	    }
	} 
      break;   // end of rule 1.
  
    case 2:
      //    printf("R rule \n");
      //printf("wordend=%2i stress=%2i boundary=%2i [%c][%c]\n",wordend, stressfollows, boundary, rphon, rrphon);
      /* Production of R/r rule in its simplest form only: R becomes r if a vowel follows. */
      phon = Morph->phonemepart[len-1];     // the last in the string.
      if (!wordend)
	{
	  if(is_a_vowel(rphon))
	    { 
	      
	      {
		Morph->phonemepart[len-1] = 'r'; 
	      }
	    }
	}
      else
	{
	  if ( phon=='R' && Morph->phonemepart[len-2] == '@')
	    {
	      Morph->phonemepart[len-1] = 'B';
	      //	      Morph->phonemepart[len-1] = '\0';
	    }
	}
      break;
     
    case 3:
      // printf("ng rule\n");
      phon = Morph->phonemepart[len-1];     // should be 'G'
      // printf(" We have [%c][%c][%c]\n",phon,rphon,rrphon);
      if (phon =='G')
	if (!wordend)
	  if (does_not_have_the_feature(rphon, BACHG_VOICED))
	    {
	      if ((len-1) < MAXMORPHLENGTH)           /* there should be enough space, see def in bachus.h but one never knows. */
		{
		  Morph->phonemepart[len] = 'k';
		  Morph->phonemepart[len+1] = '\0';    /* note that this assumes that there is enough space to prolong the phonemepart */
		}
	    }
      break;
      
    case 4:
      // printf("ig rule \n");
      phon = Morph->phonemepart[len-1];     // should be 'g'
      // printf(" We have [%c][%c][%c]\n",phon,rphon,rrphon);
      if (phon=='g')
	{
	  if (wordend) 
	    {
	      Morph->phonemepart[len-1] = 'x';
	    }
	  else
	    {
	      if (rphon=='r' || rphon =='l') 
		{
		  Morph->phonemepart[len-1] = 'k';
		}
	      else
		if (has_the_feature(rphon,BACHG_CONSONANT))
		{
		  Morph->phonemepart[len-1] = 'x';
		}
	    }
	}
      break; 
     
      //  case 5:
      //  final v becomes f if non-sonorant follows.
      //  rule 1 is now used for that too.
      //  break;
      
    case 6:
      // printf("v/f rule nah \n");  // a lousy rule used only in syllable concat
      break;

    case 7:
      // printf("c rule \n");
      break;
      
    case 8:
      // printf("pre-hardening rule avoid\n");
      break;

    case 9:
//      printf("vowel length rule\n");
      phon = Morph->phonemepart[len-1]; 
      rphon = phon;  // here: replacement phone

      lengthdescript =  vowel_duration_stupid(llM, lM, rM, rrM);
      // printf("letter code %c\n",lengthdescript);
      switch (lengthdescript)
	{
	case 'L':
	  switch (phon)
	    {
	    case 'a':  rphon = '1'; break;
	    case 'E':  rphon = '2'; break;
	    case 'c':  rphon = '4'; break;
	    case 'U':  rphon = '5'; break;
	    case 'I':  rphon = 'i'; break;
	    case 'V':  rphon = '7'; break;
	    case 'Q':  rphon = 'q'; break;
	    case 'Y':  rphon = '6'; break;
	    }
	  break;

	case 'M':
	  switch (phon)
	    {
	    case 'a':  rphon = 'a'; break;
	    case 'E':  rphon = 'E'; break;
	    case 'c':  rphon = 'o'; break;
	    case 'U':  rphon = 'u'; break;
	    case 'I':  rphon = 'i'; break;
	    case 'V':  rphon = 'V'; break;
	    case 'Q':  rphon = 'q'; break;
	    case 'Y':  rphon = '6'; break;
	    }
	  break;

	case 'S':
	  rphon = phon;
	  break;
	}
      Morph->phonemepart[len-1] = rphon;
      break;

    case 10:
      // printf("x allophony rule\n");
      break;

    case 13:
      /* if the rule 13 is noted after a syllable final h, especially after open tense vowels,
	 we delete the h if we are not at the word end. I would like to modify this rule later
         to be able to over emphasize words by pronouncing the h. */

      phon = Morph->phonemepart[len-1]; 
      if (phon == 'h' && len > 1)
	{
	  if (has_the_feature(Morph->phonemepart[len-2],BACHG_TENSE) && !wordend)
	    {
	      Morph->phonemepart[len-1]='\0';
	    }
	} 
      break;
    
    case 20:
      // printf("wordboundary  # rule [%c][%c] \n",rphon,rrphon);
      if ( (rphon ==BACHUS_STRESS1_MARKER || rphon ==BACHUS_STRESS2_MARKER) 
	   &&  (has_the_feature(rrphon,BACHG_SYLLABIC)))
	{
	  Morph->phonemepart[0] = rphon;
	  if(right) right->phonemepart[0] = '|';
	}
      break;

    case 21:
      // printf("syll =  boundary rule\n");
      
      break;

    case 22:
      // printf("Morpheme + boundary rule\n");
      break;
      
      
    default:
//      printf("Unknown rule: %d \n",rulenumber);
      break;
    }

  /* and here we add the funky rules. The first one of these is a fix for 
     the problem that DECtalk overlystronglycoarticulates. I will simply 
     introduce a glottal stop in front of each stressed phoneme that starts
     either with any vowel and a stress marker or simply for all tense vowels
     even if there is is no stress marker.
  */
  //#ifdef GERMAN_BACHUS_out
  if (wordstart==1 && Morph->phonemepart != NULL)
    {
      phon = Morph->phonemepart[0];
      if (is_stress_marker(phon))
	{
	  rphon=phon;
	  phon = Morph->phonemepart[1];
	  stressed=1;
	}
      if (phon) 
	{
	  if ( (is_a_vowel(phon)  && stressed==1) || has_the_feature(phon,BACHG_SYLLABIC) || has_the_feature(phon,BACHG_DIPHTHONG))
	    {
	      if (stressed==1)
		{
		  for (i=len+1;i>0;i--) Morph->phonemepart[i] =  Morph->phonemepart[i-1];  // copy includes the null
		  Morph->phonemepart[0]=rphon;   // the stress marker
		  Morph->phonemepart[1]='|';     // glottal stop
		}
	    }
	}
    }
  //#endif
}

#include "bachus.h"


GERLETTER* points_embed(const GERLETTER *word, GERLETTER *po)
{
  GERLETTER *pout; 
  int i,le;

  pout=po;
  *pout++='.';
  le = strlen(word);

  for (i=0;i<le;i++) {*pout++ = word[i];}
  *pout++ = '.';
  *pout++ = '\0';
		
  return po;
}

int charindex(const char cc)
{
  /* assigns a number between 0 and 30 to the characters of the 
   * lower case German alphabet, including Umlaute 
   */
  int val,kk;
  switch (cc)   {
  case '.': val= 46; kk =0; break; 
  case 'a': val= 97; kk =1; break; 
  case 'b': val= 98; kk =2; break; 
  case 'c': val= 99; kk =3; break; 
  case 'd': val= 100; kk =4; break; 
  case 'e': val= 101; kk =5; break; 
  case 'f': val= 102; kk =6; break; 
  case 'g': val= 103; kk =7; break; 
  case 'h': val= 104; kk =8; break; 
  case 'i': val= 105; kk =9; break; 
  case 'j': val= 106; kk =10; break; 
  case 'k': val= 107; kk =11; break; 
  case 'l': val= 108; kk =12; break; 
  case 'm': val= 109; kk =13; break; 
  case 'n': val= 110; kk =14; break; 
  case 'o': val= 111; kk =15; break; 
  case 'p': val= 112; kk =16; break; 
  case 'q': val= 113; kk =17; break; 
  case 'r': val= 114; kk =18; break; 
  case 's': val= 115; kk =19; break; 
  case 't': val= 116; kk =20; break; 
  case 'u': val= 117; kk =21; break; 
  case 'v': val= 118; kk =22; break; 
  case 'w': val= 119; kk =23; break; 
  case 'x': val= 120; kk =24; break; 
  case 'y': val= 121; kk =25; break; 
  case 'z': val= 122; kk =26; break; 
  case 'ß': val= 223; kk =27; break; 
  case 'ä': val= 228; kk =28; break; 
  case 'ö': val= 246; kk =29; break; 
  case 'ü': val= 252; kk =30; break; 
  default: val=0; kk=-1; break;
  }
  return kk;
}


void decompose_pattern(const char *p, char *pout, int *num, int *digits, int *places)
{
  /*  gets as input a pattern such as ".ei6n5eh" in p. It looks for
      digits in the string and moves only the other characters to the 
      output field pout. In num it registers how many digits where found,
      in digits it registers the digits, and in places the positions.
      A position of 0 represents before the first character and other
      wise a position of n is after the n-th character.
      Example:
      For an input of ".ei6n5eh" in p, the field pout will contain ".eineh",
      The field digits will contain [3,4]; places will contain [6,5], and
      *num will be 2.
  */

  int i,l,nn,pos;
  char c;

  l = strlen(p)-1;
  i = 0;
  pos=0;
  nn=0;
  
  while (l>0)
    {
      c = p[i++];
      l -= 1;
      
      if (c>'0'&& c<='9')  
	{
	  digits[nn] = (int) c-'0';
	  places[nn++] = pos;
	}
      else
	{
	  pout[pos++] = c;
	}
    }
  *num = nn;
  pout[pos++] = '\0';
}



/* Strategy: We have for each beginning letter of a group of
   patterns the beginning address and the ending address.
   We go through the word, letter by letter. For each letter
   we compare the remaining string of the word with the
   patterns, of a the letter group. We assume that the word
   is already embedded in the ".xxxx." form. */

void update_separations(const tokenT *TOK,
			int ntok,     // token number
			int ipos,     // position in word
			int le,       // length of word
			int *separationdigits)
{
  int i;
  int ip;
  int ndigits;
  int pos[MAX_DIGITS];
  int digits[MAX_DIGITS];
  char string[MAX_TOKEN];

  // decompose the pattern string: 

  decompose_pattern(TOK[ntok].orig, string, &ndigits, digits, pos);

  //  printf("%s %s %i \n", TOK[ntok].orig, string, ndigits);
  // for (j=0;j<ndigits; j++) printf("  (%i %i)",pos[j],digits[j]);
  // printf("\n");

  for (i=0; i<ndigits; i++)
    {
      ip = ipos+pos[i];
      separationdigits[ip] = MAX(separationdigits[ip],digits[i]);
    }
}



int patterncheck(const GERLETTER *word,
		 const tokenT *TOK,
		 const int* from,
		 const int* upto,
		 int *separationdigits,
		 int *affectedtokens)
{
  int numhits=0;    // return value
  int i,it;
  int nindx;        // addresses from and upto fields
  int ic, le, letok;

  le = strlen(word);

  for (i=0; i<=le; i++) separationdigits[i]=0;
  for (i=0; i<MAXAFFECTEDTOKENS;i++) affectedtokens[i]=-1;

  for (ic=0; ic<le; ic++)
    {
      nindx = charindex(word[ic]);
      if (nindx>=0)
      for (it=from[nindx];it<upto[nindx];it++)
	{
	  letok = strlen(TOK[it].str);  // token length
	  if (letok<=strlen(&word[ic]))
	    if (strncmp(&word[ic],TOK[it].str,letok)==0)
	      {
		update_separations(TOK, it,ic,le,separationdigits);
		affectedtokens[numhits]=it;
		++numhits;
	      }
	}
    }
  return le;
}
	  
GERLETTER *word_separate(const GERLETTER *word, GERLETTER *po, int len, int *separationdigits)
{
  /* word separations based on the markers in the field separationdigits */
  /* hyphenate at odd points of the digits.  */
  GERLETTER *pout;
  GERLETTER c;
  int s;
  int k;

  pout = po;
  c=word[0];

  for (k=1; k<len; k++)
    {
      s = separationdigits[k] & 1;
      if (s)
	{
	  if (k>1) *pout++ ='-';
	}
      if (c !='.') *pout++ =c;
      c = word[k];
    }
  *pout++ = c;
  *pout++ = '\0';
  return po;
}


GERLETTER *geminyrepairs(GERLETTER *pin, GERLETTER *pout)
{
  /* find the string "-ck" and replace by "k-k" if a vowel preceeds the hyphen. */

  GERLETTER *p;
  GERLETTER *po;

  po = strcpy(pout, pin);     // copy to out so it can be changed.

repairagain:
  p = (GERLETTER *) strstr(pout, "-ck");
  if (p) 
    {
      p[0] = 'k';
      p[1] = '-';
      p[2] = 'k';
      goto repairagain;     // look for more of the same. Risky?  
    }

puckels:  
  p = (GERLETTER *) strstr(pout, "-ß");
  if (p) 
    {
      p[0] = 'ß';
      p[1] = '-';
      goto puckels;     // look for more of the same. Risky?  
    }
 tzte:
  p = (GERLETTER *) strstr(pout, "-tz");
  if (p) 
    {
      p[0] = 't';
      p[1] = 'z';
      p[2] = '-';
      goto tzte;     // look for more of the same. Risky?  
    }

 nge: 
  p = (GERLETTER *) strstr(pout, "n-g");
  if (p) 
    {
      p[0] = 'n';
      p[1] = 'g';
      p[2] = '-';
      goto nge;     // look for more of the same. Risky?  
    }

  return po;
}




GERLETTER *Trenne(const tokenT *Tok, 
	      const int *from, 
	      const int *upto,  
	      const GERLETTER *inword,   
	      GERLETTER *pout,
	      GERLETTER *Wort,
	      int  *affectedtokens)
{
  
  int lensep;
  GERLETTER *res;
  GERLETTER *orig;
  GERLETTER *po;

  // GERLETTER word[80];
  int separationdigits[80];
  orig = Wort;
  po = pout;

  res = points_embed(inword, Wort);      // copies to pout.
  //  printf(" the input is: %s\n",Wort);

  lensep = patterncheck(res, Tok, from, upto, separationdigits,affectedtokens);

  res = word_separate(inword,po,lensep,separationdigits);   // copies hyphenized to po

  res = geminyrepairs(po,Wort);    // replace -ck by k-k

  //  printf(" the output is: %s\n",res);

  return res;
}



GERLETTER *hyphenate_graphems(const GERLETTER *inword, GERLETTER *outword, const HPatterns *HP)
{
  int k;


  GERLETTER pout[120];
  int affectedtokens[MAXAFFECTEDTOKENS];
  GERLETTER *res;
  
  
#ifdef BACHUS_DEBUG
  printf("%s\n",inword);
#endif

  res = Trenne(HP->TOK, HP->from, HP->to, inword, pout, outword, affectedtokens);

#ifdef BACHUS_DEBUG
  printf("%s\n",res);

  for (k=0;k<MAXAFFECTEDTOKENS;k++)
    {
      if (affectedtokens[k] >= 0)
	{
	  printf("%5i %s\n",affectedtokens[k], HP->TOK[affectedtokens[k]].orig);
	}
    }
#endif
  return res;

}



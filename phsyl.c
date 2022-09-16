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
 *    File Name:	phsyl.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  phsyl.c -- syllabification and output ....
 *
 ***********************************************************************
 *    Revision History:
 */

#include   "phdefs.h"
/* include "\dtpc\src\lang\usa_def.h" */
#include "usa_def.h"
/* include "\dtpc\src\lang\usa_phon.tab" */
//#include "usa_phon.tab"


extern   short   symbols[];               /* Where input symbols go.	*/
extern   short   nsymbtot;               /* Length of above.		*/
extern   short   *user_durs;               /* Where user durations go. */
extern   short   *user_f0;               /* Where user f0 commands go.	*/
//extern   short *user_offset;
extern   int   bound;
extern   char   nphone;
extern   int   lastoffs;
extern   int   asperation;

/*
 *  temp storage for saysyllable() ...
 */
#ifndef MINIMAL_SYNTH
short   temp_symbols[NPHON_MAX+SAFETY+2];
short   temp_user_durs[NPHON_MAX+SAFETY+2];
short   temp_user_f0[NPHON_MAX+SAFETY+2];
/*
 * translates phonemes to ascky ... complete table ...
 */
/*char   ascky_table[] =   {
      0,      'i',   'I',   'e',   'E',   '@',   'a',   'A',   'W',   '^',
      'c',   'o',   'O',   'U',   'u',   'R',   'Y',   'x',   '|',   0,
      0,      0,      0,      0,      'w',   'y',   'r',   'l',   'h',   0,
      0,      'm',   'n',   'G',   'L',   0,      'N',   'f',   'v',   'T',
      'D',   's',   'z',   'S',   'Z',   'p',   'b',   't',   'd',   'k',
      'g',   '&',   'Q',   'q',   'C',   'J',   '~',   '`',   '\'',   '"',
      0,      0,      0,   '-',   '*',   '#',   ' ',   '(',    ')',     0,
      ',',   '.',   '?',   '!',     0,	    0,     0,		0,		  0,		0,
		0,		   0,		 0,	  0,	   0,		 0,	  0,		0,		  0,		0,
		0,		   0,		 0,	  0,		0,		 0,	  0,		0,		  0,		0,		
		0,		   0,	  '`',   '\'',	 '"',	  '/',   '\\',	 '&',		'-',	  '+',
		'-'
      };
 */
/*
 *  like above, except things that may be in the phonetic strings
 *  that we need to carry are zero'd out so we can ignore them .
 */

char   ascky_check[] =   {
      0,      'i',   'I',   'e',   'E',   '@',    'a',   'A',   'W',   '^',
      'c',   'o',   'O',   'U',   'u',   'R',   'Y',   'x',   '|',   0,
      0,      0,      0,      0,      'w',   'y',   'r',   'l',   'h',   0,
      0,      'm',   'n',   'G',   'L',   0,      'N',   'f',   'v',   'T',
      'D',   's',   'z',   'S',   'Z',   'p',   'b',   't',   'd',   'k',
      'g',   '&',   'Q',   'q',   'C',   'J',   0,      0,      0,      0,
      0,      0,      0,      0,      0,      0,      ' ',   0,      0,    0,
		0,		   0,		 0,	  0,	   0,		 0,	  0,		0,		  0,		0,
		0,		   0,		 0,	  0,	   0,		 0,	  0,		0,		  0,		0,
		0,		   0,		 0,	  0,		0,		 0,	  0,		0,		  0,		0,		
		0,		   0,		 0,	  0,		0,		 0,	  0,		0,		  0,		0,		
      0,
		};
#endif

#ifndef MINIMAL_SYNTH

unsigned char *common_affixes[] = {
      "sElvz",
      "kwIst",
      "flEks",
      "sfir",
      "stAn",
      "gr@f",
      "ples",
      "plen",
      "skop",
      "baks",
      "ston",
      "wRT",
      "lxnd",
      "l@nd",
      "k@st",
      "fI|S",
      "h@nd",
      "yard",
      "kcpf",
      "mxnt",
      "mEnt",
      "sElf",
      "st@t",
      "SI|p",
      "sAt",
      "vIl",
      "b@k",
      "bot",
      "lAf",
      "lAk",
      "pAp",
      "wck",
      "wcS",
      "wUd",
      "wRk",
      "kek",
      "bcl",
      "bEl",
      "del",
      "hIl",
      "hol",
      "hUd",
      "l|s",
      "m@n",
      "mxn",
      "mor",
      "nEk",
      "n|s",
      "Sap",
      "Z|n",
      "S|n",
      "tel",
      "tin",
      "tAm",
      "wRd",
      "wer",
      "wIl",
      "wAz",
      "b@g",
      "k@p",
      "kar",
      "k@t",
      "dxm",
      "flA",
      "mxn",
      "m@n",
      "mEn",
      "n^t",
      "pad",
      "ek",
      "bO",
      "de",
      "fL",
      "|J",
      "sc",
      "we",
      0
      };

char syl_vowels[] = "a@AeEiIoOuU^WRc|xLN";

char *syl_cons[] = {
      "spl", "spr", "str", "skw", "skl", "skr",
      " Sm",   " SL",
      "pl", "pr",
      "bl",   "br",
      "fl", "fr",
      "tw", "tr",
      "dw", "dr",
      "Tw", "Tr",
      "kw", "kl", "kr",
      "gw", "gl", "gr",
      "sw", "sl", "sp", "st", "sk", "sm", "sn",
      "Sw", "Sl", "Sr",
      " Y",
      "y",
      "f",
      "t",
      "d",
      "T",
      "k",
      "g",
      "s",
      "S",
      "p",
      "w",
      "l",
      "r",
      "h",
      "D",
      "z",
      "Z",
      "C",
      "J",
      "n",
      "m",
      "v",
      "b",
      0
      };

syl_find_vowel(ph)
int *ph;
	{
   int   i,j,k=0,l,off;

   off = 1;
   for(i=0;ph[i] != WBOUND;i--)
   	{
      if(ascky_check[ph[i]])
      	{
         for(j=0;syl_vowels[j] != 0;j++)
				{
         	if(ascky_check[ph[i]] == syl_vowels[j])
         		{
            	for(k=1;ascky_check[ph[i-k]] == 0 && ph[i-k] != WBOUND;k++);
            	if(ph[i-k] != YU)
               	return(off);
            	for(l = k+1;ascky_check[ph[i-l]] == 0 && ph[i-l] != WBOUND;l++);
            	if(ph[i-l] != WBOUND)
               	return(off);
            	return(off);
         		}
         	if(ph[i] == YU)
         		{
            	for(k += 1;ascky_check[ph[i-k]] == 0 && ph[i-k] != WBOUND;k++);
            	if(ph[i-k] != WBOUND)
               	return(off);
            			else
               	return(0);
         		}
				}
      	}	
      	off += 1;
   	}
   	return(0);
	}

int syl_find_cons(ph)
int *ph;
{
   int   *tp;
   int   i,j,len;
   tp = ph;
	if(*tp-- == 26)
		{
      for(j=0;syl_vowels[j] != 0;j++)
			{
         if(ascky_check[*tp] == syl_vowels[j])
				{
				return(0);
				}
			}
		}

   for(j=0;syl_cons[j];j++)
   	{
      for(i=0;syl_cons[j][i];i++);
/*		printf(" %s ons %d \n",syl_cons[j],len);*/
      len = i;
      tp = ph;
      while(true)
      	{
         if( ascky_check[*tp] == 0)
         	{
            tp ++;
            len += 1;

         	}
         else
				{
/*				printf("asc = %c \n",syl_cons[j][i-1]);

				printf("look at   %d %c \n",ascky_check[*tp],ascky_check[*tp]);*/
				if(syl_cons[j][--i] != ascky_check[*tp--])
            	break;
				}
         if(i == 0)
            return(len);
      	}
   	}
   	return(0);
	}
int syl_find_affix(ph)
int *ph;
{
   int   *tp;
   int   i,j,len;

   for(j=0;common_affixes[j];j++)
   {
      for(i=0;common_affixes[j][i];i++);
      len = i;
      tp = ph;
      while(true)
      {
         if(ascky_check[*tp] == 0)
         {
            tp++;
            len += 1;
         }
         else if(common_affixes[j][--i] != ascky_check[*tp--])
            break;
         if(i == 0)
            return(len);
      }
   }
   return(0);
}
unsigned int syllable_struct[128];
unsigned int phone_struct[128];

#ifdef PRINT_OUTPUT
void logsyllable()
{
   int   i,j,k;
   for(i=1;i<nsymbtot;i++)
   {
      /*
       *  first, isolate phonemic words ...
       */
      phone_struct[0] = WBOUND;
      for(j=0;symbols[i+j] != WBOUND && i+j < nsymbtot && j < 128;j++)
			{
	      phone_struct[j+1]=symbols[i+j];
			}
		j++;
      phone_struct[j]=0;
      i += j-1;
      k=ph_syllab(j);

      WAIT_PRINT;
      printf("\n[:syll ");
      for(j=0;phone_struct[j];j++)
      	printf("%c",usa_ascky[phone_struct[j]]);
      printf(" --> ");
      while(--k)
         printf("%c",usa_ascky[syllable_struct[k]]);
      printf("]");
      SIGNAL_PRINT;
   }
}
#endif
/*
 *  saysyllable() is used to break the symbol array up into syllable chunks
 *  and pass that on ...
 */

void saysyllable()
{
   int   i,j,k,m;
   int   last,old_tot;

   /*
    *  then, save the clause ...
    */

   for(i=0;i<=nsymbtot;i++)
   {
      temp_symbols[i] = symbols[i];
      temp_user_durs[i] = user_durs[i];
      temp_user_f0[i] = user_f0[i];
   }
   old_tot = nsymbtot;
   last = 0;
   while(last <= old_tot)
   {
      phone_struct[0] = WBOUND;
      last += 1;
      for(j=0;temp_symbols[j+last] != WBOUND && j+last < old_tot && j < 128;j++)
      phone_struct[j+1]=temp_symbols[j+last];
      phone_struct[j+1]=0;
      /*
       *  syllabify it, and return the length of syllable_struct ...
       */
      k=ph_syllab(j);
      syllable_struct[k] = 0;
      /*
       *  now, after the comma, start breaking the word up ....
       */
      syl_clause_init();
      while(--k >= 0)
      {
         /*
          *  count up the sounded phones ...
          */
         if(ascky_check[temp_symbols[last]])
            nphone++;
/*         printf("  %c %d %d",ascky_table[syllable_struct[k]],ascky_table[syllable_struct[k]],SBOUND);*/
         if(syllable_struct[k] == SBOUND)
            speak_syllable();
         else
         {
            symbols[nsymbtot] = temp_symbols[last];
            user_durs[nsymbtot] = temp_user_durs[last];
            user_f0[nsymbtot++] = temp_user_f0[last++];
         }
      }
      /*
       *  take care of the last accumulated syllable ...
       */
      if(nsymbtot > 1)
         speak_syllable();
   }
}
ph_syllab(j)
int   j;
{
   int   k,len;
   /*
    *  first, strip off any common english affix ...
    */

   k = 0;
   while(true)
   {
      len = syl_find_affix(&phone_struct[j]);
      if(len == 0)
         break;
      while(len-- && j)
         syllable_struct[k++] = phone_struct[j--];
      if(j==0)
         break;
      while(j && ascky_check[phone_struct[j]] == 0)
         syllable_struct[k++] = phone_struct[j--];
      syllable_struct[k++]=SBOUND;
   }
   /*
    *  Now, syllablify the rest of it ...
    */
   if(j != 0)
   {
      while(true)
      {
         /*
          *  Find vowel ...
          */
         len=syl_find_vowel(&phone_struct[j]);
         if(len)
         	{
            while(len-- && j)
					{
               syllable_struct[k++] = phone_struct[j--];
					}
            if(j==0)
               break;
            while(j && ascky_check[phone_struct[j]] == 0)
               syllable_struct[k++] = phone_struct[j--];
         	}
         else
         	{
            while(j)
               syllable_struct[k++] = phone_struct[j--];
            break;
         	}
         /*
          *  head cons ...
          */

         len = syl_find_cons(&phone_struct[j]);
         if(len)
         	{
            while(len-- && j)
               syllable_struct[k++] = phone_struct[j--];
            if(j==0)
               break;
         	}
         /*
          *  syllable break must be here ... if we are not word initial ...
          */
         while(j && ascky_check[phone_struct[j]] == 0)
            syllable_struct[k++] = phone_struct[j--];
         if(j == 0)
				{
            break;
				}
         syllable_struct[k++]=SBOUND;
      }
   }
   return(k);
}
#ifdef PRINT_OUTPUT
logascky(s)
unsigned int *s;
{
   while(*s)
      printf("%c",usa_ascky[*s++]);
}
#endif
syl_clause_init()
{
   symbols[0] = COMMA;
   user_durs[0] = 0;
   user_f0[0] = 0;
   bound = COMMA;
   lastoffs = 0;
   nphone = 0;
   asperation = 0;
   nsymbtot = 1;
   nphone = 0;
}
speak_syllable()
{
   symbols[nsymbtot] = COMMA;
   user_durs[nsymbtot] = 0;
   user_f0[nsymbtot++] = 0;
   phclause();
   syl_clause_init();
}
#endif
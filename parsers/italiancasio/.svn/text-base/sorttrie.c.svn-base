#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

// show comments in output files:
#define COMMENTS_MARKED      
#define ITALIAN
/*

0 1 2 3 4 5 6 7 | 0 1 2 3 4 5 6 7 | 0 1 2 3 4 5 6 7
---------------------------------------------------
     char       | E R B M - * * * | * * * * * * * *   
---------------------------------------------------
                  
7 6 5 4 3 2 1 0 | F E D C B A 9 8   7 6 5 4 3 2 1 0
                  
E: BIT IS SET IF endoflex is set (1), otherwise NOEXIT (0)
R: right bit
B: down pointer big interpret number as address in 
   long pointer array.
M: more info available.

*/

//#include "sorttrie.h"

#include "bachus.h"

//typedef unsigned char ASCIILETTER;
//typedef int U16;
//#define NIL 0


void crash_this_thing(const char *mess)
{
    fprintf(stderr,"%s\n",mess);
    exit(-1);
}

/*
 At the end I want to have the following: From a word in a sorted ltrie
we have an address and know that there is additional information associated
with this word. We then run a table in which there is an mapping between
the address that is returned by the ltrie and the additional information associated
with the word.  

So we need one table that contains in the first column the addresses of words which
have "further information" (addinfo) and in the second column the index into another
table that contains the additional information. 

*/
/* start of programs */



void  init_swordlist(swordlist *wl)
{
    wl->n = 0;
    wl->first_word=(strindx *) NULL;
    wl->last_word=(strindx *) NULL;
}

swordlist *new_swordlist()
{
    swordlist *wl;
    wl = (swordlist *) calloc(1,sizeof(swordlist));
    if (!wl) crash_this_thing("new_swordlist calloc");
    init_swordlist(wl);
    return wl;
}

seqpile *new_seqpile(int n)
{
    seqpile *sp;

    sp = (seqpile *) calloc(1,sizeof(seqpile));
    
    if (!sp) crash_this_thing("new_seqpile first calloc");

    sp->nmaxseq = n;
    sp->nseq = 0;
    
    init_swordlist(&(sp->wl));

    if (n>0)
    {
	sp->sequencesets = (sequenceset **) calloc(n, sizeof(sequenceset *));
	if (!(sp->sequencesets)) crash_this_thing("new_seqpile second calloc");
    }
    else
    {
	sp->sequencesets = (sequenceset **) NULL;
    }
}


//#ifndef BACHUS_IN_DECTALK

ASCIILETTER *cleanup_string(ASCIILETTER *pin)
     /* get rid of space, and white space characters */
{
  ASCIILETTER *out,*in; 
  ASCIILETTER cc,clast;
  out = pin;
  in = pin;
  clast='\0';

  while(cc = *in++) 
    {
	if (cc=='/' && clast == '/')
	{
	    out--;
	    break;
	}
      if (!isspace(cc)) *out++ = cc;
      clast=cc;
    }
  *out++ = '\0';
  return pin;
}


void init_string_pool(StringPool *SPool)
{
    SPool->nstrings = 0;
    SPool->bigbuffer = (ASCIILETTER *) NULL;
    SPool->ptarray = (U16 *) NULL;
    SPool->buflen=0;
}

/* the input string p is stored in a pool of strings.
   The relative address is returned as U16 and the absolute
   string address is returned in the third argument.
*/ 

U16 put_in_string_pool( ASCIILETTER *p, StringPool *SPool, ASCIILETTER  **res)
{
  int i,len;
  ASCIILETTER *pp;
  ASCIILETTER *cpaddr;

  for (i=0; i<SPool->nstrings; i++)
    {
      pp = SPool->ptarray[i] + SPool->bigbuffer;
      // printf("%i is %s\n",i+1,pp);
      if (strcmp(p, pp) == 0) 
	{
	  *res = pp;
	  return SPool->ptarray[i];
	}
    }
  
  // if we are here we need to add a string
  len = strlen(p);

  SPool->bigbuffer = (ASCIILETTER *) realloc(SPool->bigbuffer, (SPool->buflen + len +1) * sizeof(ASCIILETTER) );
  if ( !(SPool->bigbuffer)) 
    {
	crash_this_thing("put_in_string_pool: could not realloc 1st array");
    }

  cpaddr = SPool->bigbuffer + SPool->buflen;   // copy to this address. 
  strcpy(cpaddr,p); 
  SPool->buflen += (len+1);                    
  
  SPool->ptarray = (U16 *) realloc((void *) SPool->ptarray, (SPool->nstrings+1) * sizeof(U16));
  if ( !(SPool->ptarray)) 
    {
      crash_this_thing(" put_in_string_pool: could not realloc 2nd array");
    }

  SPool->ptarray[SPool->nstrings] = cpaddr - SPool->bigbuffer;

  SPool->nstrings += 1;
  
  //  printf("Buflen now: %d\n", SPool->buflen);
  *res = SPool->ptarray[SPool->nstrings-1] + SPool->bigbuffer;

  return (SPool->ptarray[SPool->nstrings-1]);
}


SortTrie *make_new_sorttrie(const U16 nnodes, const U16 increments, const U16 type, StringPool *phonemepool)
{
  SortTrie *newtrie;      
  newtrie = (SortTrie *) calloc(1,sizeof(SortTrie));
  newtrie->Nodes = (SrtNode *) calloc((size_t) nnodes, sizeof(SrtNode));
    // want a catch here, please feel free to programm it !

  newtrie->size = nnodes;
  newtrie->type = type;
  newtrie->nnodes = 0;
  newtrie->last = 1;
  newtrie->current = 0;
  newtrie->nempty = nnodes-1;     // all empty but the first.
  newtrie->increments=increments; // if new nodes have to allocated.
  newtrie->stopcondition = NIL;   
  newtrie->Nodes[0].letter = '*';
  newtrie->downlongarray = calloc(256, sizeof(U16)); 
  newtrie->nlongdown=0;
  newtrie->phonemepool = phonemepool;
  return newtrie;
}

void  delete_sorttrie(SortTrie *LT)   // primitive clean up procedure
{
  if (LT->size > 0 && LT->Nodes)
    {
      free((void *) LT->Nodes);   // (watch this: crash and burn if memory corrupted.)
    }
}


U16  make_new_node(SortTrie *LT)  
{
  U16 last, newlen;

  //DEBUG_printf("Empty nodes: %i.\n",LT->nempty);
  if (LT->last < LT->size)
    {
      last = LT->last;
      LT->nempty -= 1;
      LT->last += 1;       // may now point to nonexistant memory (!)
    }
  else
    {
      newlen = LT->size + LT->increments;
      LT->Nodes =   (SrtNode *)    realloc((void *)LT->Nodes, sizeof(SrtNode)*newlen);
      //DEBUG_printf("Realoc called at current %i \n",LT->current);
      last = LT->last;
      // note: new memory not initialized.    So init at least each new node as above:
      LT->last += 1;    // btw points to non-initialized memory, will be cleared next time
      LT->size += LT->increments;
      LT->nempty = LT->increments-1;  // minus one since I give one of the new ones away
    }
  // just to be sure:
  LT->Nodes[last].letter = '*';
  LT->Nodes[last].info = 0;
  LT->Nodes[last].down = 0;
  LT->Nodes[last].bigdown = 0;
  LT->Nodes[last].right = 0;
  LT->Nodes[last].addinfo = 0;

  return last;    // point at new node, ready for use and empty
}


void make_file_header(FILE *outstr, const char *title)
{
  int i;
  int count;
  char *timep;
  time_t nowis;

  nowis = time(NULL);
  timep = ctime(&nowis);

  fprintf(outstr,"/* This is an automatically generated include file for DecTalk         */\n");
  fprintf(outstr,"/* %s   */\n",title);
  fprintf(outstr,"/* Author: ReWT @ Fonix (C)                        */\n\n");
  fprintf(outstr,"/* Time generated: \n");
  fprintf(outstr,"   %s\n",timep);
  fprintf(outstr,"*/\n");
}

int length_of_associated_list(SortTrie *ST)
{
    AssociatedInfo *a;
    int count;

    count = 0; 
    for (a = ST->assoc_first; a != (AssociatedInfo *) NULL; a = a->next) count++;
    return count;
}


#define ITALIAN_NO_RULES_IN_ASSOCTABLE

int show_associated_list(SortTrie *ST,FILE *fid,StringPool *strpool,  const char *variablename) 
{
    AssociatedInfo *a;
    ASCIILETTER *p;
    U16 rel;
    int count;

    count = 0; 

    for (a = ST->assoc_first; a != (AssociatedInfo *) NULL; a = a->next) count++;

#ifdef ITALIAN
    if (count>0) fprintf(fid,"CONST IT_assoctable %s_assoc[%d] = {\n",variablename,count);
#else
    if (count>0) fprintf(fid,"CONST IT_assoctable %s_assoc[%d] = {\n",variablename,count);
#endif

    for (a = ST->assoc_first; a != (AssociatedInfo *) NULL; a = a->next)
    {
	rel = a->straddr;
	p = strpool->bigbuffer+rel;
//     fprintf(fid, "Addr: %d relstr: %d rulenumber: %d /*<%s>*/\n",a->addr,a->straddr,a->rulenumber, p);

#ifndef ITALIAN_NO_RULES_IN_ASSOCTABLE
	fprintf(fid, "  {%8d, %8d, %8d}",a->addr,a->straddr,a->rulenumber);
#else
	fprintf(fid, "  {%8d, %8d}",a->addr,a->straddr);
#endif
	if (a->next)  fprintf(fid,",");
	else          fprintf(fid," ");
	fprintf(fid, "    /*<%s>*/\n",p);
    }
    if (count>0) fprintf(fid,"  };");

    fprintf(fid,"\n");
    return count;
}


/*

Structure of sorted ltrie in three bytes:

0 1 2 3 4 5 6 7 | 0 1 2 3 4 5 6 7 | 0 1 2 3 4 5 6 7
---------------------------------------------------
     char       | E R B M - * * * | * * * * * * * *   
---------------------------------------------------
                  
7 6 5 4 3 2 1 0 | F E D C B A 9 8   7 6 5 4 3 2 1 0
                  
E: BIT IS SET IF endoflex is set (1), otherwise NOEXIT (0)
R: right bit
B: down pointer big interpret number as address in 
   long pointer array.
M: is set to 1 if there is more information
*: pointer to next or pointer in next table
*/	


/* dwn is either direct or indirect relative pointer. If indirect it's value 
   is the index in the long pointer array 
*/


void compressed_dump_sorttrie(FILE *fid, SortTrie *Lt, const char *name, 
			      StringPool *strpool,  const char *associatedname) 
{
    int i;
    
    unsigned int dwn;
    unsigned int c2,c3;
    int acount;
    const char *assocname;
    unsigned char ch1;

//    make_file_header(fid, "generated by compressed_dump_sorttrie()" );
    
    fprintf(fid,"\n /* Dump of Sorted Letter Tree  \n   Realloc size %i\n",Lt->increments);
    fprintf(fid,"  Size: %i.  Number of Nodes %i, Empty nodes %i. \n",Lt->size,Lt->nnodes,Lt->nempty);
    fprintf(fid,"  Last: %i.  Current  %i, Stop Condition %i. String search index %i. */ \n",
	    Lt->last,Lt->current,Lt->stopcondition,Lt->searchposition);
    
    fprintf(fid,"/* Number of long jump pointers in table: %6i */\n",Lt->nlongdown);
    

    if (Lt->nlongdown != 0) 
    {
	fprintf(fid,"  CONST U16 LDP_%s[%d] = {\n",name, Lt->nlongdown);
	for (i=0;i<Lt->nlongdown;i++) 
	{
	    fprintf(fid,"%8i",Lt->downlongarray[i]);
	    if (i < (Lt->nlongdown-1)) fprintf(fid,",");
	    if ((i+1)%8 == 0) fprintf(fid,"\n");
	}
	fprintf(fid,"  };\n");
    }
#ifdef ITALIAN
    fprintf(fid,"\n\nCONST  IT_sortcomptrie %s_array[%d] = {",name,Lt->last);  
#else
    fprintf(fid,"\n\nCONST  sortcomptrie %s_array[%d] = {",name,Lt->last);  
#endif

#ifdef COMMENTS_MARKED
    fprintf(fid," /* C E R B A    dwn*/");
#endif
    fprintf(fid,"\n");

    for (i=0; i<Lt->last; i++)
    {
	if (Lt->Nodes[i].right > 1)
	{
	    fprintf(stderr, "ERR: input file improperly sorted \n");
	}
	
	dwn = (unsigned int) Lt->Nodes[i].down;
	if (Lt->Nodes[i].bigdown>0) dwn = (unsigned int) (Lt->Nodes[i].bigdown -1);
	
	c2 = ((unsigned int) Lt->Nodes[i].info)<<7  
	    | ((unsigned int) Lt->Nodes[i].right)<<6 
	    | ((unsigned int) (Lt->Nodes[i].bigdown >0 )) <<5  
	    | (Lt->Nodes[i].addinfo)<<4
	    |  (dwn>>8);

	c3 = (unsigned int) (0X00FF & dwn);
	ch1= Lt->Nodes[i].letter;
	fprintf(fid,"         {0x%02X, 0x%02X, 0x%02X}",  ch1,c2,c3);
	if ((i+1) < Lt->last) fprintf(fid,", ");
	else 	fprintf(fid,"};");

#define COMMENTS_MARKED
#ifdef COMMENTS_MARKED
/* put comment in data file at each line */	
	fprintf(fid,"    /*"); 
	fprintf(fid,"   %6i  %c %d %d %d %d %6d  ",i,
		Lt->Nodes[i].letter,
		Lt->Nodes[i].info,
		Lt->Nodes[i].right,
		Lt->Nodes[i].bigdown>0,
		Lt->Nodes[i].addinfo,
		Lt->Nodes[i].down);
	fprintf(fid,"*/");
/* end of comment */
#endif //COMMENTS_MARKED

	fprintf(fid,"\n"); 
    }

    acount = show_associated_list(Lt,fid,strpool,associatedname);

#ifdef this_shit_goes
    if (acount==0) assocname = "0";
    else assocname = associatedname;
    
    if (Lt->nlongdown != 0) 
    {
	fprintf(fid,"\n         /* sorttrie , nlong , lpointerlist, n_assoc, asscoc */\n");
	if (acount!=0) fprintf(fid,"CONST   SortLtrieBlock SLT_%s = {%s_array,%d, LDP_%s, %d , %s_assoc};\n",
			       name, name, Lt->nlongdown, name, acount, assocname);
	else fprintf(fid,"CONST   SortLtrieBlock SLT_%s = {%s_array, %d, LDP_%s,%d , 0};\n",
		name, name, Lt->nlongdown, name, acount);
    }
    else
    {
	fprintf(fid,"\n         /* sorttrie , nlong , lpointerlist, n_assoc, asscoc */\n");
	if (acount!=0) fprintf(fid,"CONST   SortLtrieBlock SLT_%s = {%s_array, 0 , 0 , %d, %s_assoc };\n",
			       name, name,acount, assocname);
	else fprintf(fid,"CONST   SortLtrieBlock SLT_%s = {%s_array, 0 , 0 , 0 , 0 };\n",
			       name, name);
    }
#endif

}



void list_compressed_sorttrie(FILE *fid, SortTrie *Lt, const char *name, 
			      StringPool *strpool,  const char *associatedname) 
{
    int acount;
    int nn;
    const char *assocname;

    acount = length_of_associated_list(Lt);
    if (acount==0) assocname = "0";
    else assocname = associatedname;
    
    if (Lt->nlongdown != 0) 
    {
	//fprintf(fid,"\n         /* sorttrie , nlong , lpointerlist, n_assoc, asscoc */\n");
	if (acount!=0) fprintf(fid," {%s_array,%d, LDP_%s, %d , %s_assoc},\n",
			       name, Lt->nlongdown, name, acount, assocname);
	else fprintf(fid," {%s_array, %d, LDP_%s,%d , 0},\n",
		     name, Lt->nlongdown, name, acount);
    }
    else
    {
	//fprintf(fid,"\n         /* sorttrie , nlong , lpointerlist, n_assoc, asscoc */\n");
	if (acount!=0) fprintf(fid," {%s_array, 0 , 0 , %d, %s_assoc },\n",
			        name,acount, assocname);
	    else fprintf(fid," {%s_array, 0 , 0 , 0 , 0 },\n",
			 name);
    }
}


/* the following programs, extend_lt_right, extend_lt_left,
   are special subroutines used in building an Ltrie
*/

U16  extend_lt_right(SortTrie *trie,  char letter, char info)
{
  int last;
  int curr;

  curr = trie->current;

  last = make_new_node(trie);
  trie->nnodes += 1;
  trie->Nodes[last].letter = letter;
  if (letter=='.') trie->Nodes[last].letter = ' ';
  //DEBUG_printf("Extend right letter %c\n",letter);
  trie->Nodes[last].info = info;
  trie->Nodes[last].down = 0;
  trie->Nodes[last].right = 0;
  trie->Nodes[curr].bigdown=0;
  trie->Nodes[curr].right = last-curr;   // differential
  trie->current=last;
  return last;
}

U16  extend_lt_down(SortTrie *trie,  char letter, char info)
{
  int last;
  int curr;

  curr = trie->current;

  last = make_new_node(trie);
  trie->nnodes += 1;
  trie->Nodes[last].letter = letter;
  if (letter=='.') trie->Nodes[last].letter = ' ';
  //DEBUG_printf("Extend down letter %c\n",letter);
  trie->Nodes[last].info = info;
  trie->Nodes[last].down = 0;
  trie->Nodes[last].right = 0;
  trie->Nodes[curr].bigdown=0;
  trie->Nodes[curr].down = last-curr;    // differential
  if (trie->Nodes[curr].down > 2047) trie->Nodes[curr].bigdown = 1;
  trie->current=last;
  if (trie->Nodes[curr].bigdown == 1)
  {
    trie->downlongarray[trie->nlongdown] = last-curr;
    trie->Nodes[curr].bigdown = trie->nlongdown+1;       
    trie->nlongdown += 1;
  }
  return last;
}

/* 
   match_string attempts to find a string in the sorted Ltrie.
   This subroutine operates on the expanded form of the ltrie 
*/

U16 match_string(char *str, SortTrie *Lt)
{
  U16  ii,len,curr,match,lastletter;
  char cc;
  Lt->stopcondition = SORTTRIE_NIL;  // reset
  len = strlen(str);
  if (len == 0) return 0;

  curr = 0;     // start at epsilon node, the empty letter.
  match=0;
  ii = 0;
  //DEBUG_printf("Start match %s\n",str);

  while ((cc = str[ii++] ) != 0) 
    {
	if (cc=='.') cc=' ';
      lastletter=ii-1;
      //DEBUG_printf("searching for %c .......\n",cc);
      if (Lt->Nodes[curr].right != NIL)
	{
	  curr = Lt->Nodes[curr].right + curr; // differential now
	  Lt->current = curr;
	}
      else
	{
	  //DEBUG_printf("got out while stepping right\n");
	  Lt->stopcondition = SORTTRIE_NORIGHT;  // last node has no righ field.
	  match=0;
	  break;
	}
      if (Lt->Nodes[curr].letter == cc)
	{
	  match = 1;    //DEBUG_printf("Match %c at node %i \n",cc,curr);
	}
      else
	{
	  match=0;
	  while(Lt->Nodes[curr].down != NIL && match == 0)
	    {
	      curr = Lt->Nodes[curr].down + curr;  // differential 
	      Lt->current = curr;
	      if (Lt->Nodes[curr].letter == cc)
		{
		  match = 1;   //DEBUG_printf("Match %c at node %i after down\n",cc,curr);
		  break;
		}
	    }
	  if (match==0) 
	    {
	      //DEBUG_printf("got out going down\n");
	      Lt->stopcondition = SORTTRIE_NODOWN;  // last node has no down next field.
	      break;
	    }
	}
    }
  Lt->current = curr;   // at any rate.
  Lt->searchposition = lastletter;
  //DEBUG_printf("final position in trie: %i.\n",curr);
  if ((curr != NIL ) && match == 1)
    {
      if (Lt->Nodes[curr].info == SLENDOFLEX) Lt->stopcondition = SORTTRIE_ENDOFLEX;  // exact match.
      else 
	{
	  Lt->stopcondition = SORTTRIE_INCOMPLETE;   // string matches but is only part of a lexeme.
	  match=0;
	}
      return match;
    }
  else
    {
      return 0;
    }
}

U16 retrieve_string_location(char *str, SortTrie *Lt)
{
  U16  ii,len,curr,match,lastletter;
  char cc;
  Lt->stopcondition = SORTTRIE_NIL;  // reset
  len = strlen(str);
  if (len == 0) return 0;

  curr = 0;     // start at epsilon node, the empty letter.
  match=0;
  ii = 0;
  //DEBUG_printf("Start match %s\n",str);

  while ((cc = str[ii++] ) != 0) 
    {
	if (cc=='.') cc=' ';
      lastletter=ii-1;
      //DEBUG_printf("searching for %c .......\n",cc);
      if (Lt->Nodes[curr].right != NIL)
	{
	  curr = Lt->Nodes[curr].right + curr; // differential now
	  Lt->current = curr;
	}
      else
	{
	  //DEBUG_printf("got out while stepping right\n");
	  Lt->stopcondition = SORTTRIE_NORIGHT;  // last node has no righ field.
	  match=0;
	  break;
	}
      if (Lt->Nodes[curr].letter == cc)
	{
	  match = 1;    //DEBUG_printf("Match %c at node %i \n",cc,curr);
	}
      else
	{
	  match=0;
	  while(Lt->Nodes[curr].down != NIL && match == 0)
	    {
	      curr = Lt->Nodes[curr].down + curr;  // differential 
	      Lt->current = curr;
	      if (Lt->Nodes[curr].letter == cc)
		{
		  match = 1;   //DEBUG_printf("Match %c at node %i after down\n",cc,curr);
		  break;
		}
	    }
	  if (match==0) 
	    {
	      //DEBUG_printf("got out going down\n");
	      Lt->stopcondition = SORTTRIE_NODOWN;  // last node has no down next field.
	      break;
	    }
	}
    }
  if (match==1) return curr;
  else return 0;
}
 
/* 
   insert a string to a sorted trie if it is not already in the trie.
   The subroutine first checks using match_string() if the string is
   already in the trie. 
   this subroutine operates on the expanded form of the ltrie 
*/


U16 insert_string_to_sorttrie(char *str, SortTrie *Lt)
{
  U16 match;
  U16 info;
  int ii=0;
  int len;


  len = strlen(str);

  match = match_string(str, Lt);
  if (match==1) return 1;
  else
    {
      switch (Lt->stopcondition)
	{
	case SORTTRIE_EMPTY:
	  for (ii=0; len; ii++)
	    {
	      if (ii==(len-1)) 
		{
		  info = SLENDOFLEX; 
		}
	      else
		{
		  info = SLNOEXIT;
		}
	      extend_lt_right(Lt,str[ii],info); 
	    }
	  break;

	case SORTTRIE_INCOMPLETE:                     // found string but was not end of affix
	  Lt->Nodes[Lt->current].info = SLENDOFLEX;  // tree needs no new nodes
	  break;

	case SORTTRIE_NORIGHT:
	  for (ii=Lt->searchposition; ii<len; ii++)
	    {
	      if (ii==(len-1)) 
		{
		  info = SLENDOFLEX; 
		}
	      else
		{
		  info=SLNOEXIT;
		}
	      extend_lt_right(Lt,str[ii],info);
	    }
	  break;

	case SORTTRIE_NODOWN:
	  ii = Lt->searchposition;

	  if (ii==(len-1))
	    {
	      info = SLENDOFLEX; 
	    }
	  else
	    {
	      info = SLNOEXIT;
	    }
	  extend_lt_down(Lt,str[ii],info);

	  for (ii=Lt->searchposition+1; ii<len; ii++)
	    {
	      if (ii==(len-1)) 
		{
		  info = SLENDOFLEX; 
		}
	      else
		{
		  info = SLNOEXIT;
		}

	      extend_lt_right(Lt,str[ii],info);
	    }
	  break;
	default:
	  //DEBUG_printf("uncovered stopcondition in trie: %i\n",Lt->stopcondition);
	    break;
	}
    }
}


/* reads a token file and converts it into a letter trie */
/* this program is obsolete. It needs to be replaced 
   by a program that first puts the words in a list,
   then the list needs to be sorted and then a sorted
   ltrie is generated.
*/
SortTrie *file2sorttrie(const char *filename, const U16 type, StringPool *phonemepool)
{
  SortTrie *Lt;
  FILE *stream;
  int eof,numtokens;
  U16 phonemehandle, rule;
  U16 addr;
  
  char *pin;
  char inp[MAX_TOKEN_LENGTH];
  char conv[MAX_TOKEN_LENGTH];

  stream = fopen(filename,"r");
  if (stream==NULL)
    {
      fprintf(stderr, "ERR: File %s could not be opened\n",filename);
      perror(filename);
      exit(1);
    }

  Lt = make_new_sorttrie(SORTTRIE_CHUNK_SIZE,SORTTRIE_CHUNK_SIZE,type,phonemepool);

  eof=0;
  numtokens=0;

  while (eof==0)
    {
      pin = fgets(inp,MAX_TOKEN_LENGTH,stream);
      if (!pin)
	{
	  eof = 1;
	  break;
	}
      else if (pin[0] != '#')
	{
	  ++numtokens;
	  // printf("%i [%s]\n",strlen(pin),pin);
	  pin = cleanup_string(inp);   // usually remove trailing blanks and other white space chars.
	  // printf("%i [%s]\n",strlen(pin),pin);
	  insert_string_to_sorttrie(pin , Lt);
	  addr = retrieve_string_location(pin, Lt);
	  printf("[%s] @ %d \n",pin,addr);
	}
    }
  fclose(stream);

  return Lt;
}


int  segment_string_in_three(ASCIILETTER *pin, ASCIILETTER **p1, ASCIILETTER **p2, ASCIILETTER **p3)
     /* Cut input string pin into 1,2 or 3 parts if they are of any of the 
	following formats: 
	string 
	string<string2> 
	string<string2><string3>
	returns number of partial strings and sets appropriate pointers in p1,p2,p3.
	p2 and or p3 are NULL if the second or third string is not defined.
	Assumption: The input string is already free of whitespaces.
	Assumption: The input string is non const, and can be modified.
	            (characters '<' and '>' will be replaced by '\0'
	Warning: This function can not be called with a string that is const or
	         implicitely declared const by the compiler. 
	The subroutine is stupid: It will not recognize any syntax errors. 
     */
{
  int i,kk;
  int len, bracketcnt;
  ASCIILETTER *pp;
  ASCIILETTER* parray[3];

  parray[0]=NULL;
  parray[1]=NULL;
  parray[2]=NULL;
  
  len = strlen(pin);
  pp = pin;
  *p1 = pin;
  kk =0;

  bracketcnt=0;

  parray[kk++] = pin;

  
  // printf("%s \n",pin);

  for (i=0;i<len;i++)
    {

      if (pin[i] == '<') 
	{
	  bracketcnt++;
	  pin[i]='\0';  
	  parray[kk++] = &(pin[i+1]);
	}
      if (pin[i] == '>')
	{
	  bracketcnt--;
	  pin[i]='\0';  
	}
    }
  *p1 = parray[0];
  *p2 = parray[1];
  *p3 = parray[2];
  
  if (bracketcnt!=0) 
    {
      return -1;
    }

  //  printf("segment3.. returns %i\n",kk);
  return kk;
}
  

int  split_vocabulary_entry(ASCIILETTER *bp, ASCIILETTER **word, ASCIILETTER **phone, U16 *rule)
     /* this function receives a string consisting either of a 
	single word (a morpheme) or a morpheme plus a phoneme
	string in <.> brackets, or a morpheme plus a phoneme
	string plus a rule number in brackets.
	The phoneme string is registered in a Morpheme dictionary.
	If the morpheme is paired with a phoneme string, 
	the index of that string is returned.
	The third field in the input string is interpreted by atoi 
	as a rule number. If the field does not exist, a zero
	is returned in the reference field *rule. 
     */
{
    int jj;
    ASCIILETTER *p1,*p2,*p3;
    ASCIILETTER *res,*pin;
    
    *word = (ASCIILETTER *) NULL;
    *phone = (ASCIILETTER *) NULL;
    *rule = 0;         /* a rule number. The third string field is interpreted as a numeral. */
    
    //  printf("%s\n",bp);

    pin = cleanup_string(bp);    // remove blanks and final comments, pin becomes bp
    
    jj = segment_string_in_three(pin,&p1,&p2,&p3);
    //printf("found %d segments \n",jj);
    switch (jj)
    {
	case -1:
	    return 0;  // indicating something went wrong (usually reading the file).
	case 1:
	    *word = p1;
	    *phone = (ASCIILETTER *) NULL;
	    *rule = 0;
	    break;
	case 2:
	    *word = p1;
	    *phone = p2; 
	    *rule = 0;
	    break;
	case 3:
	    *word = p1;
	    *phone = p2;
	    *rule = atoi(p3);    // look mom, no error checking!!.
	    break;
    }        
    return jj;
}



/* converts a sorted word list to a letter trie */
SortTrie *swordlist2sorttrie(swordlist *wl, const U16 type, StringPool *phonemepool)
{
    SortTrie *Lt;
    strindx *sx;
    U16 addr;
    
    Lt = make_new_sorttrie(SORTTRIE_CHUNK_SIZE,SORTTRIE_CHUNK_SIZE,type, phonemepool);
    
    printf("Word list of %d words\n",wl->n);
    
    for (sx = wl->first_word; sx != (strindx *) NULL; sx = sx->next)
    {
	insert_string_to_sorttrie(sx->word , Lt);
	addr = retrieve_string_location(sx->word, Lt);
	sx->indx = addr;
	printf("[%s] @ %d \n",sx->word,addr);
    }
    return Lt;
}


void add_to_associated_list(U16 addr, U16 relstraddr, U16 rule, SortTrie *ST)
{
    AssociatedInfo *newa;

    newa = (AssociatedInfo *) calloc(1,sizeof(AssociatedInfo));

    newa->addr = addr;
    newa->straddr = relstraddr;
    newa->rulenumber = rule;
    newa->next = (AssociatedInfo *) NULL;

    if (!(ST->assoc_first))
    {
	ST->assoc_first = newa;
	ST->assoc_last = newa;
    }
    else
    {
	ST->assoc_last->next = newa;
	ST->assoc_last = newa;
    }
}

void filedump_stringpool(FILE *fid, 
			 StringPool *strpool, 
			 const char *typename, 
			 const char *variablename)
{
    int i;

    if (strpool->buflen == 0)
    {
	fprintf(fid,"\n /* Empty string pool */\n");
    }
    else
    {
	fprintf(fid,"\n/* What follows is the string pool for phonemes (can be empty) */\n");
	fprintf(fid,"%s  %s_strpool[%d] = {\n",typename,variablename,strpool->buflen);
	for (i=0; i<strpool->buflen ; i++)
	{
	    fprintf(fid," 0x%.2x",strpool->bigbuffer[i]);
	    if (i<strpool->buflen-1) fprintf(fid,",");
	    if ( (i-8*(i>>3)) == 7) fprintf(fid,"\n");
	}
    fprintf(fid,"};\n\n");
    }
}



/* converts a sorted word list to a letter trie */
SortTrie *extended_swordlist2sorttrie(swordlist *wl, const U16 type,StringPool *phonemepool)
{
    SortTrie *Lt;
    strindx *sx;
    U16 addr;
    U16 relstraddr;
    ASCIILETTER *stringaddress;

    stringaddress = (ASCIILETTER *) NULL;
    
    Lt = make_new_sorttrie(SORTTRIE_CHUNK_SIZE,SORTTRIE_CHUNK_SIZE,type,phonemepool);
    
    printf("Word list of %d words\n",wl->n);
    
    for (sx = wl->first_word; sx != (strindx *) NULL; sx = sx->next)
    {
	insert_string_to_sorttrie(sx->word , Lt);
	addr = retrieve_string_location(sx->word, Lt);
	sx->indx = addr;
	
	if (sx->phones) 
	{
	    Lt->Nodes[addr].addinfo = 1;     // otherwise 0 while generated. 
	    printf("[%s] @ %d -> %s <%d> \n",sx->word,addr,sx->phones,sx->rule);

	    relstraddr = put_in_string_pool(sx->phones,Lt->phonemepool,&stringaddress); /*returns rel string addr*/
	    add_to_associated_list(addr, relstraddr, sx->rule, Lt);
	}
	else
	{
	    printf("[%s]@%d \n",sx->word,addr);
	}
    }
    return Lt;
}




/* find the words in a string. 
   returns the number of words seperated by blanks
   in a string and stores the locations of the first
   and last characters in the string.
*/

int locate_words_in_string(char *str,int *starts,int *ends)
{
    int i,kk,len;
    int n1,n2;
    char c;
    char *p;

    p = str;
    kk = 0;
    n1=0;
    n2=0;
    i=0;
    
    while ((c = *p++) != '\0' && c != '#')        // stop at comment 
    {
	i++;
	if (isspace(c)) 
	{
	    if (n2>0)
	    {
		starts[kk]=n1;
		ends[kk]=n2;
		n2 =0;
		n1 =0;
		kk += 1;
	    }
	    n1=i;
	}
	else
	{
	    n2 = i-1;
	}
    }

    if (n2>0)
    {
	starts[kk]=n1;
	ends[kk]=n2;
	n2 =0;
	n1 =0;
	kk += 1;
    }
    return kk;
}

void show_swordlist(swordlist *wl)
{
    strindx *sx;

    printf("Word list of %d words\n",wl->n);
    for (sx = wl->first_word; sx != (strindx *) NULL; sx = sx->next)
    {
	printf("%i %s\n",sx->indx, sx->word);
    }
}

int numerate_swordlist(seqpile *SQ)
{
    strindx *sx;
    int k;
    swordlist *wl;

    wl = &(SQ->wl);

    k=0;
    for (sx = wl->first_word; sx != (strindx *) NULL; sx = sx->next)
    {
	sx->indx = k++;
    }
    if (wl->n != k) crash_this_thing("Mismatch between words in list and actual number of members\n");
    return k;
}


int compare_words(const void *a, const void *b)
{
    strindx **ax, **bx;

    ax = (strindx **) a;
    bx = (strindx **) b;
//    printf("Comparing %s with %s",(*ax)->word, (*bx)->word);
//    printf("Comparing %X with %X\n",*ax, *bx);

    return (strcmp((*ax)->word, (*bx)->word));
}

void show_sequences(FILE *fid, sequenceset *seq)
{
    int i;
    seqarray *s;

    fprintf(fid,"There are %d sequences in %s \n",seq->n,seq->name);

    for (s = seq->first_seq; s != (seqarray *) NULL; s = s->next)
    {
	fprintf(fid,"Sequence of %d: ",s->nwords);
	for (i=0;i<s->nwords;i++)
	{
	    fprintf(fid,"[%d:%s] ",s->words[i]->indx,s->words[i]->word);
	}
	fprintf(fid,"\n");
    }
}

// make a data statement for an include file from the 
//   sequences associated with a name 
void file_dump_sequences(FILE *fid, sequenceset *seq)
{
    int i;
    seqarray *s;

    fprintf(fid,"/* There are %d sequences in %s */ \n",seq->n,seq->name);
    fprintf(fid,"CONST U16 %s[]={\n",seq->name);                     // name of the sequences      

    for (s = seq->first_seq; s != (seqarray *) NULL; s = s->next)
    {
	fprintf(fid,"%d, ",s->nwords);
	for (i=0;i<s->nwords;i++)
	{
	    fprintf(fid,"%d, ",s->words[i]->indx);
	}
#ifdef COMMENTS_MARKED
	fprintf(fid,"     /* ");
	for (i=0;i<s->nwords;i++)
	{
	    fprintf(fid,"%s ",s->words[i]->word);
	}
	fprintf(fid," */ ");
#endif

	fprintf(fid,"\n");
    }
    fprintf(fid,"0 };\n\n");
}


void show_all_sequences(FILE *fid,seqpile *SQ)
{
    int k;

    for (k=0;k<SQ->nseq;k++)
    {
	file_dump_sequences(fid, SQ->sequencesets[k]);
    }
}


void sort_swordlist(swordlist *wl)
{
    strindx *sx;
    strindx **array;
    int k;
    int i;
    int numwords = wl->n;

    array = (strindx **) calloc(numwords, sizeof(strindx *));
    if (!array) crash_this_thing("sort_wordindex_list big array calloc crash boom");

    k=0;
    
    for (sx=wl->first_word; sx != (strindx *) NULL; sx=sx->next)
    {
	array[k++]=sx;
    }
    for (i=0;i<k;i++)
    {
	printf("%d %X %s\n",i,array[i],array[i]->word);
    }

    qsort(array, numwords, sizeof(strindx *), compare_words);
    
    wl->first_word = array[0];
    wl->last_word = array[numwords-1];

/* rechain them */

    for (k=0;k<numwords;k++) 
    {
	array[k]->indx=k;
	if (k<(numwords-1)) array[k]->next = array[k+1];
	else              array[k]->next = (strindx *)NULL; 
	printf("%i: %s\n",k,array[k]->word);
    }

    free ((void *) array);
}

void order_sequence_piles(seqpile *SQ)
{
    int numwords;
    
    numwords = numerate_swordlist(SQ);  
//    show_swordlist(&(SQ->wl));
    sort_swordlist(&(SQ->wl));
//    printf("-----\n");
//    show_swordlist(&(SQ->wl));
}


strindx *find_in_word_list(char *word,swordlist *wl)
{
    strindx *sx;

    for (sx = wl->first_word; sx != (strindx *) NULL; sx = sx->next)
    {
	if (strcmp(sx->word,word)==0)
	{
	    return sx;
	}
    }
    return (strindx *) NULL;
}

/* ---- copy_to_word_list: 
   first checks if the word is already in the list and if not, creates a
   new list member. strdup is used to reproduce the string that's hung into
   the list.
*/	  
strindx *copy_to_word_list(char *word,swordlist *wl)
{
    strindx *sx;

    for (sx = wl->first_word; sx != (strindx *) NULL; sx = sx->next)
    {
	if (strcmp(sx->word,word)==0)
	{
	    return sx;
	}
    }
	   
    if (wl->last_word == (strindx *) NULL)
    {
	wl->first_word = wl->last_word = (strindx *) calloc(1,sizeof(strindx));
	sx = wl->last_word;
	sx->next = 0;
	wl->n = 1;
    }
    else
    {
	sx = wl->last_word;
	wl->last_word = (strindx *) calloc(1,sizeof(strindx));
	wl->last_word->next = (strindx *) NULL;
	sx->next = wl->last_word;
	wl->n += 1;
    }

    wl->last_word->word = strdup(word);
    return wl->last_word;
}

/* ---- duplicate_sequence_and_words
   receives a string as input in which the first blank after 
   each word are already replaced by zeros. the array starts
   contains the string addresses of the words' first letters.
   It then generates an array that contains the words, 
   duplicated with strdup in copy_to_word_list().
*/    
seqarray *duplicate_sequence_and_words(char *str, int numwords,int *starts,swordlist *wl)
{
    int k;
    strindx *stptr;
    seqarray *seq;
   
    seq = (seqarray *)  calloc(1, sizeof(seqarray));
    if (!seq) crash_this_thing("duplicate_sequence_and_words 1");
    
    seq->nwords = numwords;
    seq->words = (strindx **) calloc(numwords,sizeof(strindx *)); // pointer array

    for (k=0;k<numwords; k++) 
    {
	printf("%s, ",&str[starts[k]]);
	stptr = copy_to_word_list(&str[starts[k]], wl);
	seq->words[k] = stptr;
    }
    printf("\n");

    return seq;
}

/* Read a file that contains single words or sequences of words in each line,
seperated by blanks. It calls locate_words_in_string to mark the beginnings of 
each word and then duplicates each word sequence. 
*/
sequenceset *read_sequences(const char *filename, const char *name, seqpile *SeqPile)
{
    FILE *stream;
    int eof;
    char *pin;
    char inp[MAX_SEQUENCE_LENGTH];
    int k;
    int numseq, numwords;
    int starts[10],ends[10];
    char *stptr;
    seqarray *seq;
    sequenceset *seqset;

    eof=0;
    numseq=0;

    stream = fopen(filename,"r");
    if (stream==NULL)
    {
	fprintf(stderr, "ERR: File %s could not be opened\n",filename);
	perror(filename);
	exit(1);
    }

    printf("DEBUG: successfully opened %s in read_sequences() defining sequence named %s\n",filename,name);

    seqset = (sequenceset *) calloc(1,sizeof(sequenceset));
    
    if (!seqset) crash_this_thing("read_sequences first calloc crash boom ");


    seqset->first_seq = seqset->last_seq = (seqarray *) NULL;
    seqset->name = strdup(name);
    seqset->n = 0;

 while (eof==0)
    {
      pin = fgets(inp,MAX_SEQUENCE_LENGTH,stream);
      if (!pin)
	{
	  eof = 1;
	  break;
	}
      else if (pin[0] != '#')
	{
	  ++numseq;
	  numwords = locate_words_in_string(inp,starts,ends);  // finds the words
	  if (numwords>0)
	  {
	      for (k=0;k<numwords;k++)
	      {
		  inp[ends[k]+1]='\0';
	      }

	      seq = duplicate_sequence_and_words(inp, numwords,starts,&(SeqPile->wl));
	      if (seqset->n  == 0)
	      {
		  seqset->first_seq = seqset->last_seq = seq;
		  seq->next = (seqarray *) NULL;
		  seqset->n = 1;
	      }
	      else
	      {
		  seqset->last_seq->next = seq;
		  seqset->last_seq = seq;
		  seq->next = (seqarray *) NULL;
		  seqset->n += 1;
	      }		  
	  }
	}
    }
  fclose(stream);

  SeqPile->sequencesets[SeqPile->nseq] = seqset;
  SeqPile->nseq += 1;
  return seqset;
}


SortTrie *file2extendedsorttrie(const char *filename, const U16 type, StringPool *phonemepool)
{
  SortTrie *Lt;
  int res;
  FILE *stream;
  int eof,numtokens;
  ASCIILETTER *word;
  ASCIILETTER *phone;
  U16 rule;
  U16 addr;
  strindx *sx;
  swordlist *wl;

  char *pin;
  char inp[MAX_TOKEN_LENGTH];


  wl = new_swordlist();


  stream = fopen(filename,"r");
  if (stream==NULL)
    {
      fprintf(stderr, "ERR in file2extendedsorttrie: File %s could not be opened\n",filename);
      perror(filename);
      exit(1);
    }

  eof=0;
  numtokens=0;

  while (eof==0)
    {
      pin = fgets(inp,MAX_TOKEN_LENGTH,stream);
      if (!pin)
	{
	  eof = 1;
	  break;
	}
      else if (pin[0] != '#')
	{
	    res = split_vocabulary_entry(pin, &word, &phone, &rule);
	    
	    if (res > 0)
	    {
		++numtokens;
		
		sx = find_in_word_list(word, wl);
		if (sx != (strindx *) NULL) 
		{
		    fprintf(stderr,"Word was already in list - word info will be overwritten : \n");
		    fprintf(stderr,"%s in %s\n", word,filename);
		}
		else
		{
		    sx = copy_to_word_list(word,wl);
		}

		if (sx)
		{
		    if (phone != (ASCIILETTER *) NULL)
		    {
			printf("Phone: %s",phone);
			sx->phones = strdup(phone);
			sx->rule = rule;
		    }
		    else
		    {
			sx->phones = (ASCIILETTER *) NULL;
			sx->rule = 0;
		    }
		}
	    }
	}
    }
  fclose(stream);

  sort_swordlist(wl);

  Lt = extended_swordlist2sorttrie(wl, LONG_MORPH_FIRST,phonemepool);

  return Lt;

}

stdict *new_stringdictionary()
{
    stdict *n;
    n = (stdict *) calloc(1,sizeof(stdict));
    if (!n) crash_this_thing("calloc failed in new_stringdictionary()");
    return n;
}

stdictword *new_dict_word(char *name, char *name2, int ident)
{
    stdictword *w;

    w = (stdictword *) calloc(1,sizeof(stdictword));
    if (!w) crash_this_thing("calloc failed in new_dict_word()");   
     
    w->name = strdup(name);
    w->name2 = strdup(name2);
    w->ident = ident;
    w->next = (stdictword *) NULL;
    return w;
}

void enumerate_dict(stdict *d)
{
    stdictword *w;
    int count;
    count=0;

    for (w = d->first; w != (stdictword *) NULL; w = w->next)
	{
	    w->ident = count;
	    count += 1;
	}
}

int add_new_pair_to_dict(stdict *d, char *name, char *name2, int ident)
{
    stdictword *w;
    int count;
    int id;
    count=0;

    if (d->first == (stdictword *) NULL)
    {
	if (ident<0) id = count; else id = ident;
	w = new_dict_word(name, name2, id);
	d->first = w;
	d->last = w;
	d->numwords=1;
	return 0;
    }
    else
    {
	count=0;
	for (w = d->first; w != (stdictword *) NULL; w = w->next)
	{
	    count += 1;
	    if (strcmp(name,w->name) == 0)
	    {
		return count;
	    }
	}
    }
    
    if (ident<0) id = count; else id = ident;
    w = new_dict_word(name, name2, id);

    d->last->next = w;
    d->last = w;
    d->numwords += 1;

    return 0;
}

void read_stdict(stdict *d)
{
    stdictword *s;
   
    s = d->first;

    for (s=d->first; s != (stdictword *) NULL; s = s->next)
    {
	printf(" %s %s %d\n",s->name,s->name2,s->ident);
    }
}


char *translate_from_stdict(stdict *d, char *name, int *ident)
{
    stdictword *s;

    *ident = 0;

    for (s=d->first; s != (stdictword *) NULL; s = s->next)
    {
	if (strcmp(name,s->name) == 0)
	{
	    *ident = s->ident;
	    return s->name2;
	}
    }
    return (char *) NULL;
}

/* look for the second string instead of the first */

char *translate_backwards_from_stdict(stdict *d, char *name, int *ident)
{
    stdictword *s;

    *ident = 0;

    for (s=d->first; s != (stdictword *) NULL; s = s->next)
    {
	if (strcmp(name,s->name2) == 0)
	{
	    *ident = s->ident;
	    return s->name;
	}
    }
    return (char *) NULL;
}

  
// #define _test_with_a_main_
#ifdef _test_with_a_main_
StringPool thestringpool;
int main(int argc, const char** argv)
{
  U16 current;
  U16 match;
  int numwords;
  int numseq;
  swordlist WL;
  SortTrie *LT,*LT2;  // make_new_sorttrie(20,40);
  seqpile *SQ;
  FILE  *fid;

  SQ = new_seqpile(10);

  
//  LT = file2sorttrie("testwordlist.txt",LONG_MORPH_FIRST);


  init_string_pool(&thestringpool);

  read_sequences("vocabelsequences.txt","seq4",SQ); 
  read_sequences("testsequences.txt","seq1",SQ);
  read_sequences("testsequencesB.txt","seq2",SQ);
  read_sequences("oneseq.txt","seq3",SQ); 
  
  order_sequence_piles(SQ);

  LT2 = swordlist2sorttrie(&(SQ->wl), LONG_MORPH_FIRST,&thestringpool);

  LT = file2extendedsorttrie("vocabeln.txt", LONG_MORPH_FIRST, &thestringpool);

  fid = fopen("sorttrieout.h","w");
  if (!fid) crash_this_thing("could not open file \n");

  compressed_dump_sorttrie(fid, LT,"sortedtrie",&thestringpool,"ass");
  compressed_dump_sorttrie(fid, LT2,"sortedtrie2",&thestringpool,"aZZ");
  show_all_sequences(fid ,SQ);
  filedump_stringpool( fid,&thestringpool,"CONST  ASCIILETTER"," bach_phonemepool");
  fclose(fid);
}

#endif


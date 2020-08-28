#include "bachus.h"

/* For convenience, I included the file nodestack.c into this file since it
   is always used and only used by Gtwalker which is in this file. So 
   there is no longer a nodestack.c 
*/

//#define NODESTACKDEBUG 1

/* The subroutines dealing with the nodestack are used by GtWalker in 
   the usual fashion of a stack of node addresses. Explanation, self
   evident, I think. 
*/

GERLETTER *point_to_phoneme_string(const PhonemeWords *Mdict, U16 index) 
     /* referes to structures defined in ltrie.c */
{
  if (!index) return NULL;
  return Mdict->bigbuffer + Mdict->ptarray[index-1];  // has to be zero terminated, and is.
}


#ifdef MATCHINGTRIX

/*************** matching pieces**********/
#define MAXCANDIDATES 5
#define MAXCANDCOLLECTION 150

#include "minpath.h"
typedef
struct  _candidate {
  SHORT from;
  SHORT to;
  U16 rule;
  U16 type;
  SHORT  weight;
  GERLETTER str[20];
  GERLETTER phon[20];
}
candidate;

typedef
struct  _candidate_list {
  int nlist;
  candidate  cand[MAXCANDIDATES];
}
canditlist;

typedef 
struct _collection_list {
  int nlist;
  candidate  cand[MAXCANDCOLLECTION];
}
canditcollection;


void init_dkstate(MinPathState *dj, const int nnodes)
{
  int i;
  if (nnodes > MAXPATHNODES) 
    {
#ifndef ARM7_NOSWI
      printf("Too many nodes in initializing graph structure\n");
#endif
      return;
    }


  for (i=0;i<nnodes;i++)
    {
      dj->dist[i]=MAXDISTVALUE;
      dj->pred[i]=-1;
      dj->adj[i]=0;
      dj->nadj[i]=0;
      dj->inS[i]=0;
    }

  /*     Just overwrite, don't need to clear */
  /*
  for (i=0;i<MAXEDGES;i++)
    {
      dj->edges[i].source=0;
      dj->edges[i].destin=0;
      dj->edges[i].weight=0;
      dj->edges[i].info=0;
    }
  */

  dj->nnodes = nnodes;
  dj->nedges = 0;
  dj->n_in_S = 0;
  dj->dist[0]= 0;        // first node, node zero has a distance 0 to itself.
}

void path_addedge(MinPathState *dj, const SHORT from, const SHORT to, const SHORT w, const EdgeInfo info)
{
  int n;
  n = dj->nedges;
  dj->edges[n].source = from;
  dj->edges[n].destin = to;
  dj->edges[n].weight = w;
  dj->edges[n].info = info;
  if(n<MAXEDGES) dj->nedges += 1;
#ifndef ARM7_NOSWI
  else 
    printf("Too many edges in graph\n");
#endif
}

int edge_compare(const void *a, const void *b)
{
  Gkedge *pa,*pb;

  pa = (Gkedge*) a;
  pb = (Gkedge*) b;

  if (pa->source < pb->source) return -1;
  if (pa->source > pb->source) return 1;
  if (pa->destin < pb->destin) return -1;
  if (pa->destin > pb->destin) return 1;
  if (pa->weight < pb->weight) return -1;
  if (pa->weight > pb->weight) return 1;    /* this one was wrongly -1 */
  return 0;
}


int  sort_edges(MinPathState *dj)
{
  /* sorts edges according to source, destination 
     and then generates a structure that allows 
     direct access of all adjacent edges of a node.
  */

  int j;
  SHORT S;
  Gkedge *ed = dj->edges;
  qsort(ed,dj->nedges,sizeof(Gkedge),&edge_compare);

  for (j=0; j<dj->nedges; j++)
    {
      S = dj->edges[j].source;
      if (dj->adj[S] == 0) dj->adj[S] = j+1;    // mark first.
      dj->nadj[S] += 1;                         // count them
    }
  return dj->nedges;
}

 
void print_edges(const MinPathState *dj)
{
  int i;
  for (i=0; i<dj->nedges; i++)
    {
#ifndef ARM7_NOSWI
      printf(" %3i:   %3i -> %3i w= %3i info: %i \n",i,
	     dj->edges[i].source,
	     dj->edges[i].destin,
	     dj->edges[i].weight,
	     dj->edges[i].info);
#endif

    }
}

void print_dkstate(const MinPathState *dj,const int how)
{
#ifndef ARM7_NOSWI
  int i;
  printf("dist "); for (i=0;i<dj->nnodes;i++) printf("%3i ",dj->dist[i]); printf("\n"); 
  printf("pred "); for (i=0;i<dj->nnodes;i++) printf("%3i ",dj->pred[i]); printf("\n"); 
  printf("in S "); for (i=0;i<dj->nnodes;i++) printf("%3i ",dj->inS[i]);  printf("\n"); 
  if (how==0) return;
  printf("adj  ");  for (i=0;i<dj->nnodes;i++) printf("%3i ",dj->adj[i]); printf("\n"); 
  printf("nadj ");  for (i=0;i<dj->nnodes;i++) printf("%3i ",dj->nadj[i]); printf("\n"); 
#endif
}


int extract_min(MinPathState *dj)
{
  int i;
  int mind;
  int q;

  mind = MAXDISTVALUE;

  q = 0;

  if (dj->n_in_S == dj->nnodes) return 0;    // no more nodes found in Q: all in S.

  for (i=0;i<dj->nnodes; i++)
    {
      if (dj->inS[i] == 0)    // if it is in Q and not in S
      {
	if (dj->dist[i] < mind)
	  {
	    mind = dj->dist[i];
	    q = i+1;
	  }
      }
    }
  if (q==0)
    {
#ifdef FROMTYPED
      printf("non smaller found \n");
#endif
      return 0;
    }

  dj->n_in_S += 1;
  dj->inS[q-1] = 1;

  return q;     // returns q+1 . q=0 means not found.
}

/*
void  do_relax(MinPathState *dj, int u, int v, int w)
{
  printf("relax (%i, %i, %i)\n",u,v,w);

  if (dj->dist[v] > (dj->dist[u] + w))
    {
      dj->dist[v] = dj->dist[u] + w;
      dj->pred[v] = u;
    }
}
*/

void  relax_adjacent(MinPathState *dj, const int u)
{
  /* for each node adjacent to u relax */
  int i,n,n1;
  int v,w;

  n = dj->nadj[u];        // number of adjacent nodes
  n1 = dj->adj[u]-1;      // first adjacent node but meaningless if no adjacents

  if (n>0)
    {
      for (i=0;i<n;i++)
	{
	  v = dj->edges[n1+i].destin;   // v adjacent to u
	  w = dj->edges[n1+i].weight;
	  //  do_relax(dj, u,v,w);
	  if (dj->dist[v] > (dj->dist[u] + w))
	    {
	      dj->dist[v] = dj->dist[u] + w;
	      dj->pred[v] = u;
	    }
	}
    }
}


void process_graph(MinPathState *dj, const int nstepmax)
{
  int count;
  int q;
  
  count = 0;
  
  while (count < nstepmax)
    {
      q = extract_min(dj);
      count += 1;
      // printf(" %i:\n",count);

      if (q>0)
	{
	  // printf("extracted %i\n",q-1);
	  relax_adjacent(dj,q-1);
	  // print_dkstate(dj,0);
	}
      else break;
    }
}

EdgeInfo get_edge_info(MinPathState *dj, const SHORT ns, const SHORT nd)
{
  SHORT n,n1,i;
 
  n = dj->nadj[ns];
  if (n==0) return (EdgeInfo) 0;
  n1 = dj->adj[ns]-1;             // important dont' forget -1 here.
  for (i=0;i<n;i++)
    {
      if (dj->edges[n1+i].destin == nd) return (dj->edges[n1+i].info);
    }
  return (EdgeInfo) 0;     // does this occure?
}  

int track_path(MinPathState *dj, const int last, SHORT *path, EdgeInfo *info)
{
  int j,n,k,n1,n2;

  //   print_dkstate(dj,1);
  //  print_edges(dj);

  j = 0;
  n = last;
  if (n > dj->nnodes-1) return 0;

  if (dj->pred[n] < 0) return 0;

  while(n > -1)
    {
      path[j++]  = n;
      n = dj->pred[n];
    }
  
  n = j ;

  if (n<2) return 0;
  
  k=0;
  for (j=n-1;j>0;j--)
    {
      n1 = path[j];
      n2 = path[j-1];
      info[k++] = get_edge_info(dj,n1,n2);
    }
  return n;
}
      	

BOOL is_a_vowelgrapheme(GERLETTER c)
{
  if (c=='a' || c =='e' || c=='i' || c=='o' || c == 'u'|| c == 'y' ||
          c=='A' || c=='E' || c == 'I' || c=='O' || c == 'U'|| c=='Y' ||
          c == UML_A || c == UML_O || c == UML_U ||
          c == UML_a || c == UML_o || c == UML_u )
    return 1;
  else
    return 0;
}

BOOL is_a_consonantgrapheme(GERLETTER c)
{
  if (c >= 'a' && c<= 'z' && !is_a_vowelgrapheme(c)) return 1;
  else return 0;
}



/* We need in the interim some specific rules here to automatically generate 
   proper candidates on the fly. In particular, here the rules for 
   long versus short vowels are specified. */


int long_or_short(GERLETTER cin, GERLETTER cr, GERLETTER crr, SHORT *explain)
{
  
  const  GERLETTER *shortlist[] = {"x","ß", "sch", NULL};         
  const GERLETTER *longlist[] = {"sm", "sh","ph","rf","rl","rk","rg","rh","dr", NULL};
  int lang, len;
  int i;

  *explain += 1;
  lang  = 0; 
  
  for (i=0; shortlist[i] != NULL; i++)
    { 
      len = strlen(shortlist[i]);
      if (     
	  (len==1 && shortlist[i][0] == cr)
	  || (len==2 && shortlist[i][0] == cr && shortlist[i][1] == crr)
	  || (len==3 && shortlist[i][0] == cr && shortlist[i][1] == crr)   // cheat with the "sch".
	  )
	{ 
	  lang=1;
	}
    }
  for (i=0; longlist[i] != NULL; i++)
    {
      if (cr == longlist[i][0] && crr == longlist[i][1])
	{
	  lang=2;
	}
    }
  
  if (is_a_vowelgrapheme(cr) && cr == crr) lang=1;     // hh makes it also short, do I care?
  
  if (cr == 'h')
    {
      if (is_a_vowelgrapheme(crr)) lang = 2;
      else 
	{
	  lang=2;
	  *explain  += 1;            // we absorbe the h here and shorten the path.
	}
    }
  
  if (lang != 0) return lang;

  if (cr != '\0' && crr != '\0')
    {  
      if (is_a_consonantgrapheme(cr) && is_a_consonantgrapheme(crr)) lang=1;
      else if (is_a_consonantgrapheme(cr) && is_a_vowelgrapheme(crr)) lang=2;
      else if (is_a_vowelgrapheme(cr) && is_a_vowelgrapheme(crr)) lang = 1;
      else if (is_a_vowelgrapheme(cr) && is_a_consonantgrapheme(crr)) lang=1;
      else lang=1;
      return lang;
    }
  else if (cr != '\0')
    {
      if (is_a_consonantgrapheme(cr)) lang = 2;
      else if (is_a_vowelgrapheme(cr)) lang = 1;
      else lang=1;
    }
  else lang = 2;   // final
  return lang;
}

GERLETTER vowel_lts_rule(GERLETTER *word, SHORT from, SHORT wordlen, SHORT *explain)
{
  GERLETTER cin, cr, crr, cout;
  int lang;

  cout=cin=cr=crr='\0';
  *explain=0;
  
  cin = word[from];
  if (from+1 < wordlen) cr = word[from+1];
  if (from+2 < wordlen) crr = word[from+2];
  
  if (cr == 'e' && is_a_consonantgrapheme(crr))
    {
      if (cin=='a' || cin =='o' || cin=='u')
	{
	  cr = crr ='\0';
	  if (from+2 < wordlen) cr = word[from+2];
	  if (from+3 < wordlen) crr = word[from+3];
	  *explain += 1;
	  switch (cin)
	    {
	    case 'a': cin='ä'; break;
	    case 'o': cin='ö'; break;
	    case 'u': cin='ü'; break;
	    }
	}
      else if (cin=='i')
	{
	  *explain = 2;
	  cout = '3';
	  return cout;      // you're done.
	}
    }
  else if (cin == 'y')
    {
      if (is_a_consonantgrapheme(cr))
	{
	  cout = 'y';
	  *explain  = 1;
	}
      if (cr == 'o' || cr == 'a' || cr == 'u')
	{
	  cout = 'j';
	  *explain = 1;
	}
      else 
	{
	  cout = 'i';
	  *explain = 1;
	}
      return cout;
    }
  else if ((cin=='e') && (cr == '\0'))
    { 
      *explain = 1;
      cout = '@';
      return cout;
    }
  
  lang = long_or_short(cin,cr,crr, explain);
  // printf("lang=%i letters: [%c][%c][%c]\n",lang,cin,cr,crr);
  if (lang==1)
    {
      switch (cin)
	{
	case 'a':  cout='a'; break;
	case 'e':  cout='E'; break;
	case 'i':  cout='I'; break;
	case 'o':  cout='c'; break;
	case 'u':  cout='u'; break;
	case 'ä':  cout='V'; break;
	case 'ö':  cout='Q'; break;
	case 'ü':  cout='Y'; break;
#if !defined ARM7 && !defined __ipaq__
	case UML_a:  cout='V'; break;     // gnu cc does not get the umlaut, 
	case UML_o:  cout='Q'; break;     // so the above are doubled here 
	case UML_u:  cout='Y'; break;     // with different code
#endif
	}
    }
  else if (lang==2)
    {
      switch (cin)
	{
	case 'a':  cout='1'; break;
	case 'e':  cout='2'; break;
	case 'i':  cout='3'; break;
	case 'o':  cout='4'; break;
	case 'u':  cout='5'; break;
	case 'ä':  cout='7'; break;
	case 'ö':  cout='q'; break;
	case 'ü':  cout='6'; break;
#if !defined ARM7 && !defined __ipaq__
	case UML_a:  cout='7'; break;
	case UML_o:  cout='q'; break;
	case UML_u:  cout='y'; break;
#endif
	}
    }
  // printf("out lang=%i letters: [%c][%c][%c][%c]\n",lang,cin,cout,cr,crr);
  return cout;
}



/* The following subroutine handles a small list of string 
   candidates and orders them according to length
   For example in the word wassermann we might find 
   for the first letter wasser, wass, and w;  so these three
   would be in the candidate list. Their phonetic equivalences
   are also stuck in the list. 
*/

void init_candidate_list(canditlist *candlist)
{
  int i;
  candlist->nlist = 0;
  for (i=0;i<MAXCANDIDATES;i++)
    {
      candlist->cand[i].from = 0;
      candlist->cand[i].to = 0;
      candlist->cand[i].str[0]='\0';
      candlist->cand[i].phon[0]='\0';
      candlist->cand[i].rule=0;
      candlist->cand[i].weight=MAXDISTVALUE;
      candlist->cand[i].type=0;
    }
}

int add_to_candidate_list(canditlist *candlist, 
			  GERLETTER *newstr, 
			  GERLETTER *newphon, 
			  const U16 newrule, 
			  const SHORT newfrom, 
			  const SHORT newto, 
			  const U16 newtype,
			  const int newweight)
{
  int i;
  int ncan;

      /* find first candidate that is inferior */
  ncan = -1;

  //  printf("trying to enter: %s %s with weight %i\n",newstr,newphon,newweight);

  for (i=0; i < candlist->nlist; i++) 
    {
      /*  if (strlen(newstr) > strlen(candlist->cand[i].str)) */
      if (newweight <  candlist->cand[i].weight)
	{
	  ncan=i+1;                // found first position where this one belongs
	  break;
	}	 
       else if (newweight == candlist->cand[i].weight) return 0;
      /* else if (strlen(newstr) == strlen(candlist->cand[i].str)) return 0;*/
    }
  
  if (ncan<0)
    {
      if (candlist->nlist < MAXCANDIDATES)  ncan = candlist->nlist +1;
    }
  
  if (ncan<0) return 0;
  
  if (ncan <= candlist->nlist) 
    {
      // printf("moving down %i %i\n",ncan,candlist->nlist);
      for (i=MAXCANDIDATES-1; i > (ncan-1); i--) candlist->cand[i] = candlist->cand[i-1];  // copy down 
    }
  
  if (candlist->nlist < MAXCANDIDATES) candlist->nlist += 1;
  
  // copy in the new one where it belongs.
  candlist->cand[ncan-1].rule = newrule;
  candlist->cand[ncan-1].type = newtype;
  candlist->cand[ncan-1].weight = newweight;
  candlist->cand[ncan-1].from = newfrom;
  candlist->cand[ncan-1].to = newto;
  strcpy(candlist->cand[ncan-1].str, newstr);
  strcpy(candlist->cand[ncan-1].phon, newphon);
  
  // printf("nlist: %i\n",candlist->nlist);
  return 0;
}

/* weight function: a heuristic function that calculates the penalty for using
   certain snippets. Long snippets have lower weight, and add thus less to the
   path length. Further, prefixes at the beginning of the word are encouraged but
   penalized at the end.
*/

SHORT  edge_weight(const SHORT from , const SHORT to, const U16 type, const int wordlength)
{
  SHORT l,w;
  const SHORT weights[] = { 14, 12, 9, 8 , 7  ,6 , 6};      // extra high weight for short snippets.


  l = to-from;
  
  if (l<7) w = weights[l];
  else w = 6;

  if (type == 3 && from < 2 )            w += 10;          // higher weight for suffix found in the beginning.
  if (type == 3 && to == wordlength-1)   w -= 4;
  if (type == 3 && l < 2 && to  < wordlength-1)    w += 4;
  if (type == 2 && from < 3 && l>2)      w -= 4;           // prefixes prefered at word start.
  if (type == 2 && to > 8 )              w += 4;   // higher weight for prefixes further in the word
  if (type == 2 && to > (wordlength-6))  w += 4;   // even more weight for prefixes at end of word 
  if (type == 6 && to == wordlength-1)   w -= 5;   // special interfixes and fuge more likely

  if (type==1 || type==5)
    {
      if (l<3) w += 2;                            // dicourage short roots.
      if (l>4) w -= 4;
    }
      

  if (type==0) w -= 2;       // special case for single vowels

  if (w<0) w=0;  // never never.
 
  return w;
}


void add_path_candidates(canditlist *candlist, canditcollection *collected,  MinPathState *dj, const int wordlength)
{
  /* get the candiates out of candlist and collected them in collected. Get a handle
     for each of them and use it in the minimal path algorithm as info attached
     to an edge of the path graph 
  */

  int i;
  SHORT n1, n2, w;
  EdgeInfo edgeinfo;

  for (i=0;i<candlist->nlist; i++)
    {
      collected->cand[collected->nlist] = candlist->cand[i];
      edgeinfo = collected->nlist;                            // handle to the candiate
      collected->nlist += 1;

      /* and now: put as edge in the path list */
      n1 = candlist->cand[i].from;              //  a path from letter position. 
      n2 = candlist->cand[i].to + 1;            //  to letter position  
      //      w = edge_weight(n1,n2,candlist->cand[i].type, wordlength);   // calculate the weight of the edge
      w = candlist->cand[i].weight;
      path_addedge(dj, n1,n2,w,edgeinfo);     
    }
}

void print_candidate_list(canditlist *candlist, const char how)
{
#ifndef ARM7_NOSWI
  int i,j,len;
  GERLETTER hilf[20];
  switch (how)
    {
    case 'P':       // print
      for (i=0;i<candlist->nlist; i++)
	{
	  printf("%2i",i+1);
	  for (j=0;j<candlist->cand[i].from;j++) printf(" ");
	  printf("%s   /%s/%i/  [%i,%i] w=%i type=%i\n", candlist->cand[i].str,candlist->cand[i].phon, 
		 candlist->cand[i].rule,candlist->cand[i].from,candlist->cand[i].to, candlist->cand[i].weight, candlist->cand[i].type);
	}
      break;
      
    case 'O':       // print
      for (i=0;i<candlist->nlist; i++)
	{
	  printf("%2i",i+1);
	  for (j=0;j<candlist->cand[i].from;j++) printf(" ");
	  len = strlen(candlist->cand[i].str);
	  for (j=0;j<len;j++) hilf[j]='x'; hilf[len]='\0';
	  printf("%s\n",hilf);
	}
      break;
    }
#endif
}


int  match_whatever(GERLETTER *word, 
		    GERLETTER *outphonemes,
		    const LTrie  *Ltlist, 
		    const int ntries,   
		    CONST  PhonemeWords *MorphDict) 
{
  int len;
  int pathnodes,i,j,jj,k,currpos,nalt;
  SHORT from, to, weight;
  SHORT explain;
  
  BOOL hit;
  unsigned char proceed[7];
  U16 phonemeindex[7];
  unsigned char ruleindex[7];
  U16 type;
  GERLETTER outstr[20];
  GERLETTER outphon[20];
  GERLETTER cout;
  LTrie *Lt;
  canditlist candlist;
  canditcollection candcollection;
  EdgeInfo edgeinfos[MAXPATHNODES];
  SHORT path[MAXPATHNODES];
  MinPathState DIJ;
  MorphemeStruct Mcumulate;
  candidate *candyPt;
  Morpheme  *MorphPt;
  GERLETTER *phonemestring;
  U16 rulenumber;
 
//  printf("number of ltries is %i\n",ntries);

  phonemestring=NULL;
  rulenumber=0;

  len = strlen(word);
  pathnodes=len+1;
  init_dkstate(&DIJ, pathnodes);                 // minimum path problem with len+1 nodes 
  candcollection.nlist = 0;                  // snippet candidate list empty
  Mcumulate.nparts=0;                        // morpheme list empty

  for (currpos= 0 ; currpos < len; currpos++)
    {
      nalt=0;
      hit=0;
      from = currpos;
      to = currpos-1;

      init_candidate_list(&candlist);  

      // GERLETTER vowel_lts_rule(GERLETTER *word, int from, int wordlen, int *explain)

      if (is_a_vowelgrapheme(word[currpos])) 
	{
	  explain=0;
	  cout = vowel_lts_rule(word, from, len, &explain);
	  // printf("Letter %c  -> /%c/ Explains: %i\n",word[currpos],cout,explain);
	  // put this candidate in the list.
	  to = from+explain-1;
	  weight = edge_weight(from , to  , 0 , len);                // call with type 0
	  for (jj=0; jj<explain;jj++) outstr[jj] = word[from+jj]; outstr[jj++]='\0';
	  outphon[0] = cout; outphon[1]='\0';

	  add_to_candidate_list(&candlist, outstr, outphon, 0 , from, to , 0 , weight);
	}

      for (k=0; k<ntries; k++)
	{
	  Lt = &Ltlist[k]; 
	  type = Lt->type  &  (~MORPH_ORDER_MASK);   // bitwise complement to get lowest bits.

	  //  printf("ltrie type: %i\n",type);
	  if (type>0)                             // use only ltries which are marked in the input grammar. 
	    {
	      nalt = Lt_parse_string(word,
				     currpos , 
				     Lt, 
				     &proceed[0],
				     &phonemeindex[0],
				     &ruleindex[0],
				     LONG_MORPH_FIRST);
	    }
	  else 
	    {
	      nalt=0;
	    }

	  if (nalt > 0)
	    {
	      hit = 1;
	      for (jj=0; jj<nalt;jj++)
		{
		  to = currpos+proceed[jj];
		  for (j=from;j<=to;j++) outstr[j-from] = word[j];
		  outstr[to-from+1]='\0';
		  phonemestring =  point_to_phoneme_string(MorphDict, phonemeindex[jj]);  //(ltrie.c)

		  if (type==1 && (to-from)>=2 )       // minium of three letters and root morpheme: likes stress.
		    {
		      // printf("This applies to %s\n",  phonemestring);
		      outphon[0]=':'; 
		      strcpy(&outphon[1],phonemestring);    // ugly fix for the fact that German roots morphemes have no stress in table.
		    }
		  else
		    {
		      strcpy(outphon,phonemestring);
		    }
		  rulenumber = ruleindex[jj];
		  weight = edge_weight(from , to , type , len);       
		  // printf("at position %i with type %i found %i alternatives %s -> %s with weight %i\n",
		  //	  currpos,type, nalt,outstr, phonemestring,weight);

		  add_to_candidate_list(&candlist, outstr, outphon, rulenumber, from, to,type,weight);
		}
	    }
	}
      if (hit) 
	{
	  //      for (i=0;i<currpos;i++) printf(" ");
	  //	  printf("%s /%s/%i/\n",outstr,outphon,rulenumber); 
	  //      hit=0
#ifdef FROMTYPED
	  print_candidate_list(&candlist,'P');
#endif 
	  add_path_candidates(&candlist,&candcollection, &DIJ, len);
	  hit =0;
	}
    }
  
  // print_edges(&DIJ);

  if (sort_edges(&DIJ) == 0 ) return 0;

  // print_edges(&DIJ);
 
  process_graph(&DIJ,pathnodes+1);    // find shortest path algorithm.
  

  // the sequence of edgeinfo numbers now gives the successful candidates; they
  // had been associated with the edges of the path that was found to be optimal
  // 

  jj = track_path(&DIJ, pathnodes-1 , path, edgeinfos);

  if (jj<2) return 0;

#ifdef FROMTYPED
  for (j=0; j<jj-1;j++) printf(" %i Cand %i : %s -> /%s/ %2i  \n",
			       j, edgeinfos[j], 
			       candcollection.cand[edgeinfos[j]].str,  
			       candcollection.cand[edgeinfos[j]].phon,
			       candcollection.cand[edgeinfos[j]].rule);

#endif

  for (j=0; j<jj-1;j++)
    {
      candyPt = &(candcollection.cand[edgeinfos[j]]);    // point to a successful candidate
      MorphPt = &(Mcumulate.morph[Mcumulate.nparts]);
      strcpy(MorphPt->wordpart, candyPt->str);
      strcpy(MorphPt->phonemepart, candyPt->phon);
      strcpy(MorphPt->morphname, "Dijkstra");
      MorphPt->rulenumber =  candyPt->rule;
      Mcumulate.nparts += 1;
    }

  concat_morphems_phonemes(outphonemes, &Mcumulate,1,1);     // forward and deal with stress.
  hit = correct_unstressed_longvowels(outphonemes);             // returns if there is any stress.
  
  if (hit==0) 
    {
      len = strlen(outphonemes);
      if (len < MAX_BACHUSLETTERS-2) 
	{
	  for (i=len+1; i>0; i--) outphonemes[i] = outphonemes[i-1];
	  outphonemes[0] = '`';
	}
    }

  return 1;
} 

/*************** matching **********/

#endif 

Nodestack newNodestack()
{
  Nodestack nn;
  initNodestack(&nn);
  return nn;
}

void initNodestack(Nodestack *stk) 
{
  stk->sz = MAXSTACKDEPTH;
  stk->ntok=0;
  stk->status=0;
  stk->p = &(stk->v[0]);
}

BOOL pushNode(Nodestack *stk, StkToken tok)
{ 
  if (stk->ntok < stk->sz)
    {
      stk->status=0; 
      *(stk->p)++ = tok; 
      (stk->ntok)++; 
      return 1;
    } 
  else 
    {
      stk->status=1; // overflow
#ifdef NODESTACKDEBUG 
      printf("Nodestack Overflow\n");
      exit(0);
#endif
      return 0;
    }
}

StkToken  popNode(Nodestack *stk)
{
  StkToken ret = 0;

  if (stk->ntok>0)
    {
      stk->status=0;
      (stk->ntok)--;
      return *(--(stk->p));
    } 
  else 
    {
      stk->status=2;  // underflow.
#ifdef NODESTACKDEBUG 
      printf("Nodestack Underflow\n");
#endif
      return ret;
    }
}

StkToken  topNode(Nodestack *stk)    // note the difference. 
     /* get me a peek what's the uppermost token
	that would be popped up if pop was called */
{
  StkToken ret = 0;
  if (stk->ntok>0)       return (stk->v[stk->ntok-1]);  // ça ne vas rien toucher ...
  else return ret;
}


void resetNodestack(Nodestack *stk)
{
  stk->ntok=0;
  stk->status=0;
}


/* Utility functions to convert to lower or upper case */

void tolowerGER(GERLETTER *word, GERLETTER *outword)
     /* conversion to lower case considering the special Umlaut 
	characters of German. Keeps invariant the letter ß 
	input word and output word can be the same address
	in which case the content of the input gets overwritten */
{
  GERLETTER *p,*pp;
  GERLETTER c,cc;

  for (p=word,pp=outword; (c = *p) != 0; p++)
    {
      switch (c)
	{
	case 'Ä':  cc = 'ä'; break;
	case 'ä':  cc = 'ä'; break;
	case 'Ö':  cc = 'ö'; break;
	case 'ö':  cc = 'ö'; break;
	case 'Ü':  cc = 'ü'; break;
	case 'ü':  cc = 'ü'; break;
	case 'ß':  cc = 'ß'; break;
	default:
	  if (c>='A'&& c<='Z') cc = (GERLETTER) (c+32);
	  else  cc = c;
	  break;
	}
      *pp++ = cc;
    }
  *pp=0;
}


void toupperGER(GERLETTER *word, GERLETTER *outword)
     /* conversion to upper case considering the special Umlaut 
	characters of German. Keeps invariant the letter ß 
	input word and output word can be the same address
	in which case the content of the input gets overwritten */
{
  GERLETTER *p,*pp;
  GERLETTER c,cc;

  for (p=word,pp=outword; (c = *p) != 0; p++)
    {
      switch (c)
	{
	case 'Ä':  cc = 'Ä'; break;
	case 'ä':  cc = 'Ä'; break;
	case 'Ö':  cc = 'Ö'; break;
	case 'ö':  cc = 'Ö'; break;
	case 'Ü':  cc = 'Ü'; break;
	case 'ü':  cc = 'Ü'; break;
	case 'ß':  cc = 'ß'; break;
	default:
	  if (c>='a'&& c<='z') cc = (GERLETTER) (c-32);
	  else  cc = c;
	  break;
	}
      *pp++ = cc;
    }
  *pp=0;
}


/* The rest of this file contains two main subroutines used 
   in online word grammar parsing, 
   Lt_parse_string and GtWalker.

   Purpose of Lt_parse_string: Given as input a string and a start position within
   the string, it tries to find one or multiple matches in a dictionary which is
   implemented as a letter trie. It returns the number of found matches and 
   places the number of bytes of each matching partial string into the the
   foundseq argument. foundseq must have sufficient storage allocated for the
   maximally possible number of matches. 
*/
#ifdef _DEBUG
int gfoundcount=0;
#endif


U16 Lt_parse_string(GERLETTER *str,       // string to match
		    U16 startposition,    // starting at this position
		    const LTrie *Lt,      // by the entries in the letter trie
		    unsigned char *foundseq,        // multiple possible lengths to proceed
		    U16 *phonemeindices,  // corresponding phoneme string indices
		    unsigned char *ruleindices,     // corresponding rule numbers. 
		    U16 mode)
{
  U16  ii,len,curr,match,lastletter, foundcount;
  GERLETTER cc;
  unsigned char  foundbuf[10];   // used to mark number characters that match
  U16  phindexbuf[10]; // used to copy an index for a phoneme string.  
  unsigned char  rulebuf[10];    // used to store the rule number noted in the final ltrie node
                       // of a matched word.

  foundcount = 0;   // returned 

  /* exclude immediately the trivial possibility that 
     we are already at the end of a word, that is,  the first letter
     at the start position is already at the word end (i.e., equal 0).
  */
  len = strlen(str);
  if (len == 0) return 0;          // don't process null strings
  if (startposition>len) return 0; // same reason to return;
   

  /* In searching the trie, always start at the epsilon node
     which is assumed by convention to be the very first node
     at address 0
  */
  curr = 0;     // start at epsilon node, the empty letter.
  match=0;
  ii = startposition;
  
  
  /* In the following outer while loop, we proceed to
     the next letter of the input string (starting with
     the letter at the initial position.). 
     Accordingly we proceed in the letter trie one position
     to the right in each while loop, if indeed there
     is one node to the right of the current node.
     If there is one, this may or may not be the node
     that matches the current letter. If it is
     matching the letter, we have succesfully matched it
     and can proceed with the next letter. If it is
     not the letter, we have to find alternative nodes by
     using the down direction in the trie.
  */
     
  while ((cc = str[ii++] ) != 0) 
    {
      lastletter=ii-1;     // (-1 to compensate for ii++) 

      if (Lt->Nodes[curr].right != NIL)  // is there a right node?
	{ 
	  curr = Lt->Nodes[curr].right; 
	}
      else  // no right node
	{
	  match=0;
	  break;  
	}
      /* We arrive here if there is a right node, 
	 Is it the correct letter? 
      */
      if (Lt->Nodes[curr].letter == cc)
	{
	  match = 1;   
	  // printf("match found for [%c]\n",cc);
	  if (Lt->Nodes[curr].info == ENDOFLEX)
	    { 
	      foundbuf[foundcount]   = (unsigned char)lastletter-startposition;
	      rulebuf[foundcount] = Lt->Nodes[curr].rule;
	      phindexbuf[foundcount++] = Lt->Nodes[curr].phonemehandle;
	    }
	}
      else  // wrong letter at the right node.
	{
	  match=0;
	  /* If it wasn't the first letter to the right of the node,
	     it could be another one in an alternative node, which
	     can be found by using the down field of the current node.
	  */
	  
	  while(Lt->Nodes[curr].down != NIL && match == 0)
	    {
	      curr = Lt->Nodes[curr].down; 
	      if (Lt->Nodes[curr].letter == cc)
		{
		  match = 1;   
		  // printf("match found 2 for [%c]\n",cc);
		  if (Lt->Nodes[curr].info == ENDOFLEX)
		    { 
		      foundbuf[foundcount] = lastletter-startposition;
		      rulebuf[foundcount] = Lt->Nodes[curr].rule;
		      phindexbuf[foundcount++] = Lt->Nodes[curr].phonemehandle;
		    }
		  break;
		}
	    }
	  if (match==0) 
	    {
	      break;
	    }
	}
    }

  if ((curr != NIL ) && match == 1)
    {
      if (Lt->Nodes[curr].info != ENDOFLEX) 
	{
	  match=0;
	}
    }
  if (foundcount>0)
    {
    switch (mode)
      {
      case LONG_MORPH_FIRST:      // reverse sequence
	for (ii=0;ii<foundcount && ii<7;ii++) 
	  {
	    foundseq[ii] = foundbuf[foundcount-1-ii];
	    phonemeindices[ii]=phindexbuf[foundcount-1-ii];
	    ruleindices[ii]=rulebuf[foundcount-1-ii];
	  }
	break;
	
      case LONG_MORPH_LAST:
	for (ii=0;ii<foundcount && ii<7;ii++) 
	  {
	    foundseq[ii] = foundbuf[ii];
	    phonemeindices[ii]=phindexbuf[ii];
	    ruleindices[ii]=rulebuf[ii];
	  }
	break;
      }
    }
if (foundcount>7)
{
#ifdef _DEBUG
#ifndef ARM7_NOSWI
	printf("error:too many items found\n");
#endif
#endif
	foundcount=7;
}
  return foundcount;  // number of found matches
}

#ifdef GRAMMAR_EVALUATION
void GtrieStatisitics(GTrieNode *Nodes, U16 number)
{
    int i;
    printf("Call statistics for rule lines\n");

    for (i=0; i< number ; i++)
      {
	if (Nodes[i].typeinfo == ALTNODE)
	  {
	    printf("Line %4d succeeded %8d times.\n",Nodes[i].info.parameter,Nodes[i].info.counter);
	    Nodes[i].info.counter=0;
	  }
      }
}
#ifdef FROMTYPED
void GtrieQuickStatistics(GTrieNode *Nodes, U16 number)
{
    int i;
    printf("Grammar Lines:");
    for (i=0; i<number; i++)
      {
	if (Nodes[i].typeinfo == ALTNODE)
	  {
	    if (Nodes[i].info.counter > 0) 
	      {
		printf("%4d ",Nodes[i].info.parameter);
		Nodes[i].info.counter=0;
	      }
	  }
      }
    printf("\n");
}
#endif
#endif



void register_word_part(WalkCNTXT *cntxt, GERLETTER *name, U16 from, U16 to, BOOL action, GERLETTER *phone, U16 rule)
     /* if a word part was found in GtWalker, it is registered by it's name (e.g. root, suffix etc).
	The function is also used (see case 1) to copy tags such as "=" or "+" to mark
	inner word boundaries. See Gtwalker how it is called. 
      */
{
  int i,n;
  MorphemeStruct *M;

  M = &(cntxt->Morphstruct);
  
  n = (M->nparts)++;
  
  //  printf("Registering %s with rule %d\n",phone,rule);
  
  switch (action)
    {
    case 0:
      strcpy(M->morph[n].morphname,name);
      for (i=from;i<=to;i++) 
	{
	  M->morph[n].wordpart[i-from] = cntxt->theword[i];
	}
      M->morph[n].wordpart[to-from+1]='\0';
      strcpy(M->morph[n].phonemepart,phone);
      M->morph[n].rulenumber = rule;
      break;
    case 1:
      strcpy(M->morph[n].wordpart,name);
      strcpy(M->morph[n].morphname,name);        // morphname in this case is an inserted string such as "+"
      strcpy(M->morph[n].phonemepart,name);
      M->morph[n].rulenumber = 0;       // aha! here we can later introduce some interesting tricks...
      break;
    }
}
  
void split_inline_morph_phonemes(const GERLETTER *name, int *comparelength, int *phonestart, int *phonelength, U16 *rule)
     /* This special cludge function applies to strings in the form "ed @d 1" where ed is a compare
	string, @d is a phoneme string and 1 is a rule number. We want to know how many 
	characters are in the compare string, where the phoneme string begins, and how long it is,
	and finally, if there is a number, what number is it? I don't assume that there
	any totally pathetic strings here such as all blanks or not zero terminated. 
     */

{
  int i;
  int len;
  GERLETTER separator='/';     // modify appropriately: We use here a blank as separator

  *comparelength=0;
  *phonestart=0;
  *phonelength=0;
  *rule=0;
  
  len = strlen(name);
  
  for (i=0; i<len;i++) 
    {
      if (name[i] == separator)
	{
	  *comparelength = i;
	  break;
	}
    }

  if (*comparelength==0)    // no blank found. 
    {
      *comparelength=len;
      return;
    }

  for (i = *comparelength + 1; i<len; i++)
    {
      if (name[i] != separator)
	{
	  *phonestart=i;
	  break;
	}
    }
  if (*phonestart==0)       // only blanks until end (bad syntax)
    {
      return;
    }
  
  for (i = *phonestart; i<len; i++)
    {
      *phonelength = i - *phonestart;
      if (name[i]==separator)
	{
	  break;
	}
    }
  if ((*phonestart + *phonelength+1)<len)
    {
      *rule = atoi(&name[*phonestart+*phonelength+1]);
    }
}


BOOL word_is_capitalized(const GERLETTER *word)
{
  if(    word[0] >= 'A' && word[0] <= 'Z'
	 || word[0] == UML_A 
	 || word[0] == UML_O 
	 || word[0] == UML_U)  
    return 1;
  else 
    return 0;
}

BOOL word_has_some(const char test, const GERLETTER *word)
     /* check if a word contains a certain character test */
{
  int i;
  for (i=0; word[i] != '\0'; i++) if (word[i] == test) return 1;
  return 0;
}


walkinfo  GtWalker(WalkCNTXT *cntxt, U16 curr, walkinfo oldwalki)
/* forget about sniffing dogs: voilá, le maitre lui-même: GtWalker.

   This program calls itself recursively. We hope it
   knows what one of its instantiations down the chain
   knows what it is doing.  Backtracking is 
   achieved by a return value of 0 in walkinfo structure.
   Only one final point in the parsing process
   can set succeeded to 1: If we reach an
   end of a path and the position in the word is 
   at the same time equal to the length of the word.
   The part that may move the word position is
   in the case TERMINAL below, where an actual
   comparison to a letter trie is made.

   Return "policy": Each node returns a walkinfo. In the walkinfor
 
*/
{
  //  const GTrie *Gt;
//  const LTrie *Lt;
  //  BOOL succeeded;
  unsigned char nalt,currpos,incr;
  unsigned char proceed[7];
  unsigned char ruleindex[7];
  walkinfo newwalki;
  GERLETTER *phonemestring = NULL;
  S16 i,j,ii,jj,j1,j2;
  U16 ntrie;
  U16 next,alt,what;
  U16 phonemeindex[7];
  U16 opcode, opparam, match; // for operator calls.
  U16 rulenumber = 0;


  // Gt = cntxt->Gt;

  cntxt->counter += 1;
  (cntxt->level)++;
  if (cntxt->level > cntxt->maxlevel) cntxt->maxlevel= cntxt->level;


  if (cntxt->counter > MAXRECURSIONS
//#ifdef EPSON_ARM7
		|| cntxt->level >MAXRECURSIVELEVEL
//#endif
	  )
    { 
      cntxt->alert=1;
#ifdef BACHUS_IN_DECTALK
      newwalki = oldwalki;
      newwalki.succeeded = 0;     // unfortunately it will loop here a while.
#ifndef ARM7_NOSWI
#ifdef _DEBUG
//	  printf("walker:too many levels word:%s\n",cntxt->theword);
#endif
#endif
      goto walkexit;
#else 
#ifdef FROMTYPED
      printf("I give up\n"); 
      GtrieStatisitics(cntxt->Nodes,cntxt->nnodes);
      exit(1);
#endif
#endif
    }
   
  newwalki = oldwalki;
  if (cntxt->alert) goto walkexit;

  if (cntxt->wordlength == newwalki.wordpos) 
    { 
      //      printf("End of word reached\n");
      if (newwalki.succeeded==1) goto walkexit;
    }

    switch (cntxt->Nodes[curr].typeinfo)
      {
      case ENDOFPATH:  
       	newwalki.succeeded = (cntxt->wordlength == newwalki.wordpos);
	if (!newwalki.succeeded) {newwalki=oldwalki; newwalki.succeeded=0;}
	break;

      case PATHRETURN: 
	next = popNode(&cntxt->nstack);
	newwalki = GtWalker(cntxt,next,newwalki); 
	if (newwalki.succeeded==0)
	  {
	    pushNode(&cntxt->nstack,next);    // push it back to keep stack intact
	  }
	break;

      case EPSILONNODE:
	pushNode(&cntxt->nstack,0);
	next = cntxt->Nodes[curr].alt;              // point to first startnode
	newwalki = GtWalker(cntxt,next,newwalki);

	//	printf("EPSILON NODE REACHED\n");  should not does not happen
	//	newwalki = GtWalker(cntxt,next,newwalki);
	break;
	
      case STARTNODE:                      // startnode always calls an altnode 
	/* This behaves like a subroutine call */
	// printf("St:%s\n",cntxt->Nodes[curr].name);
	next = cntxt->Nodes[curr].right;     
	newwalki = GtWalker(cntxt,next,newwalki);
	break; 

      case ALTNODE:
	/* For each of the current and alt nodes call the right sides
	   until one returns succeeded. */
	next = curr;
newalt:	    
	// printf("Rule %5i\n",cntxt->Nodes[next].info.parameter);
	newwalki = GtWalker(cntxt,cntxt->Nodes[next].right,newwalki);      
#ifdef GRAMMAR_EVALUATION
	if (newwalki.succeeded==1)              // evaluation mode: count how often the 
	                                        // grammar's lines where used successfully
	  {
	    cntxt->Nodes[next].info.counter += 1;   // this one is usually readonly!
	  }
#endif /* GRAMMAR_EVALUATION */
	if (newwalki.succeeded==1) goto walkexit; //return newwalki;
	else 
	  {
	    next = cntxt->Nodes[next].alt;
	    if (next) goto newalt;
	  }
	break;
	
      case LOOPNODE:
	// get the loop counters from the information part of the node
	j1 = cntxt->Nodes[curr].info.counter;
	j2 = cntxt->Nodes[curr].info.counterB;

	alt = cntxt->Nodes[curr].alt;       // address of continue node (JUMPNODE)
	next = cntxt->Nodes[alt].right;     // address of node after continue 
	what = cntxt->Nodes[curr].right;    // address of first node inside loop
	pushNode(&cntxt->nstack,next);   // push on stack: the continuation after the loop
	//     printf("alt is %i next is %i right is %i\n",alt,next,what);
	if (j1>j2)
	  {
	    j=j2;
	    j2=j1;
	    incr=-1;
	    j1=j;
	    jj=j2;
	  }
	else
	  {
	    jj=j1;
	    incr=1;
	  }
	/* the following loop pushes on the stack the first node inside of the 
	   loop as often as the loop has to be excecuted. */

	for (j=j1; (j<=j2) && (newwalki.succeeded==0); j++)
	  {
	    //   printf("loop jj= %i\n",jj);
	    newwalki=oldwalki;
	    for (ii=0;ii<jj;ii++)                        // start of repeated path to stack
	      {
	        pushNode(&cntxt->nstack,what);
	      }
	    newwalki = GtWalker(cntxt,alt,newwalki);     // execute the continue node
	    if (newwalki.succeeded == 0)
	      {
		for (ii=0;ii<jj;ii++) 
		  {
		    next=popNode(&cntxt->nstack);        // drain stack: take off as often as pushed on the stack
		  }
	      }
	    jj += incr;
	  }
	if (!newwalki.succeeded) next=popNode(&cntxt->nstack);
	break;                            

      case JUMPNODE:                                // This is a continue node
	next = popNode(&cntxt->nstack);             // get from stack from loop
	newwalki = GtWalker(cntxt,next,newwalki);
	if (newwalki.succeeded==0)
	  {
	    pushNode(&cntxt->nstack,next);  // push back
	  }
	break;                            // work on this later.
	
      case NONTERMINAL:
	/* calls a "subroutine" . if successfull continues with next */
	// printf("calling next %s \n",gnodetypename(cntxt->Nodes[next].typeinfo));
	// printf("push %i\n",cntxt->Nodes[curr].right);
	pushNode(&cntxt->nstack,cntxt->Nodes[curr].right); 
	newwalki = GtWalker(cntxt,cntxt->Nodes[curr].what,newwalki);   // 'what' is always a startnode
	if (newwalki.succeeded==0)
	  {
	    next = popNode(&cntxt->nstack);
	    // printf("pop back in %i\n",next);
	  }
	break;

      case NOPNODE:
	/* this funny node (no operation node) was introduced to make life simpler in the grammar 
	   definition. Currently, all it does, is calling the next node if there is one. this
	   makes it possible that backtracking can proceed also through this node.
	*/
	next = cntxt->Nodes[curr].right;
	newwalki = GtWalker(cntxt,next,newwalki);
	break;

      case BOUNDACTION:
	/* this node inserts strings (e.g. '+', or '=') into the output to mark boundaries
           other than that operates just like the NOP node. */
	next = cntxt->Nodes[curr].right;
	currpos = oldwalki.wordpos;           // current position in the word.
	newwalki = GtWalker(cntxt,next,newwalki);
	if (newwalki.succeeded==1) register_word_part(cntxt,
						      cntxt->Nodes[curr].name,
						      currpos,currpos,
						      1,           // register the little string: case 1
						      NULL,0);     // no phonemes
	break;

      case SINGLEMORPH:
	/* It's in the name: The name field of the node is a morpheme string
	   and we have to check if the next few letters of the word are identical
	   with this string. If they are, we call the subsequent node, and
	   if they are not, we return with succeeded=0 
	*/
	// dumpGTrieNode(Gt,curr);
	currpos = oldwalki.wordpos;           // current position in the word.

	/* Had to change this. The name field here may now be of the form, e.g.,  "ge g@ 1".
	   The string to compare to is "ge", the phonemestring is "g@" and 
	   the applied rule number is 1 (obtained by atoi in the splitter)
	   This change was needed so that also for inline definitions of 
	   search strings in the rule file, we have an according phoneme string,
	   and if really needed a rule number to apply allophonic variations.
	 */

	split_inline_morph_phonemes(cntxt->Nodes[curr].name, // The string containing, e.g, "ge g@ 1"
				    &jj,                     // compare length.
				    &j1,                     // phoneme start
				    &j2,                     // phoneme length,
				    &rulenumber);            // usually 0. 
	if (currpos+jj-1 <= cntxt->wordlength)
	  {
	    ii=1;
	    for (i=0;i<jj;i++)  // compare char by char 
	      {
		// printf("%i %i %c %c\n",ii,i,cntxt->theword[currpos+i],cntxt->Nodes[curr].name[i]);
		ii = ii && (cntxt->theword[currpos+i] == cntxt->Nodes[curr].name[i]);
	      }
	    if (ii==1)     // if matches 
	      {
		newwalki.wordpos =  currpos+jj;           // proceed by the number of letters found.
		newwalki = GtWalker(cntxt,cntxt->Nodes[curr].right,newwalki);
		if (newwalki.succeeded==1)
		  {
		    // copy phoneme part to work buffer in the context structure:
		    for (i=0; i<j2; i++) cntxt->workbuffer[i] = cntxt->Nodes[curr].name[i+j1];
		    cntxt->workbuffer[j2]='\0';       // terminate string

		    phonemestring = cntxt->workbuffer;

		    // printf("Phonemestring: /%s/. Rule No: %d\n",phonemestring,rulenumber);
		    
		    register_word_part(cntxt,
				       "morph",
				       currpos,
				       currpos+jj-1,
				       0,
				       phonemestring,  // pointing to work buffer in cntxt 
				       rulenumber);    // received 
		  }
		else
		  {
		    newwalki=oldwalki;                   // backtracking
		    newwalki.succeeded=0;
		  }
	      }  
	  } 

	break;

      case TERMINAL:                      // go ask a letter trie.
	/* the most complicated part it seems:
	   We ask a letter trie if the subsequent letters of the word
	   can be interpreted as one or multiple morphs that are stored
	   in a letter trie. The number of the letter trie (index) is
	   stored in the node's field what. The subroutine Lt_parse_string
	   returns either none, one or multiple increments by which 
	   the string matching could be proceeded. If there are multiples
	   e.g., "un" and "unter" both match, we try both. In each case
	   we proceed the position in the word by an appropriate number
	   of letters, then call the subsequent nodes and if non comes 
	   back with success we return with succeeded=0
	   Also, if a full path could be found, we register the part
	   of word that was found in a special structure.
	*/

	ntrie = cntxt->Nodes[curr].what;
	if (ntrie==0)
	  {
//	    printf("error: Terminal node %d has no reference to a startnode.\n",curr);
//	    printf("We are hosed. Bye! make a better program!!!!\n");
//	    exit(1);
	  }
//	Lt = &(cntxt->Ltlist[ntrie-1]);  // get the appropriate letter trie from the list.  WATCH
	currpos = oldwalki.wordpos;
	nalt = Lt_parse_string(cntxt->theword,
			       currpos , 
			       (&(cntxt->Ltlist[ntrie-1])), //Lt, 
			       &proceed[0],
			       &phonemeindex[0],
			       &ruleindex[0],
			       ((cntxt->Nodes[curr].info.parameter) & MORPH_ORDER_MASK));  // parameter: LONG MORPH first or last
	next = cntxt->Nodes[curr].right;
	/*
		printf("callingnext %s \n",gnodetypename(cntxt->Nodes[next].typeinfo));
    		printf("Ltrie %d tried on %s at currpos=%i yields %i alternatives, Next=%i\n",
	        ntrie,cntxt->theword,currpos,nalt,next);
	*/
	if (nalt > 0)
	  {
	    for (i=0; (i<nalt); i++)
	      {
		newwalki=oldwalki;
		currpos = oldwalki.wordpos;
		/*
		         printf("trying %10s ",cntxt->Nodes[curr].name );
			 for (j=currpos;j<=currpos+proceed[i];j++) printf("%c",cntxt->theword[j]);
			 printf("\n");
		*/

		newwalki.wordpos =  currpos+proceed[i]+1;
		if (newwalki.wordpos > cntxt->wordlength) {
		//printf("wordlength execeeded!\n");
		}
		newwalki = GtWalker(cntxt,next,newwalki);
		// printf("%10s ",cntxt->Nodes[curr].name );
		// for (j=currpos;j<=currpos+proceed[i];j++) printf("%c",cntxt->theword[j]);

		if (newwalki.succeeded)   // get the phoneme string info, and rule number i.
		  {
		    // printf(" --> accept\n");
		    rulenumber = ruleindex[i];
		    phonemestring =  point_to_phoneme_string(cntxt->MorphDict, phonemeindex[i]);  //(ltrie.c)
		    // if (phonemestring)  printf("Phonemestring from Ltrie: /%s/. Rule No: %d\n",phonemestring,rulenumber);


		    register_word_part(cntxt,cntxt->Nodes[curr].name,
				       currpos,currpos+proceed[i],0,
				       phonemestring, rulenumber);
		    goto walkexit; // return newwalki;
		  }
	      }
	    newwalki=oldwalki;	
	    newwalki.succeeded=0;
	    // newwalki = GtWalker(cntxt,next,newwalki); 
	  }
	else
	  {
	    newwalki=oldwalki;	
	  }
	break;

	/* The operators that are permissible can be found in an extra file bachusoperator.h
	   They must be programmed here. Currently this code is inline here but could
	   be moved to yet another subroutine. 
	 */

      case OPERATORNAME:
	opcode = cntxt->Nodes[curr].index;   
	opparam = cntxt->Nodes[curr].what;
	//      printf("opcode = %i  opparm = %i\n", opcode,opparam);
	//	printf("Encountered an Operator opcode is %i, parameter is %i\n",opcode,opparam);

	match = 0;
	currpos = oldwalki.wordpos;
	switch (opcode)
	  {
	  case OPsyllabify:
	    if (cntxt->grammar == opparam) 
	      {
		match = 1;
	      }
	    break;
	    
	  case OPgrammar:
	    if (cntxt->grammar== opparam) 
	      {
		match = 1;
	      }
	    break;

	  case OPspezial:  // for the argument special(0) test if any bit is set in cntxt->special
                           // otherwise, the argument of special(M), M, is treated as bit mask.
	    if (opparam==0) 
	      {
		if(cntxt->special != 0 )
		  {
		    match=1;
		  }
	      }
	    else
	      {
		if ((cntxt->special & opparam) != 0)
		  {
		    match = 1;
		  }
	      }
	    break;

	    
	  case OPlonger:
	    //  printf("longer: currentpos %i\n",currpos);
	    if ((cntxt->wordlength - currpos) > opparam)
	      {
		match = 1;	 //   printf("longer: rule matches\n");
	      }
	    break;

	  case OPshorter:
	    // printf("shorter: currentpos %i\n",currpos);
	    if ((cntxt->wordlength - currpos) < opparam)
	      {
		match = 1;       //  printf("shorter: rule matches\n");
	      }
	    break;
	    
	  case OPstartvowel:
	    // printf("shorter: currentpos %i\n",currpos);
	    if (is_a_vowelgrapheme(cntxt->theword[0]))
	      {
		match = 1;       // printf("vowel rule matches\n");
	      }
	    break;

	  case OPstartcons:
	    if (!is_a_vowelgrapheme(cntxt->theword[0]))
	      {
		match = 1;       // printf("cons rule matches\n");
	      }
	    break;

	  case OPbreak:
	    newwalki.succeeded = 1;  // (cntxt->wordlength == newwalki.wordpos);
	    match = 1;
	    //	    printf("We got a break operator %i %i %i \n",cntxt->level,newwalki.wordpos,cntxt->wordlength);
	    cntxt->wordlength=newwalki.wordpos;
	    //	    if (!newwalki.succeeded) {newwalki=oldwalki; newwalki.succeeded=0;}

	  default:
	    break;
	  }
	if (match==1)     // if matches 
	  {
	    newwalki.wordpos =  currpos;
	    newwalki = GtWalker(cntxt,cntxt->Nodes[curr].right,newwalki);	
	    if (newwalki.succeeded == 0)
	      {
		newwalki=oldwalki;                   // backtracking
		newwalki.succeeded=0;
	      }
	  }  
	break; 


      case SYLLABIFY:
	/* Send the rest of the word over to a syllabifier */
	next = cntxt->Nodes[curr].right;
	currpos = oldwalki.wordpos;
	ntrie = cntxt->Nodes[curr].what;
//	printf("syllabify it from %i, length %i, using ntrie from %i\n",currpos,cntxt->wordlength,ntrie);
        // for now, emulate succesful parsing.
	newwalki.wordpos =  cntxt->wordlength;
	newwalki = GtWalker(cntxt,next,newwalki);
	break;

      }
    //  printf("Returning from %d with %d succeeded\n",curr,succeeded);
walkexit:
    (cntxt->level)--;
    if (cntxt->alert==1) newwalki.succeeded=0;  // relentlessly
    return newwalki;
}

/* three simple programs to display the word structure are the 
   following. 
*/


void display_word_stucture(GERLETTER *word, MorphemeStruct *M)
{
  int i;
//  printf("%s @@ \n",word);
  for (i=M->nparts; i>0; i--)
    {
 //     printf("%12s: %6s  \n",&(M->morph[i-1].morphname), &(M->morph[i-1].wordpart));
    }
//  printf("\n");
}

void display_separated_word(GERLETTER *word, MorphemeStruct *M)
{
  int i;
 // printf("%s @@ ",word);
  for (i=M->nparts; i>0; i--)
    {
    //  printf("%s", &(M->morph[i-1].wordpart));
    }
  //  printf("\n");
}

/* The following function reconstructs the word - after a successful parse only -
   and inserts morpheme markers. The structure MorphemeStruct that was assembled
   during the parsing process is used as input, whereby we start at the end of the
   structure. Input is the word in decomposed form in the MorphemeStruct, 
   output the wordstring with included    morpheme markers.
*/
void insert_morph_seperators(GERLETTER *outword, MorphemeStruct *M)     
{
  int i,j,kk;
  GERLETTER c;

  kk=0;
  for (i=M->nparts; i>0; i--)
    {
      for (j=0; (c = M->morph[i-1].wordpart[j])!=0; j++) outword[kk++] = c;
    }
  outword[kk++]='\0';
}

void copy_morpheme_structures(MorphemeStruct *Mcumul, MorphemeStruct *Mnew)
{
  /* used to collect pieces of translated text strings and concatinate
     them later, see the stuff with the sylloids */

  int i,nmorph;
  nmorph = Mnew->nparts;
  Mcumul->nparts += nmorph;
  
  for (i=0; i<nmorph; i++)
    {
      Mcumul->morph[Mcumul->nparts-i-1] = Mnew->morph[i];
    }
}


void process_stress(GERLETTER *phonemes)
{
  U16 address[40];        // which letter position
  U16 stress[40];         // which stress.
  U16 stressval,naddr;
  int i,len,kk,npos,focus;
  int focus2,focus3, prim, fixedstress;
  int fleftwind , frightwind;

  len = strlen(phonemes);

  fixedstress=0;

  kk=0;
  for (i=0;i<len;i++)
    {
      npos = 1;
      switch (phonemes[i])
	{
	case '\'': 
	  stressval = 5;         // fixed lexical first stress
	  naddr = i;             // located at position
	  fixedstress=1;
	  break;
	case '`':  
	  stressval = 4;         // fixed lexical secondary stress
	  naddr = i;        // located at position
	  fixedstress=1;
	  break;
	case '*':
	  stressval = 2;         // possible primary stress: must be stressed: candidate for word focus
	  naddr = i; 
	  break;
	case ':':
	  stressval = 1;         // possible stress: can be stressed and may be primary or secondary or none
	  naddr = i; 
	  break;
	case '.':
	  stressval = 0;         // must not be stressed: typical in unstressed suffixes or flexion morphs.
	  naddr = i; 
	  break;
	default:
	  npos=0;
	  break;
	  
	}
      if (npos)
	{
	  if (kk==0) 
	    {
	      address[kk]=naddr;    
	      stress[kk]=stressval;
	      kk = 1;
	    }
	  else
	    {
	      if (naddr==(address[kk-1]+1))
		{
		  phonemes[address[kk-1]] = '.';  // set that one to no stress at all.
		  address[kk-1]=naddr;
		  stress[kk-1]=stressval;
		}
	      else
		{
		  address[kk]=naddr;    
		  stress[kk]=stressval;
		  kk += 1;
		}
	    }
	}
    }
  npos = kk;                   // from now: number of points where stress is decided as specified, possible or impossible
  if (npos<=0) return;           // nothing to do if no stress points.

#ifdef FROMTYPED   
  // for (i=0;i<npos;i++) printf("pos: %3i %3i \n",address[i]+1, stress[i]);
#endif

  if (fixedstress==1){ goto stressreplace; }    // don't change a thing if some stresses are fixed, replace the others trivially then.


  // Next: find the focus as the point at which the first time a primary stress is demanded by the '*' marker.

  focus=0;
  focus2=0;
  focus3=0;

  for (i=0; i<npos; i++) 
    {
      if (stress[i] == 2)
	{
	  if (focus== 0) 
	    {
	      focus = address[i]+1;    // make sure it is +1.
	    }
	  else if (focus2 == 0)
	    {
	      focus2 = address[i]+1;
	    }
	  else if (focus3 == 0)
	    {
	      focus3 = address[i]+1;
	    }
	}
    }


  //  printf("fixed stress: %i.  Focus %i  Focus2: %i Focus 3: %i\n",fixedstress, focus,focus2, focus3);

  kk=0;

  fleftwind = 10;              // stresses before primary stress less than fleftwind are suppressed.
  frightwind =8;              // stresses after primary stress less than frigthwind are suppressed.
  

  if(focus)
    {
      if (focus>1)   // not at the very beginning of the word.
	{
	  fleftwind = 10;              // stresses before primary stress less than fleftwind are suppressed.
	  frightwind =8;              // stresses after primary stress less than frigthwind are suppressed.
  
	  if (focus2)
	    {
	      if (focus2 - fleftwind < focus) focus = focus2;
	      if (focus3) 
		{
		  if (focus3 - fleftwind < focus) focus = focus3;
		}
	    }
	}
      else 
	{
	  fleftwind = 5;        // concentrate scope on prefixes for focus at beginning of word
	  frightwind = 5; 
	}
    }


  // printf("fixed stress: %i.  Focus %i  Focus2: %i Focus 3: %i\n",fixedstress, focus,focus2, focus3);


  if (focus==0) 
    {
      for (i=0; i<npos; i++) 
	{
	  if (stress[i] == 1)
	    {
	      if (focus== 0) 
		{
		  focus = address[i]+1;    // make sure it is +1.
		  fleftwind = 8; 
		  frightwind =6;
		  break;
		}
	    }
	}
    }

  // printf("fixed stress: %i.  Focus %i  Focus2: %i Focus 3: %i\n",fixedstress, focus,focus2, focus3);


  if (focus > 0)              // note that focus is the address of the stress marker plus one
    {
      for (i=0; i<npos; i++)
	{
	  naddr = address[i];
	  if (naddr == (focus-1)) stress[i] = 5;
	  if (naddr < (focus-1))
	    {
	      if (((focus-1)-naddr) < fleftwind)  // if close enough to focus
		{
		  // printf("naddr %i. stress[i]=%i \n",naddr,stress[i]);
		  if (stress[i] == 2 || stress[i] == 1) stress[i]=0;
		}
	      else 
		{
		  // outside the shorter range of the focus, only secondary stress.
		  if (stress[i] == 2) stress[i] = 4;       // turn potential primary into secondary stress.
		  else if (stress[i] == 1) stress[i] = 4;  // turn possible stress into secondary outside the scope of the focus
		}
	    }
	  else                  // behind the focus
	    {
	      if ((naddr - (focus-1)) < frightwind)  // if close enough
		{
		  if (stress[i] == 2 || stress[i] == 1) stress[i]=0;
		}
	      else 
		{
		  // outside the shorter range of the focus, only secondary stress.
		  if (stress[i] == 2) stress[i] = 4;       // turn potential 1st into secondary stress.
		  else if (stress[i] == 1) stress[i] = 4;  // turn into secondary stress as well.
		}
	    }
	}   
    }

  /*  done with processing needed if there is a focus */

  else
  
    /* If there is only secondary type stress (can be stressed) we pick the
     *  first one to be stressed primary and if the word has 4 or more stress mark
     *  and set the rest to secondary stress. 
     */
    {
      prim = 0;
      for (i=0; i<npos; i++) 
	{
	  if (stress[i] == 1)
	    {
	      if (prim==0) 
		{
		  stress[i] = 5;   
		  prim=address[i]+1;  /* +1 since addresses are counted from 0 */
		}
	      else
		{
		  stress[i] = 4;
		}
	    }
	}
    }


  //  for (i=0;i<npos;i++) printf("pos: %3i %3i \n",address[i]+1, stress[i]);


 
 stressreplace:  
  
  for (i=0;i<npos;i++)
    {
      switch (stress[i])
	{
	case 0: phonemes[address[i]] = '.'; break;
	case 1: phonemes[address[i]] = '`'; break;
	case 2: phonemes[address[i]] = '\''; break;
	case 3: phonemes[address[i]] = '.'; break;
	case 4: phonemes[address[i]] = '`'; break;
	case 5: phonemes[address[i]] = '\''; break;
	default: phonemes[address[i]] = '.'; break;
	}
    }
  kk = 0;

  // get rid of remaining dots (zero stress markers).
  for (i=0;i<len;i++) 
    {
      if (phonemes[i] != '.') phonemes[kk++] = phonemes[i];
    }
  phonemes[kk]='\0';
}


void concat_morphems_phonemes(GERLETTER *outphonemes, MorphemeStruct *M, const int  order, const BOOL deal_with_stress)     
{
  int i,j,kk, nmorph;
  // U16 rule;
  GERLETTER c,cc;

  Morpheme *Mobo[5];     // pointer chain.
  Morpheme *focus;       // central Morpheme
  int nstress1,nstress2,nfirsttime1,nfirsttime2,skippit,nlast2;

  for (i=0;i<5;i++) Mobo[i]=(Morpheme *) NULL;
  kk=0;

  // feed buffer with n morphemes and two nulls
  
  nmorph = M->nparts;

  for (i=0;i < (nmorph + 2) ;i++)            // nmorph morphemes and pump two more.
    {
      for (j=1;j<5;j++) Mobo[j-1]=Mobo[j];   // delay.

      if (i < nmorph) 
	{
	  if (order== -1) Mobo[4] = &(M->morph[nmorph-1-i]);    // this is the normal way.
	  else if (order == 1) Mobo[4] = &(M->morph[i]);
	}
      else
	{
	  Mobo[4] = (Morpheme *) NULL;
	}
      
      process_rule(Mobo[0],Mobo[1],Mobo[2],Mobo[3],Mobo[4]);
      
      focus = Mobo[2];    // middle morph
      if (focus) 
	{
	  for (j=0; (c = focus->phonemepart[j])!=0;j++) outphonemes[kk++] =c;
	}
    }

  outphonemes[kk++]='\0';

  nstress1 = 0;
  nstress2 = 0;
  nfirsttime1 = 0;
  nfirsttime2 = 0;
  nlast2 = 0;
  skippit=0;


  //  printf("  [[%s]] \n",outphonemes);

  if (deal_with_stress == 1)
    {
      process_stress(outphonemes);
    }

  else if (deal_with_stress ==2 ) 
    {
      kk = strlen(outphonemes);

      for (i=0; i<kk; i++) 
	{
	  c = outphonemes[i];
	  switch (c)
	    {
	    case '*':
	      nstress1 += 1;
	      if(nfirsttime1 == 0 ) nfirsttime1 = i+1;
	      break;
	    case ':': 
	      nstress2 += 1;
	      if(nfirsttime2 == 0) nfirsttime2 = i+1;
	      nlast2 = i+1;
	      break;
	    default:
	      break;
	    }
	}
       
      //      printf(" STRESS: %i %i  FIRST %i %i\n",nstress1,nstress2,nfirsttime1,nfirsttime2);
      j=0;
      for (i=0;i<kk;i++)
	{
	  c = outphonemes[i];
	  if (c != '.' && c !='+')
	    {
	      skippit =0;
	      switch ( c )
		{
		case ':' :    // get rid off if before firsttime1
		  if (nstress1)  // if there is  primary stress
		    {
		      if(nstress2 > 1)
			{
			  if ((i+1) == nlast2) 
			    {
			      skippit = 0;
			    }
			  else skippit=1;
			}
		      else
			{
			  if ((i+1)<nfirsttime1)   skippit=1;
			}
		      cc = '`'; 
		    }
		  else
		    {
		      cc = '`';
		      if ((i+1)>nfirsttime2) skippit=1;
		      else  if (nstress2 > 1) cc = '\''; 
		    }
		  break;
		  
		case '*':     // primary stress
		  cc = '\''; 
		  break;
		default:   
		  cc = c; 
		  break;
		}
	      if (!skippit) outphonemes[j++] = cc;
	    }
	}
      outphonemes[j++] = '\0';
    }
}

BOOL is_shortener(GERLETTER c1, GERLETTER c2)
{

  /* these consonant combinations, enclosed by vowels shorten the preceeding vowel */

  const  GERLETTER *shortenerlist[] = {"sp", "st", "rd", "rl", "rt", 
				"ld", "lt", "ng", "tz", "nz", 
				"mp", "nt", "nd", "pf", "lk",
                                "rg", "kt"}; 
  int i;
  
  for (i=0; i<17; i++)
    {
      if (c1 == shortenerlist[i][0] && c2 ==  shortenerlist[i][1]) return 1;
    }
  return 0;
}



BOOL morphemize_word(const GERLETTER *word, 
		     GERLETTER *outword, 
		     GERLETTER *outphonemes, 
		     const wordgrammarinfo *Wt)
                                                /* const HPatterns *TOK) no longer */
{
  BOOL ret;
  int i,j;
  WalkCNTXT Contxt;
  U16 currpos;
  walkinfo walki;
  GERLETTER wordbuff[120];
  GERLETTER cc;
  currpos=0;
  Contxt.counter=0;
  Contxt.level=0;
  Contxt.maxlevel=0;  
  Contxt.alert =0;
  Contxt.grammar = 0; 
  Contxt.Nodes = Wt->GtNodes;
#ifndef BACHUS_IN_DECTALK
  Contxt.nnodes = Wt->nnodes;
#endif 
  Contxt.Ltlist = Wt->Ltreelist;
  Contxt.MorphDict = Wt->MorphDict;
  Contxt.special = 0;

  /* process special bits for conditions: such as "ist's", "war's", "USA", "Prof.", "etc" */
  /* see bachusoperators.h */

  if (word_is_capitalized(word)) Contxt.special += 1;
  if (word_has_some('.', word))       Contxt.special += 2;
  if (word_has_some('-', word))    Contxt.special += 4;
  if (word_has_some('`',word) 
      || word_has_some('\'',word) )  Contxt.special += 8;

  
  j=0;

  for (i=0;word[i] != '\0'; i++)
    {
      cc = ls_lower[word[i]];
      /* if (cc>='a' && cc <="z" && cc != '\'' && cc != '`')*/  wordbuff[j++]=cc;
    }
  wordbuff[j++] = '\0';
  Contxt.wordlength = strlen(wordbuff);

  Contxt.theword = wordbuff;

  Contxt.wordpos=0;
  Contxt.Morphstruct.nparts=0; 
  initNodestack(&Contxt.nstack);

  ret = 0;
  walki.wordpos = 0;
  walki.succeeded=0;
  walki = GtWalker(&Contxt,1,walki); // start at 1st node

  // #ifdef MATCHINGTRIX
  // match_whatever(wordbuff, outphonemes, Wt->Ltreelist, Wt->notries,  Wt->MorphDict);
  // printf("pathmethod: %s -> /%s/ \n",wordbuff,outphonemes);
  // #endif 
  if (walki.succeeded == 1) 
    {
      insert_morph_seperators(outword, &Contxt.Morphstruct);
      concat_morphems_phonemes(outphonemes, &Contxt.Morphstruct,-1,1);   // backwards
#ifdef FROMTYPED     
      display_word_stucture(Contxt.theword, &Contxt.Morphstruct);
      GtrieQuickStatistics(Wt->GtNodes,Wt->nnodes);
      printf("Gtwalker Iterations: %i\n", Contxt.counter); 
      printf("Phoneme string : /%s/.\n",wordbuff);
#endif
      ret=1;
    }
  else
    {
      ret = match_whatever(wordbuff, outphonemes, Wt->Ltreelist, Wt->notries,  Wt->MorphDict);
      strcpy(outword,Contxt.theword);
      if (ret) {
	  //printf("pathmethod: %s -> /%s/ \n",wordbuff,outphonemes);
	  }
      else{//printf("pathmethod failed\n");
	  }
    }
  return ret;
}


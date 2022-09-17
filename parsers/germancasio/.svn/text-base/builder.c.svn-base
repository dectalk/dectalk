/*

Purpose: The subroutines in this file are mainly called by the
"actions" of the parser which is defined in bachus.y. 
In particular, the function buildtree() defined here is
called by the code generated from bachus.y 

Remarks: Some of these subroutines may allocate memory for strings. 
For example, I make use of the function strdup which duplicates
a string. Duplicating a string implicitely means allocation of
additional memory. I did not care about this since the
string duplication occures only once to create lists that 
are used without further change. For example the generation
of the symbol table (which is finite) and the generation
of the letter-trie table filenames (there should only be a few).

*/

#include "bachus.h"
#include <string.h>
#include <stdio.h>
#include <time.h>
#include "bachusoperators.h"
/* defines the table operatordictionary */

gnodeinfo newgnodeinfo(U16 stat,U16 count,U16 countB, U16 par)
{ // just a little helper
  gnodeinfo g;
  g.status = stat;
  g.counter = count;
  g.counterB = countB;
  g.parameter=par;
  return g;
}

/* -- used?
gnodeinfo emptynodeinfo(gnodetype type)
{ // just a little helper
  gnodeinfo g;
  g.status = 0;
  g.counter = 0;
  g.counterB = 0;
  g.parameter=0;
  return g;
}
*/

/* the following is called only once in the program.
   Purpose Initialize the grammar trie structure.
   It allocates an array of 
*/

GTrie newGTrie(const U16 nnodes, const U16 increments)
{
  GTrie newtrie;
  newtrie.Nodes = (GTrieNode *) calloc((size_t) nnodes, sizeof(GTrieNode));

  newtrie.size = nnodes;
  newtrie.nnodes = 1;
  newtrie.last = 1;
  newtrie.current = 0;
  newtrie.nempty = nnodes-1;     // all empty but the first two.
  newtrie.increments=increments; // if new nodes have to allocated.
  //  newtrie.stopcondition = 0;
  return newtrie;
}

void  deleteGTrie(GTrie *Gt)   // primitive clean up procedure
{
  if (Gt->size > 0 && Gt->Nodes)
    {
      free((void *) Gt->Nodes);   // (crash and burn if memory corrupted.)
    }
}

gnodeinfo get_gnodeinfo(GTrie *Gt, U16 node)
{
  return Gt->Nodes[node].info;
}

void set_gnodeinfo(GTrie *Gt, U16 node, gnodeinfo info)
{
  Gt->Nodes[node].info = info;
}

/* create within the GTrie Gt a new node */
U16  newGTrieNode(GTrie *Gt)  
{
  U16 last, newlen;

  //DEBUG_printf("Empty nodes: %i.\n",Gt->nempty);
  if (Gt->last < Gt->size)
    {
      last = Gt->last;
      Gt->nempty -= 1;
      Gt->last += 1;       // may now point to nonexistant memory (!)
    }
  else
    {
      newlen = Gt->size + Gt->increments;
      Gt->Nodes =   (GTrieNode *)    realloc((void *)Gt->Nodes, sizeof(GTrieNode)*newlen);
      //DEBUG_printf("Realoc called at current %i \n",Gt->current);
      last = Gt->last;
      // note: new memory not initialized.    So init at least each new node as above:
      Gt->last += 1;    // btw points to non-initialized memory, will be cleared next time
      Gt->size += Gt->increments;
      Gt->nempty = Gt->increments-1;  // minus one since I give one of the new ones away
    }
  // just to be sure:
  Gt->nnodes += 1;

  Gt->Nodes[last].name = (char *) NULL;
  Gt->Nodes[last].typeinfo = NULLNODE;
  Gt->Nodes[last].info = newgnodeinfo(0,0,0,0);
  Gt->Nodes[last].alt = 0;
  Gt->Nodes[last].what = 0;
  Gt->Nodes[last].right = 0;
  return last;    // point at new node, ready for use and empty
}

U16 make_node(GTrie *Gt,gnodetype type,GERLETTER *name,U16 val,U16 alt, U16 what, U16 right)
{

  U16  newn;
  newn =  newGTrieNode(Gt);
  Gt->Nodes[newn].name = strdup(name);
  Gt->Nodes[newn].index = val;
  Gt->Nodes[newn].typeinfo = type;
  Gt->Nodes[newn].info = newgnodeinfo(0,0,0,0);
  Gt->Nodes[newn].alt = alt;
  Gt->Nodes[newn].what = what;
  Gt->Nodes[newn].right = right;
  return newn;
}
  

GERLETTER *gnodetypename(gnodetype type)
{
  switch (type)
    {
    case NULLNODE: return "NULLNODE";
    case NOPNODE: return "NOPNODE";
    case INITIALIZE: return "INITIALIZE";
    case ENDOFPATH: return "End path";
    case PATHRETURN: return "Return";
    case EPSILONNODE: return "EPSILONNODE";
    case STARTNODE: return "STARTNODE";
    case ALTNODE: return "ALTNODE";
    case RIGHTNODE: return "RIGHTNODE";
    case TERMINAL: return "TERMINAL";
    case NONTERMINAL: return "NONTERMINAL";
    case SYLLABIFY: return "SYLLABIFY";
    case OPERATORNAME:  return "OPERATORNAME";
    case LOOPNODE: return "LOOPNODE";
    case JUMPNODE: return "JUMPNODE";
    case SINGLEMORPH: return "SINGLEMORPH"; 
    case BOUNDACTION: return "BOUNDACTION"; 
    case UNBEKANNTE: return "Not Defined";
    case NEWPATH: return "NEWPATH";
    default: return "Unknown gnodetype";
    }
}

void dumpGTrieNode(GTrie *Gt,U16 i)
{
  printf("%4i: %12s(%3i) %4i %4i %4i %12s [%4i %4i %4i %4i]\n",
	 i,
	 Gt->Nodes[i].name,
	 Gt->Nodes[i].index,
	 Gt->Nodes[i].alt,                         // also called alt.
	 Gt->Nodes[i].what ,
	 Gt->Nodes[i].right,
	 gnodetypename(Gt->Nodes[i].typeinfo),
	 Gt->Nodes[i].info.status,
	 Gt->Nodes[i].info.counter,
	 Gt->Nodes[i].info.counterB,
	 Gt->Nodes[i].info.parameter);
}

void dumpGTrie(GTrie *Gt)
{
  int i;
  printf("\n Dump of Grammar Tree  \n Realloc size %i\n",Gt->increments);
  printf("Size: %i.  Number of Nodes %i, Empty nodes %i. \n",Gt->size,Gt->nnodes,Gt->nempty);
  printf("Last: %i.  Current  %i.\n", Gt->last,Gt->current);
  printf("\n   pos      Symbol(indx) alt what  next  node_type  [stat cntA cntB parm]\n");

  for (i=0; i<Gt->last; i++) dumpGTrieNode(Gt,i);
}

void filedumpGTrieNode(GTrie *Gt, U16 i, FILE *outstr)
{
    if (Gt->Nodes[i].typeinfo == BOUNDACTION ||
	Gt->Nodes[i].typeinfo == SINGLEMORPH )
    {
/*
	fprintf(outstr,"{\"%s\", %4i, %4i, %4i, %4i, %4i, %4i, %4i, %4i, %4i }, \n",
		Gt->Nodes[i].name,
		Gt->Nodes[i].alt,                         // also called alt.
		Gt->Nodes[i].what ,
		Gt->Nodes[i].right,
		Gt->Nodes[i].index,
		Gt->Nodes[i].typeinfo,
		Gt->Nodes[i].info.status,
		Gt->Nodes[i].info.counter,
		Gt->Nodes[i].info.counterB,
		Gt->Nodes[i].info.parameter);
*/
	fprintf(outstr,"{\"%s\", %4i, %4i, %4i, %4i, %4i, %4i }, \n",
		Gt->Nodes[i].name,
		Gt->Nodes[i].alt,                         // also called alt.
		Gt->Nodes[i].what ,
		Gt->Nodes[i].right,
		Gt->Nodes[i].index,
		Gt->Nodes[i].typeinfo,
		Gt->Nodes[i].info.parameter);
    }
    else
    {
	if (Gt->Nodes[i].info.counter != 0 || Gt->Nodes[i].info.counterB != 0 ||Gt->Nodes[i].info.status != 0 )
	{
	    fprintf (stderr,"There is a case COUNTER COUNTERB \n");
	}
/*
	fprintf(outstr,"{0x0000, %4i, %4i, %4i, %4i, %4i, %4i, %4i, %4i, %4i }, \n",
		Gt->Nodes[i].alt,                         // also called alt.
		Gt->Nodes[i].what ,
		Gt->Nodes[i].right,
		Gt->Nodes[i].index,
		Gt->Nodes[i].typeinfo,
		Gt->Nodes[i].info.status,
		Gt->Nodes[i].info.counter,
		Gt->Nodes[i].info.counterB,
		Gt->Nodes[i].info.parameter);
*/
	fprintf(outstr,"{0x0000, %4i, %4i, %4i, %4i, %4i, %4i }, \n",
		Gt->Nodes[i].alt,                         // also called alt.
		Gt->Nodes[i].what ,
		Gt->Nodes[i].right,
		Gt->Nodes[i].index,
		Gt->Nodes[i].typeinfo,
		Gt->Nodes[i].info.parameter);
    }
}

/*
void filedumpGTrieNode(GTrie *Gt, U16 i, FILE *outstr)
{
  fprintf(outstr,"{\"%s\", %4i, %4i, %4i, %4i, %4i, %4i, %4i, %4i, %4i }, \n",
	  Gt->Nodes[i].name,
	  Gt->Nodes[i].alt,    
	  Gt->Nodes[i].what ,
	  Gt->Nodes[i].right,
	  Gt->Nodes[i].index,
	  Gt->Nodes[i].typeinfo,
	  Gt->Nodes[i].info.status,
	  Gt->Nodes[i].info.counter,
	  Gt->Nodes[i].info.counterB,
	  Gt->Nodes[i].info.parameter);
}
*/
char *make_upper_name(char *name)
{
    char *p = name;

    while (*p)
    {
        if (*p=='.')
        {
            *p = '\0';
            break;
        }
        *p = toupper(*p);
        p++;
    }
    return name+1;
}


/* write an include.h file that can become part of Dectalk 
   The resulting file contains both the grammar tree and
   the letter tries in a slightly compacter form than used
   in the building process */

void filedumpGTrie(GTrie *Gt, FILE *outstr, const char *nameextension)
{
  int i;
  int count;
  lettertriename *sp;
  time_t nowis;
  char *timep;
 
  // tmtime = localtime(&nowis);
  //  mktime(&time);

  nowis = time(NULL);
  timep = ctime(&nowis);

  //timep = asctime_r(localtime_r(time(&timespace),&tmstruct),timebuf);

  fprintf(outstr,"/* This is an automatically generated include file for German DecTalk */\n");
  fprintf(outstr,"/* It is generated with the bachus word parser software               */\n");
  fprintf(outstr,"/* Written by Reiner Wilhelms-Tricarico for Fonix                     */\n\n");
  fprintf(outstr,"/* Time generated: %s */ \n", timep);
  //  fprintf(outstr,"#ifndef   BACHUS_IN_DECTALK /* automatic include */\n");
  //  fprintf(outstr,"#define  BACHUS_IN_DECTALK  /* compact version of includes */  \n");
  fprintf(outstr,"#include \"bachus.h\" \n\n");
  //  fprintf(outstr,"#endif  /* BACHUS_IN_DECTALK */\n\n");

  
  file_dump_morph_phone_list(&MorphDict, outstr,nameextension);  // output phoneme pool


  fprintf(outstr, "%s GTrieNode  %swordgrammarnodes[] = {\n",CONSTSTRING,nameextension);
  for (i=0; i<Gt->last; i++) filedumpGTrieNode(Gt,i,outstr);  

  fprintf(outstr, "};\n");

  count = 0; 
	
  for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++)    // static table, fixed length
    {
      if (sp->triename) 
	{
	  count++;
	  if (sp->inmemory==1)
	      file_dump_ltrie( LTrieList[count-1],sp->triename, count, outstr, nameextension);  // see ltrie.c
	}
    }

  fprintf(outstr,"%s LTrie    %sLetterTrieList[%i] = {\n",CONSTSTRING,nameextension,count);

  count = 0; 

  for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++) 
    {
      if (sp->triename)
	{
	  count++;
	  if (sp->inmemory==1)
	  {
	      fprintf(outstr,"             {%i,%i, %s,%s%s%i},\n",
		      LTrieList[count-1].last,
		      sp->type,
		      make_upper_name(sp->filename),
			  nameextension,
		      sp->triename, count);
	  }
	  else
	  {
	      fprintf(outstr,"             {%i,%i, %s,NULL},\n",
		      LTrieList[count-1].last,
		      sp->type,
		      make_upper_name(sp->filename));
	  }
	}
    }
  
  fprintf(outstr,"    };\n");

  fprintf(outstr, "\n%s wordgrammarinfo   %sWordGrammar = {",CONSTSTRING,nameextension,nameextension);
  fprintf(outstr, "%i, %s%s, %i, %s%s,&%s%s};\n",
	  Gt->nnodes,nameextension,"wordgrammarnodes", count,
	  nameextension,"LetterTrieList",nameextension,"Phonemes_List");
}

  
  
U16  epsilonNode(GTrie *Gt)  
     /* make the start of the tree node */
     /* I modifed this later to include  */
     /* a node at position 0 which is used */
     /* for the parser to check if the end of */
     /* a path is reached. this is only to */
     /* make the program a little more, say, elegant. */
{
  U16 curr;

  curr = 0;
  /*
  Gt->Nodes[curr].name = strdup("EndPath"); 
  Gt->Nodes[curr].index = 0;
  Gt->Nodes[curr].typeinfo=ENDOFPATH;
  Gt->Nodes[curr].info = newgnodeinfo(0,0,0,0);
  Gt->Nodes[curr].alt = 0;
  Gt->Nodes[curr].right = 0;  
  Gt->Nodes[curr].what = 0;
  */

  Gt->Nodes[curr].name = strdup("epsilon"); 
  Gt->Nodes[curr].index = 0;
  Gt->Nodes[curr].typeinfo=EPSILONNODE;
  Gt->Nodes[curr].info = newgnodeinfo(0,0,0,0);
  Gt->Nodes[curr].alt = 0;
  Gt->Nodes[curr].right = 0;  
  Gt->current=curr;

  return curr;
}

void dump_terminallist()
{
  lettertriename *sp;
	
	for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++)    // static table, fixed length
	  {
	    if (sp->triename) printf(" Triename %s(%i) defined in file: %s\n",
				     sp->triename,sp->value,sp->filename);
	  }
}

U16 which_in_terminallist(GERLETTER *name, U16 *type)
{
  lettertriename *sp;
  int count;
  
  count = 0;
  for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++) 
    {
      count++;
      if (sp->triename && !strcmp(sp->triename,name)) 
	{
	  *type = sp->type;
	  return count;
	}
    }
  return 0;
}

lettertriename *look_in_terminallist(GERLETTER *name, U16 indx, GERLETTER *filename, U16 type, U16 bits)
{
	int count;
	lettertriename *sp;
	count=0;
	
	for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++)    // static table, fixed length
	  {
	    /* is it already here? */
	    if (sp->triename && !strcmp(sp->triename,name)) return sp; 
	    /* is it free */
	    if(!sp->triename) {
	      sp->triename = strdup(name);
	      sp->filename = strdup(filename);
	      sp->value = indx;
	      if (type>=10) 
	      {
		  sp->inmemory=1;
		  sp->type = type-10 + bits;
	      }
	      else
	      {
		  sp->inmemory=0;
		  sp->type = type + bits;
	      }
	      return sp;
	    }
	    /* otherwise continue to next */
	}
	fprintf(stderr,"Too many trie files.\n");
	exit(1);	/* cannot continue */
} 


U16 which_startsybol(U16 node)
{
  /* find for the node in the argument if it appears 
     on the left side of a definition  */
  U16 curr, def;
  curr=0; def=0;

  while ( curr=STGT.Nodes[curr].alt )    // from the epsilon node down.
    {
      if (STGT.Nodes[curr].index == STGT.Nodes[node].index) def=curr;
    }
  return def;
}

/* the following function is called if the metaparser finds a statment 
   with the word PROCESS, a process declaration. So far I only have
   a process called syllabification.  The process needs to be
   made a terminal otherwise it would be assumed that it's an ltrie.
*/

BOOL make_process_terminal(GERLETTER *processname,U16 type)
{
  int typ;
  U16 curr,indx;
  BOOL ret;
  
  ret=1;

  for (curr=1 ; curr <= STGT.nnodes; curr++)
    {
      typ = STGT.Nodes[curr].typeinfo;
      if (typ==NONTERMINAL)
	{
	  indx = strcmp(STGT.Nodes[curr].name,processname);
	  if (indx==0)
	    {
	      STGT.Nodes[curr].typeinfo = SYLLABIFY;    // for now only this one.
	      STGT.Nodes[curr].what = indx;  
	      STGT.Nodes[curr].info.parameter = type; 
	    }
	}
    }
}

/* function check_node_tree(): For each symbol that
   has been defined in a statement "Trie name = filename" 
   statement, change the type from non-terminal to 
   terminal. Further, for the remaining non-terminal
   nodes, check if they appear in a definition as
   startsymbol. If one of these go wrong, ring the bell.
*/

BOOL check_node_tree()
{
  int typ;
  U16 curr,indx,type;
  BOOL ret;

  ret=1;

  /* first loop: For each node that is Nonterminal, check
     if it is in the list of definitions that associate
     a symbol with a letter trie file. If this file can
     be found, enter the index of the filename into the
     parameter field of the node info, and turn the node
     into a terminal node; that is a node that uses directly
     a letter trie 
  */

  for (curr=1 ; curr <= STGT.nnodes; curr++)
    {
      typ = STGT.Nodes[curr].typeinfo;
      if (typ==NONTERMINAL)
	{
	  indx = which_in_terminallist(STGT.Nodes[curr].name,&type);
	  if (indx>0)
	    {
	      STGT.Nodes[curr].typeinfo = TERMINAL;  
	      STGT.Nodes[curr].what = indx;  
	      STGT.Nodes[curr].info.parameter = type; 
	    }
	}
    }

  /* second loop: For each node that is still left
     non-terminal, there got to be a definition 
     where it appears on the left side as startnode. 
     Except for the first start symbol after the 
     epsilon node. 
  */
  
  for (curr=1 ; curr <= STGT.nnodes; curr++)
    {
      typ = STGT.Nodes[curr].typeinfo;
      if (typ==NONTERMINAL)
	{
	  indx = which_startsybol(curr);
	  if (indx>0) 
	    {
	      STGT.Nodes[curr].what = indx;
	    }
	  else
	    {
	      printf("No definition found for symbol %s (%i)\n",
		     STGT.Nodes[curr].name,STGT.Nodes[curr].index);
	      STGT.Nodes[curr].typeinfo=UNBEKANNTE;    //unknown type 
	      ret=0;
	    }
	}
    }
	  
  return ret;
}


void translate_triecalls()
{
  lettertriename *sp;
  int count;
  count = 0;
	
  printf("/* Building the list of letter tries from file */\n");
  for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++)    // static table, fixed length
    {
      if (sp->triename) 
	{
	  count++;
	  printf(" Ltlist[%i] = file2trie(%s);\n",count-1,sp->filename);
	}
    }
}

GERLETTER *strip_quotes(GERLETTER *str)
/* get rid of quote signs in filenames so we don't have to alter the syntax file 
   (uses strdup, thus malloc) */
{
  GERLETTER *p, *o, *oo;
  GERLETTER c;

  oo = strdup(str);
  
  p = str;
  o = oo;

  while(c = *p++)
    {
      if (c != '"') *o++ = c;
    }
  *o++ = '\0';
  return oo;
}

GERLETTER *strip_brackets(GERLETTER *str)
/* get rid of bracket signs in strings 
   (uses strdup, thus malloc) */
{
  GERLETTER *p, *o, *oo;
  GERLETTER c;

  oo = strdup(str);
  
  p = str;
  o = oo;

  while(c = *p++)
    {
      if (c != '(' && c != '<' && c != '[' && c != ')' && c != '>' && c != ']' ) *o++ = c;
    }
  *o++ = '\0';
  return oo;
}


void  make_ltries()
{
  lettertriename *sp;
  int count;
  count = 0;
	
  printf("/* makeing the list of letter tries from file */\n");
  for(sp = LTrieFiles; sp < &LTrieFiles[NTRIEFILES]; sp++)    // static table, fixed length
    {
      if (sp->triename) 
	{
	  if (count >= NTRIEFILES){ printf("maximal number of ltrie filenames exceeded\n"); exit(1);}
	  printf(" file %s In Memory: %i\n",sp->filename,sp->inmemory);
	  LTrieList[count++] = file2ltrie(strip_quotes(sp->filename), &MorphDict, sp->type,sp->inmemory);  // static list.
	}
    }
}


void 	validate_operator(GERLETTER *name, U16 *code, U16 *parameter)
{
  int n1,n2;
  int i;
   
  *code=0;
  *parameter=0;

  n1 = 1;   // trusting the parser, there is always a star in the first character.

  for (n2=1; n2<80; n2++) if (name[n2]=='(') {n2 -= 1; break;}   // operator name ends at bracket open.
  
  for (i=0; i<NUMBER_OF_BACHUS_OPERATORS; i++)
    {
      if (strncmp(&name[1],operatordictionary[i].name,n2) == 0)
	{
	  *code = operatordictionary[i].index;
	  break;
	}
    }

  if (*code==0) 
    {
      printf("Operator string is %s could not be found. Ends at %i\n",name,n2);
    }

  n1 = n2+2;           // *point to beginning of number string, one after the open paranthesis.

  for (n2=n1; n2<80; n2++)
    {
      if (name[n2] == ')') break;
    }
  n2 = n2-n1;        // length of number string
  
  if (n2==0) *parameter = 0;
  else
    {
      *parameter = atoi(&name[n1]);
    }
  printf("in string %s numbers are from %i with length %i\n",name,n1,n2, *parameter);
}
  

/* -----------------------------------------------------------------
   buildtree() is the main point of this file.

   The following subroutine, buildtree, is directly called by the
   (yacc or bison generated-) parser. In the file bachus.y, one can
   see this subroutine called inside of various action brackets {}.
   The yacc or bison generated program bachus.tab.c results then
   in specific calls of this subroutine. The process of 
   calling buildtree forms the first part of the compilation.
   By repeated calls to buildtree, as first representation
   consisting of GTrie nodes is generated that contains the
   informaion in an easier processable form. This can be 
   printed using dumpGtrie. The tabled form is then used
   by GtWalker, either directly or after the table was dumped 
   to file and later included into another, independent, program.
   -----------------------------------------------------------------
*/

BOOL  buildtree(gnodetype how, GERLETTER *name, int val, int valb)
{
    U16 curr,dest;
    U16 code, parameter;   // for operators
    int gntype;
    // GERLETTER *txt;
    gnodeinfo inf;
    BOOL ret;
    
    ret = 1;

    /* remarks: when pushing a number to the little stack I
       add and subtract one in order to be able to distinguish 
       between a condition of stack over/underflow and a stack token
       containing zero. A smarter way would be to use the extra 
       status information of the stack. But it's not really needed 
       since: If the parser gets through, this stack is not going
       to be messed up, so no real testing of stack status is needed.
       (until proven wrong...:-)
       The symbol STGT that is referred here frequently is a static
       list containg a list of GTrie nodes which are being generated
       here.
    */
    switch (how)
      {
      case INITIALIZE: 
	/* initialization of static objects with some fringes 
           assumption: must be called once and only once */
	STGT  = newGTrie(GNODEINCREMENTS,GNODEINCREMENTS);  // static object
	// Stloopstack = newNodestack();
	initNodestack(&Stloopstack);
	/* make the "epsilon node" and push on the node stack */
	curr = epsilonNode(&STGT);
	buildstat.startnodes=0;
	buildstat.laststart = curr;
	buildstat.lastright = 0;
	buildstat.lastalt=0;
	buildstat.newpath=0;
	buildstat.newrule=0;
	buildstat.loopnest=0;
	init_morph_dict(&MorphDict);     // another global: phoneme strings used for direct translation into phonemes.
	break;

      case STARTNODE:   // called by parser if left node is defined.
	//  printf("Startode: %s(%d)\n",name,val);
	/* a start node is on the left of the grammar tree. */
	/* put it on the next free position. */
	/* point to epsilon node, go right, then down */
	curr = buildstat.laststart;
	curr = make_node(&STGT,STARTNODE,name,val,0,0,0);
	buildstat.startnodes += 1;     // count them since first has special meaning
	STGT.Nodes[buildstat.laststart].alt = curr;
	buildstat.laststart = curr;
	buildstat.newrule =1;
	buildstat.lastright = 0;
	buildstat.lastalt = 0;
	break;

      case ENDOFPATH:                    // watch it this seems all funny REWT
	//  printf("Endof a path\n");	
	if (buildstat.startnodes==1)
	  {
	    gntype=ENDOFPATH;
	    curr = make_node(&STGT,gntype,"END", val,0,0,0);
	  }
	else
	  {
	    gntype=PATHRETURN;
	    curr = make_node(&STGT,gntype,"RET", val,0,0,0);
	  }

	if (buildstat.newpath) 
	  {
	    buildstat.newpath=0;
	    STGT.Nodes[buildstat.lastalt].right = curr;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastright].right = curr;
	    buildstat.lastright = 0;
	  }
	break;

      case LOOPNODE: 
	//  printf("Loopnode : ");
	buildstat.loopnest++;
        name = "loop";
	valb = buildstat.loopnest;
	buildstat.loopstart = 1;   // will be reset below.
	// valb carries the nesting depth. 
        // Note: there is no break statement here on purpose
        // we just continue as in RIGHTNODE below, which
	// MUST not be moved 
	// ** DON'T INSERT ANOTHER CASE HERE! case RIGHTNOTE is a continuation of case LOOPNODE.
      case RIGHTNODE:              // don't move this, since LOOPNODE continues here.
	/* link a nonterminal node either to the last altnode or 
	   to the last nonterminal node */
	//  printf("Rightnode: %s(%d)\n",name,val); 
	if (buildstat.loopstart) gntype = LOOPNODE;
	else gntype = NONTERMINAL;

	curr = make_node(&STGT,gntype,name,val,0,0,0);
	if (buildstat.newpath) 
	  {
	    buildstat.newpath=0;
	    STGT.Nodes[buildstat.lastalt].right = curr;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastright].right = curr;
	  }
	buildstat.lastright = curr;


	if (buildstat.loopstart) // if this is a loop node.
	  {
	    pushNode(&Stloopstack,curr);
	    buildstat.loopstart = 0;
	  }
	break;

      case NOPNODE:
	//  printf("NOP node: \n");
	gntype = NOPNODE;
	curr = make_node(&STGT,gntype,"NOP",0,0,0,0);
	if (buildstat.newpath) 
	  {
	    buildstat.newpath=0;
	    STGT.Nodes[buildstat.lastalt].right = curr;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastright].right = curr;
	  }
	buildstat.lastright = curr;
	break;

      case JUMPNODE: 
	//  printf("Jumpnode: [%d,%d]",val,valb);
	if (buildstat.loopnest==0) printf("Jumpnode outside a loop???");
	dest = popNode(&Stloopstack);  // jump destination - it's a loop node
	buildstat.loopnest--;          //
	curr = make_node(&STGT,JUMPNODE,"continue",0,0,0,0);
	STGT.Nodes[buildstat.lastright].right = curr;
	STGT.Nodes[dest].alt = curr;  // loop node's alt
	buildstat.lastright=curr;
	STGT.Nodes[curr].what = dest;
	inf = get_gnodeinfo(&STGT,dest);
	inf.counter=val;       // first of the two numbers [x,y] - see bachus.y
	inf.counterB=valb;     // second of the two numbers [x,y]
	inf.parameter=curr;    // let loop know it's corresponding jump node.
	set_gnodeinfo(&STGT,dest,inf);
	break;

      case NEWPATH: 
	//  printf("NEWPATH: \n");
	// always create an altnode. 
	curr = make_node(&STGT,ALTNODE,"alt",0,0,0,0);
	STGT.Nodes[curr].info.parameter = val;           // note the grammar file's line number here.
	if (buildstat.newrule) 
	  {
	    STGT.Nodes[buildstat.laststart].right = curr;
	    buildstat.newrule = 0;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastalt].alt = curr;
	  }
	buildstat.lastalt = curr;
	/* signal a new path */
	buildstat.newpath=1;
	break;
      case SINGLEMORPH:
	//  printf("SINGLEMORPH: %s(%d)\n",name,val); 
	curr = make_node(&STGT,SINGLEMORPH,strip_quotes(name),val,0,0,0);
	if (buildstat.newpath) 
	  {
	    buildstat.newpath=0;
	    STGT.Nodes[buildstat.lastalt].right = curr;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastright].right = curr;
	  }
	buildstat.lastright = curr;
	break;

      case OPERATORNAME:
	validate_operator(name, &code, &parameter);
	curr = make_node(&STGT,OPERATORNAME,name,code,0,parameter,0);
	if (buildstat.newpath) 
	  {
	    buildstat.newpath=0;
	    STGT.Nodes[buildstat.lastalt].right = curr;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastright].right = curr;
	  }
	buildstat.lastright = curr;
	break;

      case BOUNDACTION:
	//  printf("BOUNDACTION: %s(%d)\n",name,val); 
	curr = make_node(&STGT,BOUNDACTION,strip_brackets(name),0,0,0,0);  // clean up "<...>"
	if (buildstat.newpath) 
	  {
	    buildstat.newpath=0;
	    STGT.Nodes[buildstat.lastalt].right = curr;
	  }
	else
	  {
	    STGT.Nodes[buildstat.lastright].right = curr;
	  }
	buildstat.lastright = curr;
	break;

      case PROCESSNAME:
	printf("Do a thing with this: %s \n",symtab[val-1].name);
	make_process_terminal(name,0);
	break;

      case TRIENAME:   // expect in the next argument filename and an index.
	// in val we find the index of the symbol.
        // in valb we find 0 or 1 for maximal or minimal preference in word search
	// note that symlook, called by lex (bachus.l) starts counting at 1.
	// Hence, if yacc (see bachus.y) returns val, we have to address via val-1.
	//  printf("name of the thing: %s  filename %s\n",symtab[val-1].name,name);
	  valb=0;
	look_in_terminallist(symtab[val-1].name,val,name,valb,0);  // name is filename.
	break;
      case LTRIENAME:   // expect in the next argument filename and an index.
	// in val we find the index of the symbol.
        // in valb we find 0 or 1 for maximal or minimal preference in word search
	// note that symlook, called by lex (bachus.l) starts counting at 1.
	// Hence, if yacc (see bachus.y) returns val, we have to address via val-1.
	printf("name of the ltrie with number  %s  filename %s\n",symtab[val-1].name,name);
	look_in_terminallist(symtab[val-1].name,val,name,valb,LONG_MORPH_FIRST);  // name is filename.
	break;

      case DUMPTREE:
	dumpGTrie(&STGT);
	break;
#ifdef GRAMMAR_EVALUATION
      case STATISTICS:
	GtrieStatisitics(&(STGT.Nodes),STGT.nnodes);
	break;
#endif

      case DUMPALL: 

	dumpGTrie(&STGT);

	//      	dump_terminallist();
	ret = check_node_tree();
	if(ret==1)
	  {
	  buildstat.pathn = ret;
	  dumpGTrie(&STGT); 
	  //translate_triecalls();
	  }
	break;

      case FILEDUMP:
	{
	  FILE *outstr;
	  outstr = fopen("bachusi.h","w");
	  if (outstr == NULL)
	    {
	      printf("buildtree (builder.c) could not open output file %s \n",name);
	      perror(name);
	      exit(1);
	    }
	  
	  filedumpGTrie(&STGT, outstr, name);
	  fclose(outstr);
	  break;
	}
	
      default:  printf("Ill code %d for buildtree: %s\n", 
		       how,gnodetypename(how));
      }
    return ret;
} 

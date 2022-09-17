#define jumpmacro(RES,pos,poslab,CNT,NX,NW) \
	pushjump(cntxt,pos); \
	cntxt->STK[NST+1].curr=NX; \
	cntxt->STK[NST+1].oldwalki=NW; \
	NST+=1; \
	goto startpos; \
poslab: \
	NST-=1; \
	RES=cntxt->STK[NST+1].newwalki;



Jumpstack popjump(WalkCNTXT *cntxt)
{
//    printf("popjump %d top=%d\n",cntxt->jmpstack[(cntxt->jmptop)], cntxt->jmptop);
    if (cntxt->jmptop==0) return -1;                 
    else return (cntxt->jmpstack[--(cntxt->jmptop)]);
}

int pushjump(WalkCNTXT *cntxt, Jumpstack val)
{
//    printf("pushjump %d top=%d \n",val,cntxt->jmptop);
    if (cntxt->jmptop+1 > cntxt->maxlevel) cntxt->maxlevel= cntxt->jmptop+1;  /* Keep track */
    if (cntxt->jmptop >= MAXNESTING) return -1;       /* crash and burn in this case */
    else cntxt->jmpstack[(cntxt->jmptop)++] = val;
    return 0;
}


walkinfo  GtWalker(WalkCNTXT *cntxt, U16 curr, walkinfo oldwalki)

{
/*
  int BLUB.inx,BLUB.jnx,BLUB.ii,BLUB.jj,BLUB.j1,BLUB.j2,BLUB.incr;
  U16 BLUB.nalt,BLUB.ntrie,BLUB.currpos;
  U16 BLUB.next,BLUB.alt,BLUB.what;
  U16 BLUB.proceed[10];
  U16 BLUB.phonemeindex[10];
  U16 BLUB.ruleindex[10];
  U16 BLUB.opcode, BLUB.opparam, BLUB.match; // for operator calls.
  walkinfo BLUB.newwalki;
  GERLETTER *BLUB.phonemestring = NULL;
  U16 BLUB.rulenumber = 0;
*/

    int NST=0;
    int position;
    pushjump(cntxt,-1);
 
    cntxt->STK[NST].curr = curr;    
    cntxt->STK[NST].oldwalki = oldwalki;

 startpos: 
    position=0;

    cntxt->STK[NST].phonemestring = NULL;
    cntxt->STK[NST].rulenumber=0;
    cntxt->STK[NST].ii = 0; 
    cntxt->STK[NST].jj = 0;
    cntxt->STK[NST].j1 = 0;
    cntxt->STK[NST].j2 = 0;
    cntxt->STK[NST].incr = 0;

    cntxt->counter += 1;

  if (cntxt->counter > MAXRECURSIONS)
    { 
      cntxt->alert=1;
#ifdef BACHUS_IN_DECTALK
      cntxt->STK[NST].newwalki = cntxt->STK[NST].oldwalki;
      cntxt->STK[NST].newwalki.succeeded = 0;     // unfortunately it will loop here a while.
      goto walkexit;
#else 
#ifdef FROMTYPED
      printf("I give up\n"); 
      GtrieStatisitics(cntxt->Nodes,cntxt->nnodes);
      exit(1);
#endif
#endif
    }
   

  if (cntxt->jmptop >= MAXNESTING)
    { 
      cntxt->alert=2;
#ifdef BACHUS_IN_DECTALK
      cntxt->STK[NST].newwalki = cntxt->STK[NST].oldwalki;
      cntxt->STK[NST].newwalki.succeeded = 1;     // unfortunately it will loop here a while.
      goto walkexit;
#else 
#ifdef FROMTYPED
      printf("I give up: too deep nesting by GtWalker calling itself\n"); 
      GtrieStatisitics(cntxt->Nodes,cntxt->nnodes);
      exit(1);
#endif
#endif
    }

  cntxt->STK[NST].newwalki = cntxt->STK[NST].oldwalki;
  if (cntxt->alert) goto walkexit;

  if (cntxt->wordlength == cntxt->STK[NST].newwalki.wordpos) 
    { 
      if (cntxt->STK[NST].newwalki.succeeded==1) goto walkexit;
    }


 switchboard:

  switch (position)
  {
      case 0: break;
      case 1: goto jump1;
      case 2: goto jump2;
      case 3: goto jump3;
      case 4: goto jump4;
      case 5: goto jump5;
      case 6: goto jump6;
      case 7: goto jump7;
      case 8: goto jump8;
      case 9: goto jump9;
      case 10: goto jump10;
      case 11: goto jump11;
      case 12: goto jump12;
      case 13: goto jump13;
  }


    switch (cntxt->Nodes[cntxt->STK[NST].curr].typeinfo)
      {
      case ENDOFPATH:  
       	cntxt->STK[NST].newwalki.succeeded = (cntxt->wordlength == cntxt->STK[NST].newwalki.wordpos);
	if (!cntxt->STK[NST].newwalki.succeeded) {cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki; cntxt->STK[NST].newwalki.succeeded=0;}
	break;

      case PATHRETURN: 
	cntxt->STK[NST].next = popNode(&cntxt->nstack);
	jumpmacro(cntxt->STK[NST].newwalki,1,jump1,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki); 
	if (cntxt->STK[NST].newwalki.succeeded==0)
	  {
	    pushNode(&cntxt->nstack,cntxt->STK[NST].next);    // push it back to keep stack intact
	  }
	break;

      case EPSILONNODE:
	pushNode(&cntxt->nstack,0);
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].curr].alt;              // point to first startnode
	jumpmacro(cntxt->STK[NST].newwalki,2,jump2,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);
	break;
	
      case STARTNODE:                      // startnode always calls an cntxt->STK[NST].altnode 
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].curr].right;     
	jumpmacro(cntxt->STK[NST].newwalki,3,jump3,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);
	break; 

      case ALTNODE:
	/* For each of the current and cntxt->STK[NST].alt nodes call the right sides
	   until one returns succeeded. */
	cntxt->STK[NST].next = cntxt->STK[NST].curr;
newalt:	    
	jumpmacro(cntxt->STK[NST].newwalki,4,jump4,cntxt,cntxt->Nodes[cntxt->STK[NST].next].right,cntxt->STK[NST].newwalki);      
#ifdef GRAMMAR_EVALUATION
	if (cntxt->STK[NST].newwalki.succeeded==1)              // evaluation mode: count how often the 
	                                        // grammar's lines where used successfully
	  {
	    cntxt->Nodes[cntxt->STK[NST].next].info.counter += 1;   // this one is usually readonly!
	  }
#endif /* GRAMMAR_EVALUATION */
	if (cntxt->STK[NST].newwalki.succeeded==1) goto walkexit; //return cntxt->STK[NST].newwalki;
	else 
	  {
	    cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].next].alt;
	    if (cntxt->STK[NST].next) goto newalt;
	  }
	break;
	
      case LOOPNODE:
	// get the loop counters from the information part of the node
	cntxt->STK[NST].j1 = cntxt->Nodes[cntxt->STK[NST].curr].info.counter;
	cntxt->STK[NST].j2 = cntxt->Nodes[cntxt->STK[NST].curr].info.counterB;

	cntxt->STK[NST].alt = cntxt->Nodes[cntxt->STK[NST].curr].alt;       // address of continue node (JUMPNODE)
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].alt].right;     // address of node after continue 
	cntxt->STK[NST].what = cntxt->Nodes[cntxt->STK[NST].curr].right;    // address of first node inside loop
	pushNode(&cntxt->nstack,cntxt->STK[NST].next);      // push on stack: the continuation after the loop
	if (cntxt->STK[NST].j1>cntxt->STK[NST].j2)
	  {
	    cntxt->STK[NST].jnx=cntxt->STK[NST].j2;
	    cntxt->STK[NST].j2=cntxt->STK[NST].j1;
	    cntxt->STK[NST].incr=-1;
	    cntxt->STK[NST].j1=cntxt->STK[NST].jnx;
	    cntxt->STK[NST].jj=cntxt->STK[NST].j2;
	  }
	else
	  {
	    cntxt->STK[NST].jj=cntxt->STK[NST].j1;
	    cntxt->STK[NST].incr=1;
	  }
	/* the following loop pushes on the stack the first node inside of the 
	   loop as often as the loop has to be excecuted. */

	for (cntxt->STK[NST].jnx=cntxt->STK[NST].j1; (cntxt->STK[NST].jnx<=cntxt->STK[NST].j2) && (cntxt->STK[NST].newwalki.succeeded==0); cntxt->STK[NST].jnx++)
	  {
	    cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki;
	    for (cntxt->STK[NST].ii=0;cntxt->STK[NST].ii<cntxt->STK[NST].jj;cntxt->STK[NST].ii++)                        // start of repeated path to stack
	      {
	        pushNode(&cntxt->nstack,cntxt->STK[NST].what);
	      }
	    jumpmacro(cntxt->STK[NST].newwalki,5,jump5,cntxt,cntxt->STK[NST].alt,cntxt->STK[NST].newwalki);     // execute the continue node
	    if (cntxt->STK[NST].newwalki.succeeded == 0)
	      {
		for (cntxt->STK[NST].ii=0;cntxt->STK[NST].ii<cntxt->STK[NST].jj;cntxt->STK[NST].ii++) 
		  {
		    cntxt->STK[NST].next=popNode(&cntxt->nstack);        // drain stack: take off as often as pushed on the stack
		  }
	      }
	    cntxt->STK[NST].jj += cntxt->STK[NST].incr;
	  }
	if (!cntxt->STK[NST].newwalki.succeeded) cntxt->STK[NST].next=popNode(&cntxt->nstack);
	break;                            

      case JUMPNODE:                                // This is a continue node
	cntxt->STK[NST].next = popNode(&cntxt->nstack);             // get from stack from loop
	jumpmacro(cntxt->STK[NST].newwalki,6,jump6,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);
	if (cntxt->STK[NST].newwalki.succeeded==0)
	  {
	    pushNode(&cntxt->nstack,cntxt->STK[NST].next);  // push back
	  }
	break;                            // work on this later.
	
      case NONTERMINAL:
	pushNode(&cntxt->nstack,cntxt->Nodes[cntxt->STK[NST].curr].right); 
	jumpmacro(cntxt->STK[NST].newwalki,7,jump7,cntxt,cntxt->Nodes[cntxt->STK[NST].curr].what,cntxt->STK[NST].newwalki);   // 'cntxt->STK[NST].what' is always a startnode
	if (cntxt->STK[NST].newwalki.succeeded==0)
	  {
	    cntxt->STK[NST].next = popNode(&cntxt->nstack);
	  }
	break;

      case NOPNODE:
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].curr].right;
	jumpmacro(cntxt->STK[NST].newwalki,8,jump8,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);
	break;

      case BOUNDACTION:
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].curr].right;
	cntxt->STK[NST].currpos = cntxt->STK[NST].oldwalki.wordpos;           // current position in the word.
	jumpmacro(cntxt->STK[NST].newwalki,9,jump9,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);
	if (cntxt->STK[NST].newwalki.succeeded==1) register_word_part(cntxt,
						      cntxt->Nodes[cntxt->STK[NST].curr].name,
						      cntxt->STK[NST].currpos,cntxt->STK[NST].currpos,
						      1,           // register the little string: case 1
						      NULL,0);     // no phonemes
	break;

      case SINGLEMORPH:
	cntxt->STK[NST].currpos = cntxt->STK[NST].oldwalki.wordpos;           // current position in the word.
	split_inline_morph_phonemes(cntxt->Nodes[cntxt->STK[NST].curr].name, // The string containing, e.g, "ge g@ 1"
				    &cntxt->STK[NST].jj,                     // compare length.
				    &cntxt->STK[NST].j1,                     // phoneme start
				    &cntxt->STK[NST].j2,                     // phoneme length,
				    &cntxt->STK[NST].rulenumber);            // usually 0. 
	if (cntxt->STK[NST].currpos+cntxt->STK[NST].jj-1 <= cntxt->wordlength)
	  {
	    cntxt->STK[NST].ii=1;
	    for (cntxt->STK[NST].inx=0;cntxt->STK[NST].inx<cntxt->STK[NST].jj;cntxt->STK[NST].inx++)  // compare char by char 
	      {
		cntxt->STK[NST].ii = cntxt->STK[NST].ii && (cntxt->theword[cntxt->STK[NST].currpos+cntxt->STK[NST].inx] == cntxt->Nodes[cntxt->STK[NST].curr].name[cntxt->STK[NST].inx]);
	      }
	    if (cntxt->STK[NST].ii==1)     // if cntxt->STK[NST].matches 
	      {
		cntxt->STK[NST].newwalki.wordpos =  cntxt->STK[NST].currpos+cntxt->STK[NST].jj;           // proceed by the number of letters found.
		jumpmacro(cntxt->STK[NST].newwalki,10,jump10,cntxt,cntxt->Nodes[cntxt->STK[NST].curr].right,cntxt->STK[NST].newwalki);
		if (cntxt->STK[NST].newwalki.succeeded==1)
		  {
		    for (cntxt->STK[NST].inx=0; cntxt->STK[NST].inx<cntxt->STK[NST].j2; cntxt->STK[NST].inx++) 
		    {
			cntxt->workbuffer[cntxt->STK[NST].inx] = cntxt->Nodes[cntxt->STK[NST].curr].name[cntxt->STK[NST].inx+cntxt->STK[NST].j1];
		    }
		    cntxt->workbuffer[cntxt->STK[NST].j2]='\0';       // terminate string

		    cntxt->STK[NST].phonemestring = cntxt->workbuffer;

		    register_word_part(cntxt,
				       "morph",
				       cntxt->STK[NST].currpos,
				       cntxt->STK[NST].currpos+cntxt->STK[NST].jj-1,
				       0,
				       cntxt->STK[NST].phonemestring,  // pointing to work buffer in cntxt 
				       cntxt->STK[NST].rulenumber);    // received 
		  }
		else
		  {
		    cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki;                   // backtracking
		    cntxt->STK[NST].newwalki.succeeded=0;
		  }
	      }  
	  } 

	break;

      case TERMINAL:                      // go ask a letter trie.
	/* the most complicated part it seems:
	   We ask a letter trie if the subsequent letters of the word
	   can be interpreted as one or multiple morphs that are stored
	   in a letter trie. The number of the letter trie (index) is
	   stored in the node's field cntxt->STK[NST].what. The subroutine Lt_parse_string
	   returns either none, one or multiple increments by which 
	   the string cntxt->STK[NST].matching could be proceeded. If there are multiples
	   e.g., "un" and "unter" both cntxt->STK[NST].match, we try both. In each case
	   we proceed the position in the word by an appropriate number
	   of letters, then call the subsequent nodes and if non comes 
	   back with success we return with succeeded=0
	   Also, if a full path could be found, we register the part
	   of word that was found in a special structure.
	*/

	cntxt->STK[NST].ntrie = cntxt->Nodes[cntxt->STK[NST].curr].what;
	if (cntxt->STK[NST].ntrie==0)
	  {
	    printf("error: Terminal node %d has no reference to a startnode.\n",curr);
	    printf("We are hosed. Bye! make a better program!!!!\n");
	    exit(1);
	  }
	cntxt->STK[NST].currpos = cntxt->STK[NST].oldwalki.wordpos;
	cntxt->STK[NST].nalt = Lt_parse_string(cntxt->theword,
			       cntxt->STK[NST].currpos , 
			       &(cntxt->Ltlist[cntxt->STK[NST].ntrie-1]),
			       &cntxt->STK[NST].proceed[0],
			       &cntxt->STK[NST].phonemeindex[0],
			       &cntxt->STK[NST].ruleindex[0],
			       ((cntxt->Nodes[cntxt->STK[NST].curr].info.parameter) & MORPH_ORDER_MASK));  // parameter: LONG MORPH first or last
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].curr].right;

	if (cntxt->STK[NST].nalt > 0)
	  {
	    for (cntxt->STK[NST].inx=0; (cntxt->STK[NST].inx<cntxt->STK[NST].nalt); cntxt->STK[NST].inx++)
	      {
		cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki;
		cntxt->STK[NST].currpos = cntxt->STK[NST].oldwalki.wordpos;

		cntxt->STK[NST].newwalki.wordpos =  cntxt->STK[NST].currpos+cntxt->STK[NST].proceed[cntxt->STK[NST].inx]+1;
		if (cntxt->STK[NST].newwalki.wordpos > cntxt->wordlength) printf("wordlength execeeded!\n");

		jumpmacro(cntxt->STK[NST].newwalki,11,jump11,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);

		if (cntxt->STK[NST].newwalki.succeeded)   // get the phoneme string info, and rule number i.
		  {
		    cntxt->STK[NST].rulenumber = cntxt->STK[NST].ruleindex[cntxt->STK[NST].inx];
		    cntxt->STK[NST].phonemestring =  point_to_phoneme_string(cntxt->MorphDict, cntxt->STK[NST].phonemeindex[cntxt->STK[NST].inx]);  //(ltrie.c)

		    register_word_part(cntxt,cntxt->Nodes[cntxt->STK[NST].curr].name,
				       cntxt->STK[NST].currpos,cntxt->STK[NST].currpos+cntxt->STK[NST].proceed[cntxt->STK[NST].inx],0,
				       cntxt->STK[NST].phonemestring, cntxt->STK[NST].rulenumber);
		    goto walkexit; // return cntxt->STK[NST].newwalki;
		  }
	      }
	    cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki;	
	    cntxt->STK[NST].newwalki.succeeded=0;
	  }
	else
	  {
	    cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki;	
	  }
	break;

	/* The operators that are permissible can be found in an extra file bachusoperator.h
	   They must be programmed here. Currently this code is inline here but could
	   be moved to yet another subroutine. 
	 */

      case OPERATORNAME:
	cntxt->STK[NST].opcode = cntxt->Nodes[cntxt->STK[NST].curr].index;   
	cntxt->STK[NST].opparam = cntxt->Nodes[cntxt->STK[NST].curr].what;

	cntxt->STK[NST].match = 0;
	cntxt->STK[NST].currpos = cntxt->STK[NST].oldwalki.wordpos;
	switch (cntxt->STK[NST].opcode)
	  {
	  case OPsyllabify:
	    if (cntxt->grammar == cntxt->STK[NST].opparam) 
	      {
		cntxt->STK[NST].match = 1;
	      }
	    break;
	    
	  case OPgrammar:
	    if (cntxt->grammar== cntxt->STK[NST].opparam) 
	      {
		cntxt->STK[NST].match = 1;
	      }
	    break;

	  case OPspezial:  // for the argument special(0) test if any bit is set in cntxt->special
                           // otherwise, the argument of special(M), M, is treated as bit mask.
	    if (cntxt->STK[NST].opparam==0) 
	      {
		if(cntxt->special != 0 )
		  {
		    cntxt->STK[NST].match=1;
		  }
	      }
	    else
	      {
		if ((cntxt->special & cntxt->STK[NST].opparam) != 0)
		  {
		    cntxt->STK[NST].match = 1;
		  }
	      }
	    break;

	    
	  case OPlonger:
	    if ((cntxt->wordlength - cntxt->STK[NST].currpos) > cntxt->STK[NST].opparam)
	      {
		cntxt->STK[NST].match = 1;	 //   printf("longer: rule cntxt->STK[NST].matches\n");
	      }
	    break;

	  case OPshorter:
	    if ((cntxt->wordlength - cntxt->STK[NST].currpos) < cntxt->STK[NST].opparam)
	      {
		cntxt->STK[NST].match = 1;       //  printf("shorter: rule cntxt->STK[NST].matches\n");
	      }
	    break;
	    
	  case OPstartvowel:
	    if (is_a_vowelgrapheme(cntxt->theword[0]))
	      {
		cntxt->STK[NST].match = 1; 
	      }
	    break;

	  case OPstartcons:
	    if (!is_a_vowelgrapheme(cntxt->theword[0]))
	      {
		cntxt->STK[NST].match = 1; 
	      }
	    break;

	  case OPbreak:
	    cntxt->STK[NST].newwalki.succeeded = 1;  
	    cntxt->STK[NST].match = 1;
	    cntxt->wordlength=cntxt->STK[NST].newwalki.wordpos;

	  default:
	    break;
	  }
	if (cntxt->STK[NST].match==1) 
	  {
	    cntxt->STK[NST].newwalki.wordpos =  cntxt->STK[NST].currpos;
	    jumpmacro(cntxt->STK[NST].newwalki,12,jump12,cntxt,cntxt->Nodes[cntxt->STK[NST].curr].right,cntxt->STK[NST].newwalki);	
	    if (cntxt->STK[NST].newwalki.succeeded == 0)
	      {
		cntxt->STK[NST].newwalki=cntxt->STK[NST].oldwalki;                   // backtracking
		cntxt->STK[NST].newwalki.succeeded=0;
	      }
	  }  
	break; 


      case SYLLABIFY:
	  /* no longer called */
	cntxt->STK[NST].next = cntxt->Nodes[cntxt->STK[NST].curr].right;
	cntxt->STK[NST].currpos = cntxt->STK[NST].oldwalki.wordpos;
	cntxt->STK[NST].ntrie = cntxt->Nodes[cntxt->STK[NST].curr].what;
	cntxt->STK[NST].newwalki.wordpos =  cntxt->wordlength;
	jumpmacro(cntxt->STK[NST].newwalki,13,jump13,cntxt,cntxt->STK[NST].next,cntxt->STK[NST].newwalki);
	break;

      }

walkexit:
    if (cntxt->alert==1) cntxt->STK[NST].newwalki.succeeded=0;  // relentlessly

    position = popjump(cntxt);
    if (position==-1)
    {
	return cntxt->STK[NST].newwalki;
    }
    goto switchboard;

}


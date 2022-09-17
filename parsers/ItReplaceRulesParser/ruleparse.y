%{
#define  RULEPARSER_MAIN
#define  RULE_GENERATION
#include "ruleparse.h"
#include <string.h>
#include <stdio.h>
%}
%union{
  int ival;
  char oper;
  char *string;
  struct symtab *sympt;
}
%token <sympt>  SETSOUNDSET REPLACE NAME COMMENTLINE MORPH NIL
%token <string> SCHNIPP
%token <ival>  INTEGER
%token <oper>  LBRAK RBRAK 
%left '+'
%left '-'
%%
STATEMENT:   RULE
          |  STATEMENT  RULE
;
RULE:        SETDECLARE {} ';'
          |  REPLACEMENT {} ';'
          |  COMMENTLINE 
;
SETDECLARE: SETSOUNDSET NAME  '=' {asmb(SETDECLARE,$2->name,NULL);}  '[' SYMLIST ']' {asmb(ENDSET,NULL,NULL);}
;
SYMLIST:     MORPH  {asmb(MORPHINSYMLIST, $1->name, NULL);}
           | NAME   {asmb(NAMEINSYMLIST, $1->name, NULL); }
           | MORPH  {asmb(MORPHINSYMLIST, $1->name, NULL);} ',' SYMLIST
           | NAME   {asmb(NAMEINSYMLIST, $1->name, NULL); } ',' SYMLIST
;
REPLACEMENT:  MORPH '>' MORPH {asmb(REPLACERULE,$1->name,$3->name);} '/' ENVIRON 
           |  MORPH '>' MORPH {asmb(REPLACERULE,$1->name,$3->name); asmb(ALWAYSCOND, NULL, NULL);} 
           |  MORPH '>' NIL {asmb(REPLACERULE,$1->name,NULL);} '/' ENVIRON 
           |  MORPH '>' NIL {asmb(REPLACERULE,$1->name,NULL); asmb(ALWAYSCOND, NULL, NULL);}  
           |  NIL '>' MORPH {asmb(REPLACERULE,NULL,$3->name);} '/' ENVIRON 
;
ENVIRON:     ALWAYS { asmb(ALWAYSCOND, NULL, NULL);}
           | {asmb(LEFTENVSTART,NULL,NULL);} ENV {asmb(LEFTENVSTOP,NULL,NULL);} '_' {asmb(RIGHTENVSTART,NULL,NULL);} ENV {asmb(RIGHTENVSTOP,NULL,NULL);}
;
ENV:         '.' {asmb(ENVEMPTY, NULL,NULL);}
           |     {asmb(ENVSTART,NULL,NULL);}  ENVLIST {asmb(ENVSTOP,NULL,NULL);}
           | '{' {asmb(ENVSTART,NULL,NULL);}  ENVLIST {asmb(ENVSTOP,NULL,NULL);}  '}'
;
ENVLIST:     {asmb(SEQSTART,NULL,NULL);} SEQ  {asmb(SEQSTOP,NULL,NULL);}
           | ENVLIST '|' {asmb(SEQSTART,NULL,NULL);} SEQ  {asmb(SEQSTOP,NULL,NULL);} 
;
SEQ:         SYMB
           | SYMB '+' SEQ 
;
SYMB:       NAME {asmb(ENVNAME,$1->name,0);}
          | MORPH {asmb(ENVMORPH,$1->name,0);}
;
ALWAYS:  '0'
;
%%

static struct symtab *sp;

static list_header_t *the_list_header;

struct symtab *
symlook(s)
char *s;
{
	int count;
	count=0;
	for(sp = symtab; sp < &symtab[NSYMS]; sp++)        /* need to be defined in ruleparse.h */
	  {
	    /* is it already here? */
	    count++;
	    if(sp->name && !strcmp(sp->name, s))  return sp;
	    /* is it free */
	    if(!sp->name) {
	      sp->name = strdup(s);
	      sp->value=count;
	      return sp;
	    }
	    /* otherwise continue to next */
	}
	yyerror("ERROR: Too many symbols");
	exit(1);	/* cannot continue */
} /* symlook */


yyerror(char *s)
{
  fprintf(stderr, "ERROR parsing line %d columns %d-%d : %s\n",lex_line(),lex_lastcol(),lex_column(), s);
}


main(int ac, char **av)
{

  extern FILE *yyin;

  if (ac>1)
    {
      if((yyin = fopen(av[1], "r")) == NULL) 
	{
	perror(av[1]);
	exit(1);
	}
    }
  //  yyin = fopen("wordgrammar.ger", "r");

  // create list handle:



  the_list_header = NewListHeader("Main");
  
  asmb(INITIALIZERULES,NULL,NULL);

  
  yyparse();

  for (sp=symtab; sp < &symtab[NSYMS]; sp++) {
    if (sp->name) printf(" %d %s\n",sp->value,sp->name);}

  dump_list_header(the_list_header);
  dump_replace_rules();
  init_list_table();
  fill_list_table(the_list_header);
  fill_rule_table();
  dumpsympool();
  dump_list_table();
  dump_rule_table();

  if (ac>3)
  {
      write_list_table_to_file(av[2],av[3]);
  }

/* drump drool rable */
}

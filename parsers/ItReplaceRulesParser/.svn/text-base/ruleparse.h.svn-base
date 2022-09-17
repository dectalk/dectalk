#ifndef _RULEPARSER_H_
#define _RULEPARSER_H_
/* avoid multiple inclusions */
#include<stdio.h>
#include<stdlib.h>

typedef unsigned char CHAR;

//#define RULEPARSER_MAIN
#define NSYMS 5000	/* maximum number of symbols */
#define NRULESYMS 5000
#define NMAXMORPHS 10000  /* maximum number of morph strings in grammar */

#ifdef RULEPARSER_MAIN
struct symtab {
	char *name;
	int  value;
} symtab[NSYMS];

typedef enum assemblercodes
{
    INITIALIZERULES,
    SETDECLARE,
    ENDSET,
    REPLACERULE,
    ALWAYSCOND,
    ENVEMPTY,
    ENVSTART,
    ENVSTOP,
    LEFTENVSTART,
    LEFTENVSTOP,
    RIGHTENVSTART,
    RIGHTENVSTOP,
    SEQSTART,
    SEQSTOP,
    ENVNAME,
    ENVMORPH,
    MORPHINSYMLIST,
    NAMEINSYMLIST
} asmbcode;

void asmb(asmbcode, char *, char *);



#define LIST 1
#define STRING 2
#define LIST_HEADER 3
#define REPLACE_RULE 4


#ifdef RULE_GENERATION
struct list_s {
    struct list_s *next;
    int nextindex;
    int type;
    union {
	int stringpos;
	void *list_header;
    } data;
};

typedef struct list_s list_t;

typedef struct list_header_s
{
    list_t *list;
    char *name;
} list_header_t;


typedef struct replace_rules_s 
{
    int from;
    int to;
    list_header_t *leftenv;
    list_header_t *rightenv;
} replace_rule;



typedef struct _list_tab
{
    int next;
    int type;
    int data;
} listtable ;

typedef struct _rule_tab
{
    int from;
    int to;
    int leftenv;
    int rightenv;
} ruletable;

typedef struct _rule_block 
{
    char        **sympool;
    listtable   *list;
    ruletable   *rule;
    int         nrules;
} ruleblock;
#endif


#ifdef RULEPARSER_MAIN
#ifdef RULE_GENERATION
list_t *InitListNode(void);
list_header_t *NewListHeader(char *name);
int NewItemListHeader(list_header_t *list_header,list_header_t *data);
int NewItemString(list_header_t *list_header,char *data);
int NewItemListLeftHeader(list_header_t *list_header,list_header_t *data);
int NewItemLeftString(list_header_t *list_header,char *data);
list_header_t *GetListheader(list_header_t *list,char *name);
void dump_replace_rules(void);
int sympoollook(char *s);
void dumpsympool(void);
int init_list_table(void);
void dump_rule_table(void);
void dump_list_table(void);
void write_list_table_to_file(const char *, const char *);
int fill_list_table(list_t *list);
int dump_list(list_t *list);
#endif
#endif


struct symtab *symlook();
#endif


#endif /* _RULEPARSER_H_ */

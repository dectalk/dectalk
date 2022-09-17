#define  RULEPARSER_MAIN
#define  RULE_GENERATION
#define  CASIO_COMPILER

#include "ruleparse.h"


#include <string.h>
#include <stdio.h>
#include <time.h>


replace_rule *replace_rules=NULL;
int replacement=-1;
int max_replacement=256;
struct list_table_s
{
    int next;
    int type;
    int data;
};
struct list_table_s *list_table=NULL;
char *sympool[NRULESYMS];
int totalinpool=0;
int level=0;
int cur_next_index=1;
struct rule_table_s
{
    int from;
    int to;
    int leftenv;
    int rightenv;
};
struct rule_table_s *rule_table=NULL;


list_t *InitListNode(void)
{
    list_t *p;

    p=(list_t *)malloc(sizeof(list_t));

	if (!p) 
	{
		fprintf(stderr,"InitListNode: malloc screw up!");
		return p;
	}

    memset(p,0,sizeof(list_t));

    return(p);
}

list_header_t *NewListHeader(char *name)
{
    list_header_t *p;

    p=(list_header_t *)malloc(sizeof(list_header_t));
    memset(p,0,sizeof(list_header_t));
    p->name=strdup(name);

    return(p);
}

int NewItemListHeader(list_header_t *list_header,list_header_t *data)
{
    list_t *p,*q;

    p=InitListNode();
    p->type=LIST_HEADER;
    ((list_header_t *)p->data.list_header)=data;
    p->next=NULL;

    if (list_header->list==NULL)
    {
	list_header->list=p;
	return(0);
    }
    q=list_header->list;
    while (q->next!=NULL)
    {
	q=q->next;
    }
    q->next=p;
    return(0);
}
int NewItemListLeftHeader(list_header_t *list_header,list_header_t *data)
{
    list_t *p,*q;

    p=InitListNode();
    p->type=LIST_HEADER;
    ((list_header_t *)p->data.list_header)=data;
    p->next=NULL;

    if (list_header->list==NULL)
    {
	list_header->list=p;
	return(0);
    }
    p->next = list_header->list;
    list_header->list = p;
    return(0);
}

int NewItemString(list_header_t *list_header,char *data)
{
    list_t *p,*q;

    p=InitListNode();
    p->type=STRING;
    p->data.stringpos=sympoollook(data);
    p->next=NULL;

    if (list_header->list==NULL)
    {
	list_header->list=p;
	return(0);
    }
    q=list_header->list;
    while (q->next!=NULL)
    {
	q=q->next;
    }
    q->next=p;
    return(0);
}

int NewItemLeftString(list_header_t *list_header,char *data)
{
    list_t *p,*q;

    p=InitListNode();
    p->type=STRING;
    p->data.stringpos=sympoollook(data);
    p->next=NULL;

    if (list_header->list==NULL)
    {
	list_header->list=p;
	return(0);
    }
    p->next=list_header->list;
    list_header->list=p;
    return(0);
}

list_header_t *GetListHeader(list_header_t *listh,char *name)
{
    list_t *p;
    list_header_t *q;

    printf("%X %s\n",listh,name);



    p=listh->list;


    while(p!=NULL)
    {
	if (p->type==LIST_HEADER)
	{
	    q=p->data.list_header;
	    if (strcmp(q->name,name)==0)
	    {
		return(q);
	    }
	}
	p=p->next;
    }
    return(NULL);
}


int dump_list_header(list_header_t *listh)
{
    int i;
       
	    for (i=1;i<level;i++)
	    {
		printf("\t");
	    }
    if (listh==NULL)
    {
	printf("list_header NULL\n");
	return 0;
    }
	    printf("list_header name %s list_p %X\n",listh->name,listh->list);
    dump_list(listh->list);
}

int fill_list_header(list_header_t *listh)
{
    int i;
       
	    for (i=1;i<level;i++)
	    {
		printf("\t");
	    }
    if (listh==NULL)
    {
	printf("list_header NULL\n");
	return;
    }
	    printf("list_header name %s list_p %X\n",listh->name,listh->list);
    fill_list_table(listh->list);
}



int init_list_table(void)
{
    list_table=(struct list_table_s *)malloc(sizeof(struct list_table_s)*(cur_next_index+2));
}

int add_list_table_entry(int next, int type, int data, int position)
{
//    printf("next %d tpe %d data %d position %d index%d\n",next,type,data,position,cur_next_index);
    if (position && position<cur_next_index)
    {
	list_table[position].next=next;
	list_table[position].type=type;
	list_table[position].data=data;
    }
}

    


int fill_list_table(list_t *list)
{
    list_t *p;
    int temp=0,next=0;
    p=list;
    while (p!=NULL)
    {
	if (p->next)
	{
	    next=p->next->nextindex;
	}
	else
	    next=0;
	if (p->type==LIST_HEADER)
	{
	    if (p->data.list_header==NULL)
		temp=0;
	    else if (((list_header_t *)p->data.list_header)->list==NULL)
		temp=0;
	    else
		temp=((list_header_t *)p->data.list_header)->list->nextindex;
	    add_list_table_entry(next,p->type,temp,p->nextindex);
	    // put data into table
	    fill_list_header(p->data.list_header);
	}
	if (p->type==STRING)
	{
	    add_list_table_entry(next,p->type,p->data.stringpos,p->nextindex);
	    // put data into table
	    printf("STRING %d %s\n",p->data.stringpos,sympool[p->data.stringpos]);
	}
	p=p->next;
    }
}

int fill_rule_table()
{
    int i;
    rule_table=(struct rule_table_s *)calloc(1,sizeof(struct rule_table_s)*(replacement+2));

    for (i=0;i<= replacement; i++)
    {
	rule_table[i].from = replace_rules[i].from;
	rule_table[i].to = replace_rules[i].to;
	if (replace_rules[i].leftenv==NULL)
	{	
	    rule_table[i].leftenv=0;
	}
	else
	{
	    rule_table[i].leftenv = replace_rules[i].leftenv->list->nextindex;
	}
	if ( replace_rules[i].rightenv==NULL)
	{
	    rule_table[i].rightenv=0;
	}
	else
	{
	    rule_table[i].rightenv = replace_rules[i].rightenv->list->nextindex;
	}
    }
    
}

int dump_list(list_t *list)
{
    list_t *p;
    int i;
    level++;
    p=list;
    while (p!=NULL)
    {
	if (p->nextindex==0 && level>1)
	{

	    p->nextindex=cur_next_index++;
	}
	printf("index number= %d\n",p->nextindex);
	if (p->type==LIST_HEADER)
	{
	    for (i=1;i<level;i++)
	    {
		printf("\t");
	    }
	    printf("LIST_HEADER\n");
	    dump_list_header(p->data.list_header);
	}
	if (p->type==STRING)
	{
	    for (i=1;i<level;i++)
	    {
		printf("\t");
	    }
	    printf("STRING %d %s\n",p->data.stringpos,sympool[p->data.stringpos]);
	}
	p=p->next;
    }
    level--;
}



replace_rule *add_replace_rule(char *from, char *to)
{
    if (replace_rules==NULL)
    {
	replace_rules=(replace_rule *)malloc(sizeof(replace_rule)*(max_replacement+2));
    }
    replacement++;

    if (replacement>=max_replacement)
    {
	max_replacement*=2;
	replace_rules= (replace_rule *) realloc(replace_rules,sizeof(replace_rule)*(max_replacement+2));
    }
    memset(&replace_rules[replacement],0,sizeof(replace_rule));
    if (from != NULL) replace_rules[replacement].from=sympoollook(from);
    else              replace_rules[replacement].from=NULL;              // allow NIL on left side
    if (to != NULL)   replace_rules[replacement].to=sympoollook(to);
    else              replace_rules[replacement].to=NULL;                // allow NIL on right side

    return(&replace_rules[replacement]);
}

void dump_replace_rules(void)
{
    int i=0;

    for (i=0;i<=replacement;i++)
    {
	printf("rule #%d from %d %s to %d %s \n",i,replace_rules[i].from,sympool[replace_rules[i].from],
	       replace_rules[i].to,sympool[replace_rules[i].to]);
	level=1;
	if (replace_rules[i].leftenv==NULL)
	{
	    printf("leftenv = NULL\n");
	}
	else
	{
	    printf("leftenv\n");
	    dump_list_header(replace_rules[i].leftenv);
	}
	if (replace_rules[i].rightenv==NULL)
	{
	    printf("rightenv = NULL\n");
	}
	else
	{
	    printf("rightenv\n");
	    dump_list_header(replace_rules[i].rightenv);
	}
    }
}




int sympoollook(char *s)
{
	int pos;
	for(pos=0; pos<totalinpool; pos++) 
	  {
	    if ( strcmp(sympool[pos], s)==0) 
		return pos;
	  }
	sympool[totalinpool]=strdup(s);
	totalinpool++;
	return(totalinpool-1);
} 

void dumpsympool(void)
{
    int i;
    for (i=0;i<totalinpool;i++)
    {
	printf("pool %d %s\n",i,sympool[i]);
    }
}

void dump_list_table(void)
{
    int i;
    
    printf("  List Table     pos  next tp  data    char \n");

    for (i=0; i < cur_next_index; i++)
    {
	if (list_table[i].type == STRING)
	{
	    printf("list table entry %3d %5d %2d %5d    %s \n",
		   i, list_table[i].next,list_table[i].type,list_table[i].data, sympool[list_table[i].data]);
	}
	else
	{
    	    printf("list table entry %3d %5d %2d %5d\n",
		   i, list_table[i].next,list_table[i].type,list_table[i].data);
	}
    }
}


void write_list_table_to_file(const char *filename, const char *label)
{
    int i,j;

    unsigned char nix;

    FILE *stream;

    char *timep;
    time_t nowis;

    stream = fopen(filename,"w");
    if (stream==NULL)
    {
	printf("ERROR opening file %s\n",filename);
	perror("junk");
    }

    nowis = time(NULL);
    timep = ctime(&nowis);

    fprintf(stream,"/* This is an automatically generated include file for DecTalk Italian. \n");
    fprintf(stream,"** It contains tables used in letter-to-sound rules for Italian. \n");
    fprintf(stream,"** Time generated: %s*/\n",timep);

#ifdef CASIO_COMPILER
    fprintf(stream, "const char *const %ssympool[]= {\n",label);
#else
    fprintf(stream, "CONST char *%ssympool[]= {\n",label);
#endif 
    for (i=0;i<totalinpool;i++)
    {
	//fprintf(stream, "  %s",sympool[i]);
	fprintf(stream,"  ");

	for (j=0; j<strlen(sympool[i]); j++)
	{
	    if (sympool[i][j] < 0)
	    {
		nix = (unsigned char) sympool[i][j];
		fprintf(stream,"\\x%X",nix);
	    }
	    else
	    {
		fprintf(stream,"%c",sympool[i][j]);
	    }
	}


	if (i<totalinpool-1) fprintf(stream,",\n");
	else                 fprintf(stream,"};\n");
    }

    fprintf(stream, "CONST listtable   %sListtab[]={\n",label);
    for (i=0; i < cur_next_index; i++)
    {
	fprintf(stream, "  {%8d, %3d, %8d }",
		list_table[i].next,list_table[i].type,list_table[i].data);
	if (i < cur_next_index-1) fprintf(stream,",\n");
	else                      fprintf(stream,"};\n");
    }

    fprintf(stream, "\nCONST ruletable   %sRuletab[]={\n",label);
    for (i=0; i <= replacement ; i++)
    {
	fprintf(stream, "  {%8d, %8d, %8d, %8d}",
	       rule_table[i].from, rule_table[i].to, rule_table[i].leftenv,rule_table[i].rightenv);
	if (i < replacement) fprintf(stream,",\n");
	else                 fprintf(stream,"};\n");
    }
    
    fprintf(stream,"CONST ruleblock %srules ={%ssympool, %sListtab, %sRuletab, %d};\n",label,label,label,label,replacement+1);

    fclose(stream);
}


void dump_rule_table(void)
{
     int i;
    
     printf(" Rule Table        #   from   to     lefte righte \n");

    for (i=0; i <= replacement ; i++)
    {
	printf("rule table entry %3d %5d %5d   %5d %5d\n",
	       i, rule_table[i].from, rule_table[i].to, rule_table[i].leftenv,rule_table[i].rightenv);
	
    }
}



static list_header_t *the_list_header;



void asmb(asmbcode what, char *name, char *nameB)
{
    static list_header_t *cur_list, *cur_seq;
    static replace_rule *cur_replace;
    static int whichenv=0;

    list_header_t *p;
    switch (what)
    {
	case INITIALIZERULES:                           
	    asmb(SETDECLARE,"EMPTY",NULL);          /* declare an empty set */
	    asmb(MORPHINSYMLIST, "\"\"", NULL);
	    asmb(ENDSET,NULL,NULL);
	    break;
	case SETDECLARE:
	    printf("Group symbol %s\n",name);
	    cur_list=NewListHeader(name);
	    NewItemListHeader(the_list_header,cur_list);
	    break;
	case MORPHINSYMLIST:
	    printf("MORPH in symlist %s\n",name);
	    NewItemString(cur_list,name);
	    break;
	case NAMEINSYMLIST:
	    printf("NAME in symlist %s\n",name);
	    p=GetListHeader(the_list_header,name);
	    if (p==NULL)
	    {
		printf("ERROR (asmb.c): there is no list named %s\n",name);
	    }
	    else
	    {
		NewItemListHeader(cur_list,p);
	    }
	    break;
	case ENDSET:
	    printf("Done list\n");
	    cur_list=NULL;
	    break;

	case REPLACERULE:
	    printf("%s becomes %s\n",name,nameB);
	    cur_replace = add_replace_rule(name, nameB);
	    whichenv=0;
	    break;
	case ALWAYSCOND:
	    printf("ALWAYS\n"); 
	    cur_replace->leftenv =  cur_replace->rightenv = NULL;
	    break;
	case ENVEMPTY:
	    printf("environment left or right empty\n");
	    if (whichenv==1)
	    {
		cur_replace->leftenv = NULL;
	    }
	    if (whichenv==2)
	    {
		cur_replace->rightenv = NULL;
	    }
	    break;
	case ENVSTART:
	    printf("environment list start\n");
	    break;
	case ENVSTOP:
	    printf("environment list done \n");
	    break;

	case LEFTENVSTART:
	    printf("left environment list start\n");
	    cur_list=NewListHeader("L");
	    cur_replace->leftenv = cur_list;
	    NewItemListHeader(the_list_header,cur_list);
	    whichenv=1;
	    break;
	case RIGHTENVSTART:
	    printf("right environment list start\n");
	    cur_list=NewListHeader("R");
	    cur_replace->rightenv = cur_list;
	    NewItemListHeader(the_list_header,cur_list);
	    whichenv=2;
	    break;
	case LEFTENVSTOP:
	    printf("left environment list finished\n");
	    whichenv=0;
	    break;
	case RIGHTENVSTOP:
	    printf("right environment list finished\n");
	    whichenv=0;
	    break;
	case SEQSTART:
	    printf("Sequence start\n");
	    cur_seq = NewListHeader("S");
	    NewItemListHeader(cur_list,cur_seq);
	    break;
	case SEQSTOP:
	    printf("Sequence finished\n");
	    cur_seq=NULL;
	    break;
	case ENVNAME:
	    printf("environment group name %s\n",name);
	    p=GetListHeader(the_list_header,name);
	    if (p==NULL)
	    {
		printf("ERROR (asmb.c): No group named %s had been defined \n",name);
	    }
	    else
	    {
		if (cur_seq)
		{
		    if (whichenv==1)   NewItemListLeftHeader(cur_seq,p);
		    else               NewItemListHeader(cur_seq,p);
		}
		else
		    NewItemListHeader(cur_list,p);
	    }
	    break;
	case ENVMORPH:
	    printf("environment morph %s\n",name);
	    if (cur_seq)
	    {
		if(whichenv==1) NewItemLeftString(cur_seq,name);
		else            NewItemString(cur_seq,name);
	    }
	    else
		NewItemString(cur_list,name);
	    break;

	default: 
	    printf("asmb(): wrong command - does not do a thing\n");
	    break;
    }
}

/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	par_comp.c
 *    Author:       Matthew Schnee
 *    Creation Date:06/28/96
 *
 *    Functionality:
 * 		Text preprocessor rule compiler
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	---------------------------------------
 *	001	MGS		07/20/1996	made the output many binary tables
 *	002	MGS		07/29/1996	Added function headers to the file
 *  003 MGS		02/08/1997	Add STATUS_STATE and related code
 *	004	MGS		08/29/1997	Added #ifdef code for NWS
 *	005	MGS		11/05/1998	Added rule number checking support
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "port.h"
#include "par_def.h"

/* defines for the compiler */
#include "par_c2.h"

int cur_index;
int prev_char_type_index;
int old_char_type;
int dictionary_levels[100];
int cur_dict_level;

/* global variables */
short rule_indexes[MAX_RULES];		/* this is why it can't be built on ms-dos */
int line_number=0;
int rule_count=-1;
int current_rule_number;
int num_dictionaries=0;
int rule_sections[MAX_SECTIONS];

/* the total length of the rule table */
int total_rule_length=0;
/* the table of indexes for the rules */
short *rule_offsets=NULL;
/* the rule data table */
unsigned char *rule_binary_data=NULL;

int max_binary_rule_data=10240;

/* the total length of the dictionaries */
int total_dict_length=0;
/* the nubmer of entries in the dictioanry */
int dict_entry_count=0;

/* the dictionary indexes for the entries */ 
short *dictionary_offsets=NULL;
/* the dictionary data */
unsigned char *dictionary_binary_data=NULL;

/* from par_char.c */
extern unsigned short parser_char_types[];
extern unsigned char par_lower[];
extern unsigned char par_upper[];

/* from par_ambi.c */
extern char ambiguous_char[15][20];


FILE *outfile;
FILE *outfile_asc;





/*
 *	Function Name:
 *		par_get_int_length
 *
 *	Description:
 *		this function returns the length of a decimal number
 *
 *	Arguments:                                 
 *		INPUT		int			num		The number to find the length of
 *
 *	Return Value:                                
 *		the length of the number
 *
 *	Comments:
 *
 */
int par_get_int_length(int i)
{
	int j;
	if (i==0)
	{
		return(1);
	}
	for (j=0;i;j++)
		i/=10;
	return(j);
}


/*
 *	Function Name:
 *		par_convert_hex_number
 *
 *	Description:
 *		this function converts a hex number in a string to a value
 *
 *	Arguments:                                 
 *		INPUT	unsigned char	*string		a pointer to the string with the number
 *		INPUT	int				num			the number of characters to convert
 *
 *	Return Value:                                
 *		the converted value
 *		-1 on error
 *
 *	Comments:                                    
 *		the hex value must be in upper case and num is the number of charcters minus 2
 *		meaning for the number 0x4B, num should be 2
 *
 */

__int64 par_convert_hex_number(unsigned char *string, int num)
{
	__int64 i=2,total=0;
	__int64 temp=0;
	if ((*string)!='0')
		return(-1);
	if (*(string+1)!='x')
		return(-1);
	num+=2;
	while (i<num)
	{
		if (string[i]>'9')
		{
			temp=string[i]-'A'+10;
		}
		else
		{
			temp=string[i]-'0';
		}
		if ((temp<0) || (temp>15))
			return(-1);
		total=(total<<4)+temp; 
		i++;
	}                                            
	return(total);
}


/*
 *	Function Name:
 *		par_print_rule_error
 *
 *	Description:
 *		this function prints a line with a ^ below the character specified in pos
 *
 *	Arguments:                                 
 *		INPUT	unsigned char	*rule		The line to print
 *		INPUT	int				pos			The position of the error
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void par_print_rule_error(unsigned char *current_rule,int pos)
{
	int i;
	printf("line %s\n",current_rule);
	printf("     ");
	for (i=0;i<pos;i++)
	{
		printf(" ");
	}
	printf("^\n");
}


/*
 *	Function Name:
 *		free_rule_list
 *
 *	Description:
 *		this function frees the list of rules
 *
 *	Arguments:                               
 *		INPUT	rule_node	list	The list of rule nodes
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void free_rule_list(rule_node list)
{
  rule_node p;
  while(list!=NULL)
	{
	  p=list;
	  if (p->data!=NULL)
		{
		  free(p->data);
		}
	  list=list->next;
	  free(p);
	}
}



/*
 *	Function Name:
 *		free_dict_node_list
 *
 *	Description:
 *		this function frees a list of dictionary nodes 
 *		(the entries in the dictionaries)
 *
 *	Arguments:                           
 *		INPUT	dict_node	list	pointer to the list of nodes to free 
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void free_dict_node_list(dict_node list)
{
	dict_node p;
	while (list!=NULL)
	{
		p=list;
		list=list->next;
		if (p->data!=NULL)
		{
			free(p->data);
		}
		free(p);
	}
}


/*
 *	Function Name:
 *		free_dict_names
 *
 *	Description:
 *		this function frees all the space that the dictiories uses
 *
 *	Arguments:                                 
 *		INPUT	dict_names	list	The list of dictioanries
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void free_dict_names_list(dict_names list)
{
	dict_names p;
	while (list!=NULL)
	{
		p=list;
		list=list->next;
		if (p->dict_entries!=NULL)
		{
			free_dict_node_list(p->dict_entries);
		}
		free(p);
	}
}


/*
 *	Function Name:
 *		add_node
 *
 *	Description:
 *		this function adds a node to the rule list
 *
 *	Arguments:                                 
 *		INPUT	rule_node		list	The list of rule nodes
 *		INPUT	prule_comp_t	info	The data to add ot the list
 *
 *	Return Value:                                
 *		rule_node	the pointer to the beginning of the list
 *					NULL on error
 *
 *	Comments:
 *
 */
rule_node add_node(rule_node list,prule_comp_t info)
{
  rule_node p;
  p=(rule_node)malloc(sizeof(struct rule_node_s));
  if (p==NULL)
	{
	  fprintf(stderr,"add_node;out of memory\n");
	  free_rule_list(list);
	  return(NULL);
	}
  p->data=info;
  p->next=list;
  list=p;
  return(list);
}


/*
 *	Function Name:
 *		add_entry_to_dict
 *
 *	Description:
 *		ths function adds an entry to a dictioanry
 *
 *	Arguments:
 *		INPUT	dict_names		dict	The dictionary to add the entry to
 *		INPUT	dict_entry_comp	entry	Jte entry to add to the dictionary
 *
 *	Return Value:         
 *		1 if successuful
 *		0 on error
 *
 *	Comments:
 *
 */
int add_entry_to_dict(dict_names dict,dict_entry_comp entry)
{
	dict_node p;
	p=(dict_node)malloc(sizeof(struct dict_entry_s_comp));
    if (p==NULL)
	{
	  fprintf(stderr,"add_entry_to_dict;out of memory\n");
	  return(0);
	}
	p->data=entry;
	p->next=dict->dict_entries;
	dict->dict_entries=p;
	dict->num_entries++;
	return(1);
}


/*
 *	Function Name:
 *		add_dictionary to list
 *
 *	Description:
 *		this function adds a dictionary to the dictionary list with
 *		the name dict_name
 *
 *	Arguments:            
 *		INPUT	dict_names	dict_list	the list of dictioanries
 *		INPUT	char		*dict_name	The name o the dictionary
 *
 *	Return Value:                                
 *		dict_names		a pointer to the dictioanry list
 *
 *	Comments:
 *
 */
dict_names add_dictionary_to_list(dict_names dict_list,char *dict_name)
{
	dict_names p;
	p=(dict_names)malloc(sizeof(struct dict_names_s));
	if (p==NULL)
	{
	  fprintf(stderr,"add_dictionary_to_list;out of memory\n");
	  free_dict_names_list(dict_list);
	  return(NULL);
	}
	strcpy(p->dict_name,dict_name);         
	/* set the number of the dictionary */
	/* add 1 to the number of dictionaries */
	p->dic_number=(++num_dictionaries);		
	p->num_entries=0;
	p->dict_entries=NULL;
	p->next=dict_list;
	dict_list=p;
	return(dict_list);
}


/*
 *	Function Name:
 *		reverse_dict_list
 *
 *	Description:
 *		this function reverses the list of dictionaries
 *
 *	Arguments:                                 
 *		INPUT	dict_names	dict_list	The list to sort
 *
 *	Return Value:                                
 *		dict_names	a pointer to the reversed dictionary list
 *
 *	Comments:
 *
 */
dict_names reverse_dict_list(dict_names dict_list)
{
	dict_names p,new_list=NULL;
	while (dict_list!=NULL)
	{
		p=dict_list;
		dict_list=dict_list->next;
		p->next=new_list;
		new_list=p;
	}
	return(new_list);
}
							 


/*
 *	Function Name:
 *		dict_node_icmp
 *
 *	Description:
 *		compare two dictionary nodes (case insensitive)
 *
 *	Arguments:                      
 *		INPUT	dict_node	p	A dictioanry node
 *		INPUT	dict_node	q	A dictioanry node
 *
 *	Return Value:                                
 *		int		0 if the same
 *				<0 if p < q
 *				>0 if p > q
 *
 *	Comments:
 *
 */
int dict_node_icmp(dict_node p,dict_node q)
{
	return(stricmp(p->data->search_graph,q->data->search_graph));
}


/*
 *	Function Name:
 *		dict_node_cmp
 *
 *	Description:
 *		compare two dictionary nodes
 *
 *	Arguments:                      
 *		INPUT	dict_node	p	A dictioanry node
 *		INPUT	dict_node	q	A dictioanry node
 *
 *	Return Value:                                
 *		int		0 if the same
 *				<0 if p < q
 *				>0 if p > q
 *
 *	Comments:
 *
 */
int dict_node_cmp(dict_node p,dict_node q)
{
	return(strcmp(p->data->search_graph,q->data->search_graph));
}


/*
 *	Function Name:
 *		sort_dictionary
 *
 *	Description:
 *		this function sorts a dictionary
 *
 *	Arguments:
 *		INPUT	dict_node	dict_list_ent	The list of dictioanry entries to sort
 *
 *	Return Value:                                
 *		dict_node	a pointer to the the sorted list
 *
 *	Comments:
 *
 */
dict_node sort_dictionary(dict_node dict_list_ent)
{
/* this has to be done eventually */
	dict_node p,q,r,s;
	dict_entry_comp temp_e;
	int temp_v=0;
	/* sort case insensitively */
	p=dict_list_ent;
	temp_v=1;
	while (temp_v!=0)
	{
		p=dict_list_ent;
		temp_v=0;
		while (p!=NULL && p->next!=NULL)
		{
			q=p->next;
			if (dict_node_icmp(q,p)<0)
			{
				temp_v++;
				temp_e=p->data;
				p->data=q->data;
				q->data=temp_e;
			}
			p=p->next;
		}
	}
	/* go back and sort by case, capital first */
	p=dict_list_ent;
	while (p!=NULL && p->next!=NULL)
	{
		q=p->next;
		if (dict_node_icmp(p,q)==0)
		{
			q=q->next;
			while (q!=NULL && dict_node_icmp(p,q)==0)
				q=q->next;
			/* sort the region from p to q */
			temp_v=1;
			while (temp_v!=0)
			{
				temp_v=0;
				s=p;
				while (s->next!=q)
				{
					r=s->next;
					if (dict_node_cmp(r,s)<0)
					{
						temp_v++;
						temp_e=s->data;
						s->data=r->data;
						r->data=temp_e;
					}
					s=s->next;
				}
			}
		}
		p=p->next;
	}
	return(dict_list_ent);
}



/*
 *	Function Name:
 *		sort_dictionaries
 *
 *	Description:
 *		sorts the dictioanries
 *
 *	Arguments:                               
 *		INPUT	dict_names  	dict_list	the list of dictionaries
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void sort_dictionaries(dict_names dict_list)
{
	while (dict_list!=NULL)
	{
		dict_list->dict_entries=sort_dictionary(dict_list->dict_entries);
		dict_list=dict_list->next;
	}
}

							 

/*
 *	Function Name:
 *		reverse_rule_list
 *
 *	Description:
 *		the function reverses the rule node list it is passed
 *
 *	Arguments:
 *		INPUT	rule_node	list	The list to reverse
 *
 *	Return Value:
 *		rule_node		a pointer to the reverse list
 *
 *	Comments:
 *
 */
rule_node reverse_rule_list(rule_node list)
{
  rule_node p,new_list=NULL;
  while (list!=NULL)
	{
	  p=list;
	  list=list->next;
	  p->next=new_list;
	  new_list=p;
	}
  return(new_list);
}
	  

/*
 *	Function Name:
 *		par_get_char_type
 *
 *	Description:
 *		check the character and return the character type number if it is a 
 *		character type delimiter
 *
 *	Arguments:
 *		INPUT	unsigned char	c	The charcter to check
 *
 *	Return Value:
 *		The converted character type number or 0
 *
 *	Comments:
 *
 */
int par_get_char_type(unsigned char c)
{
	#ifdef DEBUG
		printf("in par_get_char_type type=%d\n",c);
	#endif
	switch(c)
	{
		case 	DIGIT_CHAR_DELIM:
			return(DIGIT_CHAR_TYPE);
		case 	UPPER_CHAR_DELIM:
			return(UPPER_CHAR_TYPE);
		case 	ANY_ALPHA_CHAR_DELIM:
			return(ANY_ALPHA_CHAR_TYPE);
		case 	ANY_CHAR_CHAR_DELIM:
			return(ANY_CHAR_CHAR_TYPE);
		case 	WHITE_CHAR_DELIM:
			return(WHITE_CHAR_TYPE);
		case 	PUNCT_CHAR_DELIM:
			return(PUNCT_CHAR_TYPE);
		case 	LOWER_CHAR_DELIM:
			return(LOWER_CHAR_TYPE);
		case 	NON_ALPHA_CHAR_DELIM:
			return(NON_ALPHA_CHAR_TYPE);
		case 	SET_CHAR_DELIM:
			return(SET_CHAR_TYPE);
		case 	VOWEL_CHAR_DELIM:
			return(VOWEL_CHAR_TYPE);
		case 	CONSONANT_CHAR_DELIM:
			return(CONSONANT_CHAR_TYPE);
		case 	NUMBER_CHAR_DELIM:
			return(NUMBER_CHAR_TYPE);
		case	CLAUSE_CHAR_DELIM:
			return(CLAUSE_CHAR_TYPE);
		case 	ALPHA_NUM_DELIM:
			return(ALPHA_NUM_CHAR_TYPE);
		case 	VOWEL_NON_Y_DELIM:
			return(VOWEL_NON_Y_TYPE);
		case 	SOME_PUNCT_DELIM:
			return(SOME_PUNCT_TYPE);
		case 	EXACT_CHAR_DELIM: 
			return(EXACT_CHAR_TYPE);
		case 	EXACT_CASE_DELIM: 
			return(EXACT_CASE_TYPE);
		case	HEXADECIMAL_DELIM:
			return(HEXADECIMAL_TYPE);
		case	SAVE_DELIMITER:
			return(SAVE_CHAR_TYPE);
		case	NO_LOOKAHEAD:
			return(NO_LOOKAHEAD);
		default:
			return(NULL_TYPE);
	}                         
}
   

/*
 *	Function Name:
 *		par_get_state
 *
 *	Description:
 *		check the character and return the state number if it is a 
 *		state delimiter
 *
 *	Arguments:
 *		INPUT	unsigned char	c	The charcter to check
 *
 *	Return Value:
 *		The converted state number or 0
 *
 *	Comments:
 *
 */
int par_get_state(unsigned char c)
{
	#ifdef DEBUG
		printf("in par_get_state state=%d\n",c);
	#endif
	switch(c)
	{

		case	COPY_DELIMITER:
			return(COPY_STATE);
		case	REPLACE_DELIMITER:
			return(REPLACE_STATE);
		case	DELETE_DELIMITER:
			return(DELETE_STATE);
		case	INSERT_DELIMITER:
			return(INSERT_STATE);
		case	INSERT_AFTER_DELIM:
			return(INSERT_AFTER_STATE);
		case	INSERT_BEFORE_DELIM:
			return(INSERT_BEFORE_STATE);
		case	OPTIONAL_DELIMITER:
			return(OPTIONAL_STATE);
		case	START_SAVE_STATE:
			return(SAVE_STATE);
		case    MACRO_DELIMITER:
			return(MACRO_STATE);
		case   DICTIONARY_STATE_DELIM:
			return(DICTIONARY_STATE);
		case   WORD_STATE_DELIM:
			return(WORD_STATE);
		/* GL 02/08/1997 add STATUS_STATE */
		case   STATUS_STATE_DELIM:
			return(STATUS_STATE);
		case	COMPOUND_BREAK_DELIM:
			return(COMPOUND_BREAK_STATE);
		default:
			return(NULL_STATE);
	}
}	

   

/*
 *	Function Name:
 *		convert_rule_line
 *
 *	Description:
 *		this function converts a rule line into a node for the linked list
 *
 *	Arguments:
 *		INPUT	unsigned char	*line	THe line read from the file
 *
 *	Return Value:
 *		prule_comp_t	A pointer to the allocated rule node
 *						Null if failure
 *
 *	Comments:
 *
 */
prule_comp_t convert_rule_line(unsigned char *line)
{
  prule_comp_t rule;

  __int64 temp;   
  int index=0;

  rule=(prule_comp_t)malloc(sizeof(rule_comp_t));
  if (rule==NULL)
	{
	  fprintf(stderr,"out of memory in convert line on line number %d\n",line_number);
	  return(NULL);
	}
  memset(rule,0,sizeof(rule_comp_t));
  while (line[index]==' ')
	index++;

	/* convert the special rule values */

  if (line[index]!=HEXADECIMAL_DELIM)
	{
	  if (strncmp(line+index,"STOP",4)==0)
		{
		  rule->special_rule=STOP_TAG_VALUE;
		}
	  else if (strncmp(line+index,"RETURN",6)==0)
		{
		  rule->special_rule=RETURN_TAG_VALUE;
		}
	  else if (strncmp(line+index,"GOTO",4)==0)
		{
		  index+=4;
		  rule->special_rule=GOTO_TAG_VALUE;
		  rule->special_value=atoi(line+index);
		}
	  else if (strncmp(line+index,"GORET",5)==0)
		{
		  index+=5;
		  rule->special_rule=GORET_TAG_VALUE;
		  rule->special_value=atoi(line+index);
		}
	  else
		{
		  fprintf(stderr,"unrecognized tag at the beginning of line number %d\n",line_number);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}                                
		/* every rule including the speical rules must have a rule number */
	  while ((line[index]!='\0') && (line[index]!=','))
		index++;
	  if (line[index]!='\0')
		index++;
	  if (line[index]!=RULE_NUMBER_DELIM)
		{
		  fprintf(stderr,"no rule number given for special rule on line %d\n",line_number);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}
	  index++;
	  rule->rule_number=atoi(line+index);
	  if (rule_indexes[rule->rule_number]!=-1)
	  {
		  fprintf(stderr,"duplicated rule number %d detected\n",rule->rule_number);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
	  }
	  rule_indexes[rule->rule_number]=rule_count;
	  
	}/*   if (line[index]!=HEXADECIMAL_DELIM) */
  else
	{
	  rule->special_rule=0;
	  rule->special_value=UNSET_PARAM;
	  rule->lang_flag=UNSET_PARAM;
	  rule->mode_flag=UNSET_PARAM;
	  rule->rule_number=UNSET_PARAM;
	  rule->next_hit_rule=UNSET_PARAM;
	  rule->next_miss_rule=UNSET_PARAM;
	  rule->next_goret_hit=UNSET_PARAM;
	  rule->next_goret_miss=UNSET_PARAM;
	  rule->copy_hit=UNSET_PARAM;
	  rule->dict_flag=UNSET_PARAM;
	  /* the dictionary hit miss flag */
	  temp=par_convert_hex_number(line+index,8);
	  if (temp==-1)
		{
		  fprintf(stderr,"error in hex number in line number %d at position %d\n",line_number,index);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}
	  rule->lang_flag=(U32)(temp & 0xFFFFFFFF);
	  index+=10;
	  if (line[index]!='-')
		{
		  printf("- not found at position %d in line number %d\n",index,line_number);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}
	  index++;
	  temp=par_convert_hex_number(line+index,8);
	  if (temp==-1)
		{
		  fprintf(stderr,"error in hex number in line number %d at position %d\n",line_number,index);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}
	  rule->mode_flag=(U32)(temp & 0xFFFFFFFF);
	  index+=10;
	  if (line[index]!=':')
		{
		  printf(": not found at position %d in line number %d\n",index,line_number);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}
	  index++;
	  while (line[index]!=',')
		{
		  switch(line[index])
			{
			case ',':
			  break;
			case ';':
			  index++;
			  break;
			case RULE_NUMBER_DELIM:
			  index++;
			  rule->rule_number=atoi(line+index);
			  index+=par_get_int_length(rule->rule_number);
			  if (rule_indexes[rule->rule_number]!=-1)
			  {
				  fprintf(stderr,"duplicated rule number %d detected\n",rule->rule_number);
				  par_print_rule_error(line,index);
				  free(rule);
				  return(NULL);
			  }
			  rule_indexes[rule->rule_number]=rule_count;
			  break;
			case HIT_NUMBER_DELIM:
			  index++;
			  rule->next_hit_rule=atoi(line+index);
			  index+=par_get_int_length(rule->next_hit_rule);
			  break;
			case MISS_NUMBER_DELIM:
			  index++;
			  rule->next_miss_rule=atoi(line+index);
			  index+=par_get_int_length(rule->next_miss_rule);
			  break;
			case GORET_NUMBER_DELIM:
			  index++;
			  if (line[index]==GORET_HIT_DELIM)
				{
				  index++;
				  rule->next_goret_hit=atoi(line+index);
				  index+=par_get_int_length(rule->next_goret_hit);
				}
			  else if (line[index]==GORET_MISS_DELIM)
				{
				  index++;
				  rule->next_goret_miss=atoi(line+index);
				  index+=par_get_int_length(rule->next_goret_miss);
				}
			  else
				{
				  fprintf(stderr,"unrecognized goret delimiter at position %d in line %d\n",index,line_number);
				  par_print_rule_error(line,index);
				  free(rule);
				  return(NULL);
				}
			  break;
			case COPY_HIT_DELIM:
			  index++;
			  rule->copy_hit=atoi(line+index);
			  index+=par_get_int_length(rule->copy_hit);
			  break;
			case DICTIONARY_DELIM:
			  index++;
			  if (line[index]==DICTIONARY_HIT)
				{
				  rule->dict_flag=DICT_HIT_VALUE;
				}
			  else if (line[index]==DICTIONARY_MISS)
				{
				  rule->dict_flag=DICT_MISS_VALUE;
				}
			  else if (line[index]==DICTIONARY_ABBREV)
				{
				  rule->dict_flag=DICT_MISS_VALUE|DICT_HIT_VALUE;
				}
			  else
				{
				  fprintf(stderr,"unrecognized dictionary tag at position %d in line %d\n",index,line_number);
				  par_print_rule_error(line,index);
				  free(rule);
				  return(NULL);
				}   
			  index++;
			  break;
			default:
			  fprintf(stderr,"unrecognized delimiter at position %d in line %d\n",index,line_number);
			  par_print_rule_error(line,index);
			  free(rule);
			  return(NULL);
			}
		}/* 	  while (line[index]!=',') */
	  index++;
	  strcpy(rule->rule,line+index);
	  index=strlen(rule->rule)-1;
	  while (rule->rule[index]==' ')
		{
		  rule->rule[index]='\0';
		  index--;
		}
	  if (rule->rule_number==-1)
		{
		  fprintf(stderr,"no rule number found in line number %d\n",line_number);
		  par_print_rule_error(line,index);
		  free(rule);
		  return(NULL);
		}
	}/*  if (line[index]!=HEXADECIMAL_DELIM) */
  return(rule);
}


/*
 *	Function Name:
 *		match_rule
 *
 *	Description:
 *		This finction checks the syntax of an entire rule state
 *		it is recursive
 *
 *	Arguments:         
 *		INPUT		char		*rule		The rule
 *		I/O			int			*index		The current position in the rule
 *		INPUT		int			state		The current matching state
 *		INPUT		dict_names	dict_list	The list of dictionaries
 *		INPUT		char		end			The character the denotes the end of the state
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *		this function updates the rule macro numbers and converts the 
 *		dictionary names into numbers                                       
 *		this function and the following match_* functions mimic the logic of the parser itself
 *
 */
void match_rule(char *rule,int *index,int state,dict_names dict_list,char end)
{
	int new_state,new_char,save_num,new_num;
	int save_len,new_len,keep_index;
	int i,diff;
	char temps[10];
	char dict_name[50];
	dict_names p;
	
#ifdef DEBUG
printf("entering match_rule\n");
par_print_rule_error(rule,(*index));
#endif
	if (state==NULL_STATE)
	{
		end=End_Is_Null;
	}
	if (state==SAVE_STATE)
	{
		(*index)++;	/* skip the $ */
		save_num=rule[(*index)]-'0';
		if ((save_num<0) || (save_num>9))
		{
			printf("invalid save state found in rule R%d\n",current_rule_number);
			par_print_rule_error(rule,(*index));
			exit(1);      
		}
		end=End_Is_Paren;
		(*index)+=2; /* skip the digit and the comma */
	}       
	if (state==DICTIONARY_STATE)
	{
		keep_index=(*index);
		i=0;
		while (rule[keep_index]!='\0' && rule[keep_index]!=',')
		{
			dict_name[i]=rule[keep_index];
			i++;
			keep_index++;
		}
		dict_name[i]='\0';
		if (rule[keep_index]=='\0')
		{
			printf("unexpected end of rule R%d\n",current_rule_number);
			par_print_rule_error(rule,keep_index);
			exit(1);      
		}
		p=dict_list;
		while (p!=NULL && stricmp(dict_name,p->dict_name))
		{
			p=p->next;
		}
		if (p==NULL)
		{
			printf("dictionary name %s not found from rule R%d\n",dict_name,current_rule_number);
			par_print_rule_error(rule,(*index));
			exit(1);      
		}
		new_num=p->dic_number;
		save_len=strlen(dict_name);
		new_len=par_get_int_length(new_num);
		if (new_len>save_len)
		{
			/* shift the entire rule to the right by the difference in the lengths */
			diff=new_len-save_len;
			for (i=strlen(rule);i>((*index)+save_len-1);i--)
			{
				rule[i+diff]=rule[i];
			}
		}
		else
		{
			if (new_len<save_len)
			{
				/* shift the entire rule to the left by the difference in the lengths */
				diff=save_len-new_len;
				for (i=(*index)+diff+1;i<=strlen(rule);i++)
				{
					rule[i-diff]=rule[i];
				}
			}
		}
		sprintf(temps,"%d",new_num);
		strncpy(rule+(*index),temps,strlen(temps));
		(*index)+=new_len;
		(*index)++; /* skip the comma */
	}	
	if (state==MACRO_STATE)
	{
		if (rule[(*index)]!=RULE_NUMBER_DELIM)
		{
			printf("no rule delimiter found in a macro state in rule R%d\n",current_rule_number);
			par_print_rule_error(rule,(*index));
			exit(0);
		}
		(*index)++;/* skip the R */
		save_num=atoi(rule+(*index));
		if (rule_indexes[save_num]==-1)
		{
			fprintf(stderr,"rule number %d does not exist\n",save_num);
			exit(2);
		}
		new_num=rule_indexes[save_num];
		if (new_num==-1)
		{
			printf("no such rule number R%d in rule R%d\n",save_num,current_rule_number);
			par_print_rule_error(rule,(*index));
			exit(0);
		}
		save_len=par_get_int_length(save_num);
		new_len=par_get_int_length(new_num);
		if (new_len>save_len)
		{
			/* shift the entire rule to the right by the difference in the lengths */
			diff=new_len-save_len;
			for (i=strlen(rule);i>((*index)+save_len-1);i--)
			{
				rule[i+diff]=rule[i];
			}
		}
		else
		{
			if (new_len<save_len)
			{
				/* shift the entire rule to the left by the difference in the lengths */
				diff=save_len-new_len;
				for (i=(*index)+diff+1;i<=strlen(rule);i++)
				{
					rule[i-diff]=rule[i];
				}
			}
		}
		sprintf(temps,"%d",new_num);
		strncpy(rule+(*index),temps,strlen(temps));
		(*index)+=new_len;
		/* place the new number into the rule at position index */
	}
	else
	{
		while (rule[(*index)]!=end)
		{
			if ((new_char=par_get_char_type(rule[(*index)]))!=NULL_TYPE)
			{
				if (new_char==NO_LOOKAHEAD)
				{
					(*index)++;
					if (((new_char=par_get_char_type(rule[(*index)]))==NULL_TYPE) ||
						(new_char==NO_LOOKAHEAD))
					{
						printf("no character type found in rule R%d\n",current_rule_number);
						par_print_rule_error(rule,(*index));
						exit(1);
					}
					match_string(rule,index,new_char);
				}
				else
				{
					match_string(rule,index,new_char);
				}
			}
			else
			{
				if ((new_state=par_get_state(rule[(*index)]))!=NULL_STATE)
				{
					(*index)++;/* skip the state delimiter */
					if (new_state!=SAVE_STATE)
					{
						if (rule[(*index)]!=STATE_PART_DELIM)
						{
							printf("no state delimiter found in rule R%d\n",current_rule_number);
							par_print_rule_error(rule,(*index));
							exit(0);
						}
						(*index)++;	/* skip the slash */
					}
					match_rule(rule,index,new_state,dict_list,End_Is_Slash);
				}
				else
				{
					printf("no action state or character type found in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
			}
		}
	}
	if (rule[(*index)]!=end)
	{
		printf("end of state slash not found in rule R%d\n",current_rule_number);
		par_print_rule_error(rule,(*index));
		exit(0);
	}
	if (state!=NULL_STATE)
		(*index)++;
	perform_action(rule,index,state,dict_list);
}


/*
 *	Function Name:
 *		perform_action
 *
 *	Description:
 *		this function checks the second half of the matching states
 *
 *	Arguments:
 *		INPUT		char		*rule		The rule
 *		I/O			int			*index		The current position in the rule
 *		INPUT		int			state		The current matching state
 *		INPUT		dict_names	dict_list	The list of dictionaries
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void perform_action(char *rule,int *index,int state,dict_names dict_list)
{
#ifdef DEBUG
printf("entering perform_action\n");
par_print_rule_error(rule,(*index));
#endif
	switch(state)
	{
		case	COPY_STATE:
		case	DELETE_STATE:
		case	OPTIONAL_STATE:
		case    MACRO_STATE: 
		case	SAVE_STATE:
			break;
		case	REPLACE_STATE:
		case	INSERT_STATE:
		case	INSERT_AFTER_STATE:
		case	INSERT_BEFORE_STATE:
		/* GL 02/08/1997 add STATUS_STATE */
		case	STATUS_STATE:
			while (rule[(*index)]!='/')
			{
				if (rule[(*index)]=='|')
					(*index)++;
				match_string(rule,index,par_get_char_type(rule[(*index)]));
				if (rule[(*index)]=='|')
					(*index)++;
			}
			(*index)++;
			break;
		case DICTIONARY_STATE:
#ifdef DEBUG
			printf("in dict_state perform_action\n");
			par_print_rule_error(rule,(*index));
#endif
			if (strncmp(rule+(*index),"FAIL",4)==0)
			{
				if (rule[(*index)+4]!='|')
				{
					printf("no vertical bar found in dictioanry_state\n");
					par_print_rule_error(rule,(*index)+4);
					exit(1);
				}
				(*index)+=5;
			}
			else
			{
				match_rule(rule,index,COPY_STATE,dict_list,'|');
			}
#ifdef DEBUG
			printf("in dict_state perform_action 2\n");
			par_print_rule_error(rule,(*index));
#endif
			if (strncmp(rule+(*index),"FAIL",4)==0)
			{
				if (rule[(*index)+4]!='/')
				{
					printf("no slash found in dictioanry_state\n");
					par_print_rule_error(rule,(*index)+4);
					exit(1);
				}
				(*index)+=5;
			}
			else
			{
				match_rule(rule,index,COPY_STATE,dict_list,'/');
			}
			break;
		default:
			break;
	}
}            
		

/*
 *	Function Name:
 *		match_string
 *
 *	Description:
 *		thie function checks the syntax of all the string identifiers
 *
 *	Arguments:
 *		INPUT		char	*rule		The rule
 *		I/O			int		*index		The current position in the rule
 *		INPUT		int		char_type	The character type to check
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void match_string(char *rule,int *index,int char_type)
{
#ifdef DEBUG
printf("entering match_string\n");
par_print_rule_error(rule,(*index));
#endif
	switch(char_type)
	{
		case	EXACT_CHAR_TYPE:
			(*index)++;
			while (rule[(*index)]!=EXACT_CHAR_DELIM)
			{
				if (rule[(*index)]==ESCAPE_DELIM)
				{
					(*index)++;
				}
				(*index)++;
			}
			(*index)++;
			break;
		case	EXACT_CASE_TYPE:
			(*index)++;
			while (rule[(*index)]!=EXACT_CASE_DELIM)
			{
				if (rule[(*index)]==ESCAPE_DELIM)
				{
					(*index)++;
				}
				(*index)++;
			}
			(*index)++;
			break;
		case	HEXADECIMAL_TYPE:
			if (par_convert_hex_number(rule+(*index),2)<0)
			{
				printf("error in hexadecimal type in rule R%d\n",current_rule_number);
				par_print_rule_error(rule,(*index));
			}
			(*index)+=4;
			break;
		case	SAVE_CHAR_TYPE:
			(*index)++;
			if (rule[(*index)]<'0' || rule[(*index)]>'9')
			{
				printf("invalid save state found in rule R%d\n",current_rule_number);
				par_print_rule_error(rule,(*index));
				exit(1);      
			}
			(*index)++;
			break;
		case	SET_CHAR_TYPE:
			match_set(rule,index);
			break;
		case	DIGIT_CHAR_TYPE:
			if ((rule[(*index)+1]=='[') || (rule[(*index)+2]=='['))
			{
				match_digit(rule,index);
				break;
			}              
		case	UPPER_CHAR_TYPE:
        case	ANY_ALPHA_CHAR_TYPE:
        case	ANY_CHAR_CHAR_TYPE:
        case	WHITE_CHAR_TYPE:
        case	PUNCT_CHAR_TYPE:
        case	LOWER_CHAR_TYPE:
        case	NON_ALPHA_CHAR_TYPE:
        case	VOWEL_CHAR_TYPE:
        case	CONSONANT_CHAR_TYPE:
		case	NUMBER_CHAR_TYPE:
		case	CLAUSE_CHAR_TYPE:
        case	ALPHA_NUM_CHAR_TYPE:
        case	VOWEL_NON_Y_TYPE:
        case	SOME_PUNCT_TYPE:
			match_standard(rule,index);
			break;
		default:
			printf("character type specifier not found in rule R%d\n",current_rule_number);
			par_print_rule_error(rule,(*index));
			exit(-1);
			break;
	}
}
				
		

/*
 *	Function Name:
 *		match_standard	
 *
 *	Description:
 *		this function checks the syntax of a character type specifier
 *		L<***>   A<***>
 *
 *	Arguments:
 *		INPUT		char	*rule		The rule
 *		I/O			int		*index		The current position in the rule
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void match_standard(char *rule,int *index)
{
	(*index)++;
	if (rule[(*index)]==NO_LOOKAHEAD)
	{
		(*index)++;
	}
	if (rule[(*index)]=='~')
	{
		(*index)++;
	}
	if (rule[(*index)]!='<')
	{
		printf("no < found at the beginning of the character type in rule R%d\n",current_rule_number);
		par_print_rule_error(rule,(*index));
		exit(1);
	}           
	(*index)++;
	while (rule[(*index)]!='>')
	{
		switch(rule[(*index)])
		{
			case '*':
				(*index)++;
				if (rule[(*index)]!='>')
				{
					printf("> not found after * in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				break;
			case '+':
				(*index)++;
				if (rule[(*index)]!='>')
				{
					printf("> not found after + in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				break;                         
			case ',':
				(*index)++;
				break;
			default:
				(*index)+=par_get_int_length(atoi(rule+(*index)));
				switch(rule[(*index)])
				{
					case ',':
						(*index)++;
						break;
					case '>':
						break;
					case '-':
						switch (rule[(*index)])
						{
							case '*':
							case '+':
								(*index)++;
								if (rule[(*index)]!='>')
								{
									printf("> not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								break;
							default:
								(*index)++; /* skip the - */
								(*index)+=par_get_int_length(atoi(rule+(*index)));
								if (rule[(*index)]!='>' && rule[(*index)]!=',')
								{
									printf("expected > or , after range in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index));
									exit(1);
								}
						}
						break;
					default:
						printf("testing 1 2 3 error in rule syntax in rule R%d\n",current_rule_number);
						par_print_rule_error(rule,(*index));
						exit(1);
				}               
		}
	}
	(*index)++;
}


/*
 *	Function Name:
 *		match_digit
 *
 *	Description:
 *		This function checks the syntax of a D[***] identifier
 *
 *	Arguments:
 *		INPUT		char	*rule		The rule
 *		I/O			int		*index		The current position in the rule
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void match_digit(char *rule,int *index)
{
	(*index)++;
	if (rule[(*index)]==NO_LOOKAHEAD)
	{
		(*index)++;
	}
	if (rule[(*index)]!='[')
	{
		printf("no [ found at the beginning of the character type in rule R%d",current_rule_number);
		par_print_rule_error(rule,(*index));
		exit(1);
	}           
	(*index)++;
	while (rule[(*index)]!=']')
	{
		switch(rule[(*index)])
		{
			case '*':
				(*index)++;
				if (rule[(*index)]!=']')
				{
					printf("] not found after * in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				break;
			case '+':
				(*index)++;
				if (rule[(*index)]!=']')
				{
					printf("] not found after + in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				break;                         
			case ',':
				(*index)++;
				break;
			default:
				(*index)+=par_get_int_length(atoi(rule+(*index)));
				switch(rule[(*index)])
				{
					case ',':
						(*index)++;
						break;
					case ']':
						break;
					case '-':
						switch (rule[(*index)])
						{
							case '*':
							case '+':
								(*index)++;
								if (rule[(*index)]!=']')
								{
									printf("] not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								break;
							default:
								(*index)++; /* skip the - */
								(*index)+=par_get_int_length(atoi(rule+(*index)));
								if (rule[(*index)]!=']' && rule[(*index)]!=',')
								{
									printf("expected ] or , after range in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index));
									exit(1);
								}
						}
						break;
					default:
						printf("error in rule syntax in rule R%d\n",current_rule_number);
						par_print_rule_error(rule,(*index));
						exit(1);
				}               
		}
	}
	(*index)++;
}
						

/*
 *	Function Name:
 *		match_set
 *
 *	Description:
 *		this fuction does syntacitcal checking of a set in a rule
 *
 *	Arguments:
 *		INPUT		char	*rule		The rule
 *		I/O			int		*index		The current position in the rule
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *
 */
void match_set(char *rule,int *index)
{
	(*index)++;
	if (rule[(*index)]!='{')
	{
		printf("no { found at the beginning of the set in rule R%d\n",current_rule_number);
		par_print_rule_error(rule,(*index));
		exit(0);
	}   
	(*index)++;                
	while (rule[(*index)]!='}')
	{
		while ((rule[(*index)]!=',') && (rule[(*index)]!='}'))
		{
			match_string(rule,index,par_get_char_type(rule[(*index)]));
		}
		if (rule[(*index)]!='}')
			(*index)++;
	}
	(*index)++;					
	if (rule[(*index)]!='<')
	{
		printf("no < found at the befinning of the character type in rule R%d",current_rule_number);
		par_print_rule_error(rule,(*index));
		exit(1);
	}           
	(*index)++;
	while (rule[(*index)]!='>')
	{
		switch(rule[(*index)])
		{
			case '*':
				(*index)++;
				if (rule[(*index)]!='>')
				{
					printf("> not found after * in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				break;
			case '+':
				(*index)++;
				if (rule[(*index)]!='>')
				{
					printf("> not found after + in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				break;                         
			case ',':
				(*index)++;
				break;
			default:
				(*index)+=par_get_int_length(atoi(rule+(*index)));
				switch(rule[(*index)])
				{
					case ',':
						(*index)++;
						break;
					case '>':
						break;
					case '-':
						switch (rule[(*index)])
						{
							case '*':
							case '+':
								(*index)++;
								if (rule[(*index)]!='>')
								{
									printf("> not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								break;
							default:
								(*index)++;
								(*index)+=par_get_int_length(atoi(rule+(*index)));
								if (rule[(*index)]!='>' && rule[(*index)]!=',')
								{
									printf("expected > or , after range in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index));
									exit(1);
								}
						}
						break;
					default:
						printf("error in rule syntax in rule R%d\n",current_rule_number);
						par_print_rule_error(rule,(*index));
						exit(1);
				}               
		}
	}
	(*index)++;
}
			
	

/*
 *	Function Name:
 *		update_rule_macro
 *
 *	Description:
 *		this function updates the dictionary and macro references in the rule
 *
 *	Arguments:
 *		I/O		char		*rule		The rule to ber converted
 *		INPUT	dict_names	dict_list	The list of dictinoaries
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void update_rule_macro(char *rule,dict_names dict_list)
{
	int index=0;
	match_rule(rule,&index,NULL_STATE,dict_list,'\0');
}
	
/*
 *	Function Name:
 *		convert_all_rules_to_binary
 *
 *	Description:
 *		This function controls the conversion of the text rule to the 
 *		new binary format
 *
 *	Arguments:
 *		I/O		rule_node		list		The list of rules
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */

void convert_all_rules_to_binary(rule_node list)
{
  rule_node p;
  p=list;
  while (p!=NULL)
	{
	  convert_rule_to_binary(p);
	  p=p->next;
  }
}


void convert_rule_to_binary(rule_node p)
{
	int index=0;
	cur_index=0;
	prev_char_type_index=-1;
	old_char_type=-1;
	memset(dictionary_levels,0,sizeof(dictionary_levels));
	cur_dict_level=-1;
	bin_match_rule(p->data->rule,p->data->newrule,&index,NULL_STATE,'\0');
	/* the last type doesn't lookahead because there is nothing to look for */
	if (prev_char_type_index!=-1)
	{
		if (((p->data->newrule[prev_char_type_index].operation) & BIN_OPERATION_MASK) >= 0x01 && 
			((p->data->newrule[prev_char_type_index].operation) & BIN_OPERATION_MASK) <= 0x0F)
		{
			set_lookahead_from(p->data->newrule,prev_char_type_index);
		}
	}
}
	

void dump_new_rule_index(action_rule_t *newrule)
{
	int i=0;
	int j=0;
	int k=0;
	while (newrule[i].operation!=0)
	{	
		printf("\tindex:\t%d\n",i);
		printf("\t\toperation:\t");
		switch ( newrule[i].operation & BIN_OPERATION_MASK)
		{
		case BIN_END_OF_RULE:
			printf("end_of_rule");
			break;
		case BIN_ALPHANUMERIC:
			printf("alphanumeric");
			break;
		case BIN_ANY_ALPHABET:
			printf("alphabet");
			break;
		case BIN_ANY_CHARACTER:
			printf("character");
			break;
		case BIN_CLAUSE_BOUNDRY:
			printf("clause boundry");
			break;
		case BIN_CONSONANT:
			printf("consonant");
			break;
		case BIN_LOWER:
			printf("lower");
			break;
		case BIN_NON_ALPHABET:
			printf("non alphabet");
			break;
		case BIN_NUMBER:
			printf("number");
			break;
		case BIN_PUNCT_SOME:
			printf("punct_some");
			break;
		case BIN_PUNCTUATION:
			printf("punctuation");
			break;
		case BIN_UPPER:
			printf("upper");
			break;
		case BIN_VOWEL:
			printf("vowel");
			break;
		case BIN_VOWEL_NON_Y:
			printf("vowel non y");
			break;
		case BIN_WHITESPACE:
			printf("whitespace");
			break;
		case BIN_DIGIT:	
			printf("digit");
			break;
		case BIN_EXACT:
			printf("exact");
			break;
		case BIN_HEXADECIMAL:
			printf("hexadecimal");
			break;
		case BIN_RESTORE:
			printf("restore");
			break;
		case BIN_SETS:
			printf("sets");
			break;
		case BIN_COPY:
			printf("copy");
			break;
		case BIN_DELETE:
			printf("delete");
			break;
		case BIN_OPTIONAL:
			printf("optional");
			break;
		case BIN_SAVE:
			printf("save");
			break;
		case BIN_MACRO:
			printf("macro");
			break;
		case BIN_REPLACE:
			printf("replace");
			break;
		case BIN_INSERT:
			if (newrule[i].operation & BIN_AFTER_FLAG)
			{
				printf("after");
			}
			else
			{
				if (newrule[i].operation & BIN_BEFORE_FLAG)
				{
					printf("before");
				}
				else
				{
					printf("insert");
				}
			}
			break;
#if 0
		case BIN_AFTER:
			printf("after");
			break;
		case BIN_BEFORE:
			printf("before");
			break;
#endif
		case BIN_COMP_BREAK:
			printf("comp break");
			break;
		case BIN_DICTIONARY:
			printf("dictionary");
			break;
		case BIN_STATUS:
			printf("status");
			break;
		case BIN_WORD:
			printf("word");
			break;
		default:
			printf("undefined operation");
			break;
		}
		printf("\n");

		switch ( newrule[i].operation & BIN_OPERATION_MASK)
		{
		case BIN_END_OF_RULE:
			break;
		case BIN_ALPHANUMERIC:
		case BIN_ANY_ALPHABET:
		case BIN_ANY_CHARACTER:
		case BIN_CLAUSE_BOUNDRY:
		case BIN_CONSONANT:
		case BIN_LOWER:
		case BIN_NON_ALPHABET:
		case BIN_NUMBER:
		case BIN_PUNCT_SOME:
		case BIN_PUNCTUATION:
		case BIN_UPPER:
		case BIN_VOWEL:
		case BIN_VOWEL_NON_Y:
		case BIN_WHITESPACE:
			if (newrule[i].operation & BIN_LOOK_TO_DISABLE)
			{
				printf("\t\tlookahead to is disabled\n");
			}
			if (newrule[i].operation & BIN_LOOK_FROM_DISABLE)
			{
				printf("\t\tlookahead from is disabled\n");
			}
			else
			{
				printf("\t\tnext type %d\n",newrule[i].next_type);
			}
			printf("\t\tnumber of descriptors = %d\n",newrule[i].num_desc & BIN_SIZE_DESC_MASK);
			if (newrule[i].num_desc & BIN_COMPLIMENT)
			{
				printf("\t\tcompliment is on\n");
			}
			if (newrule[i].num_desc & BIN_LARGE_DESC)
			{
				printf("\t\tusing large descriptors\n");
			}
			for (j=0;j<(newrule[i].num_desc & BIN_SIZE_DESC_MASK);j++)
			{
				printf("\t\tdescriptor %d ",j);
				if (newrule[i].num_desc & BIN_LARGE_DESC)
				{
					printf("\tvalue=%d continue=%d any=%d\n",
						newrule[i].descript[j].large_desc & BIN_MAX_LARGE_DESC,
						((newrule[i].descript[j].large_desc & BIN_LARGE_CONTINUE) ? 1 : 0),
						((newrule[i].descript[j].large_desc & BIN_LARGE_ANY_NUMBER) ? 1 : 0));
				}
				else
				{
					printf("\tvalue=%d continue=%d any=%d\n",
						newrule[i].descript[j].small_desc & BIN_MAX_SMALL_DESC,
						((newrule[i].descript[j].small_desc & BIN_SMALL_CONTINUE) ? 1 : 0),
						((newrule[i].descript[j].small_desc & BIN_SMALL_ANY_NUMBER) ? 1 : 0));
				}
			}
			break;
		case BIN_DIGIT:	
			if (newrule[i].operation & BIN_LOOK_TO_DISABLE)
			{
				printf("\t\tlookahead to is disabled\n");
			}
			if (newrule[i].operation & BIN_LOOK_FROM_DISABLE)
			{
				printf("\t\tlookahead from is disabled\n");
			}
			else
			{
				printf("\t\tnext type %d\n",newrule[i].next_type);
			}
			if (newrule[i].operation & BIN_DIGIT_RANGE)
			{
				printf("\t\tdigit range is on\n");
			}
			printf("\t\tnumber of descriptors = %d\n",newrule[i].num_desc & BIN_SIZE_DESC_MASK);
			if (newrule[i].num_desc & BIN_COMPLIMENT)
			{
				printf("\t\tcompliment is on\n");
			}
			if (newrule[i].num_desc & BIN_LARGE_DESC)
			{
				printf("\t\tusing large descriptors\n");
			}
			for (j=0;j<(newrule[i].num_desc & BIN_SIZE_DESC_MASK);j++)
			{
				printf("\t\tdescriptor %d ",j);
				if (newrule[i].num_desc & BIN_LARGE_DESC)
				{
					printf("\tvalue=%d continue=%d any=%d\n",
						newrule[i].descript[j].large_desc & BIN_MAX_LARGE_DESC,
						((newrule[i].descript[j].large_desc & BIN_LARGE_CONTINUE) ? 1 : 0),
						((newrule[i].descript[j].large_desc & BIN_LARGE_ANY_NUMBER) ? 1 : 0));
				}
				else
				{
					printf("\tvalue=%d continue=%d any=%d\n",
						newrule[i].descript[j].small_desc & BIN_MAX_SMALL_DESC,
						((newrule[i].descript[j].small_desc & BIN_SMALL_CONTINUE) ? 1 : 0),
						((newrule[i].descript[j].small_desc & BIN_SMALL_ANY_NUMBER) ? 1 : 0));
				}
			}
			break;
		case BIN_EXACT:
			if (newrule[i].operation & BIN_CASE_INSEN)
			{
				printf("\t\tcase insensitive is set\n");
			}
			printf("\t\tstring length=%d\n",newrule[i].data_number);
			printf("\t\tthe string is '%s'\n",newrule[i].data);
			break;
		case BIN_HEXADECIMAL:
			printf("\t\tthe value is 0x%02X\n",newrule[i].data_number);
			break;
		case BIN_RESTORE:
			printf("\t\tdata restored from %d\n",newrule[i].data_number);
			break;
		case BIN_SETS:
			printf("\t\tnumber of sections %d\n",newrule[i].data_number);
			for (j=0;j<newrule[i].data_number;j++)
			{
				printf("\t\tset index %d\n",newrule[i].sections[j]);
			}
			printf("\t\tnumber of descriptors = %d\n",newrule[i].num_desc & BIN_SIZE_DESC_MASK);
			if (newrule[i].num_desc & BIN_LARGE_DESC)
			{
				printf("\t\tusing large descriptors\n");
			}
			for (j=0;j<(newrule[i].num_desc & BIN_SIZE_DESC_MASK);j++)
			{
				printf("\t\tdescriptor %d ",j);
				if (newrule[i].num_desc & BIN_LARGE_DESC)
				{
					printf("\tvalue=%d continue=%d any=%d\n",
						newrule[i].descript[j].large_desc & BIN_MAX_LARGE_DESC,
						((newrule[i].descript[j].large_desc & BIN_LARGE_CONTINUE) ? 1 : 0),
						((newrule[i].descript[j].large_desc & BIN_LARGE_ANY_NUMBER) ? 1 : 0));
				}
				else
				{
					printf("\tvalue=%d continue=%d any=%d\n",
						newrule[i].descript[j].small_desc & BIN_MAX_SMALL_DESC,
						((newrule[i].descript[j].small_desc & BIN_SMALL_CONTINUE) ? 1 : 0),
						((newrule[i].descript[j].small_desc & BIN_SMALL_ANY_NUMBER) ? 1 : 0));
				}
			}
			break;
		case BIN_COPY:
		case BIN_DELETE:
		case BIN_OPTIONAL:
		case BIN_COMP_BREAK:
			printf("\t\tend of match = %d\n",newrule[i].end_of_match);
			break;
		case BIN_SAVE:
			printf("\t\tsave location = %d\n",newrule[i].data_number);
			printf("\t\tend of match = %d\n",newrule[i].end_of_match);
			break;
		case BIN_MACRO:
			printf("\t\trule to macro = %d\n",newrule[i].macro_num);
			break;
		case BIN_REPLACE:
		case BIN_INSERT:
#if 0
		case BIN_AFTER:
		case BIN_BEFORE:
#endif
			if ((newrule[i].operation) & BIN_CONDITIONAL_REPLACE)
			{
				printf("\t\tconditional replacement is set\n");
				printf("\t\tnumber of conditional replacements is %d\n",newrule[i].data_number);
				for (j=0;j<newrule[i].data_number;j++)
				{
					printf("\t\tr number %d",j);
					printf("\tend is %d\n",newrule[i].sections[j]);
				}
			}
			printf("\t\tend of match = %d\n",newrule[i].end_of_match);
			printf("\t\tend of action =%d\n",newrule[i].end_of_action);
			break;
		case BIN_DICTIONARY:
			printf("\t\tdictionary number %d\n",newrule[i].data_number);
			if (newrule[i].operation & BIN_DICT_HIT_FAIL)
			{
				printf("\t\thit action is FAIL\n");
			}
			if (newrule[i].operation & BIN_DICT_MISS_FAIL)
			{
				printf("\t\tmiss action is FAIL\n");
			}
			printf("\t\tend of match = %d\n",newrule[i].end_of_match);
			printf("\t\tend of hit action %d\n",newrule[i].end_of_hit);
			printf("\t\tend of action =%d\n",newrule[i].end_of_action);
			break;
		case BIN_STATUS:
			printf("\t\tend of match = %d\n",newrule[i].end_of_match);
			printf("\t\tend of action =%d\n",newrule[i].end_of_action);
			break;
		case BIN_WORD:
			printf("\t\tend of match = %d\n",newrule[i].end_of_match);
			break;
		default:
			printf("\t\tundefined operation");
			break;
		}
		i++;
	}
}


void dump_new_rules(rule_node list)
{
  rule_node p;
  int i=0;

  p=list;

  while (p!=NULL)
	{
	  printf("rule:\t%d\n",i++);
	  dump_new_rule_index(p->data->newrule);
	  p=p->next;
  }
}


/*
 *	Function Name:
 *		convert_dict_line
 *
 *	Description:
 *		this function converts a dictionary input line into a linked list node
 *		The node is allocated in this function
 *
 *	Arguments:
 *		INPUT	unsigned char *line		The line read in from the file
 *
 *	Return Value:
 *		dict_entry_comp		A pointer the the allocated and filled dictionary entry
 *
 *	Comments:
 *
 */
dict_entry_comp convert_dict_line(unsigned char *line)
{
	dict_entry_comp entry;
	int i,j;
	entry=(dict_entry_comp)malloc(sizeof(struct dict_entry_s_comp));
	if (entry==NULL)
	{
		printf("out of memory in convert_dict_line\n");
		return(NULL);
	}
	memset(entry,0,sizeof(struct dict_entry_s_comp));
	for (i=0,j=0;line[i]!=DICT_ENTRY_DELIM && line[i]!='\0';i++,j++)
	{
		if (line[i]==ESCAPE_DELIM)
			i++;
		entry->search_graph[j]=line[i];
	}
	if (line[i]!=DICT_ENTRY_DELIM)
	{
		printf("no dictionary delimiter found on line %d\n",line_number);
		par_print_rule_error(line,i);
		free(entry);
		return(NULL);
	}
	i++;
	for (j=0;line[i]!='\0';i++,j++)
	{
		if (line[i]=='[')	/* convert the beginning of a phoneme string to 0x80 */
		{
			line[i]=0x81;
		}
		if (line[i]==']')	/* convert the end of a phoneme string to 0x81 */
		{
			line[i]=0x82;
		}
		if (line[i]==ESCAPE_DELIM)
		{
			i++;
		}
		entry->out_graph[j]=line[i];
	}
	return(entry);
}


/*
 *	Function Name:
 *		find_longest_from
 *
 *	Description:
 *		this function finds the longest word that is being output from 
 *		in a dictioary
 *
 *	Arguments:          
 *		INPUT	dict_node	dict	the list of entries in the dictionary
 *
 *	Return Value:
 *		int		The length of the longest search string in the dictionary
 *
 *	Comments:
 *		This function is only used to produce good looking output
 *
 */
int find_longest_from(dict_node dict)
{
	int length=0,temp=0;
	while (dict!=NULL)
	{
		temp=strlen(dict->data->search_graph);
		if (temp>length)
			length=temp;
		dict=dict->next;
	}
	return(length);
}


/*
 *	Function Name:
 *		find_longest_to
 *
 *	Description:
 *		this function finds the longest word that is being searched for 
 *		in a dictioary
 *
 *	Arguments:          
 *		INPUT	dict_node	dict	the list of entries in the dictionary
 *
 *	Return Value:
 *		int		The length of the longest output string in the dictionary
 *
 *	Comments:
 *		This function is only used to produce good looking output
 *
 */
int find_longest_to(dict_node dict)
{
	int length=0,temp=0;
	while (dict!=NULL)
	{
		temp=strlen(dict->data->out_graph);
		if (temp>length)
			length=temp;
		dict=dict->next;
	}
	return(length);
}


/*
 *	Function Name:
 *		update_rule_numbers
 *
 *	Description:
 *		this function updates the rule numbers in the rules
 *		it also calls update_rule_macro so that the dictionary and macro
 *		referenxces are also resolved
 *
 *	Arguments:
 *		I/O		rule_node		list		The list of rules
 *		INPUT	dict_names		dict_list	The list of dictionaries
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void update_rule_numbers(rule_node list,dict_names dict_list)
{
	rule_node p;
	p=list;
	while (p!=NULL)
	{
		if (p->data->special_rule==STOP_TAG_VALUE || p->data->special_rule==RETURN_TAG_VALUE)
		{
			current_rule_number=p->data->rule_number;
			update_rule_macro(p->data->rule,dict_list);
			p=p->next;      
			continue;
		}
		if (p->data->special_rule==GOTO_TAG_VALUE || p->data->special_rule==GORET_TAG_VALUE)
		{
			if (p->data->special_value!=UNSET_PARAM)
			{
				if (rule_indexes[p->data->special_value]==-1)
				{
					fprintf(stderr,"S rule %d does not exist\n",p->data->special_value);
					exit(3);
				}
				p->data->special_value=rule_indexes[p->data->special_value];
			}
			current_rule_number=p->data->rule_number;
			update_rule_macro(p->data->rule,dict_list);
			p=p->next;      
			continue;
		}
		if (p->data->next_hit_rule!=UNSET_PARAM)
		{
			if (rule_indexes[p->data->next_hit_rule]==-1)
			{
				fprintf(stderr,"H rule %d does not exist\n",p->data->next_hit_rule);
				fprintf(stderr,"rule is %s\n",p->data->rule);
				exit(3);
			}
			p->data->next_hit_rule=rule_indexes[p->data->next_hit_rule];
		}
		if (p->data->next_miss_rule!=UNSET_PARAM)
		{
			if (rule_indexes[p->data->next_miss_rule]==-1)
			{
				fprintf(stderr,"M rule %d does not exist\n",p->data->next_miss_rule);
				exit(3);
			}
			p->data->next_miss_rule=rule_indexes[p->data->next_miss_rule];
		}
		if (p->data->next_goret_hit!=UNSET_PARAM)
		{
			if (rule_indexes[p->data->next_goret_hit]==-1)
			{
				fprintf(stderr,"GH rule %d does not exist\n",p->data->next_goret_hit);
				exit(3);
			}
			p->data->next_goret_hit=rule_indexes[p->data->next_goret_hit];
		}
		if (p->data->next_goret_miss!=UNSET_PARAM)
		{
			if (rule_indexes[p->data->next_goret_miss]==-1)
			{
				fprintf(stderr,"GM rule %d does not exist\n",p->data->next_goret_miss);
				exit(3);
			}
			p->data->next_goret_miss=rule_indexes[p->data->next_goret_miss];
		}
		if (p->data->copy_hit!=UNSET_PARAM)
		{
			if (rule_indexes[p->data->copy_hit]==-1)
			{
				fprintf(stderr,"C rule %d does not exist\n",p->data->copy_hit);
				exit(3);
			}
			p->data->copy_hit=rule_indexes[p->data->copy_hit];
		}
		current_rule_number=p->data->rule_number;
		update_rule_macro(p->data->rule,dict_list);
		p=p->next;      
	}
}


void create_binary_rules(rule_node list)
{
	int i,j,k;
	int rule_index=0;
	int add_length=0;
	int rule_length=0;
	int rule_add_num=-1;
	int cur_next_type[1000];
	int cur_next_type_index[1000];
	int cur_next_type_set[1000];

	U16 temp;

	rule_node p;
	
	p=list;
	while (p!=NULL)
	{
		rule_length=0;
		temp=0;
		if (p->data->special_rule!=NORMAL_TAG_VALUE)
		{
			if (p->data->special_rule==STOP_TAG_VALUE)
				temp|=BIN_STOP;
			if (p->data->special_rule==RETURN_TAG_VALUE)
				temp|=BIN_RETURN;
			if (p->data->special_rule==GOTO_TAG_VALUE)
				temp|=BIN_GOTO;
			if (p->data->special_rule==GORET_TAG_VALUE)
				temp|=BIN_GORET;
			set_short(&(p->data->binary_data[rule_length]),temp);
			rule_length+=2;
			set_short(&(p->data->binary_data[rule_length]),p->data->rule_number);
			rule_length+=2;
		}
		else
		{
			if (p->data->next_hit_rule!=-1)	
				temp|=BIN_NEXT_HIT;
			if (p->data->next_miss_rule!=-1)	
				temp|=BIN_NEXT_MISS;
			if (p->data->next_goret_hit!=-1)
				temp|=BIN_GORET_HIT;
			if (p->data->next_goret_miss!=-1)
				temp|=BIN_GORET_MISS;
			if (p->data->dict_flag==DICT_MISS_VALUE)
				temp|=BIN_DICT_MISS;
			if (p->data->dict_flag==DICT_HIT_VALUE)
				temp|=BIN_DICT_HIT;
			if (p->data->copy_hit!=-1)
				temp|=BIN_COPY_HIT;

			set_short(&(p->data->binary_data[rule_length]),temp);
			rule_length+=2;
			set_short(&(p->data->binary_data[rule_length]),p->data->rule_number);
			rule_length+=2;
			set_int(&(p->data->binary_data[rule_length]),p->data->lang_flag);
			rule_length+=4;
			set_int(&(p->data->binary_data[rule_length]),p->data->mode_flag);
			rule_length+=4;
			if (p->data->next_hit_rule!=-1)	
			{	
				set_short(&(p->data->binary_data[rule_length]),p->data->next_hit_rule);
				rule_length+=2;
			}
			if (p->data->next_miss_rule!=-1)	
			{	
				set_short(&(p->data->binary_data[rule_length]),p->data->next_miss_rule);
				rule_length+=2;
			}
			if (p->data->next_goret_hit!=-1)
			{	
				set_short(&(p->data->binary_data[rule_length]),p->data->next_goret_hit);
				rule_length+=2;
			}
			if (p->data->next_goret_miss!=-1)
			{	
				set_short(&(p->data->binary_data[rule_length]),p->data->next_goret_miss);
				rule_length+=2;
			}
			if (p->data->copy_hit!=-1)	
			{	
				set_short(&(p->data->binary_data[rule_length]),p->data->copy_hit);
				rule_length+=2;
			}
			i=0;
			k=-1;
			while (p->data->newrule[i].operation!=0)
			{
				/* write the operation */
				set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].operation);
				rule_length++;

				switch ( p->data->newrule[i].operation & BIN_OPERATION_MASK)
				{
				case BIN_END_OF_RULE:
					break;
				case BIN_ALPHANUMERIC:
				case BIN_ANY_ALPHABET:
				case BIN_ANY_CHARACTER:
				case BIN_CLAUSE_BOUNDRY:
				case BIN_CONSONANT:
				case BIN_LOWER:
				case BIN_NON_ALPHABET:
				case BIN_NUMBER:
				case BIN_PUNCT_SOME:
				case BIN_PUNCTUATION:
				case BIN_UPPER:
				case BIN_VOWEL:
				case BIN_VOWEL_NON_Y:
				case BIN_WHITESPACE:
				case BIN_DIGIT:	
					/* write the number of descriptors */
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].num_desc);
					rule_length++;
					/* skip the space for the next type entry */
					/* when the next type entry comes up, set the value */
					if (!(p->data->newrule[i].operation & BIN_LOOK_FROM_DISABLE))
					{
						k++;
						cur_next_type[k]=rule_length;
						cur_next_type_index[k]=p->data->newrule[i].next_type;
						cur_next_type_set[k]=1;
						set_byte(&(p->data->binary_data[rule_length]),0);
						rule_length++;
					}
					for (j=0;j<(p->data->newrule[i].num_desc & BIN_SIZE_DESC_MASK);j++)
					{
						if (p->data->newrule[i].num_desc & BIN_LARGE_DESC)
						{
							set_short(&(p->data->binary_data[rule_length]),p->data->newrule[i].descript[j].large_desc);
							rule_length+=2;
						}
						else
						{
							set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].descript[j].small_desc);
							rule_length++;
						}
					}
					break;
				case BIN_EXACT:
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
					rule_length++;
					for (j=0;j<p->data->newrule[i].data_number;j++)
					{
						set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data[j]);
						rule_length++;
					}
					break;
				case BIN_HEXADECIMAL:
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
					rule_length++;
					break;
				case BIN_RESTORE:
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
					rule_length++;
					break;
				case BIN_SETS:
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
					rule_length++;
					for (j=0;j<p->data->newrule[i].data_number;j++)
					{
						k++;
						cur_next_type[k]=rule_length;
						cur_next_type_index[k]=p->data->newrule[i].sections[j];
						cur_next_type_set[k]=2;
						set_byte(&(p->data->binary_data[rule_length]),0);
						rule_length++;
					}
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].num_desc);
					rule_length++;
					for (j=0;j<(p->data->newrule[i].num_desc & BIN_SIZE_DESC_MASK);j++)
					{
						if (p->data->newrule[i].num_desc & BIN_LARGE_DESC)
						{
							set_short(&(p->data->binary_data[rule_length]),p->data->newrule[i].descript[j].large_desc);
							rule_length+=2;
						}
						else
						{
							set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].descript[j].small_desc);
							rule_length++;
						}
					}
					break;
				case BIN_COPY:
				case BIN_DELETE:
				case BIN_OPTIONAL:
				case BIN_COMP_BREAK:
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_match;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					break;
				case BIN_SAVE:
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
					rule_length++;
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_match;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					break;
				case BIN_MACRO:
					set_short(&(p->data->binary_data[rule_length]),p->data->newrule[i].macro_num);
					rule_length+=2;
					break;
				case BIN_REPLACE:
				case BIN_INSERT:
#if 0
				case BIN_AFTER:
				case BIN_BEFORE:
#endif
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_match;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_action;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					if ((p->data->newrule[i].operation) & BIN_CONDITIONAL_REPLACE)
					{
						set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
						rule_length++;
						for (j=0;j<p->data->newrule[i].data_number;j++)
						{
							k++;
							cur_next_type[k]=rule_length;
							cur_next_type_index[k]=p->data->newrule[i].sections[j];
							cur_next_type_set[k]=2;
							set_byte(&(p->data->binary_data[rule_length]),0);
							rule_length++;
						}
					}
					break;
				case BIN_DICTIONARY:
					set_byte(&(p->data->binary_data[rule_length]),p->data->newrule[i].data_number);
					rule_length++;
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_match;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_hit;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_action;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					break;
				case BIN_STATUS:
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_match;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_action;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					break;
				case BIN_WORD:
					k++;
					cur_next_type[k]=rule_length;
					cur_next_type_index[k]=p->data->newrule[i].end_of_match;
					cur_next_type_set[k]=2;
					set_byte(&(p->data->binary_data[rule_length]),0);
					rule_length++;
					break;
				default:
					printf("\t\tundefined operation");
					break;
				}
				for (j=0;j<=k;j++)
				{
					if (cur_next_type_set[j]==1)
					{
						if ((i+1)==cur_next_type_index[j])
						{
							set_byte((&(p->data->binary_data[cur_next_type[j]])), rule_length);
						}
					}
					else if (cur_next_type_set[j]==2)
					{
						if (i==cur_next_type_index[j])
						{
							set_byte((&(p->data->binary_data[cur_next_type[j]])), rule_length-1);
						}
					}
				}
				i++;
			}

			

		}
		p->data->binary_rule_length=rule_length;
#if 0
		printf("rule_number=%d length=%d\n",p->data->rule_number,p->data->binary_rule_length);
		for (i=0;i<p->data->binary_rule_length;i++)
		{
			printf("0x%02X ",p->data->binary_data[i]);
			if (((i+1)&0x07)==0)
			{
				printf("\n");
			}
		}
		if (((i)&0x07)!=0)
		{
			printf("\n");
		}
		printf("\n");
#endif
		p=p->next;
	}







}





/*
 *	Function Name:
 *		fill_binary_rule_table
 *
 *	Description:
 *		this function allocates the rule data and indexes and fills them with data
 *
 *	Arguments:                                 
 *		INPUT	rule_node	list		The list of rules
 *
 *	Return Value:
 *		int		0 if failure
 *				1 if successful
 *
 *	Comments:
 *		global variables rule_offsets, rule_binary_data and 
 *		total_rule_length are set
 *
 */
int fill_binary_rule_table(rule_node list)
{
  int i;
  int rule_index=0;
  int add_length=0;
  int rule_length=0;
  int rule_add_num=-1;
  
  rule_node p;
  
  rule_offsets=(short *)malloc((rule_count+1)*sizeof(short)+16);
  if (rule_offsets==NULL)
	{
	  fprintf(stderr,"could not allocate rule offsets\n");
	  return(0);
	}
  p=list;
  while (p!=NULL)
	{
	  /* 4 byte align the data */
	  total_rule_length=total_rule_length+((p->data->binary_rule_length+4) & 0xFFFFFFC);
	  p=p->next;
	}
  rule_binary_data=(unsigned char *)malloc(total_rule_length*sizeof(unsigned char )+16);
  if (rule_binary_data==NULL)
	{
	  fprintf(stderr,"could not allocate rule data array\n");
	  return(0);
	}
  p=list;
  while (p!=NULL)
	{
	  rule_add_num++;
	  rule_offsets[rule_add_num]=rule_index;
	  rule_length=p->data->binary_rule_length;
	  add_length=((rule_length+4) & 0xFFFFFFFC)-rule_length;
	  /* add the rule to the array */
	  memcpy(rule_binary_data+rule_index,p->data->binary_data,rule_length);
	  rule_index+=rule_length;
	  /* null terminate the rule */
	  for (i=0;i<add_length;i++)
		{
		  rule_binary_data[rule_index++]=0x00;
		}
	  p=p->next;
	}
  printf("rule_index=%d total_rule_length=%d\n",rule_index,total_rule_length);
  return(1);
}
  


/*
 *	Function Name:
 *		fill_binary_dictionary_table
 *
 *	Description:
 *		This function allocates the dictionary indexes and dictionary
 *		table arrays and fills them with the correct data
 *
 *	Arguments:                        
 *		INPUT	dict_names	dict_list	The list of dictioanries.
 *
 *	Return Value:                                
 *		int		0 if there was a failure
 *				1 if successful
 *
 *	Comments:
 *		global variables dictionary_offsets, dictionary_binary_data, and
 *		total_dict_length are set by this function
 *
 */
int fill_binary_dictionary_table(dict_names dict_list)
{
  int dict_index=0;
  int dict_add_num=-1;
  int from_length=0,to_length=0,total_length=0;
    
  dict_names p;
  dict_node  q;

  p=dict_list;
  if (num_dictionaries==0)
  {
	dictionary_offsets=(short *)malloc(sizeof(short));
	if (dictionary_offsets==NULL)
	{
		fprintf(stderr,"could not allocate dictionary_offsets\n");
		return(0);
	}
	dictionary_offsets[0]=0x0000;
	dictionary_binary_data=(unsigned char *)malloc(sizeof(unsigned char) *4);
	if (dictionary_binary_data==NULL)
	{
		fprintf(stderr,"could not allocate dictionary_binary_data\n");
		return(0);
	}
	memset(dictionary_binary_data,0,sizeof(unsigned char) *4);
	total_dict_length=2;
  }
  else
  {
	while (p!=NULL)
	{
		dict_entry_count+=p->num_entries;
		q=p->dict_entries;
		while (q!=NULL)
		{
			from_length=strlen(q->data->search_graph)+1;
			to_length=strlen(q->data->out_graph)+1;
			total_length=from_length+to_length;
			
			total_dict_length+=total_length;
			q=q->next;
		}
		if (p->next!=NULL)
		{
			total_dict_length+=2;	/* add for the blank at the end of each dictionary */			
			dict_entry_count++;
		}
		p=p->next;
	}
	dictionary_offsets=(short *)malloc((dict_entry_count)*sizeof(short));
	if (dictionary_offsets==NULL)
	{
		fprintf(stderr,"could not allocate dictionary_offsets\n");
		return(0);
	}
	dictionary_binary_data=(unsigned char *)malloc(sizeof(unsigned char)*total_dict_length);
	if (dictionary_binary_data==NULL)
	{
		fprintf(stderr,"could not allocate dictionary_binary_data\n");
		return(0);
	}
	memset(dictionary_binary_data,0,sizeof(unsigned char)*total_dict_length);
	p=dict_list;
	while (p!=NULL)
	{
		q=p->dict_entries;
		while (q!=NULL)
		{
		    /* set the index pointer */
		    dict_add_num++;
		    dictionary_offsets[dict_add_num]=dict_index;
			/* copy the search_graph to the array */
			strcpy(dictionary_binary_data+dict_index,q->data->search_graph);
			dict_index+=strlen(q->data->search_graph);
			/* insert the null */
			dictionary_binary_data[dict_index++]=0x00;
			/* copy the out_graph to the array */
			strcpy(dictionary_binary_data+dict_index,q->data->out_graph);
			dict_index+=strlen(q->data->out_graph);
			/* insert the null */
			dictionary_binary_data[dict_index++]=0x00;
			q=q->next;
		}
		if (p->next!=NULL)
		{
		    /* set the index pointer */
		    dict_add_num++;
		    dictionary_offsets[dict_add_num]=dict_index;
			/* put in the empty entry after each dictionary */
			dictionary_binary_data[dict_index++]=0x00;
			dictionary_binary_data[dict_index++]=0x00;
		}
		p=p->next;
	}
  }
  return(1);
}


/*
 *	Function Name:
 *		
 *
 *	Description:
 *		this function writes the compiled data out to the output file
 *
 *	Arguments:
 *		INPUT	rule_node	list			The list of rule nodes
 *		INPUT	dict_names	dict_list		The list of dictionaries
 *		INPUT	int			*rule_sections	The rule sections array
 *
 *	Return Value:                                
 *		None
 *
 *	Comments:
 *		rule_sections[0] stores the nubmer of rule sections
 *		rule_sections[#] stores the starting rule number of the section
 *
 *		list and dict_list are pointers to linked lists
 *
 */
void write_output(rule_node list,dict_names dict_list,int *rule_sections,char*infile_name,char *outfile_name)
{
	int i,j,k,l,total,longest_from,longest_to,temp;
	dict_names p;
	dict_pointers_t *s;
	dict_node q;
	rule_node r;
	char char_time[30];
	time_t ltime; 

	time(&ltime);	
	/* print the top headers of the table */          
	fprintf(outfile_asc,"/* source file %s */\n",infile_name);
	fprintf(outfile_asc,"/* output file %s */\n",outfile_name);
	strcpy(char_time,ctime(&ltime));
	char_time[strlen(char_time)-1]='\0';
	fprintf(outfile_asc,"/* file created on %s */\n",char_time);
	fprintf(outfile_asc,"\n");
	fprintf(outfile_asc,"const int num_rule_sections=%d;\n\n",rule_sections[0]);
	fprintf(outfile_asc,"const int rule_sections[%d]={",rule_sections[0]);
	for (i=1;i<=rule_sections[0];i++)
	  if (i==rule_sections[0])
		fprintf(outfile_asc,"\t%d",rule_sections[i]);
	  else
		fprintf(outfile_asc,"\t%d,",rule_sections[i]);
	fprintf(outfile_asc,"\t};\n\n");
	fprintf(outfile_asc,"const int num_rules=%d;\n\n",rule_count+1);

	fprintf(outfile_asc,"const int rule_index_table[%d] = {\n",rule_count+1);
	for (i=0;i<rule_count+1;i++)
	  {
		if (i==rule_count)
		{
			fprintf(outfile_asc,"\t0x%04X",rule_offsets[i]);
		}
		else
		{
			if (i!=0 && (i+1)%6==0)
			{
				fprintf(outfile_asc,"\t0x%04X,\n",rule_offsets[i]);
			}
			else
			{
				fprintf(outfile_asc,"\t0x%04X,",rule_offsets[i]);
			}
		}
	  }
	fprintf(outfile_asc,"\n};\n\n");
	fprintf(outfile_asc,"/*\n");
	fprintf(outfile_asc," * in this file, the rule in its old form is printed before the\n");
	fprintf(outfile_asc," * the rule in its new form\n");
	fprintf(outfile_asc," */\n\n");
	fprintf(outfile_asc,"const unsigned char rule_data_table[%d] = {\n",total_rule_length);
	r=list;
	for (i=0,j=0,k=0;i<total_rule_length;i++,k++)
	{
		if ((i==rule_offsets[j]))
		{
			if (k!=0 && k%10!=0)
			{
				fprintf(outfile_asc,"\n");
			}
			/* output the old rule format as a comment */
		/*	fprintf(outfile_asc,"//{\t%d,\t%d,\t0x%08lX,\t0x%08lX,\t%5d,\t%2d,\t%2d,\t%2d,\t%2d,\t%2d,\t%2d,\t\"%s\"\t}\n",
					list->data->special_rule,
					list->data->special_value,
					list->data->lang_flag & 0xFFFFFFFF,
					list->data->mode_flag & 0xFFFFFFFF,
					list->data->rule_number,
					list->data->next_hit_rule,
					list->data->next_miss_rule,
					list->data->next_goret_hit,
					list->data->next_goret_miss,
					list->data->copy_hit,
					list->data->dict_flag,
					list->data->rule); */
			if (j<rule_count)
			{
				j++; /* move to the next rule */
			}
			list=list->next; /* move the list pointer to the next rule */
			k=0;
		}
		/* output the new rule format */
		if (i==total_rule_length-1)
		{
			fprintf(outfile_asc,"  0x%02X",rule_binary_data[i]);
		}
		else
		{
			if (k!=0 && (k+1)%10==0)
			{
				fprintf(outfile_asc,"  0x%02X,\n",rule_binary_data[i]);
			}
			else
			{
				fprintf(outfile_asc,"  0x%02X,",rule_binary_data[i]);
			}		
		}
	  }
	fprintf(outfile_asc,"\n};\n\n");
	list=r;
	fflush(outfile_asc);

	fprintf(outfile_asc,"/* this is table of indexes in the dict_index_table of */\n");
	fprintf(outfile_asc,"/* start, end, and the size each dictionary */\n");
	p=dict_list;
	i=0;
	total=0;
	longest_from=0;
	longest_to=0;
	if (num_dictionaries>0)
	  {
		s=(dict_pointers_t *)malloc(sizeof(struct dict_pointers_s)*num_dictionaries);
		if (s==NULL)
		  {
			printf("not enough memory to allocate the dictionary pointers\n");
			return;
		  }
		while (p!=NULL)
		  {
			s[i].start=total;
			s[i].end=total+p->num_entries-1;
//			s[i].num_entries=p->num_entries;
			temp=find_longest_from(p->dict_entries);
			if (temp>longest_from)
			  longest_from=temp;
			temp=find_longest_to(p->dict_entries);
			if (temp>longest_to)
			  longest_to=temp;
			total+=p->num_entries; /* leave a blank betweeen the dictionaries just in case */
			if (p!=NULL)
			  {
				total++;
			  }
			i++;
			p=p->next;
		  }
	  }
	if (num_dictionaries==0)
	  {
		fprintf(outfile_asc,"const dict_pointers_t dict_point[1]={{0,0}};\n\n");
	  }
	else
	  {
		fprintf(outfile_asc,"const dict_pointers_t dict_point[%d]={\n",i);
		for (j=0;j<i;j++)
		  {
			if (j+1==i)
			  fprintf(outfile_asc,"{\t%5d,\t%5d\t}};\n\n",s[j].start,s[j].end);
			else
			  fprintf(outfile_asc,"{\t%5d,\t%5d\t},\n",s[j].start,s[j].end);
		  }
	  }

	
	if (num_dictionaries==0)
	{
	  fprintf(outfile_asc,"const int dict_index_table[%d] = {\n",1);
		fprintf(outfile_asc,"\t0x0000");
	}
	else
	{
	  fprintf(outfile_asc,"const int dict_index_table[%d] = {\n",dict_entry_count);
		for (i=0;i<dict_entry_count;i++)
		{
			if (i==(dict_entry_count-1))
			{
				fprintf(outfile_asc,"\t0x%04X",dictionary_offsets[i]);
			}
			else
			{
				if (i!=0 && (i+1)%6==0)
				{
					fprintf(outfile_asc,"\t0x%04X,\n",dictionary_offsets[i]);
				}
				else
				{
					fprintf(outfile_asc,"\t0x%04X,",dictionary_offsets[i]);
				}
			}
		}
	}
	fprintf(outfile_asc,"\n};\n\n");
	fflush(outfile_asc);	
	if (num_dictionaries==0)
	{
	    fprintf(outfile_asc,"const unsigned char dict_data_table[%d] = {",2);
//		fprintf(outfile_asc,"\n//{\t\"\",\"\"}\n");
		fprintf(outfile_asc,"\n");
		fprintf(outfile_asc,"  0x00,  0x00");
	}
	else
	{
	    fprintf(outfile_asc,"const unsigned char dict_data_table[%d] = {",total_dict_length);
		p=dict_list;
		q=p->dict_entries;
		for (i=0,j=0,k=0;i<total_dict_length;i++,k++)
		  {
			fflush(outfile_asc);
			if (i==dictionary_offsets[j])
			  {
				if (q==NULL)
				  {
//					fprintf(outfile_asc,"\n//{\t\"\",\"\"}\n");				   
					fprintf(outfile_asc,"\n");				   
					p=p->next;
					if (p!=NULL)
					  {
						q=p->dict_entries;
					  }
				  }
				else
				  {
//					fprintf(outfile_asc,"\n//{\t\"%s\"",q->data->search_graph);
					fprintf(outfile_asc,"\n");
					/*for (l=0;l<(longest_from-strlen(q->data->search_graph));l++)
					  {
						fprintf(outfile_asc," ");
					  }
					fprintf(outfile_asc,",\t\"%s\"",q->data->out_graph);
					for (l=0;l<(longest_to-strlen(q->data->out_graph));l++)
					  {
						fprintf(outfile_asc," ");
					  }
					fprintf(outfile_asc,"\t}\n");		  */
					q=q->next;
				  }
				if (j<(dict_entry_count-1))
				  {
					j++;
				  }
				k=0; /* reset k so the numbers get printed correctly */
			  }
			if (i==total_dict_length-1)
			  {
				fprintf(outfile_asc,"  0x%02X",dictionary_binary_data[i]);
			  }
			else
			  {
				if (k!=0 && (k+1)%10==0)
				  {
					fprintf(outfile_asc,"  0x%02X,\n",dictionary_binary_data[i]);
				  }
				else
				  {
					fprintf(outfile_asc,"  0x%02X,",dictionary_binary_data[i]);
				  }		
			  }
		  }
	  }
	fprintf(outfile_asc,"\n};\n\n");
  }
			  


void write_binary(rule_node list,dict_names dict_list,int *rule_sections,char*infile_name,char *outfile_name)
{
	int i,j,total;
	dict_names p;
	dict_pointers_t *s;

	int zero=0;

	unsigned short temp;

	temp=rule_sections[0];
	fwrite(&temp,2,1,outfile);

	for (i=1;i<=rule_sections[0];i++)
	{
		temp=rule_sections[i];
		fwrite(&temp,2,1,outfile);
	}
	  
	  
	temp=rule_count+1;
	fwrite(&temp,2,1,outfile);


	for (i=0;i<rule_count+1;i++)
	{
		temp=rule_offsets[i];
		fwrite(&temp,2,1,outfile);
	}

	temp=total_rule_length;
	/* write the total_rule_length to the output file */
	fwrite(&temp,2,1,outfile);
	/* write the rule _data to the output file */
	fwrite(rule_binary_data,1,total_rule_length,outfile);
	

	fflush(outfile);

	
	p=dict_list;
	i=0;
	total=0;
	if (num_dictionaries>0)
	  {
		s=(dict_pointers_t *)malloc(sizeof(struct dict_pointers_s)*num_dictionaries);
		if (s==NULL)
		  {
			printf("not enough memory to allocate the dictionary pointers\n");
			return;
		  }
		while (p!=NULL)
		  {
			s[i].start=total;
			s[i].end=total+p->num_entries-1;
//			s[i].num_entries=p->num_entries;
			total+=p->num_entries; /* leave a blank betweeen the dictionaries just in case */
			if (p!=NULL)
			  {
				total++;
			  }
			i++;
			p=p->next;
		  }
	  }
	if (num_dictionaries==0)
	{
		temp=1;
		fwrite(&temp,2,1,outfile);
		fwrite(&zero,2,1,outfile);
		fwrite(&zero,2,1,outfile);
//		fwrite(&zero,2,1,outfile);
	}
	else
	{
		temp=i;
		fwrite(&temp,2,1,outfile);
		for (j=0;j<i;j++)
		{
			temp=s[j].start;
			fwrite(&temp,2,1,outfile);
			temp=s[j].end;
			fwrite(&temp,2,1,outfile);
//			temp=s[j].num_entries;
//			fwrite(&temp,2,1,outfile);
		}
	}

	
	if (num_dictionaries==0)
	{
		temp=1;
		fwrite(&temp,2,1,outfile);
		fwrite(&zero,2,1,outfile);
	}
	else
	{
		temp=dict_entry_count;
		fwrite(&temp,2,1,outfile);
		for (i=0;i<dict_entry_count;i++)
		{
			temp=dictionary_offsets[i];
			fwrite(&temp,2,1,outfile);
		}
	}

	fflush(outfile);	
	
	if (num_dictionaries==0)
	{
		temp=2;
		fwrite(&temp,2,1,outfile);
		fwrite(&zero,2,1,outfile);
		fwrite(&zero,2,1,outfile);
	}
	else
	{
		temp=total_dict_length;
		fwrite(&temp,2,1,outfile);
		fwrite(dictionary_binary_data,1,total_dict_length,outfile);
	}
}
			  
  
void add_define(char defines[50][50],char *sym)
{
	int i=0,j=0;
	while (defines[i][0]!='\0')
		i++;
	if (i>49)
	{
		printf("too many defines\n");
		exit(3);
	}
	strncpy(defines[i],sym,49);
}

int compare_to_defines(char *line,char defines[50][50])
{
	int i=0,j=0;
	char *temp;
	temp=strtok(line," \t\n\r");
	while (defines[i][0]!='\0')
	{
		if (strcmp(defines[i],temp)==0)
		{
			return(1);
		}
		i++;
	}
	return(0);
}
	


/*
 *	Function Name:
 *		Main
 *
 *	Description:
 *		The Main Function 
 *
 *	Arguments:            
 *		INPUT	int		argc	The nubmer of arguments
 *		INPUT	char   *argv[]	The arguemnts
 *
 *	Return Value:                                
 *		int
 *
 *	Comments:
 *
 */
int main(int argc,char *argv[])
{
  int i,j;
  FILE *infile;

  char output_file_asc[20];
  char output_file[20];
  char output_file_temp[20];
  unsigned char input_line[MAX_INPUT_LINE];
  rule_node list=NULL;
  prule_comp_t cur_rule=NULL;
  dict_names dict_list=NULL;
  dict_entry_comp cur_dict_entry_comp=NULL;
  int section=NO_SECTION;
  int num_dict_entries=-1;
  int dict_sections=0;
  char defines[50][50];
  int ifdef_level=-1;
  int skip_ifdef[10] = {0,0,0,0,0,0,0,0,0,0 };

  memset(defines,0,sizeof(defines));
  memset(output_file_asc,0,sizeof(output_file_asc));
  memset(output_file,0,sizeof(output_file));
  memset(output_file_temp,0,sizeof(output_file_temp));
  for (i=0;i<MAX_RULES;i++)
	{
	  rule_indexes[i]=-1;
	}
  line_number=0;
  if (argc<2)
	{
	  printf("usage; par_comp input_file_name <output_file_name> /D symbol\n");
	  printf("                output_file is optional\n");
	  exit(1);
	}
  if ((infile=fopen(argv[1],"r"))==NULL)
	{
	  printf("could not open the input file %s\n",argv[1]);
	  exit(2);
	}
  j=2;
  while (j<argc)
  {
	  if (argv[j][0]=='/')
	  {
		  switch (argv[j][1])
		  {
		  case 'D':
			  if (strlen(argv[j])>2)
			  {
				  add_define(defines,argv[j]+2);
			  }
			  else
			  {
				  if (argc>j+1)
				  {
					  add_define(defines,argv[j+1]);
					  j++;
				  }
			  }
			  break;
		  }
	  }
	  else
	  {
		  strcpy(output_file_temp,argv[j]);
	  }
	  j++;
  }

  if (strlen(output_file_temp)>0)
	{	
	  if (strcmp(strrchr(output_file_temp,'.'),".h")==0)
	  {
		  strcpy(output_file,output_file_temp);
		  strcpy(strrchr(output_file,'.'),".bin");
		  strcpy(output_file_asc,output_file_temp);
	  }
	  else
	  {
		  strcpy(output_file_asc,output_file_temp);
		  strcpy(strrchr(output_file_asc,'.'),".h");
		  strcpy(output_file,output_file_temp);
	  }
	  if ((outfile=fopen(output_file,"wb"))==NULL)
		{
		  printf("could not open the output file %s\n",argv[2]);
		  exit(2);
		}
	  if ((outfile_asc=fopen(output_file_asc,"w"))==NULL)
		{
		  printf("could not open the output file %s\n",output_file_asc);
		  exit(2);
		}
  }
  else

	{
	  strcpy(output_file,argv[1]);
	  strcpy(strrchr(output_file,'.'),".bin");
	  if ((outfile=fopen(output_file,"wb"))==NULL)
		{
		  printf("could not open the output file %s\n",output_file);
		  exit(2);
		}
	  strcpy(output_file_asc,argv[1]);
	  strcpy(strrchr(output_file_asc,'.'),".h");
	  if ((outfile_asc=fopen(output_file_asc,"w"))==NULL)
		{
		  printf("could not open the output file %s\n",output_file_asc);
		  exit(2);
		}
	}
  while(fgets(input_line,MAX_INPUT_LINE-2,infile)!=NULL)
	{
	  line_number++;	  
	  if (strlen(input_line)<2) /* blank or mostly blank lines */
		{
		  continue;
		}
	  if (input_line[0]=='#')
	  {
		  if (strncmp(input_line,"#ifdef ",7)==0)
		  {
			  if (ifdef_level>=9)
			  {
				  printf("too many nested ifdefes in line %d\n",line_number);
				  exit(7);
			  }
			  ifdef_level++;
			  if (ifdef_level>=1 && skip_ifdef[ifdef_level-1]==-1)
			  {
				  skip_ifdef[ifdef_level]=-1;
				  continue;
			  }
			  if (compare_to_defines(input_line+7,defines)==1)
			  {
				  skip_ifdef[ifdef_level]=1;
			  }
			  else
			  {
				  skip_ifdef[ifdef_level]=-1;
			  }
		  }
		  else if (strncmp(input_line,"#ifndef ",8)==0)
		  {
			  if (ifdef_level>=9)
			  {
				  printf("too many nested ifdefes in line %d\n",line_number);
				  exit(7);
			  }
			  ifdef_level++;
			  if (ifdef_level>=1 && skip_ifdef[ifdef_level-1]==-1)
			  {
				  skip_ifdef[ifdef_level]=-1;
				  continue;
			  }
			  if (compare_to_defines(input_line+7,defines)==0)
			  {
				  skip_ifdef[ifdef_level]=1;
			  }
			  else
			  {
				  skip_ifdef[ifdef_level]=-1;
			  }
		  }
		  else if (strncmp(input_line,"#endif",6)==0)
		  {
			  if (ifdef_level==-1)
			  {
				  printf("unmatched #endif found on line %d\n",line_number);
				  exit(2);
			  }
			  skip_ifdef[ifdef_level]=0;
			  ifdef_level--;
		  }
		  else if (strncmp(input_line,"#else",5)==0)
		  {
			  if (skip_ifdef[ifdef_level-1]==-1)
			  {
				  continue;
			  }
			  if (skip_ifdef[ifdef_level]==1)
			  {
				  skip_ifdef[ifdef_level]=-1;
			  }
			  else if (skip_ifdef[ifdef_level]==-1)
			  {
				  skip_ifdef[ifdef_level]=1;
			  }
			  else
			  {
				  printf("#else found with out and matching #ifdef\n");
				  exit(4);
			  }
		  }
		  else
		  {
			  printf("# directive %s not understood at line %d\n",input_line,line_number);
			  exit(1);
		  }
		  
		  continue;
	  }
	  if (ifdef_level>=0 && skip_ifdef[ifdef_level]==-1)
	  {
		  continue;
	  }
	  if (strlen(input_line)>MAX_INPUT_LINE-10 && input_line[strlen(input_line)-1]!='\n')
		{
		  printf("rule to long in line number %d line %s\n",line_number,input_line);
		  free_rule_list(list);
		  free_dict_names_list(dict_list);
		  exit(3);
		}
	  if (input_line[strlen(input_line)-1]=='\n')
		  input_line[strlen(input_line)-1]='\0';
	  if (input_line[0]==';')
		{
		  continue;
		}
	  if (input_line[0]==SECTION_MARKER)
	  {
		  if (strnicmp(input_line+1,"rule",4)==0)
		  {
			  if ((list!=NULL) && (list->data->special_rule!=STOP_TAG_VALUE))
			  {
				  rule_count++;
				  cur_rule=convert_rule_line("STOP,R32766");
				  if (cur_rule==NULL)
				  {
					free_rule_list(list);
					free_dict_names_list(dict_list);
					exit(4);
				  }
				  list=add_node(list,cur_rule);
			  }
			  rule_sections[++rule_sections[0]]=rule_count+1;
			  section=RULE_SECTION;
		  }
		  if (strnicmp(input_line+1,"dict",4)==0)
		  {
			  if (input_line[strlen(input_line)-1]!=']')
			  {
				  printf("invalid dictionary section marker found on line %d",line_number);
				  free_rule_list(list);
				  free_dict_names_list(dict_list);
				  exit(8);
			  }
			  num_dict_entries++;
			  dict_sections++;
			  input_line[strlen(input_line)-1]='\0';
			  dict_list=add_dictionary_to_list(dict_list,input_line+6);
			  if (dict_list==NULL)
			  {
				  free_rule_list(list);
				  exit(8);
			  }
			  section=DICT_SECTION;
		  }
		  continue;
	  }
	  if (section==RULE_SECTION)
	  {
		rule_count++;
		cur_rule=convert_rule_line(input_line);
		if (cur_rule==NULL)
		{
		  free_rule_list(list);
		  free_dict_names_list(dict_list);
		  exit(4);
		}
	    list=add_node(list,cur_rule);
		if (list==NULL)
		{
			free_dict_names_list(dict_list);
			exit(2);
		}
	  }
	  if (section==DICT_SECTION)
	  {
		  cur_dict_entry_comp=convert_dict_line(input_line);
		  if (cur_dict_entry_comp==NULL)
		  {
			  free_dict_names_list(dict_list);
			  free_rule_list(list);
			  exit(5);
		  }
		  add_entry_to_dict(dict_list,cur_dict_entry_comp);
		  num_dict_entries++;
	  }      
	}
  fclose(infile);
  if (section==NO_SECTION)
  {
	  printf("no sections found in the rule file\n");
	  exit(6);
  }
  if (list!=NULL)  
	  list=reverse_rule_list(list);
  if (dict_list!=NULL)
	  dict_list=reverse_dict_list(dict_list);
  update_rule_numbers(list,dict_list);
  convert_all_rules_to_binary(list);
//  dump_new_rules(list);		/* temporary */
  create_binary_rules(list);
  if (dict_list!=NULL)
	  sort_dictionaries(dict_list);
  if (fill_binary_rule_table(list)==0)
	{
	  free_rule_list(list);
	  free_dict_names_list(dict_list);
	  return(-1);
	}
  if (fill_binary_dictionary_table(dict_list)==0)
	{
	  free_rule_list(list);
	  free_dict_names_list(dict_list);
	  return(-1);
	}
  write_binary(list,dict_list,rule_sections,argv[1],output_file);
  write_output(list,dict_list,rule_sections,argv[1],output_file_asc);
  fclose(outfile);
  fclose(outfile_asc);
  free_rule_list(list);
  free_dict_names_list(dict_list);
  printf("total_rule_length=%d\n",total_rule_length);
  printf("total_dict_length=%d\n",total_dict_length);
  printf("total data used = %d\n",total_rule_length+total_dict_length+num_dictionaries*sizeof(short)*3+dict_entry_count*sizeof(short)+(rule_count+1)*sizeof(short)+sizeof(short)*4);
  printf("the number of rules is %d in %d sections\n",rule_count+1,rule_sections[0]);
  printf("the number of dictionary entries is %d in %d sections\n",num_dict_entries,dict_sections);
  return(0);
}
	  

	  
		  

	  

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "port.h"
#include "par_def.h"

#include "par_c2.h"

extern int cur_index;
extern int prev_char_type_index;
extern int old_char_type;
extern int dictionary_levels[100];
extern int cur_dict_level;

extern short rule_indexes[MAX_RULES];		/* this is why it can't be built on ms-dos */
extern int line_number;
extern int rule_count;
extern int current_rule_number;
extern int num_dictionaries;
extern int rule_sections[MAX_SECTIONS];

/* the total length of the rule table */
extern int total_rule_length;
/* the table of indexes for the rules */
extern short *rule_offsets;
/* the rule data table */
extern unsigned char *rule_binary_data;

/* the total length of the dictionaries */
extern int total_dict_length;
/* the nubmer of entries in the dictioanry */
extern int dict_entry_count;

/* the dictionary indexes for the entries */ 
extern short *dictionary_offsets;
/* the dictionary data */
extern unsigned char *dictionary_binary_data;

/* from par_char.c */
extern unsigned short parser_char_types[];
extern unsigned char par_lower[];
extern unsigned char par_upper[];

/* from par_ambi.c */
extern char ambiguous_char[15][20];

/*
 *	Function Name:
 *		bin_match_rule
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
 *		this function and the following bin_match_* functions mimic the logic of the parser itself
 *
 */
void bin_match_rule(char *rule,action_rule_t *newrule,int *index,int state,char end)
{
	int new_state,new_char,save_num,new_num;
	int new_len,keep_index;
	int i;
	int in_index;
	int temp_char_index;
	int first_time=1;
	
#ifdef DEBUG
printf("entering bin_match_rule\n");
par_print_rule_error(rule,(*index));
#endif

	in_index=cur_index;

	if (state==NULL_STATE)
	{
		end=End_Is_Null;
		first_time=0;
//		assign_operation(newrule,1,NULL_STATE,in_index);
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
		set_save_data_target(newrule,in_index,save_num);
		end=End_Is_Paren;
		(*index)+=2; /* skip the digit and the comma */
	}       
	if (state==DICTIONARY_STATE)
	{
		cur_dict_level++;
		dictionary_levels[cur_dict_level]=in_index;
		keep_index=(*index);
		i=0;
		new_num=0;
		while (rule[keep_index]!='\0' && rule[keep_index]!=',')
		{
			new_num*=10;
			new_num+=(rule[keep_index]-'0');
			keep_index++;
		}
		(*index)=keep_index;
		set_dictionary_number(newrule,in_index,new_num);
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
		new_num=atoi(rule+(*index));
		if (new_num==-1)
		{
			printf("no such rule number R%d in rule R%d\n",save_num,current_rule_number);
			par_print_rule_error(rule,(*index));
			exit(0);
		}
		set_macro_number(newrule,in_index,new_num);
		new_len=par_get_int_length(new_num);
		(*index)+=new_len;
		/* place the new number into the rule at position index */
	}
	else
	{
		while (rule[(*index)]!=end)
		{
			if ((new_char=par_get_char_type(rule[(*index)]))!=NULL_TYPE)
			{
				if (first_time==0)
				{
					first_time=1;
				}
				else
				{
					cur_index++;
				}
				temp_char_index=cur_index;
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
					assign_operation(newrule,2,new_char,cur_index);
					set_lookahead_to(newrule,cur_index);
					/* if lookahead to is set in this type, lookahead from should be set 
					   in the previous type if it exists, if it is not set */
					if (prev_char_type_index!=-1)
					{
						set_lookahead_from(newrule,prev_char_type_index);
					}
					bin_match_string(rule,newrule,index,new_char);
				}
				else
				{
					assign_operation(newrule,2,new_char,cur_index);
					bin_match_string(rule,newrule,index,new_char);
				}
				/* lookahead and ambiguity lookups and turning off of lookahead are done from the 
				   current type backwards because we are in the compiler and can do this easily. */

				/* some checks for disabling lookahead from the previous type should go here */

				/* set the previous character type index so the next character type can find it */

				/* if there is only 1 descriptor and the descriptor is not any number,
				   disable lookahead from */
				if ((newrule[temp_char_index].num_desc & BIN_SIZE_DESC_MASK) == 1)
				{
					if (newrule[temp_char_index].num_desc & BIN_LARGE_DESC)
					{
						if (!(newrule[temp_char_index].descript[0].large_desc & BIN_LARGE_ANY_NUMBER))
						{
							set_lookahead_from(newrule,temp_char_index);
						}
					}
					else
					{
						if (!(newrule[temp_char_index].descript[0].small_desc & BIN_SMALL_ANY_NUMBER))
						{
							set_lookahead_from(newrule,temp_char_index);
						}
					}
				}
				/* no lookahead to sets, so set lookahead from the previous type */
				if (check_types(newrule,prev_char_type_index,temp_char_index,old_char_type))
				{
					if (cur_dict_level!=-1)
					{
						if (dictionary_levels[cur_dict_level]>0)
						{
							set_next_type(newrule,prev_char_type_index,dictionary_levels[cur_dict_level]);
						}
						else
						{
							set_next_type(newrule,prev_char_type_index,temp_char_index);
						}
					}
					else
					{
						set_next_type(newrule,prev_char_type_index,temp_char_index);
					}
				}
				else
				{
					if (prev_char_type_index!=-1)
					{
						set_lookahead_from(newrule,prev_char_type_index);
					}
					set_lookahead_to(newrule,temp_char_index);
				}
				if (cur_dict_level!=-1)
				{
					dictionary_levels[cur_dict_level]=-dictionary_levels[cur_dict_level];
				}
				prev_char_type_index=temp_char_index;
				old_char_type=new_char;
			}
			else
			{
				if ((new_state=par_get_state(rule[(*index)]))!=NULL_STATE)
				{
					if (first_time==0)
					{
						first_time=1;
					}
					else
					{
						cur_index++;
					}
					assign_operation(newrule,1,new_state,cur_index);
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
					/* macro state has no lookahead to it */
					if (new_state==MACRO_STATE)
					{
						if (prev_char_type_index!=-1)
						{
							set_lookahead_from(newrule,prev_char_type_index);
						}
					}
					bin_match_rule(rule,newrule,index,new_state,End_Is_Slash);
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
	{
		(*index)++;
		set_end_of_match(newrule,in_index,cur_index);
	}

	bin_perform_action(rule,newrule,in_index,index,state);
	if (state==DICTIONARY_STATE)
	{
		dictionary_levels[cur_dict_level]=0;
		cur_dict_level--;
	}

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
void bin_perform_action(char *rule,action_rule_t *newrule, int in_index,int *index,int state)
{
	int new_char;
	int save_char_type_index;
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
		case	COMPOUND_BREAK_STATE:
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
				{
					add_conditional_to_action(newrule,in_index,cur_index);
					(*index)++;
				}
				cur_index++;
				new_char=par_get_char_type(rule[(*index)]);
				assign_operation(newrule,2,new_char,cur_index);

				bin_match_string(rule,newrule,index,new_char);
				if (rule[(*index)]=='|')
				{
					add_conditional_to_action(newrule,in_index,cur_index);
					(*index)++;
				}
			}
			(*index)++;
			set_end_of_action(newrule,in_index,cur_index);
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
				set_dict_hit_fail(newrule,in_index);
			}
			else
			{
				cur_index++;
				save_char_type_index=prev_char_type_index;
				prev_char_type_index=-1;
				assign_operation(newrule,1,COPY_STATE,cur_index);
				bin_match_rule(rule,newrule,index,COPY_STATE,'|');
				if (prev_char_type_index!=-1)
				{
					if (((newrule[prev_char_type_index].operation) & BIN_OPERATION_MASK) >= 0x01 && 
						((newrule[prev_char_type_index].operation) & BIN_OPERATION_MASK) <= 0x0F)
					{
						set_lookahead_from(newrule,prev_char_type_index);
					}
				}
				prev_char_type_index=save_char_type_index;
			}
			set_end_of_hit(newrule,in_index,cur_index);
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
				set_dict_miss_fail(newrule,in_index);
			}
			else
			{
				cur_index++;
				printf("save_char_type_index = %d\n",save_char_type_index);
				prev_char_type_index=-1;
				assign_operation(newrule,1,COPY_STATE,cur_index);
				bin_match_rule(rule,newrule,index,COPY_STATE,'/');
				if (prev_char_type_index!=-1)
				{
					if (((newrule[prev_char_type_index].operation) & BIN_OPERATION_MASK) >= 0x01 && 
						((newrule[prev_char_type_index].operation) & BIN_OPERATION_MASK) <= 0x0F)
					{
						set_lookahead_from(newrule,prev_char_type_index);
					}
				}
				prev_char_type_index=save_char_type_index;

			}
			set_end_of_action(newrule,in_index,cur_index);
			break;
		default:
			break;
	}
}            
		

/*
 *	Function Name:
 *		bin_match_string
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
void bin_match_string(char *rule,action_rule_t *newrule,int *index,int char_type)
{
	int i=0;
	int j=0;
	int in_index=cur_index;
	char temps[256];

#ifdef DEBUG
printf("entering bin_match_string\n");
par_print_rule_error(rule,(*index));
#endif
	memset(temps,0,256);
	switch(char_type)
	{
		case	EXACT_CHAR_TYPE:
			(*index)++;
			i=(*index);
			j=0;
			while (rule[(*index)]!=EXACT_CHAR_DELIM)
			{
				if (rule[(*index)]==ESCAPE_DELIM)
				{
					(*index)++;
				}
				temps[j]=rule[(*index)];
				j++;
				(*index)++;
			}
			(*index)++;
			set_string_data(newrule,in_index,temps,j);
			break;
		case	EXACT_CASE_TYPE:
			(*index)++;
			i=(*index);
			j=0;
			while (rule[(*index)]!=EXACT_CASE_DELIM)
			{
				if (rule[(*index)]==ESCAPE_DELIM)
				{
					(*index)++;
				}
				temps[j]=rule[(*index)];
				j++;
				(*index)++;
			}
			(*index)++;
			set_string_data(newrule,in_index,temps,j);
			set_case_insen(newrule,in_index);
			break;
		case	HEXADECIMAL_TYPE:
			if ((i=par_convert_hex_number(rule+(*index),2))<0)
			{
				printf("error in hexadecimal type in rule R%d\n",current_rule_number);
				par_print_rule_error(rule,(*index));
			}
			set_hex_number(newrule,in_index,i);
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
			i=(rule[(*index)]-'0');
			set_restore_number(newrule,in_index,i);
			(*index)++;
			break;
		case	SET_CHAR_TYPE:
			bin_match_set(rule,newrule,index);
			break;
		case	DIGIT_CHAR_TYPE:
			if ((rule[(*index)+1]=='[') || (rule[(*index)+2]=='['))
			{
				set_digit_range(newrule,in_index);
				bin_match_digit(rule,newrule,index);
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
			bin_match_standard(rule,newrule,index);
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
 *		bin_match_standard	
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
void bin_match_standard(char *rule,action_rule_t *newrule,int *index)
{
	int in_index=cur_index;
	int i;

	(*index)++;
	if (rule[(*index)]==NO_LOOKAHEAD)
	{
		(*index)++;
		set_lookahead_from(newrule,in_index);
	}
	if (rule[(*index)]=='~')
	{
		(*index)++;
		set_compliment(newrule,in_index);
	}
	if (rule[(*index)]==NO_LOOKAHEAD)
	{
		(*index)++;
		set_lookahead_from(newrule,in_index);
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
				set_descriptor_number(newrule,in_index,0,1);
				set_any_number(newrule,in_index,0);
				break;
			case '+':
				(*index)++;
				if (rule[(*index)]!='>')
				{
					printf("> not found after + in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				set_descriptor_number(newrule,in_index,1,1);
				set_any_number(newrule,in_index,0);
				break;                         
			case ',':
				(*index)++;
				break;
			default:
				(*index)+=par_get_int_length((i=atoi(rule+(*index))));
				set_descriptor_number(newrule,in_index,i,1);
				switch(rule[(*index)])
				{
					case ',':
						(*index)++;
						break;
					case '>':
						break;
					case '-':
						set_continue(newrule,in_index,0);
						(*index)++;
						switch (rule[(*index)])
						{
							case '*':
								(*index)++;
								if (rule[(*index)]!='>')
								{
									printf("> not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								set_descriptor_number(newrule,in_index,0,1);
								set_any_number(newrule,in_index,0);
								break;
							case '+':
								(*index)++;
								if (rule[(*index)]!='>')
								{
									printf("> not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								set_descriptor_number(newrule,in_index,1,1);
								set_any_number(newrule,in_index,0);
								break;
							default:
								(*index)+=par_get_int_length((i=atoi(rule+(*index))));
								if (rule[(*index)]!='>' && rule[(*index)]!=',')
								{
									printf("expected > or , after range in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index));
									exit(1);
								}
								set_descriptor_number(newrule,in_index,i,1);
								break;
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
 *		bin_match_digit
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
void bin_match_digit(char *rule,action_rule_t *newrule,int *index)
{
	int in_index=cur_index;
	int i;
	(*index)++;
	if (rule[(*index)]==NO_LOOKAHEAD)
	{
		(*index)++;
		set_lookahead_from(newrule,in_index);
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
				set_descriptor_number(newrule,in_index,0,1);
				set_any_number(newrule,in_index,0);
				break;
			case '+':
				(*index)++;
				if (rule[(*index)]!=']')
				{
					printf("] not found after + in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				set_descriptor_number(newrule,in_index,1,1);
				set_any_number(newrule,in_index,0);
				break;                         
			case ',':
				(*index)++;
				break;
			default:
				(*index)+=par_get_int_length((i=atoi(rule+(*index))));
				set_descriptor_number(newrule,in_index,i,1);
				switch(rule[(*index)])
				{
					case ',':
						(*index)++;
						break;
					case ']':
						break;
					case '-':
						(*index)++;
						set_continue(newrule,in_index,0);
						switch (rule[(*index)])
						{
							case '*':
								(*index)++;
								if (rule[(*index)]!=']')
								{
									printf("] not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								set_descriptor_number(newrule,in_index,0,1);
								set_any_number(newrule,in_index,0);
								break;
							case '+':
								(*index)++;
								if (rule[(*index)]!=']')
								{
									printf("] not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								set_descriptor_number(newrule,in_index,1,1);
								set_any_number(newrule,in_index,0);
								break;
							default:
								(*index)+=par_get_int_length((i=atoi(rule+(*index))));
								if (rule[(*index)]!=']' && rule[(*index)]!=',')
								{
									printf("expected ] or , after range in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index));
									exit(1);
								}
								set_descriptor_number(newrule,in_index,i,1);
								break;
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
 *		bin_match_set
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
void bin_match_set(char *rule,action_rule_t *newrule,int *index)
{
	int in_index;
	int new_char;
	int i;
	in_index=cur_index;

	set_lookahead_from(newrule,in_index);
	set_lookahead_to(newrule,in_index);

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
			cur_index++;
			new_char=par_get_char_type(rule[(*index)]);
			assign_operation(newrule,2,new_char,cur_index);
			bin_match_string(rule,newrule,index,new_char);

			/* the same checking for character types has to be done here as if it was done */
			/* above in bin_match_rule, but this would change how the parser acts. so I wont */

			set_lookahead_from(newrule,cur_index);
			set_lookahead_to(newrule,cur_index);

		}
		/* add the section at ',' or '}' */
		add_section_to_set(newrule,in_index,cur_index);
		if (rule[(*index)]!='}')
		{
			(*index)++;
		}
	}
	(*index)++;					
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
				set_descriptor_number(newrule,in_index,0,1);
				set_any_number(newrule,in_index,0);
				break;
			case '+':
				(*index)++;
				if (rule[(*index)]!='>')
				{
					printf("> not found after + in rule R%d\n",current_rule_number);
					par_print_rule_error(rule,(*index));
					exit(1);
				}
				set_descriptor_number(newrule,in_index,1,1);
				set_any_number(newrule,in_index,0);
				break;                         
			case ',':
				(*index)++;
				break;
			default:
				(*index)+=par_get_int_length((i=atoi(rule+(*index))));
				set_descriptor_number(newrule,in_index,i,1);
				switch(rule[(*index)])
				{
					case ',':
						(*index)++;
						break;
					case '>':
						break;
					case '-':
						set_continue(newrule,in_index,0);
						(*index)++;
						switch (rule[(*index)])
						{
							case '*':
								(*index)++;
								if (rule[(*index)]!='>')
								{
									printf("> not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								set_descriptor_number(newrule,in_index,0,1);
								set_any_number(newrule,in_index,0);
								break;
							case '+':
								(*index)++;
								if (rule[(*index)]!='>')
								{
									printf("> not found after * or + in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index)); 
									exit(1);
								}
								set_descriptor_number(newrule,in_index,1,1);
								set_any_number(newrule,in_index,0);
								break;
							default:
								(*index)+=par_get_int_length((i=atoi(rule+(*index))));
								if (rule[(*index)]!='>' && rule[(*index)]!=',')
								{
									printf("expected > or , after range in rule R%d\n",current_rule_number);
									par_print_rule_error(rule,(*index));
									exit(1);
								}
								set_descriptor_number(newrule,in_index,i,1);
								break;
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
			

void assign_operation(action_rule_t *newrule,int type, int in_op,int index)
{
	int op=0;
	switch (type)
	{
	case 1:
		switch(in_op)
		{
		case NULL_STATE:
		case COPY_STATE:
			op=BIN_COPY;
			break;
		case DELETE_STATE:
			op=BIN_DELETE;
			break;
		case OPTIONAL_STATE:
			op=BIN_OPTIONAL;
			break;
		case SAVE_STATE:
			op=BIN_SAVE;
			break;
		case MACRO_STATE:
			op=BIN_MACRO;
			break;
		case REPLACE_STATE:
			op=BIN_REPLACE;
			break;
		case INSERT_STATE:
			op=BIN_INSERT;
			break;
		case INSERT_AFTER_STATE:
//			op=BIN_AFTER;
			op=BIN_INSERT;
			break;
		case INSERT_BEFORE_STATE:
//			op=BIN_BEFORE;
			op=BIN_INSERT;
			break;
		case DICTIONARY_STATE:
			op=BIN_DICTIONARY;
			break;
		case STATUS_STATE:
			op=BIN_STATUS;
			break;
		case WORD_STATE:
			op=BIN_WORD;
			break;
		case COMPOUND_BREAK_STATE:
			op=BIN_COMP_BREAK;
			break;
		default:
			op=BIN_END_OF_RULE;
			break;
		}
		break;
	case 2:	
		switch (in_op)
		{
		case ALPHA_NUM_CHAR_TYPE:
			op=0x01;
			break;
		case ANY_ALPHA_CHAR_TYPE:
			op=0x02;
			break;
		case ANY_CHAR_CHAR_TYPE:
			op=0x03;
			break;
		case CLAUSE_CHAR_TYPE:
			op=0x04;
			break;
		case CONSONANT_CHAR_TYPE:
			op=0x05;
			break;
		case LOWER_CHAR_TYPE:
			op=0x06;
			break;
		case NON_ALPHA_CHAR_TYPE:
			op=0x07;
			break;
		case NUMBER_CHAR_TYPE:
			op=0x08;
			break;
		case SOME_PUNCT_TYPE:
			op=0x09;
			break;
		case PUNCT_CHAR_TYPE:
			op=0x0A;
			break;
		case UPPER_CHAR_TYPE:
			op=0x0B;
			break;
		case VOWEL_CHAR_TYPE:
			op=0x0C;
			break;
		case VOWEL_NON_Y_TYPE:
			op=0x0D;
			break;
		case WHITE_CHAR_TYPE:
			op=0x0E;
			break;
		case DIGIT_CHAR_TYPE:
			op=0x0F;
			break;
		case EXACT_CHAR_TYPE:
			op=0x10;
			break;
		case EXACT_CASE_TYPE:
			op=0x10;
			break;
		case HEXADECIMAL_TYPE:
			op=0x11;
			break;
		case SAVE_CHAR_TYPE:
			op=0x12;
			break;
		case SET_CHAR_TYPE:
			op=0x13;
			break;
		default:
			op=0x00;
			break;
		}
		break;
	default:
		op=0x00;
		break;
	}
	set_binary_operation(newrule,index,op);
	if (type==1)
	{
		if (in_op==INSERT_AFTER_STATE)
		{
			set_after_flag(newrule,index);
		}
		if (in_op==INSERT_BEFORE_STATE)
		{
			set_before_flag(newrule,index);
		}
	}
}

void set_binary_operation(action_rule_t *newrule,int index,int op)
{
	newrule[index].operation&=BIN_OPERATION_FLAG_MASK;
	newrule[index].operation|=op;
}

void set_lookahead_from(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_LOOK_FROM_DISABLE;
}


void set_lookahead_to(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_LOOK_TO_DISABLE;
}

void set_digit_range(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_DIGIT_RANGE;
}

void set_case_insen(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_CASE_INSEN;
}

void set_conditional_replace(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_CONDITIONAL_REPLACE;
}

void set_after_flag(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_AFTER_FLAG;
}

void set_before_flag(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_BEFORE_FLAG;
}

void add_conditional_to_action(action_rule_t *newrule,int index,int number)
{
	if (prev_char_type_index!=-1)
	{
		if (((newrule[prev_char_type_index].operation & BIN_OPERATION_MASK) != BIN_DIGIT) && 
		    ((newrule[prev_char_type_index].operation & BIN_OPERATION_MASK) != BIN_SETS) ) 
		{
			fprintf(stderr,"conditional replacements can only be done from digit and set character types\n");
			exit(345);
		}
	}
	set_conditional_replace(newrule,index);
	if (newrule[index].data_number >=254)
	{
		fprintf(stderr,"too many conditional repalcementsin rule\n");
		exit(2342);
	}
	newrule[index].sections[newrule[index].data_number]=number;
	newrule[index].data_number++;
}

void set_compliment(action_rule_t *newrule, int index)
{
	newrule[index].num_desc|=BIN_COMPLIMENT;
}

void set_large_desc(action_rule_t *newrule, int index)
{
	newrule[index].num_desc|=BIN_LARGE_DESC;
}

void add_descriptor_to_list(action_rule_t *newrule,int index)
{
	if ((newrule[index].num_desc & BIN_SIZE_DESC_MASK) == BIN_SIZE_DESC_MASK)
	{
		printf("too many descriptors\n");
		exit(0);
	}
	newrule[index].num_desc++;
}

int get_desc_index(action_rule_t *newrule,int index)
{
	return(((newrule[index].num_desc) & BIN_SIZE_DESC_MASK)-1);
}

void set_any_number(action_rule_t *newrule,int index,int next)
{
	int desc_index;
	if (next)
	{
		add_descriptor_to_list(newrule,index);
	}
	desc_index=get_desc_index(newrule,index);
	if (newrule[index].num_desc & BIN_LARGE_DESC)
	{
		newrule[index].descript[desc_index].large_desc|=BIN_LARGE_ANY_NUMBER;
	}
	else
	{
		newrule[index].descript[desc_index].small_desc|=BIN_SMALL_ANY_NUMBER;
	}
}

void set_continue(action_rule_t *newrule,int index,int next)
{
	int desc_index;
	if (next)
	{
		add_descriptor_to_list(newrule,index);
	}
	desc_index=get_desc_index(newrule,index);
	if (newrule[index].num_desc & BIN_LARGE_DESC)
	{
		newrule[index].descript[desc_index].large_desc|=BIN_LARGE_CONTINUE;
	}
	else
	{
		newrule[index].descript[desc_index].small_desc|=BIN_SMALL_CONTINUE;
	}
}

void set_descriptor_number(action_rule_t *newrule,int index,int value,int next)
{
	int desc_index;
	int temp=0;
	if (value > BIN_MAX_LARGE_DESC)
	{
		printf("size descriptor too large. max is %d\n",BIN_MAX_LARGE_DESC);
		exit(0);
	}
	if (next)
	{
		add_descriptor_to_list(newrule,index);
	}
	desc_index=get_desc_index(newrule,index);
	if (newrule[index].num_desc & BIN_LARGE_DESC)
	{
		temp=newrule[index].descript[desc_index].large_desc;
		temp&=BIN_LARGE_DESC_FLG_MASK;
		temp|=value;
		newrule[index].descript[desc_index].large_desc=temp;
	}
	else
	{
		if (value > BIN_MAX_SMALL_DESC)
		{
			convert_desc_to_large(newrule,index);
			temp=newrule[index].descript[desc_index].large_desc;
			temp&=BIN_LARGE_DESC_FLG_MASK;
			temp|=value;
			newrule[index].descript[desc_index].large_desc=temp;
		}
		else
		{
			temp=newrule[index].descript[desc_index].small_desc;
			temp&=BIN_SMALL_DESC_FLG_MASK;
			temp|=value;
			newrule[index].descript[desc_index].small_desc=temp;
		}
	}
}
		

void convert_desc_to_large(action_rule_t *newrule,int index)
{
	int number_desc=0;
	int i;

	if (newrule[index].num_desc & BIN_LARGE_DESC)
		return;
	newrule[index].num_desc |= BIN_LARGE_DESC;
	number_desc=((newrule[index].num_desc) & BIN_SIZE_DESC_MASK);
	for (i=0;i<number_desc;i++)
	{
		newrule[index].descript[i].large_desc = ((newrule[index].descript[i].small_desc) & BIN_MAX_SMALL_DESC);
		if (newrule[index].descript[i].small_desc & BIN_SMALL_CONTINUE)
		{
			newrule[index].descript[i].large_desc |= BIN_LARGE_CONTINUE;
		}
		if (newrule[index].descript[i].small_desc & BIN_SMALL_ANY_NUMBER)
		{
			newrule[index].descript[i].large_desc |= BIN_LARGE_ANY_NUMBER;
		}
	}
}

void set_save_data_target(action_rule_t *newrule,int index,int number)
{
	newrule[index].data_number=number;
}

void set_dictionary_number(action_rule_t *newrule,int index,int number)
{
	newrule[index].data_number=number;
}

void set_macro_number(action_rule_t *newrule,int index,int number)
{
	newrule[index].macro_num=number;
}

void set_end_of_match(action_rule_t *newrule,int index,int cur_index)
{
	newrule[index].end_of_match=cur_index;
}

void set_end_of_action(action_rule_t *newrule,int index,int cur_index)
{
	newrule[index].end_of_action=cur_index;
}

void set_end_of_hit(action_rule_t *newrule,int index,int cur_index)
{
	newrule[index].end_of_hit=cur_index;
}

void set_dict_hit_fail(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_DICT_HIT_FAIL;
}


void set_dict_miss_fail(action_rule_t *newrule,int index)
{
	newrule[index].operation|=BIN_DICT_MISS_FAIL;
}

void set_string_data(action_rule_t *newrule, int index, char *string,int length)
{
	strcpy(newrule[index].data,string);
	newrule[index].data_number=strlen(string);
}

void set_hex_number(action_rule_t *newrule, int index,int number)
{
	newrule[index].data_number=number;
}

void set_restore_number(action_rule_t *newrule,int index,int number)
{
	newrule[index].data_number=number;
}

void add_section_to_set(action_rule_t *newrule,int index,int cur_index)
{
	if (newrule[index].data_number > 255)
	{
		printf("too many section in a set\n");
		exit(0);
	}
	newrule[index].sections[newrule[index].data_number]=cur_index;
	newrule[index].data_number++;
}

void set_next_type(action_rule_t *newrule,int index,int type_index)
{
	if (!(newrule[index].operation & BIN_LOOK_FROM_DISABLE))
	{
		newrule[index].next_type=type_index;
	}
}


/* lookahead and ambiguity lookups and turning off of lookahead are done from the 
   current type backwards because we are in the compiler and can do this easily. */

/* some checks for disabling lookahead from the previous type should go here */
/* set the previous character type index so the next character type can find it */
/* no lookahead to sets, so set lookahead from the previous type */
int check_types(action_rule_t *newrule, int prev_index,int cur_index,int prev_old_type)
{
	int cur_type=0;
	int cur_comp=0;
	int cur_digit_range=0;
	int prev_type=0;
	int prev_comp=0;
	int prev_digit_range=0;

	if (prev_index == -1 || cur_index == -1)
	{
		return(0);
	}
	
	prev_type=(newrule[prev_index].operation & BIN_OPERATION_MASK);

	switch (newrule[prev_index].operation & BIN_OPERATION_MASK)
	{
	case BIN_DIGIT:	
		if (newrule[prev_index].operation * BIN_DIGIT_RANGE)
		{
			prev_digit_range=1;
			break;
		}
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
		if (newrule[prev_index].num_desc & BIN_COMPLIMENT)
		{
			prev_comp=1;
		}
		break;
	case BIN_EXACT:
	case BIN_HEXADECIMAL:
	case BIN_RESTORE:
	case BIN_SETS:
		/* no lookahead is performed from these types */
		return(0);
	default:
		printf("undefined operation");
		break;
	}


	cur_type=(newrule[cur_index].operation & BIN_OPERATION_MASK);

	switch ( newrule[cur_index].operation & BIN_OPERATION_MASK)
	{
	case BIN_DIGIT:	
		if (newrule[cur_index].operation * BIN_DIGIT_RANGE)
		{
			cur_digit_range=1;
		}
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
		if (newrule[cur_index].num_desc & BIN_COMPLIMENT)
		{
			cur_comp=1;
		}
		if (bin_lookup_ambiguous(bin_convert_to_ambi(prev_type),prev_comp,bin_convert_to_ambi(cur_type),cur_comp))
		{
			/* if there is only 1 descriptor and the descriptor is not any number,
			   disable lookahead from */
			return(1);
		}
		break;
	case BIN_EXACT:
		if (prev_old_type!=-1)
		{
			if (prev_comp)
			{
				if (newrule[cur_index].operation & BIN_CASE_INSEN)
				{
					if ( (((parser_char_types[par_lower[newrule[cur_index].data[0]]]) & prev_old_type)) &&
						 (((parser_char_types[par_upper[newrule[cur_index].data[0]]]) & prev_old_type)) )
					{
						return(0);
					}
				}
				else
				{
					if (((parser_char_types[newrule[cur_index].data[0]]) & prev_old_type))
					{
						return(0);
					}
				}
			}
			else
			{
				if (newrule[cur_index].operation & BIN_CASE_INSEN)
				{
					if ( (!((parser_char_types[par_lower[newrule[cur_index].data[0]]]) & prev_old_type)) &&
						 (!((parser_char_types[par_upper[newrule[cur_index].data[0]]]) & prev_old_type)) )
					{
						return(0);
					}
				}
				else
				{
					if (!((parser_char_types[newrule[cur_index].data[0]]) & prev_old_type))
					{
						return(0);
					}
				}
			}
		}
		return(1);
	case BIN_HEXADECIMAL:
		if (prev_old_type!=-1)
		{
			if (prev_comp)
			{
				if (((parser_char_types[newrule[cur_index].data_number]) & prev_old_type))
				{
					return(0);
				}
			}
			else
			{
				if (!((parser_char_types[newrule[cur_index].data_number]) & prev_old_type))
				{
					return(0);
				}
			}
		}
		return(1);
	case BIN_RESTORE:
		return(1);
	case BIN_SETS:
		return(1);
	default:
		printf("undefined operation");
		break;
	}
	return(0);
}



int bin_lookup_ambiguous(int cur_type,int from_reverse,int new_type,int to_reverse)
{
  char bit_to_check=0x01;
  if (from_reverse)
	{
	  bit_to_check<<=2;
	}
  if (to_reverse)
	{
	  bit_to_check<<=1;
	}   

  return(ambiguous_char[cur_type][new_type] & bit_to_check);
}


int bin_convert_to_ambi(int i)
{
	switch(i)
	{
		case BIN_DIGIT:
			return(DIGIT_CHAR_TYPE2);
		case BIN_UPPER:
			return(UPPER_CHAR_TYPE2);
		case BIN_LOWER:
			return(LOWER_CHAR_TYPE2);
		case BIN_ANY_ALPHABET:
			return(ANY_ALPHA_CHAR_TYPE2);
		case BIN_ANY_CHARACTER:
			return(ANY_CHAR_CHAR_TYPE2);
		case BIN_WHITESPACE:
			return(WHITE_CHAR_TYPE2);
		case BIN_PUNCTUATION:
			return(PUNCT_CHAR_TYPE2);
		case BIN_NON_ALPHABET:
			return(NON_ALPHA_CHAR_TYPE2);
		case BIN_VOWEL:
			return(VOWEL_CHAR_TYPE2);
		case BIN_CONSONANT:
			return(CONSONANT_CHAR_TYPE2);
		case BIN_NUMBER:
			return(NUMBER_CHAR_TYPE2);
		case BIN_CLAUSE_BOUNDRY:
			return(CLAUSE_CHAR_TYPE2);
		case BIN_ALPHANUMERIC:
			return(ALPHA_NUM_CHAR_TYPE2);
		case BIN_VOWEL_NON_Y:
			return(VOWEL_NON_Y_TYPE2);
		case BIN_PUNCT_SOME:
			return(SOME_PUNCT_TYPE2);
		case BIN_SETS:
			return(SET_CHAR_TYPE2);
 		case BIN_EXACT:
			return(EXACT_CHAR_TYPE2);
		case BIN_HEXADECIMAL:
	 		return(HEXADECIMAL_TYPE2);
		case BIN_RESTORE:
	 		return(SAVE_CHAR_TYPE2);
	}
}

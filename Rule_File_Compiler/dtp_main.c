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
 *    File Name:	dtp_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		TQL		03/01/1996	initial release
 *
 */                  

#include "dtp_main.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "par_def.h"

#define MAX_RULES			32767
#define MAX_SECTIONS		100
#define MAX_DICT_ENTRY		50
#define MAX_INPUT_LINE		500

int rule_numbers_used[MAX_RULES];
int num_sections;
int line_number;


unsigned char hex_code[LARGE]={""};	/* global variable for rule_hex_code() function */

void usage(void)
{
    printf( "\nUsage:  rul_comp inputfile [outputfile] [options].\n" );
	printf( "\n  inputfile    file to be converted");
	printf( "\n  outputfile   file to be converted to");
	printf( "\n  options      /m:#	indicates which conversion mode to use\n");
	printf( "\nModes:  1 - Convert External format to Intermediate format.");
	printf( "\n        2 - Convert External format to Internal format.");
	printf( "\n        3 - Convert Intermediate format to Internal format.");
	printf( "\n        4 - Convert Intermediate format to External format.\n");
	printf( "\nExamples:  rulecomp sample.txt sample.par /m:1");
	printf( "\n           rulecomp sample.par /m:4\n");
	exit(0);
}

int error(int num, char *message)
{
	switch(num)
	{
	case 0:
		printf("unexpected end of file in line %d\n",line_number);
		exit(-1);
	case 1:
		printf("{ expected but got %s\n in line %d",message,line_number);
		exit(-2);
	case 2:
		printf("'rule' expected but got %s in line %d\n",message,line_number);
		exit(-3);
	case 3:
		printf("expected a number but got %s in macro rule on line %d\n",message,line_nubmer);
		exit(-4);
	case 4:
		printf("expected } but got %s in macro rule on line %d\n",message,line_number);
		exit(-5);
	case 5:
		printf("no character type found in rule in line %d\n",line_number);
		exit(-6);
	case 6:
		printf("no character type or action state found in rule in line %d\n",line_number);
		exit(-7);
	case 7:
		printf("{ expected, but got %s in line %d\n",message,line_number);
		exit(-8);
	case 8:
		printf("} expected, but gt %s in line %d\n",message,line_number);
		exit(-9);
	case 9:
		printf("brace not found in rule in line %d\n",line_number);
		exit(-10);
	case 10:
		printf("'}' expected, but got %s at end of rule in line %d\n",message,line_number);
		exit(-11);
	case 11:
		printf("'|' expected, but got %s at end of rule in line %d\n",message,line_number);
		exit(-12);
	case 12:
		printf("rule too long. max length is %d in line %d",PAR_MAX_RULE_LENGTH,line_number);
		exit(-13);
	case 13:
		printf("only one '>' enmcountered, two expected in line %d",line_number);
		exit(-14);
	case 14:
		printf("end of linn encountered in exact string in line %d\n",line_number);
		exit(-15);
	case 15:
		printf("end of line encountered in string pattern definition in line %d\n",line_number);
		exit(-16);
	case 16:
		printf("%s expected at end of string pattern definition in line %d\n",message,line_number);
		exit(-17);

	}
	exit(1);
}



int main (int argc, char *argv[])
{


	int	i=0;
	int	j=0;
	int	k=0;	/* used in loops */
	int input_given=0;
	int output_given=0;
	char input_file_ex[5]={""};
	char output_file_ex[5]={""};
	char short_file_name[MEDIUM]={""};	/* file extensions and names */
	char input_file[MEDIUM]={""};
	char output_file[MEDIUM]={""};	/* declare and initialize input_file to output_file */
	int conversion_mode=1; /* set default conversion mode */

	num_sections=0;
	line_number=0;
	memset(rule_numbers_used,0,sizeof(rule_number));

	if (argc<=1)
		usage();

	for (i=1;i<argc;i++)
	{
		if (argv[i][0]=='/')
		{
			switch(argv[i][1])
			{
			case '?':
				usage();
				break;
			case 'm':
			case 'M':
				if (argv[i][2]==':')
				{
					conversion_mode=atoi(argv[i]+3);
				}
				else
				{
					conversion_mode=atoi(argv[i]+2);
				}
				break;
			default:
				usage();
			}
		}
		else
		{
			if (input_given==0)
			{
				strncpy(input_file,argv[i],MEDIUM-1);
				input_given=1;
			}
			else
			{
				if (output_given==0)
				{
					strncpy(output_file,argv[i],MEDIUM-1);
					output_given=1;
				}
				else
				{
					usage();
				}
			}
		}
	}
	if (!output_given)
	{
		strcpy(output_file,input_file);
		switch (conversion_mode)
		{
		case 1:
			strcpy( strrchr( output_file, '.' ), ".par" );	/* for mode 1, output the output file ext. is .par */
			break;
		case 2:
		case 3:
			strcpy( strrchr( output_file, '.'), ".h" );	/* for mode 2 and 3, output the output file ext. is .h */
			break;
		case 4:
			strcpy( strrchr( output_file, '.'), ".txt" );	/* for mode 4, output the output file ext. is .txt */
		}
	}

  printf( "\nConverting %s to %s...\n", input_file, output_file );

  file_in( input_file, output_file, conversion_mode );
  return(0);

}

int file_in( unsigned char *input_file, unsigned char *output_file, int c_mode )
{

  FILE *out_stream, *in_stream;
  unsigned char file_line[LARGE]={""}, rule_number[MEDIUM]={""}, rule_language[SMALL]={""}, rule_mode[SMALL]={""};
  unsigned int k=0, m=0, n=0, p=0;
  int rule_flag=0, replace_flag=0, insert_flag=0, optional_flag=0, S_flag=0, apostrophe_flag=0;
  char command[LARGE]={""};

  out_stream = fopen( output_file, "w" );
  if( !out_stream )
  {
	printf( "\nError opening %s\n", output_file );
	exit(0);
  }
  in_stream = fopen( input_file, "r" );
  if( !in_stream )
  {
	printf( "\nError opening %s\n", input_file );
	exit(0);
  }

  fprintf( out_stream, "; This file was generated by the Rule File Compiler.\n\n");
  
  switch( c_mode )
  {

  case 1:	/* Convert External format to Intermediate format */


	convert_rules(FILE *infile, FILE *outfile);
			
/* convert_rules
	copies rule section headers to the .par file

convert_rule_header
	converts the rule header information (language, modeflags, dict flags)...

convert_rule
	converts the rule into intermediate syntax.
		changes the words (replace, optional, insert) to proper internal format
		changes { to /
		changes >> to /
		changes } to /
	calls it self when it encounters a sub rule

convert_string
	converts string types

convert_standard
	converts standard type specifiers

convert_digit
	converts digit specifiers

convert_set
	converts sets

convert_action
	action_replace
		copies the replacement string for replacement

	action_insert
		copies the replacement string for replacement
	action_after
		copies the replacement string for replacement
	action_before
		copies the replacement string for replacement

	action_delete
		does nothing

	action_copy
		does nothing

	action_macro
		does nothing

	action_rule_dict
		converts the hit part(calls convert_rule), adds a |, 
		converts the miss part(calls convert rule)

	action_shuffle
		does nothing

convert_dictionaries
	copies the [DICT,<dict name>]

convert_dict
	copies the data from the input file to the output file
	
	  
	  
*/	  
#ifdef OLD_CODE
	while( fgets( file_line, LARGE, in_stream ) != NULL )
	{
	  for( k=0; k < strlen( file_line ); k++ )
	  {
		if( file_line[0] == ';' )
		{ 
		  if( rule_flag == 1 )
		  {
			fprintf( out_stream, "\n" );
			rule_flag = 0;
		  }
		  fprintf( out_stream, "%s", file_line );
		  break;
		}
		else if( !_strnicmp( file_line, "[RULE]", 6 ) )
		{
		  fprintf( out_stream, "%s", file_line );
		  break;
		}
		else if( file_line[strlen( file_line )-2] == ':' )
		{
		  rule_flag = 1;
		  m = 0;
		  while( file_line[m] != ':' )
			rule_number[m] = file_line[m++];
		  rule_number[ m ] = '\0';

		  m = m+2;
		  n = 0;
		  while( file_line[n+m] != ':' )
			rule_language[n] = file_line[(n++)+m];
		  rule_language[ n ] = '\0';
		
		  n = n+2;
		  p = 0;
		  while( file_line[p+n+m] != ':' )
			rule_mode[p] = file_line[(p++)+n+m];
		  rule_mode[ p ] = '\0';
		
		  rule_hex_code( rule_number, rule_language, rule_mode );

		  fprintf( out_stream, "%s", hex_code );

		  break;
		}
		else if( file_line[k] == '\'' )
		{
		  if( apostrophe_flag == 0 )
			apostrophe_flag = 1;
		  else if( apostrophe_flag == 1 )
			apostrophe_flag = 0;
		  fprintf( out_stream, "%c", '\'' );
		}
		else if( file_line[k] == ' ' && apostrophe_flag == 0);
		else if( file_line[k] == '\n' && replace_flag == 1 )
		{
		  fprintf( out_stream, "%c", '/' );
		  replace_flag = 0;
		}
		else if( file_line[k] == '\n' && insert_flag == 1 )
		{
		  fprintf( out_stream, "%c", '/' );
		  insert_flag = 0;
	    }
		else if( file_line[k] == '}' && optional_flag == 1 )
		{
		  fprintf( out_stream, "%c", '/' );
		  optional_flag = 0;
		}
		else if( file_line[k] == 'S' && file_line[k+1] == '{' )
		{
		  fprintf( out_stream, "%c%c", 'S', '{' );
		  S_flag++;
		  k++;
		}
		else if( file_line[k] == '{' );
		else if( file_line[k] == '}' && S_flag != 0 )
		{
		  fprintf( out_stream, "%c", '}' );
		  S_flag--;
		  k--;
		}
		else if( file_line[k] == '}' );
		else if( file_line[k] == '\n' );
		else if( file_line[k] == '>' && file_line[k+1] == '>' )
		{
		  fprintf( out_stream, "%c", '/' );
		  k = k + 1;
		}
		else if( file_line[k] == 'o' && file_line[k+1] == 'p' && file_line[k+2] == 't' && file_line[k+3] == 'i' )
		{  
		  fprintf( out_stream, "%c%c", 'o', '/' );
		  optional_flag = 1;
		  k = k + 8;
		}
		else if( file_line[k] == 'r' && file_line[k+1] == 'e' && file_line[k+2] == 'p' && file_line[k+3] == 'l' )
		{  
		  fprintf( out_stream, "%c%c", 'r', '/' );
		  replace_flag = 1;
		  k = k + 7;
		}
		else if( file_line[k] == 'i' && file_line[k+1] == 'n' && file_line[k+2] == 's' && file_line[k+3] == 'e' )
		{  
		  fprintf( out_stream, "%c%c", 'i', '/' );
		  insert_flag = 1;
		  k = k + 6;
		}
		else
		  fprintf( out_stream, "%c", file_line[k] );
	  }
	}
#endif

	break;

  case 2:	/* Convert External format to Internal format */
  
	if ( file_in( input_file, "!!temp!!.par", 1 ) == 0 )
	  printf( "ERROR" );	/* elaborate later */
	strcat( strcat( strcpy( command, "par_comp "), "!!temp!!.par " ), output_file );
	printf( "\n%s\n", command );
	system( command );
	unlink("!!temp!!.par");

	break;
  
  case 3:	/* Convert Intermediate format to Internal format */

	strcat( strcat( strcat( strcpy( command, "par_comp "), input_file ), " " ), output_file );
	system( command );

	break;

  case 4:	/* Convert Intermediate format to External format */

	printf( "\nThis mode is not fully functional at this time.\n" );

	break;


  default:
  
	printf( "ERROR" ); /*elaborate later*/
  
  }

  fprintf( out_stream, "\n" );

  fclose( in_stream );
  fclose( out_stream );

  return (1);

}


int rule_hex_code( unsigned char *rule_number, unsigned char *rule_language, unsigned char *rule_mode )
{
  //unsigned char hex_code[LARGE]={""};
  unsigned char number[MEDIUM]={""}, language[SMALL]={""}, mode[SMALL]={""};
  unsigned int q=0;

  if( !strcmp( rule_language, "US" ) )
	strcpy( language, "0x00000001" );
  else if( !strcmp( rule_language, "FR" ) )
	strcpy( language, "0x00000002" );
  else if( !strcmp( rule_language, "GR" ) )
	strcpy( language, "0x00000004" );
  else if( !strcmp( rule_language, "SP" ) )
	strcpy( language, "0x00000008" );
  else if( !strcmp( rule_language, "JP" ) )
	strcpy( language, "0x00000010" );
  else if( !strcmp( rule_language, "ALL" ) )
	strcpy( language, "0xFFFFFFFF" );

  if( !strcmp( rule_mode, "ALL" ) )
	strcpy( mode, "0xFFFFFFFF" );

  for( q=0; q < strlen( rule_number ); q++)
  {
	if( rule_number[q] == ',' )
	  number[q] = ':';
	else
	  number[q] = rule_number[q];
  }
  number[q] = ',';
  number[q+1] = '\0';

  hex_code[0] = '\0';  
  strcat( strcat( strcat( strcat( strcat( hex_code, language ), "-" ), mode ), ":" ), number );

  return( 1 );
}


int skip_spaces(char *line,int position)
{
	while ((line[position]==' ') || (line[position]=='\n') || 
		(line[position]=='\r') || (line[position]=='\t'))
	{
		position++;
	}
	return(position);
}

int copy_word(char *line,int position,char *word)
{
	int i=0;
	char end_char=0;
	char end_c[2]={0,0};
	switch (line[position])
	{
	case '{':
	case '}':
	case '|':
		word[0]=line[position];
		word[1]='\0';
		position++;
		break;
	case '>':
		if (line[position+1]!='>')
		{
			error(13,"");
		}
		position+=2;
		word[0]='>';
		word[1]='>';
		word[2]='\0';
		break;
	case '\'':
		position++;
		word[0]='\'';
		i=1;
		while (line[postion]!='\'' && line[position]!='\0')
		{
			word[i++]=line[position++];
		}
		if (line[position]=='\0')
		{
			error(14,"");
		}
		position++;
		word[i]='\'';
		break;
	case '`':
		position++;
		word[0]='`';
		i=1;
		while (line[postion]!='`' && line[position]!='\0')
		{
			word[i++]=line[position++];
		}
		if (line[position]=='\0')
		{
			error(14,"");
		}
		position++;
		word[i]='`';
		break;

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
	case	NO_LOOKAHEAD:
		end_char='>';
	case	DIGIT_CHAR_TYPE:
		if ((line[position+1]=='<' || line[position+1]=='[')) || 
			((line[position+1]=='x' || line[position]=='x') && 
			 (line[position+2]=='<' || line[position+2]=='[')) || 
			((line[position+2]=='x' && line[position]=='x') && 
			 (line[position+3]=='<' || line[position+3]=='[')))
		{
			if (line[position+1]=='[' || line[position+2]=='[' || line[position+3]=='[')
			{
				end_char=']';
			}
			while (line[position]!=' ' && line[position]!=end_char &&
				   line[position]!='\n' && line[position]!='\r' && 
				   line[position]!='\t' && line[position]!='\0')
			{
				word[i++]=line[position++];
			}
			if (line[position]=='\0')
			{
				error(15,"");
			}
			if (line[position]!=end_char)
			{
				end_c[0]=end_char;
				error(16,end_c);
			}
			break;
		}
	default:
		while (line[position]!=' ' && 
			   line[position]!='\n' && line[position]!='\r' && 
			   line[position]!='\t' && line[position]!='\0')
		{
			word[i++]=line[position++]);
		}
	}
	return(position);
	
/* has to stop when it encounters a ':' that is not in an exact string */
/* has to stop when it encounters a ',' that is not in an exact string */
/* copy { } >> separate */
/* for string types it has to just give the type first I.E. 
		A '  ` D S shuffle_u or any other character type 
	    x is a character type (no lookahead) */ 
	/* copy one string type A<3-4> D[4,7] '..'  `..` */

}

int get_word(FILE *infile,char *word)
{
	static char line[500]="";
	static int position=0;
	
	if (position==-1)
		return(position);

	if (line[0]==NULL)
	{
		if (fgets(line,499,infile)==NULL)
		{
			position=-1;
			return(-1);
		}
		line_number++;
		position=0;
	}
	while (((position=skip_spaces(line,position))==strlen(line)) )
	{
		if (fgets(line,499,infile)==NULL)
		{
			position=-1;
			return(-1);
		}
		position=0;
		line_number++;
	}
	position=copy_word(line,position,word);
	return(position);
}

int rule_cat(char *rule,char *add)
{
	if ((strlen(rule)+strlen(add))>PAR_MAX_RULE_LENGTH)
	{
		error(12,"");
	}
	strcat(rule,add);
}



int convert_rules(FILE *infile, FILE *outfile)
{

	int rule_section=1;
	char line[500],word[500];


	while (get_word(infile,word)!=-1)
	{
		if (stricmp(word,"[RULE]")==0)
		{
			if (rule_section==0)
			{
				printf("error in rule on line %d\n",line_number);
				printf("rule sections have to come before dictionaries\n");
				exit(0);
			}
			fprintf(outfile,"[RULE]\n");
			break;
		}
		else
		{
			if (strincmp(word,"[DICT",5)==0)
			{
				rule_section=0;
				convert_dictionaries(infile,word);
			}
			else
			{
				convert_rule(infile,word);
			}
		}

	}	
}


int convert_rule(FILE *infile, char *inword)
{
	int rule_number=-1;
	int miss_number=-1;
	int hit_number=-1;
	int dict_flag=-1;
	int go_hit=-1;
	int go_miss=-1;
	long lang_flag=0;
	long mode_flag=0;
	char rule[PAR_MAX_RULE_LENGTH];
	char word[500];
	char rule_word[500];

	/* the rule is converted into an internal format and thn written 
	   out to the file */

	strcpy(word,inword);	/* copy the prevoius word to the current buffer */
	/* loop to convert R1,M4,H6,DM,DH,GH7.GH9 */
	do
	{
		switch (word[0])
		{

		case 'r':
		case 'R':
			rule_number=atoi(word+1);
			if (rule_number>=MAX_RULES)
			{
				printf("rule number to high in line number %d\n",line_number);
				exit(0);
			}
			if (rule_numbers_used[rule_number]!=0)
			{
				printf("rule numbers can only be used once\n");
				printf("rule number %d reused in line %d\n",rule_number,line_number);
				printf("rule number %d is used preiously in line %d\n",
					   rule_number,rule_numbers_used[rule_number]);
				exit(0);
			}
			rule_numbers_used[rule_number]=line_number;
			break;
		case 'm':
		case 'M':
			miss_number=atoi(word+1);
			break;
		case 'h':
		case 'H':
			hit_number=atoi(word+1);
			break;
		case 'd':
		case 'D':
			if (ls_lower[word[1]]=='m')
				dict_flag=DICT_MISS_VALUE;
			if (ls_lower[word[1]]=='h')
				dict_flag=DICT_HIT_VALUE;
			break;
		case 'g':
		case 'G':
			if (ls_lower[word[1]]=='m')
				go_miss=atoi(word+2);
			if (ls_lower[word[1]]=='h')
				go_hit=atoi(word+2);
			break;
		default:
			printf("unsupported type %s in line %d\n",word,line_number);
		}
	} while ((get_word(infile,word)!=-1) && word[0]!=':');
	/* loop to convert the language flag */
	do
	{
		if (word[0]==',' || word[0]==':')
		{
			if (strlen(word)>1)
			{
				lang_flag=convert_language_to_hex(word+1,lang_flag);
			}
		}
		else
		{
			lang_flag=convert_language_to_hex(word,lang_flag);
		}
	} while (get_word(infile,word)!=-1 && word[0]!=':');
	/* loop to convert the mode flags */
	do
	{
		if (word[0]==',' || word[0]==':')
		{
			if (strlen(word)>1)
			{
				mode_flag=convert_mode_to_hex(word+1,mode_flag);
			}
		}
		else
		{
			mode_flag=convert_mode_to_hex(word,mode_flag);
		}
	} while (get_word(infile,word)!=-1 && word[0]!=':');

	build_rule(infile,rule_word,rule,NULL_STATE);
	/* write the rule to the file */
	
}


int build_rule(FILE *infile, char *inword,char *rule,int state);
{
	char word[500];
	char temp[500];
	int got_paren=0;
	int rule_length=0;
	int newstate=0,newtype=0;
	int single_line=0;

	if (inword==NULL)
	{
		printf("inword NULL in build_rule on line %d\n",line_nubmer);
		exit(0);
	}
	if ((word[0]==':') && strlen(word)>1))
	{
		strcpy(word,inword+1);
	}
	else
	{
		getword(infile,word);
	}
	/* check for the first { and remove it */
	if (strcmp(word,"{")==0)
	{
		got_paren=1;
	}
	if (state==NULL_STATE)
	{
		if (got_paren==0)
		{
			printf("error in rule syntax at line %d\n",line_number);
			exit(-1);
		}
		state=COPY_STATE;
	}
	/* save state */
	if (state==SAVE_STATE)
	{
		sprintf(temp,"$%s,",word);
		rule_cat(rule,temp);
		if (getword(infile,word)==-1)
		{
			error(0,"");
		}
		if (strcmp(word,"{")==0)
		{
			got_paren=1;
		}
		else
		{
			error(7,word);
		}
	}
	if (state==DICTIONARY_STATE)
	{
		rule_cat(rule,word);
		rule_cat(rule,",");
		if (getword(infile,word)==-1)
		{
			error(0,"");
		}
		if (strcmp(word,"{")==0)
		{
			got_paren=1;
		}
		else
		{
			error(7,word);
		}
	}
	if (state==MACRO_STATE)
	{
		if (getword(infile,word)==-1)
		{
			error(0,"");
		}
		if (stricmp(word,"rule")!=0)
		{
			error(2,word);
		}
		rule_cat(rule,"R");
		if (getword(infile,word)==-1)
		{
			error(0,"");
		}
		if (!is_str_num(word))
		{
			error(3,word);
		}
		rule_cat(rule,word);
		if (getword(infile,word)==-1)
		{
			error(0,"");
		}
		if (strcmp(word,"}")!=0)
		{
			error(4,word);
		}
		rule_cat(rule,"/");
	}
	else
	{
		if (got_paren==0)
		{
			error(9,"");
		}
		while ((get_word(infile,word)!=-1) && ((strcmp(word,"}")!=0) || (strcmp(word,">>")!=0)) )
		{
			if ((newtype=par_get_char_type(word))!=NULL_TYPE)				
			{
				if (newtype==NO_LOOKAHEAD)
				{
					add_type_tag(newtype,rule);
					if (getword(infile,word)==-1)
					{
						error(0,"");
					}
					if (((newtype=par_get_char_type(word))==NULL_TYPE) || 
						(newtype==NO_LOOKAHEAD))
					{
						error(5,"");
					}					
					convert_string(infile,word,rule,newtype);
				}
				else
				{
					convert_string(infile,word,rule,newtype);
				}
			}
			else
			{
				if ((newstate=par_get_state(word))!=NULL_TYPE)
				{
					add_rule_tag(newstate,rule);	
					build_rule(infile,word,rule,newstate);
				}
				else
				{
					error(6,"");
				}
			}
		}
		if (strcmp(word,"}")!=0)
		{
			error(10,word);
		}

	}
	if (strcmp(word,"}")!=0)
	{
		error(10,word);
	}
	rule_cat(rule,"/");
	convert_action(infile,rule,state);
	/* process action state */

}

	
int convert_action(FILE *infile, char *rule, int state)
{
	char word[500];
	int chartype;

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
	case	STATUS_STATE:
		while ((getword(infile,word)!=-1) && (strcmp(word,"}")!=0))
		{
			if (strcmp(word,"|")==0)
			{
				rule_cat(rule,"|");
			}
			convert_string(infile,word,rule,par_get_char_type(word));
			if (strcmp(word,"|")==0)
			{
				rule_cat(rule,"|");
			}
		}
		rule_cat(rule,"/");
		break;
	
	case DICTIONARY_STATE:
		if (getword(infile,word)==-1)
		{
			error(1,"");
		}
		if (stricmp(word,"FAIL")==0)
		{
			rule_cat(rule,"FAIL");
			if (getword(infile,word)==-1)
			{
				error(1,"");
			}
			if (stricmp(word,"|")!=0)
			{
				error(11,word);
			}
			rule_cat(rule,"|");
		}
		else
		{
			build_rule(infile,NULL,rule,NULL_STATE);
			rule_cat(rule,"|");
		}
		if (stricmp(word,"FAIL")==0)
		{
			rule_cat(rule,"FAIL");
			if (getword(infile,word)==-1)
			{
				error(1,"");
			}
			if (stricmp(word,"})!=0)
			{
				error(10,word);
			}
			rule_cat(rule,"/");
		}
		else
		{
			build_rule(infile,NULL,rule,NULL_STATE);
			rule_cat(rule,"/");
		}
		break;
	default:
		break;
	}
}

int convert_string(FILE *infile,char *word,char *rule,int type)
{
	switch (type)
	{
	case	EXACT_CHAR_TYPE:
	case	EXACT_CASE_TYPE:
		rule_cat(rule,word);
		break;
	case	HEXADECIMAL_TYPE:
		if (strlen(word)>4)
		{
			error(17,"");
		}
		if (word[1]!='x')
		{
			error(18,"");
		}
		if (word[2]<'0' || ls_upper[word[2]]>'F')
		{
			error(19,"");
		}
		if (word[2]>'9' && ls_upper[word[2]]<'A')
		{
			error(19,"");
		}
		if (word[3]<'0' || ls_upper[word[3]]>'F')
		{
			error(20,"");
		}
		if (word[3]>'9' && ls_upper[word[3]]<'A')
		{
			error(20,"");
		}
		rule_cat(rule,word);
		break;

	case	SAVE_CHAR_TYPE:

		break;

	case	SET_CHAR_TYPE:
		break;

	case	DIGIT_CHAR_TYPE:
		if (word[1]=='[')
		{
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
		break;
	}

}


int convert_dictionaries(FILE *infile, FILE *outfile)
{
}

int add_rule_tag(int state,char *rule)
{
	switch(state)
	{
	case COPY_STATE:
		rule_cat(rule,"c/");
		break;
	case REPLACE_STATE:
		rule_cat(rule,"r/");
		break;
	case DELETE_STATE:
		rule_cat(rule,"d/");
		break;
	case INSERT_STATE:
		rule_cat(rule,"i/");
		break;
	case INSERT_AFTER_STATE:
		rule_cat(rule,"a/");
		break;
	case INSERT_BEFORE_STATE:
		rule_cat(rule,"b/");
		break;
	case OPTIONAL_STATE:
		rule_cat(rule,"o/");
		break;
	case SAVE_STATE:
		rule_cat(rule,"(");
		break;
	case MACRO_STATE:
		rule_cat(rule,"p/");
		break;
	case DICTIONARY_STATE:
		rule_cat(rule,"h/");
		break;
	case WORD_STATE:
		rule_cat(rule,"w/");
		break;
	case STATUS_STATE:
		rule_cat(rule,"s/");
		break;
	}
	return(0);
}


add_type_tag(int type,char *rule)
{
}

			
			
int convert_language_to_hex(char *word,int lang_flag)
{
	if( !stricmp( word, "US" ) )
		lang_flag |=0x00000001;
	else if( !stricmp( word, "FR" ) )
		lang_flag |=0x00000002;
	else if( !stricmp( word, "GR" ) )
		lang_flag |=0x00000004;
	else if( !stricmp( word, "SP" ) )
		lang_flag |=0x00000008;
	else if( !stricmp( word, "JP" ) )
		lang_flag |=0x00000010;	
	else if( !stricmp( word, "ALL" ) )
		lang_flag |=0xFFFFFFFF;
	else
	{
		printf("unknown language tag %s in line %d\n",word,line_number);
		exit(-1);
	}
	return(lang_flag);
}

int convert_mode_to_hex(char *word,int mode_flag)
{
	if( !stricmp( word, "MA" ) )
		mode_flag |=0x00000004;
	else if( !stricmp( word, "SP" ) )
		mode_flag |=0x00000010;
	else if( !stricmp( word, "EU" ) )
		mode_flag |=0x00000008;
	else if( !stricmp( word, "NA" ) )
		mode_flag |=0x00000040;
	else if( !stricmp( word, "HO" ) )
		mode_flag |=0x00000080;	
	else if( !stricmp( word, "CI" ) )
		mode_flag |=0x00000100;	
	else if( !stricmp( word, "LA" ) )
		mode_flag |=0x00000200;	
	else if( !stricmp( word, "TA" ) )
		mode_flag |=0x00000400;	
	else if( !stricmp( word, "EM" ) )
		mode_flag |=0x00001000;	
	else if( !stricmp( word, "ALL" ) )
		mode_flag |=0xFFFFFFFF;
	return(mode_flag);
}


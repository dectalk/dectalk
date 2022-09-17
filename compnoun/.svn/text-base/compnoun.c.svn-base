/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *    (c) Digital Equipment Corporation 1998. All rights reserved.
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
 *    File Name:	compnoun.c
 *    Author:       Matthew Schnee
 *    Creation Date:05/08/1998
 *
 *    Functionality:
 * 		Text preprocessor main file
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	---------------------------------------
 *
 */

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>



#include <time.h>

/*
 *  lower-case folding table ... upper case 8 bit characters are
 *  folded to their lower-case 7 bit equivalents ...
 */

unsigned char par_lower[] = {
#include "ls_lower.tab"
};

unsigned char par_upper[] = {
#include "ls_upper.tab"
};

int char_mapping[256];
int count_chars=0;
int reverse_mapping[256];

int num_conj=0;


int total_nodes=0;
int total_input_characters=0;

int total_space_used=0;
int num_singular_ends=0;
int length_of_ends=0;


int total_used=0;
int num_entry=0;
int num_string=0;
int num_short_entry=0;

int num_singular_middles=0;
int size_of_middles=0;

int num_dup_endings=0;
int length_dup_endings=0;

int cur_index=1;
int *index_table;
int cur_data=0;

short *temp_chars;
struct data_short_entry *temp_schars;


unsigned char *data_table;

int char_freq_data[256];
int last_used_data[256];

unsigned char output_name[200];

int max_ends=0;
int cur_ends=0;

FILE *infile, *outfile, *inconj;


unsigned char initial_input[200];

#include "compnoun.h"

compiler_conjunction conjs[10];

compiler_table_string **existing_ends=NULL;

int main(int argc, char *argv[])
{

	int used_chars[256];

	int i;
	int most_used;
	int most_loc;
	unsigned char input_name[200],input_conj_name[200];

	unsigned char end[50];
	unsigned char middle[50];
	compiler_table_entry *head;

	unsigned char input_string[200];

	/* program arguments */
	/* compnoun input_file_name output_file_name */


	if (argc<4)
	{
		fprintf(stderr,"usage compnoun <word input file> <conjuntion input file> <output file>\n");
		exit(1);
	}

	strcpy(input_name,argv[1]);
	strcpy(input_conj_name,argv[2]);
	strcpy(output_name,argv[3]);

	if ((infile=fopen(input_name,"r"))==NULL)
	{
		fprintf(stderr,"error opening input file %s\n",input_name);
		exit(2);
	}
	if ((inconj=fopen(input_conj_name,"r"))==NULL)
	{
		fprintf(stderr,"error opening conjunctions file %s\n",input_conj_name);
		exit(7);
	}
	if ((outfile=fopen(output_name,"w"))==NULL)
	{
		fprintf(stderr,"error opening output file\n");
		exit(3);
	}

	for (i=0;i<256;i++)
	{
		used_chars[i]=0;
		char_mapping[i]=-1;
		reverse_mapping[i]=-1;
		last_used_data[i]=0;
		char_freq_data[i]=0;
	}

	while (fgets(input_string,198,infile)!=NULL)
	{
		for (i=0;input_string[i]!=0;i++)
		{
			if (input_string[i]>=32)
			{
				used_chars[input_string[i]]=1;
				char_freq_data[par_lower[input_string[i]]]++;
			}
		}
	}
#if 0
	for (i=0;i<256;i++)
	{
		if (char_freq_data[i])
		{
			printf("%3d %c number = %d\n",i,i,char_freq_data[i]);
		}
	}
#endif

	/* return the file pointer to the beginning of the file */
	fseek(infile,0,SEEK_SET);
#define NEW_CHAR_MAPPING

#ifdef NEW_CHAR_MAPPING
	most_used=1;
	most_loc=1;
	while (most_used && most_loc)
	{
		most_used=0;
		most_loc=0;
		for (i=0;i<256;i++)
		{
			if (char_freq_data[i]>most_used)
			{
				most_loc=i;
				most_used=char_freq_data[i];
			}
		}
		if ((most_used==0) && (most_loc==0))
		{
			break;
		}
#if 0
		printf("most %3d %c number = %d\n",most_loc,most_loc,most_used);
#endif
		char_freq_data[most_loc]=0;
		char_mapping[most_loc]=count_chars;
		char_mapping[par_upper[most_loc]]=count_chars;
		count_chars++;
	}

#else

	for (i=0;i<256;i++)
	{
		if (used_chars[i]!=0)
		{
			if (char_mapping[i]==-1)
			{
				char_mapping[i]=count_chars;
				char_mapping[par_lower[i]]=count_chars;
				count_chars++;
			}
			
		}
	}
#endif

	printf("count chars = %d\n",count_chars);

	

	for (i=0;i<256;i++)
	{
		if (char_mapping[i]!=-1)
		{
			if (reverse_mapping[char_mapping[i]]==-1)
			{
				reverse_mapping[char_mapping[i]]=par_lower[i];
			}
		}
	}

#if 0
	for (i=0;i<count_chars;i++)
	{
		printf("reverse mapping[%d]=%c\n",i,reverse_mapping[i]);
	}
#endif

	while (fgets(input_string,198,inconj)!=NULL)
	{
		input_string[my_strlen(input_string)-1]='\0';
		conjs[num_conj].length=my_strlen(input_string);
		memcpy(conjs[num_conj].conj,input_string,my_strlen(input_string)+1);
		num_conj++;
	}

	head=create_entry();
	while (fgets(initial_input,198,infile)!=NULL)
	{
		initial_input[my_strlen(initial_input)-1]='\0';
		if (my_strlen(initial_input)<3)
			continue;
		total_input_characters+=my_strlen(initial_input);
		add_entry_to_table(head,initial_input);
	}

	calculate_used_space(head);

	printf("total memory used before removal = %d\n",total_used);
	printf("number of entry nodes = %d\n",num_entry);
	printf("number of string nodes = %d\n",num_string);

	remove_singular_ends(head,end);

	count_singular_middles(head,middle);

	printf("number of middles=%d\n",num_singular_middles);
	printf("size of middles = %d\n",size_of_middles);


	total_used=0;
	num_entry=0;
	num_string=0;
	calculate_used_space(head);

	printf("total memory used after removal = %d\n",total_used);
	printf("number of entry nodes = %d\n",num_entry);
	printf("number of string nodes = %d\n",num_string);
	printf("number of dup strings = %d\n",num_dup_endings);
	printf("length of dup strings = %d\n",length_dup_endings);
	
	printf("number of singular ends = %d\n",num_singular_ends);
	printf("length of singular ends = %d\n",length_of_ends);

	printf("total characters in dictionary = %d\n",total_input_characters);
	printf("number of nodes = %d\n",total_nodes);
	total_space_used=(sizeof(compiler_table_entry) + 	sizeof(compiler_table_entry *) * (count_chars));
	printf("memory for 1 node = %d\n",total_space_used);
	total_space_used=total_space_used*(total_nodes-length_of_ends) +length_of_ends +num_singular_ends*sizeof(compiler_table_entry);
	printf("total memory used = %d\n",total_space_used);

	compress_nodes(head);

	total_used=0;
	num_entry=0;
	num_string=0;
	num_short_entry=0;
	calculate_used_space(head);

	printf("total memory used after removal = %d\n",total_used);
	printf("number of entry nodes = %d\n",num_entry);
	printf("number of string nodes = %d\n",num_string);
	printf("number of short entry nodes = %d\n",num_short_entry);
	printf("number of dup strings = %d\n",num_dup_endings);
	printf("length of dup strings = %d\n",length_dup_endings);
	
	printf("number of singular ends = %d\n",num_singular_ends);
	printf("length of singular ends = %d\n",length_of_ends);

	printf("total characters in dictionary = %d\n",total_input_characters);
	printf("number of nodes = %d\n",total_nodes);
	total_space_used=(sizeof(compiler_table_entry) + 	sizeof(compiler_table_entry *) * (count_chars));
	printf("memory for 1 node = %d\n",total_space_used);
	total_space_used=total_space_used*(total_nodes-length_of_ends) +length_of_ends +num_singular_ends*sizeof(compiler_table_entry);
	printf("total memory used = %d\n",total_space_used);

	set_indexes_in_table(head);
	
	memset(end,0,sizeof(end));
//	dump_dictionary(head,end);

#if 0
	while (fgets(initial_input,198,stdin)!=NULL)
	{
		memset(input_string,0,200);
		initial_input[my_strlen(initial_input)-1]='\0';
		break_down_word(head,initial_input,input_string);
		printf("%s\n",input_string);
	}
#endif


	index_table=(int *)malloc(sizeof(int)*(cur_index+1));
	if (index_table==NULL)
	{
		fprintf(stderr,"out of memory on allocation of index table\n");
		exit(5);
	}
	memset(index_table,0,sizeof(int)*cur_index);
	/* allocate more than enough space for the data table */
	data_table=(char *)malloc(total_used);
	if (data_table==NULL)
	{
		fprintf(stderr,"out of memory on allocation of data table\n");
		exit(6);
	}
	memset(data_table,0,total_used);

	temp_chars=(short *)malloc((count_chars) * sizeof(short));
	memset(temp_chars,0,(count_chars) * sizeof(short));

	temp_schars=(struct data_short_entry *)malloc(count_chars * sizeof(struct data_short_entry));
	memset(temp_schars,0,sizeof(struct data_short_entry) * count_chars);

	fill_index_data_table(head);
	
	output_text_format();

#if 0

	for (i=0;i<256;i++)
	{
		if (last_used_data[i])
		{
			printf("%3d %c number = %d\n",i,i,last_used_data[i]);
		}
	}
#endif




	printf("number of indexes = %d\n",cur_index);
	printf("size of runtime data = %d\n",cur_data);
	printf("total runtime memory ~ %d\n",cur_data + cur_index*4);


	fclose(infile);
	fclose(outfile);	
	return(0);
}

void output_text_format(void)
{	
	int i;
	int cur_time;
	struct tm *tm;


	time(&cur_time);
	tm=localtime(&cur_time);
	/* write the file header */
	fprintf(outfile,"/*\n");
	fprintf(outfile," ***********************************************************************\n");
	fprintf(outfile," *\n");
	fprintf(outfile," *                           Coryright (c)\n");
	fprintf(outfile," *    Force Computers, Inc. %d. All rights reserved.\n",tm->tm_year+1900);
	fprintf(outfile," *\n");
	fprintf(outfile," *    Restricted Rights: Use, duplication, or disclosure by the U.S.\n");
	fprintf(outfile," *    Government is subject to restrictions as set forth in subparagraph\n");
	fprintf(outfile," *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR\n");
	fprintf(outfile," *    52.227-14 Alt. III, as applicable.\n");
	fprintf(outfile," *\n");
	fprintf(outfile," *    This software is proprietary to and embodies the confidential\n");
	fprintf(outfile," *    technology of Digital Equipment Corporation and other parties.\n");
	fprintf(outfile," *    Possession, use, or copying of this software and media is authorized\n");
	fprintf(outfile," *    only pursuant to a valid written license from Digital or an\n");
	fprintf(outfile," *    authorized sublicensor.\n");
	fprintf(outfile," *\n");
	fprintf(outfile," ***********************************************************************\n");
	fprintf(outfile," *    File Name:	%s\n",output_name);
	fprintf(outfile," *    Author:		Matthew Schnee\n");
	fprintf(outfile," *    Creation Date:%s\n",ctime(&cur_time));
	fprintf(outfile," *\n");
	fprintf(outfile," *	  Functionality:       \n");
	fprintf(outfile," *		this file is the compound noun dictionart file\n");
	fprintf(outfile," *		by itself and link it with the rest of the parser.\n");
	fprintf(outfile," *\n");
	fprintf(outfile," ***********************************************************************\n");
	fprintf(outfile," */\n");

	/* write the count of characters used */
	fprintf(outfile,"int noun_num_character_in_mapping = %d;\n\n",count_chars);
	/* write the chraracter mapping table */
	fprintf(outfile,"int noun_character_mapping_table[256] = {\n");
	for (i=0;i<256;i++)
	{
		if (i<32)
		{
			fprintf(outfile,"/*   */\t%5d,\n",char_mapping[i]);
		}
		else
		{
			if (i==255)
			{
				fprintf(outfile,"/* %c */\t%5d\n",i,char_mapping[i]);
			}
			else
			{
				fprintf(outfile,"/* %c */\t%5d,\n",i,char_mapping[i]);
			}
		}
	}
	fprintf(outfile,"};\n\n");
	/* write the number of conjunction entries */
	fprintf(outfile,"int noun_number_of_conjunctions = %d;\n\n",num_conj);
	/* write the conjunctions */
	fprintf(outfile,"comp_noun_conjunction noun_conjunction[%d] = {\n",num_conj);
	for (i=0;i<num_conj;i++)
	{
		if (i==num_conj-1)
		{
			fprintf(outfile,"\t{%4d,\t\"%s\" }};\n\n",conjs[i].length,conjs[i].conj);
		}
		else
		{
			fprintf(outfile,"\t{%4d,\t\"%s\" },\n",conjs[i].length,conjs[i].conj);
		}
	}

	fprintf(outfile,"int noun_index_table[%d] = {",cur_index);
	for (i=0;i<cur_index;i++)
	{
		if ( (i)%4==0)
		{
			if (i+1==cur_index)
			{
				fprintf(outfile,"\n/* %5d */ 0x%08X",i,index_table[i]);
			}
			else
			{
				fprintf(outfile,"\n/* %5d */ 0x%08X,",i,index_table[i]);
			}
		}
		else
		{
			if (i+1==cur_index)
			{
				fprintf(outfile,"\t0x%08X",index_table[i]);
			}
			else
			{
				fprintf(outfile,"\t0x%08X,",index_table[i]);
			}
		}
	}
	fprintf(outfile,"\n};\n\n");
	
	fprintf(outfile,"unsigned char noun_data_table[%d] = {",cur_data);
	for (i=0;i<cur_data;i++)
	{
		if ( (i)%8==0)
		{
			if (i+1==cur_data)
			{
				fprintf(outfile,"\n/* 0x%06X */ 0x%02X",i,data_table[i]);
			}
			else
			{
				fprintf(outfile,"\n/* 0x%06X */ 0x%02X,",i,data_table[i]);
			}
		}
		else
		{
			if (i+1==cur_data)
			{
				fprintf(outfile," 0x%02X",data_table[i]);
			}
			else
			{
				fprintf(outfile," 0x%02X,",data_table[i]);
			}
		}
	}
	fprintf(outfile,"\n};\n");
}

void output_binary_format(void)
{
	int temp=0x02;
	int i;
	/* write the language info */
	fwrite(&temp,4,1,outfile);
	/* write the count of characters used */
	fwrite(&count_chars,4,1,outfile);
	/* write the chraracter mapping table */
	fwrite(char_mapping,4,256,outfile);
	/* write the number of conjunction entries */
	fwrite(&num_conj,4,1,outfile);
	/* write the conjunctions */
	for (i=0;i<num_conj;i++)
	{
		fwrite(&conjs[i].length,4,1,outfile);
		fwrite(conjs[i].conj,1,4,outfile);
	}
	/* write the number of nodes */
	fwrite(&cur_index,4,1,outfile);
	/* write the node indexes */
	fwrite(index_table,4,cur_index,outfile);
	/* write the size of the data table */
	fwrite(&cur_data,4,1,outfile);
	/* write the data table	*/
	fwrite(data_table,1,cur_data,outfile);

}



compiler_table_entry *create_entry(void)
{
	compiler_table_entry *p;
	int i;
	p=(compiler_table_entry *)malloc(sizeof(compiler_table_entry));
	if (p==NULL)
	{
		fprintf(stderr,"out of memory\n");
		exit(1);
	}
	p->word_ending=0;
	p->length=0;
	p->index_number=0;
	p->written=0;
	p->chars=(compiler_table_entry **)malloc(sizeof(compiler_table_entry *) * (count_chars));
	if (p->chars==NULL)
	{
		fprintf(stderr,"out of memory\n");
		exit(4);
	}

	for (i=0;i<count_chars;i++)
	{
		p->chars[i]=UNUSED_ENTRY;
	}
	total_nodes++;
	return(p);
}

compiler_table_string *create_string(unsigned char *word)
{
	compiler_table_string *p;
	if ((p=check_existing_ends(word)))
	{
		num_dup_endings++;
		length_dup_endings+=p->length;
		return(p);
	}
	p=(compiler_table_string *)malloc(sizeof(compiler_table_string));
	if (p==NULL)
	{
		fprintf(stderr,"out of memory\n");
		exit(2);
	}
	p->word_ending=2;
	p->length=0;
	p->index_number=0;
	p->written=0;
	p->rest=(unsigned char *)malloc(my_strlen(word)+1);
	if (p->rest==NULL)
	{
		fprintf(stderr,"out of memory\n");
		exit(3);
	}
	p->length=my_strlen(word);
	memcpy(p->rest,word,p->length+1);
	add_end_to_existing(p);
	return(p);
}

compiler_table_short_entry *create_short_entry(compiler_table_entry *head)
{
	compiler_table_short_entry *p;
	int i;
	int last_used=-1;
	int num_used=0;

	p=(compiler_table_short_entry *)malloc(sizeof(compiler_table_short_entry));
	if (p==NULL)
	{
		fprintf(stderr,"out of memory\n");
		exit(1);
	}
	p->word_ending=head->word_ending | 0x00000004;
	p->length=0;
	p->index_number=0;
	p->written=0;
	p->schars=(struct compiler_short_entry *)malloc(sizeof(struct compiler_short_entry) * (count_chars));
	if (p->schars==NULL)
	{
		fprintf(stderr,"out of memory\n");
		exit(4);
	}

	num_used=0;
	for (i=0;i<count_chars;i++)
	{
		if (head->chars[i] !=UNUSED_ENTRY)
		{
			p->schars[num_used].character=reverse_mapping[i];
			p->schars[num_used].schar=head->chars[i];
			num_used++;
		}
	}
	p->length=num_used;
	return(p);
}

int remove_ending(compiler_table_entry *p)
{
	int i;
	int j;
	
	if (p==NULL)
	{
		return(1);
	}
	if (p==UNUSED_ENTRY)
	{
		return(0);
	}
	for (i=0;i<count_chars;i++)
	{
		j=remove_ending(p->chars[i]);
		if (j)
		{
			free(p->chars);
			free(p);
			return(1);
		}
	}
	return(0);
}


void add_entry_to_table(compiler_table_entry *head,unsigned char *input_string)
{
	/* end of the word reached */
	compiler_table_entry *newhead=NULL;

	if (input_string[0]=='\0')
	{
		return;
	}

	if (head->chars[char_mapping[input_string[0]]]==UNUSED_ENTRY)
	{
		if (input_string[1]=='\0')
		{
			head->chars[char_mapping[input_string[0]]]=NULL;
		}
		else
		{
			head->chars[char_mapping[input_string[0]]]=create_entry();
			add_entry_to_table(head->chars[char_mapping[input_string[0]]],input_string+1);
		}
	}
	else
	{
		if (head->chars[char_mapping[input_string[0]]]==NULL)
		{
			if (input_string[1]=='\0')
			{
				fprintf(stderr,"duplicated word %s in dictionary\n",initial_input);
				exit(0);
			}
			head->chars[char_mapping[input_string[0]]]=create_entry();
			add_entry_to_table(head->chars[char_mapping[input_string[0]]],input_string+1);
			head->chars[char_mapping[input_string[0]]]->word_ending=1;
		}
		else
		{
			if (input_string[1]=='\0')
			{
				head->chars[char_mapping[input_string[0]]]->word_ending=1;
			}
			else
			{
				add_entry_to_table(head->chars[char_mapping[input_string[0]]],input_string+1);
			}
		}

	}
}


void calculate_used_space(compiler_table_entry *head)
{
	int i;


	if (head==UNUSED_ENTRY)
	{
		return;
	}
	if (head==NULL)
		return;
	
	if (head->word_ending & 2)
	{
		num_string++;
		total_used+=sizeof(compiler_table_string);
		total_used+=my_strlen(((compiler_table_string *)head)->rest)+1;
	}
	else if (head->word_ending & 4)
	{
		num_short_entry++;
		for (i=0;i<head->length;i++)
		{
			calculate_used_space((compiler_table_entry *)((compiler_table_short_entry *)head)->schars[i].schar);
		}
		total_used+=(sizeof(compiler_table_short_entry) + sizeof(struct compiler_short_entry)*count_chars);
	}
	else
	{
		for (i=0;i<count_chars;i++)
		{
			calculate_used_space(head->chars[i]);
		}
		num_entry++;
		total_used+=(sizeof(compiler_table_entry) + sizeof(compiler_table_entry *) * (count_chars));
	}
}


int remove_singular_ends(compiler_table_entry *head,unsigned char *end)
{
	int total_used=0;
	int i;
	int used_entry=-1;
	int end_length;

	if (head==UNUSED_ENTRY)
	{
		return(-1);
	}
	if (head==NULL)
	{
		if (my_strlen(end)>=1)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	for (i=0;i<count_chars;i++)
	{
		if (head->chars[i]!=UNUSED_ENTRY)
		{
			if (used_entry==-1)
			{
				used_entry=i;
			}
			else
			{
				used_entry=500;
				break;
			}
		}
	}
		
	if (used_entry==500)
	{
		for (i=0;i<count_chars;i++)
		{
			end[0]='\0';
			if (remove_singular_ends(head->chars[i],end)>0)
			{
				num_singular_ends++;
				length_of_ends+=my_strlen(end);
				remove_ending(head->chars[i]);
				head->chars[i]=(compiler_table_entry *)create_string(end);
				/* do the replace for the stuff here */
			}
		}	
		return(0);
	}
	if (head->word_ending & 1)
	{
		end[0]='\0';
		i=remove_singular_ends(head->chars[used_entry],end);
		if (i>0)
		{
			num_singular_ends++;
			length_of_ends+=my_strlen(end);
			remove_ending(head->chars[i]);
			head->chars[used_entry]=(compiler_table_entry *)create_string(end);
		}
		return(0);
	}
	else
	{
		end_length=my_strlen(end);
		end[end_length+1]='\0';
		end[end_length]=reverse_mapping[used_entry];
		return(remove_singular_ends(head->chars[used_entry],end));		
	}
}


void dump_dictionary(compiler_table_entry *head, unsigned char *in_word)
{
	int i;
	int length;
	char cur_word[50];
	length=my_strlen(in_word);

	strcpy(cur_word,in_word);

	if (head==UNUSED_ENTRY)
	{
		return;
	}
	if (head==NULL)
	{
		fprintf(outfile,"%s\n",cur_word);
		return;
	}
	
	if (head->word_ending & 2)
	{
		fprintf(outfile,"%s%s\n",cur_word,((compiler_table_string *)head)->rest);
	}
	else
	{
		if (head->word_ending & 1)
		{
			fprintf(outfile,"%s\n",cur_word);
		}
		for (i=0;i<count_chars;i++)
		{
			if (length==0)
			{
				cur_word[length]=par_upper[reverse_mapping[i]];
			}
			else
			{
				cur_word[length]=reverse_mapping[i];
			}
			cur_word[length+1]='\0';
			dump_dictionary(head->chars[i],cur_word);
		}
	}
}


int find_word_in_dict(compiler_table_entry *head, unsigned char *word, int *positions, int depth,int *num_pos)
{
	if (head==UNUSED_ENTRY)
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (head==NULL)
	{
		positions[*num_pos]=depth;
		(*num_pos)++;
		return(1);
	}
	if (head->word_ending & 1)
	{
		positions[*num_pos]=depth;
		(*num_pos)++;
	}
	if (head->word_ending & 2)
	{
		if (memcmp(word,((compiler_table_string *)head)->rest,head->length)==0)
		{
			positions[*num_pos]=depth+head->length;
			(*num_pos)++;
			return(1);
		}
		else
		{
			if (*num_pos>0)
			{
				return(1);
			}
			else
			{
				return(0);
			}
		}
	}
	if (word[0]=='\0')
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (char_mapping[word[0]]==-1)
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (char_mapping[word[0]]>(head->length))
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	return(find_word_in_dict(head->chars[char_mapping[word[0]]],word+1,positions,depth+1,num_pos));
}




int break_down_word(compiler_table_entry *head,unsigned char *input,unsigned char *output)
{
	int i,j;

	int number_of_pos=0;
	int positions[10];
	int result;

	result=find_word_in_dict(head,input,positions,0,&number_of_pos);
	if (result==0)
	{
		return(0);
	}
	for (i=number_of_pos-1;i>=0;i--)
	{
		memcpy(output,input,positions[i]);
		output[positions[i]]=' ';
		output[positions[i]+1]='\0';
		if (input[positions[i]]=='\0')
		{
			return(1);
		}
		if (num_conj>0)
		{
			for (j=0;j<num_conj;j++)
			{
				if (conjs[j].length==0)
				{
					result=break_down_word(head,input+positions[i],output+positions[i]+1);
					if (result>0)
					{
						return(result);
					}
				}
				else
				{
					if (memcmp(conjs[j].conj,input+positions[i],conjs[j].length)==0)
					{
						result=break_down_word(head,input+positions[i]+conjs[j].length,output+positions[i]+1);
						if (result>0)
						{
							return(result);
						}
					}
				}
			}
		}
		/* insert code for connecting characters here */
		/* remove the connections in reverse order from longest to shortest */
	}
	return(0);
}


int my_strlen(unsigned char *word)
{
	int i=0;
	while (*word)
	{
		i++;
		*word++;
	}
	return(i);
}


void set_indexes_in_table(compiler_table_entry *head)
{
	int i;
	int last_used=-1;

	if (head==UNUSED_ENTRY)
	{
		return;
	}
	if (head==NULL)
		return;
	
	if (head->word_ending & 2)
	{
		if (head->index_number==0)
		{
			head->index_number=cur_index;
			cur_index++;
		}
	}
	else if (head->word_ending & 0x04)
	{
		if (head->index_number==0)
		{
			head->index_number=cur_index;
			cur_index++;
			for (i=0;i<head->length;i++)
			{
				if (((compiler_table_short_entry *)head)->schars[i].schar !=UNUSED_ENTRY)
				{	
					last_used=i;
				}
				set_indexes_in_table(((compiler_table_short_entry *)head)->schars[i].schar);
			}
			last_used_data[reverse_mapping[last_used]]++;
		}

	}
	else
	{
		if (head->index_number==0)
		{
			head->index_number=cur_index;
			cur_index++;
			for (i=0;i<count_chars;i++)
			{
				if (head->chars[i] !=UNUSED_ENTRY)
				{	
					last_used=i;
				}
				set_indexes_in_table(head->chars[i]);
			}
			last_used_data[reverse_mapping[last_used]]++;
			head->length=last_used+1;
		}

	}
}

#define _BIGENDIAN_

#ifdef _BIGENDIAN_
unsigned short fix_endian_short(unsigned short in)
{
	short temp;

	temp=in>>8;
	temp|=((in&0x00ff)<<8);

	return temp;
}
#else
unsigned short fix_endian_short(unsigned short in)
{
	return(in);
}
#endif

void fill_index_data_table(compiler_table_entry *head)
{
	int i;
	compiler_table_short_entry *p;
	if (head==UNUSED_ENTRY)
	{
		return;
	}
	if (head==NULL)
		return;
	
	if (head->word_ending & 2)
	{
		if (head->written==0)
		{
			head->written=1;
			index_table[head->index_number]=cur_data;
			data_table[cur_data]=head->word_ending;
			cur_data++;
			data_table[cur_data]=head->length;
			cur_data++;
			memcpy(data_table+cur_data,((compiler_table_string *)head)->rest,head->length);
			cur_data+=head->length;
//			cur_data=((cur_data+3)& (~0x00000003));
		}
	}
	else if (head->word_ending & 0x04)
	{
		if (head->written==0)
		{
			p=(compiler_table_short_entry *)head;
			head->written=1;
			index_table[head->index_number]=cur_data;
			data_table[cur_data]=head->word_ending;
			cur_data++;
			data_table[cur_data]=head->length;
			cur_data++;
			for (i=0;i<p->length;i++)
			{
				temp_schars[i].character=p->schars[i].character;
				if (p->schars[i].schar==NULL)
				{
					temp_schars[i].entry=0;
				}
				else
				{
					temp_schars[i].entry=fix_endian_short(p->schars[i].schar->index_number);
				}
			}
			memcpy(data_table+cur_data,temp_schars,head->length*3);
			cur_data+=head->length*3;
//			cur_data=((cur_data+3)& (~0x00000003));
	
			for (i=0;i<p->length;i++)
			{
				fill_index_data_table(p->schars[i].schar);
			}
		}
	}
	else
	{
		if (head->written==0)
		{
			head->written=1;
			index_table[head->index_number]=cur_data;
			data_table[cur_data]=head->word_ending;
			cur_data++;
			data_table[cur_data]=head->length;
			cur_data++;
			for (i=0;i<count_chars;i++)
			{
				if (head->chars[i]==UNUSED_ENTRY)
				{
					temp_chars[i]=-1;
					continue;
				}
				if (head->chars[i]==NULL)
				{
					temp_chars[i]=0;
					continue;
				}
				temp_chars[i]=fix_endian_short(head->chars[i]->index_number);
			}
			memcpy(data_table+cur_data,temp_chars,head->length*2);
			cur_data+=head->length*2;
//			cur_data=((cur_data+3)& (~0x00000003));
	
			for (i=0;i<count_chars;i++)
			{
				fill_index_data_table(head->chars[i]);
			}
		}
	}
}


compiler_table_string *check_existing_ends(unsigned char *word)
{
	int i;
	int length;

	if (max_ends==0)
	{
		return(NULL);
	}
	if (cur_ends==0)
	{
		return(NULL);
	}
	length=my_strlen(word);
	for (i=0;i<cur_ends;i++)
	{
		if (length==existing_ends[i]->length)
		{
			if (memcmp(word,existing_ends[i]->rest,length)==0)
			{
				return(existing_ends[i]);
			}
		}
	}
	return(NULL);
}


void add_end_to_existing(compiler_table_string *p)
{
	if (max_ends==0)
	{
		existing_ends=(compiler_table_string **)malloc(sizeof(compiler_table_string *) * 128);
		if (existing_ends==NULL)
		{
			exit(8);
		}
		max_ends=128;
	}
	if (cur_ends==max_ends)
	{
		max_ends<<=1;
		existing_ends=(compiler_table_string **)realloc(existing_ends,sizeof(compiler_table_string *) * max_ends);
		if (existing_ends==NULL)
		{
			exit(9);
		}
	}
	existing_ends[cur_ends]=p;
	cur_ends++;
}

int compress_nodes(compiler_table_entry *head)
{
	int i;
	int last_used=-1;
	int num_used=0;
	int return_value=0;
	compiler_table_short_entry *p;

	if (head==UNUSED_ENTRY)
	{
		return(0);
	}
	if (head==NULL)
		return(0);
	
	if (head->word_ending & 2)
	{
		return(0);
	}
	else
	{
		if (head->length==0)
		{
			for (i=0;i<count_chars;i++)
			{
				if (head->chars[i] !=UNUSED_ENTRY)
				{
					num_used++;
					last_used=i;
				}
				if (compress_nodes(head->chars[i]))
				{
					p=create_short_entry(head->chars[i]);
					free(head->chars[i]->chars);
					free(head->chars[i]);
					head->chars[i]=(compiler_table_entry *)p;
				}
			}
			if (  (((num_used * 3)+1)& ~0x00000001) < (last_used *2))
			{
				return_value=1;
			}
			head->length=last_used+1;
		}

	}
	return(return_value);
}


int count_singular_middles(compiler_table_entry *head,unsigned char *middle)
{
	int total_used=0;
	int i;
	int used_entry=-1;
	int middle_length;
	char temp_middle[50]={'\0'};

	if (head==UNUSED_ENTRY)
	{
		return(-1);
	}
	if (head==NULL)
	{
		if (my_strlen(middle)>=1)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (head->word_ending & 2)
	{
		if (my_strlen(middle)>=1)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	for (i=0;i<count_chars;i++)
	{
		if (head->chars[i]!=UNUSED_ENTRY)
		{
			if (used_entry==-1)
			{
				used_entry=i;
			}
			else
			{
				used_entry=500;
				break;
			}
		}
	}
		
	if (used_entry==500)
	{
		if (my_strlen(middle))
		{
			// this is the case where there is a middle in the buffer
			// and this the end of the middle, but there cnould be another one
			// farther down the trie
			// this will be counted when removed later
			// but since they are not being restored here at all
			strcpy(temp_middle,middle);
			// have to save the middle here
			// and restore after the for loop
			middle[0]='\0';

		}
		for (i=0;i<count_chars;i++)
		{
			middle[0]='\0';
			if (count_singular_middles(head->chars[i],middle)>0)
			{
				if (my_strlen(middle)>=2)
				{
					num_singular_middles++;
					size_of_middles+=my_strlen(middle);
				}
				//remove the middle here
//				remove_ending(head->chars[i]);
		//		head->chars[i]=(compiler_table_entry *)create_string(end);
				/* do the replace for the stuff here */
			}
		}
		if (my_strlen(temp_middle))
		{
			// restore the middle from above and return 1
			strcpy(middle,temp_middle);
			return(1);
		}
		return(0);
	}
	if (head->word_ending & 1)
	{
		if (my_strlen(middle))
		{
			// this is the case where there is a middle in the buffer
			// and this the end of the middle because of the end of a word
			// there could be another middle farther down the trie
			// this will be counted when removed later
			// but since they are not being restored here at all
			strcpy(temp_middle,middle);
			// have to save the middle here
			// and restore after the for loop
			middle[0]='\0';

		}
		middle[0]='\0';
		i=count_singular_middles(head->chars[used_entry],middle);
		if (i>0)
		{
			if (my_strlen(middle)>=2)
			{
				num_singular_middles++;
				size_of_middles+=my_strlen(middle);
			}
			//do the remove here
			//remove_ending(head->chars[i]);
			//head->chars[used_entry]=(compiler_table_entry *)create_string(end);
		}
		if (my_strlen(temp_middle))
		{
			strcpy(middle,temp_middle);
			return(1);
		}
		return(0);
	}
	else
	{
		middle_length=my_strlen(middle);
		middle[middle_length+1]='\0';
		middle[middle_length]=reverse_mapping[used_entry];
		return(count_singular_middles(head->chars[used_entry],middle));		
	}
}

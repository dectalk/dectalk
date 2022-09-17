#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int line_number;
unsigned unsigned char words[5000][100];
int word_pos[5000];
int word_pos2[5000];
int cont_pairs[5000][2];
int disc_pairs[5000][2];
int cont_triples[5000][3];
int either_pairs[5000][2];
int conj_words[5000][4];
int word_count=1;
int cont_pair_count=0;
int disc_pair_count=0;
int cont_triple_count=0;
int either_pair_count=0;
int conj_words_count=0;


int find_type_of_entry(unsigned char *line)
{
	int type=0;
	int start=0;
	int plus=0;
	int bracket=0;
	int dash=0;
	int in_paren=0;
	int i,j,k;

	for (i=0;i<strlen(line);i++)
	{
		if (start==0 && line[i]!=' ')
		{
			if (line[i]=='P')
			{
				type=1;
			}
			if (line[i]=='C')
			{
				type=2;
				return(5);
			}
			start=1;
			i++;
			continue;
		}
		if (in_paren)
		{
			if (line[i]==')')
			{
				in_paren=0;
			}
			continue;
		}
		if (line[i]=='(')
		{
			in_paren=1;
		}
		if (line[i]=='+')
		{
			plus++;
		}
		if (line[i]=='<')
		{
			bracket++;
			if (line[i+1]!='>')
			{
				fprintf(stderr,"mismatched < in line %d\n",line_number);
				exit(-1);

			}
		}
		if (line[i]=='-')
		{
			dash++;
		}
	}
	if (in_paren)
	{
		fprintf(stderr,"mismatched ( in line %d\n",line_number);
		exit(-1);
	}
	if (bracket==1 && (plus+dash)==0)
	{
		return(2);
	}
	if (dash==2 && (plus+bracket)==0)
	{
		return(4);
	}
	if (plus && (bracket+dash)==0)
	{
		if (plus==1)
		{
			return(1);
		}
		else if (plus==2)
		{
			return(3);
		}
		else
		{
			fprintf(stderr,"too many pluses in line %d\n",line_number);
			exit(-1);
		}
	}
	fprintf(stderr,"No word types found on line %d\n",line_number);
	exit(-1);
}

int find_and_assign_word_number(unsigned char *word)
{
	int i;

	for (i=0;i<word_count;i++)
	{
		if (strcmp(words[i],word)==0)
		{
			return(i);
		}
	}
	strcpy(words[i],word);
	word_count++;
	return(i);
}
		

void parse_cont_pair(unsigned char *line)
{
	int firsts[100];
	int seconds[100];
	int num_firsts=0;
	int num_seconds=0;
	unsigned char word[100];
	int word_length=0;
	int got_plus=0;
	int i,j;

	memset(firsts,0,100*4);
	memset(seconds,0,100*4);

	for (i=0;i<strlen(line);i++)
	{
		if (line[i]=='+')
		{
			got_plus=1;
			if (word_length)
			{
				word[word_length]='\0';
				firsts[num_firsts++]=find_and_assign_word_number(word);
				word_length=0;
			}
			continue;
		}
		if (line[i]=='(')
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_plus)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
			}
			if (line[i+1]=='-')
			{
				i+=1;
			}
			else
			{
				word_length=0;
			}
			continue;
		}
		if (line[i]>='a' && line[i]<='z')
		{
			word[word_length++]=line[i];
		}
		else
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_plus)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
				word_length=0;
			}
		}
	}
	if (word_length)
	{
		word[word_length]='\0';
		if (got_plus)
		{
			seconds[num_seconds++]=find_and_assign_word_number(word);	
		}
		else
		{
			firsts[num_firsts++]=find_and_assign_word_number(word);	
		}
		word_length=0;
	}
	for(i=0;i<num_firsts;i++)
	{
		for (j=0;j<num_seconds;j++)
		{
			cont_pairs[cont_pair_count][0]=firsts[i];
			cont_pairs[cont_pair_count++][1]=seconds[j];
		}
	}
}


void parse_disc_pair(unsigned char *line)
{
	int firsts[100];
	int seconds[100];
	int num_firsts=0;
	int num_seconds=0;
	unsigned char word[100];
	int word_length=0;
	int got_bracket=0;
	int i,j;

	memset(firsts,0,100*4);
	memset(seconds,0,100*4);

	for (i=0;i<strlen(line);i++)
	{
		if (line[i]=='<')
		{
			got_bracket=1;
			if (word_length)
			{
				word[word_length]='\0';
				firsts[num_firsts++]=find_and_assign_word_number(word);
				word_length=0;
			}
			continue;
		}
		if (line[i]=='(')
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_bracket)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
			}
			if (line[i+1]=='-')
			{
				i+=1;
			}
			else
			{
				word_length=0;
			}
			continue;
		}
		if (line[i]>='a' && line[i]<='z')
		{
			word[word_length++]=line[i];
		}
		else
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_bracket)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
				word_length=0;
			}
		}
	}
	if (word_length)
	{
		word[word_length]='\0';
		if (got_bracket)
		{
			seconds[num_seconds++]=find_and_assign_word_number(word);	
		}
		else
		{
			firsts[num_firsts++]=find_and_assign_word_number(word);	
		}
		word_length=0;
	}
	for(i=0;i<num_firsts;i++)
	{
		for (j=0;j<num_seconds;j++)
		{
			disc_pairs[disc_pair_count][0]=firsts[i];
			disc_pairs[disc_pair_count++][1]=seconds[j];
		}
	}
}

void parse_cont_triple(unsigned char *line)
{
	int firsts[100];
	int seconds[100];
	int thirds[100];
	int num_firsts=0;
	int num_seconds=0;
	int num_thirds=0;
	unsigned char word[100];
	int word_length=0;
	int got_plus=0;
	int i,j,k;

	memset(firsts,0,100*4);
	memset(seconds,0,100*4);
	memset(thirds,0,100*4);

	for (i=0;i<strlen(line);i++)
	{
		if (line[i]=='+')
		{
			got_plus++;
			if (word_length)
			{
				word[word_length]='\0';
				if (got_plus==1)
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);
				}
				else
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				word_length=0;
			}
			continue;
		}
		if (line[i]=='(')
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_plus==2)
				{
					thirds[num_thirds++]=find_and_assign_word_number(word);	
				}
				else if (got_plus==1)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
			}
			if (line[i+1]=='-')
			{
				i+=1;
			}
			else
			{
				word_length=0;
			}
			continue;
		}
		if (line[i]>='a' && line[i]<='z')
		{
			word[word_length++]=line[i];
		}
		else
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_plus==2)
				{
					thirds[num_thirds++]=find_and_assign_word_number(word);	
				}
				else if (got_plus==1)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
				word_length=0;
			}
		}
	}
	if (word_length)
	{
		word[word_length]='\0';
		if (got_plus==2)
		{
			thirds[num_thirds++]=find_and_assign_word_number(word);	
		}
		else if (got_plus==1)
		{
			seconds[num_seconds++]=find_and_assign_word_number(word);	
		}
		else
		{
			firsts[num_firsts++]=find_and_assign_word_number(word);	
		}
		word_length=0;
	}
	for(i=0;i<num_firsts;i++)
	{
		for (j=0;j<num_seconds;j++)
		{
			for (k=0;k<num_thirds;k++)
			{
				cont_triples[cont_triple_count][0]=firsts[i];
				cont_triples[cont_triple_count][1]=seconds[j];
				cont_triples[cont_triple_count++][2]=thirds[k];
			}
		}
	}
}

void parse_either_pair(unsigned char *line)
{
	int firsts[100];
	int seconds[100];
	int num_firsts=0;
	int num_seconds=0;
	unsigned char word[100];
	int word_length=0;
	int got_dash=0;
	int i,j;

	memset(firsts,0,100*4);
	memset(seconds,0,100*4);

	for (i=0;i<strlen(line);i++)
	{
		if (line[i]=='-')
		{
			if (got_dash)
			{
				word[word_length]='\0';
				seconds[num_seconds++]=find_and_assign_word_number(word);	
				word_length=0;
			}
			else
			{
				got_dash=1;
				if (word_length)
				{
					word[word_length]='\0';
					firsts[num_firsts++]=find_and_assign_word_number(word);
					word_length=0;
				}
			}
			continue;
		}
		if (line[i]=='(')
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_dash)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
			}
			if (line[i+1]=='-')
			{
				i+=1;
			}
			else
			{
				word_length=0;
			}
			continue;
		}
		if (line[i]>='a' && line[i]<='z')
		{
			word[word_length++]=line[i];
		}
		else
		{
			if (word_length)
			{
				word[word_length]='\0';
				if (got_dash)
				{
					seconds[num_seconds++]=find_and_assign_word_number(word);	
				}
				else
				{
					firsts[num_firsts++]=find_and_assign_word_number(word);	
				}
				word_length=0;
			}
		}
	}
	if (word_length)
	{
		word[word_length]='\0';
		if (got_dash)
		{
			seconds[num_seconds++]=find_and_assign_word_number(word);	
		}
		else
		{
			firsts[num_firsts++]=find_and_assign_word_number(word);	
		}
		word_length=0;
	}
	for(i=0;i<num_firsts;i++)
	{
		for (j=0;j<num_seconds;j++)
		{
			either_pairs[either_pair_count][0]=firsts[i];
			either_pairs[either_pair_count++][1]=seconds[j];
		}
	}
}


void parse_conj_words(unsigned char *line)
{
	int firsts[100];
	int seconds[100];
	int thirds[100];
	int fourths[100];
	int num_firsts=0;
	int num_seconds=0;
	int num_thirds=0;
	int num_fourths=0;
	unsigned char word[100];
	int word_length=0;
	int got_space=0;
	int i,j,k,l;

	memset(firsts,0,100*4);
	memset(seconds,0,100*4);
	memset(thirds,0,100*4);
	memset(fourths,0,100*4);

	for (i=0;i<strlen(line);i++)
	{
		if (line[i]>='a' && line[i]<='z' || line[i]>0x81)
		{
			word[word_length++]=line[i];
		}
		else
		{
			if (line[i]=='\n')
			{
				line[i]=' ';
			}
			if (line[i]==' ' && i>=1 && line[i-1]!=' ')
			{
				got_space++;
				if (word_length)
				{
					word[word_length]='\0';
					switch (got_space)
					{
					case 1:
						firsts[num_firsts++]=find_and_assign_word_number(word);
						break;
					case 2:
						seconds[num_seconds++]=find_and_assign_word_number(word);	
						break;
					case 3:
						thirds[num_thirds++]=find_and_assign_word_number(word);	
						break;
					case 4:
						fourths[num_fourths++]=find_and_assign_word_number(word);	
						break;
					}
					
					word_length=0;
				}
			}
		}
	}
	if (word_length)
	{
		got_space++;
		word[word_length]='\0';
		switch (got_space)
		{
		case 1:
			firsts[num_firsts++]=find_and_assign_word_number(word);
			break;
		case 2:
			seconds[num_seconds++]=find_and_assign_word_number(word);	
			break;
		case 3:
			thirds[num_thirds++]=find_and_assign_word_number(word);	
			break;
		case 4:
			fourths[num_fourths++]=find_and_assign_word_number(word);	
			break;
		}
		
		word_length=0;
	}
	if (num_seconds==0)
	{
		num_seconds=1;
		seconds[0]=0;
	}
	if (num_thirds==0)
	{
		num_thirds=1;
		thirds[0]=0;
	}
	if (num_fourths==0)
	{
		num_fourths=1;
		fourths[0]=0;
	}
	for(i=0;i<num_firsts;i++)
	{
		for (j=0;j<num_seconds;j++)
		{
			for (k=0;k<num_thirds;k++)
			{
				for (l=0;l<num_fourths;l++)
				{
					conj_words[conj_words_count][0]=firsts[i];
					conj_words[conj_words_count][1]=seconds[j];
					conj_words[conj_words_count][2]=thirds[k];
					conj_words[conj_words_count++][3]=fourths[l];
				}
			}
		}
	}
}


void sort_words(void)
{
	int i,j,k;
	int smallest=1;
	unsigned char tempa[100];
	int tempi;

	for (i=0;i<word_count+2;i++)
	{
		word_pos[i]=i;
	}

	for (i=1;i<(word_count-1);i++)
	{
		smallest=i;
		for (j=i+1;j<word_count;j++)
		{
			if (strcmp(words[j],words[smallest])<0)
			{
				smallest=j;
			}
		}

		strcpy(tempa,words[i]);
		strcpy(words[i],words[smallest]);
		strcpy(words[smallest],tempa);
		
		tempi=word_pos[i];
		word_pos[i]=word_pos[smallest];
		word_pos[smallest]=tempi;
	}
}

void renumber_pairs(void)
{
	int i,j,k;
	
	for (i=1;i<word_count;i++)
	{
		for (j=1;j<word_count;j++)
		{
			if (word_pos[j]==i)
			{
				word_pos2[i]=j;
			}
		}
	}



	for (i=0;i<cont_pair_count;i++)
	{
		cont_pairs[i][0]=word_pos2[cont_pairs[i][0]];
		cont_pairs[i][1]=word_pos2[cont_pairs[i][1]];
	}
	for (i=0;i<disc_pair_count;i++)
	{
		disc_pairs[i][0]=word_pos2[disc_pairs[i][0]];
		disc_pairs[i][1]=word_pos2[disc_pairs[i][1]];

	}
	for (i=0;i<cont_triple_count;i++)
	{
		cont_triples[i][0]=word_pos2[cont_triples[i][0]];
		cont_triples[i][1]=word_pos2[cont_triples[i][1]];
		cont_triples[i][2]=word_pos2[cont_triples[i][2]];
	}
	for (i=0;i<either_pair_count;i++)
	{
		either_pairs[i][0]=word_pos2[either_pairs[i][0]];
		either_pairs[i][1]=word_pos2[either_pairs[i][1]];
	}
	for (i=0;i<conj_words_count;i++)
	{
		conj_words[i][0]=word_pos2[conj_words[i][0]];
		conj_words[i][1]=word_pos2[conj_words[i][1]];
		conj_words[i][2]=word_pos2[conj_words[i][2]];
		conj_words[i][3]=word_pos2[conj_words[i][3]];
	}
	
}

void sort_cont_pairs(void)
{
	int small;

	int temp;
	int i,j;

	for (i=0;i<cont_pair_count-1;i++)
	{
		small=i;
		for (j=i+1;j<cont_pair_count;j++)
		{
			if (cont_pairs[j][0]<cont_pairs[small][0])
			{
				small=j;
				continue;
			}
			if (cont_pairs[j][0]==cont_pairs[small][0] 
				&& cont_pairs[j][1]<cont_pairs[small][1])
			{
				small=j;
			}
		}
		temp=cont_pairs[i][0];
		cont_pairs[i][0]=cont_pairs[small][0];
		cont_pairs[small][0]=temp;

		temp=cont_pairs[i][1];
		cont_pairs[i][1]=cont_pairs[small][1];
		cont_pairs[small][1]=temp;

	}
}

void sort_disc_pairs(void)
{
	int small;

	int temp;
	int i,j;

	for (i=0;i<disc_pair_count-1;i++)
	{
		small=i;
		for (j=i+1;j<disc_pair_count;j++)
		{
			if (disc_pairs[j][0]<disc_pairs[small][0])
			{
				small=j;
				continue;
			}
			if (disc_pairs[j][0]==disc_pairs[small][0] 
				&& disc_pairs[j][1]<disc_pairs[small][1])
			{
				small=j;
			}
		}
		temp=disc_pairs[i][0];
		disc_pairs[i][0]=disc_pairs[small][0];
		disc_pairs[small][0]=temp;

		temp=disc_pairs[i][1];
		disc_pairs[i][1]=disc_pairs[small][1];
		disc_pairs[small][1]=temp;

	}
}

void sort_cont_triple(void)
{
	int small;

	int temp;
	int i,j;

	for (i=0;i<cont_triple_count-1;i++)
	{
		small=i;
		for (j=i+1;j<cont_triple_count;j++)
		{
			if (cont_triples[j][0]<cont_triples[small][0])
			{
				small=j;
				continue;
			}
			if (cont_triples[j][0]==cont_triples[small][0] 
				&& cont_triples[j][1]<cont_triples[small][1])
			{
				small=j;
			}
			if (cont_triples[j][0]==cont_triples[small][0] 
				&& cont_triples[j][1]==cont_triples[small][1]
				&& cont_triples[j][2]<cont_triples[small][2])
			{
				small=j;
			}
		}
		temp=cont_triples[i][0];
		cont_triples[i][0]=cont_triples[small][0];
		cont_triples[small][0]=temp;

		temp=cont_triples[i][1];
		cont_triples[i][1]=cont_triples[small][1];
		cont_triples[small][1]=temp;

		temp=cont_triples[i][2];
		cont_triples[i][2]=cont_triples[small][2];
		cont_triples[small][2]=temp;

	}
}

void sort_either_pairs(void)
{
	int small;

	int temp;
	int i,j;

	for (i=0;i<either_pair_count-1;i++)
	{
		small=i;
		for (j=i+1;j<either_pair_count;j++)
		{
			if (either_pairs[j][0]<either_pairs[small][0])
			{
				small=j;
				continue;
			}
			if (either_pairs[j][0]==either_pairs[small][0] 
				&& either_pairs[j][1]<either_pairs[small][1])
			{

				small=j;
			}
		}
		temp=either_pairs[i][0];
		either_pairs[i][0]=either_pairs[small][0];
		either_pairs[small][0]=temp;

		temp=either_pairs[i][1];
		either_pairs[i][1]=either_pairs[small][1];
		either_pairs[small][1]=temp;

	}
}

void sort_conj_words(void)
{
	int small;

	int temp;
	int i,j;

	for (i=0;i<conj_words_count-1;i++)
	{
		small=i;
		for (j=i+1;j<conj_words_count;j++)
		{
			if (conj_words[j][0]<conj_words[small][0])
			{
				small=j;
				continue;
			}
			if (conj_words[j][0]==conj_words[small][0] 
				&& conj_words[j][1]<conj_words[small][1])
			{
				small=j;
			}
			if (conj_words[j][0]==conj_words[small][0] 
				&& conj_words[j][1]==conj_words[small][1]
				&& conj_words[j][2]<conj_words[small][2])
			{
				small=j;
			}
			if (conj_words[j][0]==conj_words[small][0] 
				&& conj_words[j][1]==conj_words[small][1]
				&& conj_words[j][2]==conj_words[small][2]
				&& conj_words[j][3]<conj_words[small][3])
			{
				small=j;
			}
		}
		temp=conj_words[i][0];
		conj_words[i][0]=conj_words[small][0];
		conj_words[small][0]=temp;

		temp=conj_words[i][1];
		conj_words[i][1]=conj_words[small][1];
		conj_words[small][1]=temp;

		temp=conj_words[i][2];
		conj_words[i][2]=conj_words[small][2];
		conj_words[small][2]=temp;

		temp=conj_words[i][3];
		conj_words[i][3]=conj_words[small][3];
		conj_words[small][3]=temp;
	}
}



int main(int argc, unsigned char *argv[])
{
	int i,j,k;

	unsigned char line[1000];
	FILE *infile;
	FILE *outfile;
	
	int type=0;


	unsigned char word_table[50000];
	int pos;
	unsigned short word_index[5000];

	memset(words,0,5000*100);
	memset(cont_pairs,0,5000*2*4);
	memset(disc_pairs,0,5000*2*4);
	memset(cont_triples,0,5000*3*4);
	memset(either_pairs,0,5000*2*4);
	memset(conj_words,0,5000,4*4);

	infile=fopen(argv[1],"r");
	if (infile==NULL)
	{
		fprintf(stderr,"usage: proparser <infile> <outfile>");
		exit(1);
	}
	outfile=fopen(argv[2],"w");
	if (outfile==NULL)
	{
		fprintf(stderr,"usage: proparser <infile> <outfile>");
		fclose(infile);
		exit(1);
	}
	line_number=0;
	while (fgets(line,999,infile)!=NULL)
	{
		line_number++;
		line[strlen(line)-1]='\0';
		type=find_type_of_entry(line);
		switch(type)
		{
		case 1:	// continous pair
			parse_cont_pair(line+2);
			break;
		case 2: // discontinous pair
			parse_disc_pair(line+2);
			break;
		case 3: // continous_triple
			parse_cont_triple(line+2);
			break;
		case 4: // either_pair
			parse_either_pair(line+2);
			break;
		case 5:
			parse_conj_words(line+2);
			break;
		}
	}
	sort_words();

	renumber_pairs();

	sort_cont_pairs();
	sort_disc_pairs();
	sort_cont_triple();
	sort_either_pairs();
	sort_conj_words();

	word_table[0]=0;
	pos=1;
	word_index[0]=0;
	for (i=1;i<word_count;i++)
	{
		word_index[i]=pos;
		for (j=0;j<strlen(words[i]);j++)
		{
			word_table[pos++]=words[i][j];
		}
		word_table[pos++]='\0';
	}

#if 0
	fprintf(outfile,"/*\n");
	for (i=1;i<word_count;i++)
	{
		fprintf(outfile," * %3d %s\n",i,words[i]);
	}
	fprintf(outfile," */\n");
#endif

	fprintf(outfile,"const unsigned short verb_pairs_index[%d]={",word_count);
	for (i=0;i<word_count-1;i++)
	{
		if (((i)%8)==0)
		{
			fprintf(outfile,"\n\t0x%04X, ",word_index[i]);
		}
		else
		{
			fprintf(outfile,"0x%04X,  ",word_index[i]);
		}
	}
	if (((i)%8)==0)
	{
		fprintf(outfile,"\n\t0x%04X\n}; \n\n",word_index[i]);
	}
	else
	{
		fprintf(outfile,"0x%04X\n}; \n\n",word_index[i]);
	}

	fprintf(outfile,"const unsigned char verb_pairs_words[%d]= {",pos);
	for (i=0;i<pos-1;i++)
	{
		if (((i)%12)==0)
		{
			fprintf(outfile,"\n\t0x%02X, " ,word_table[i]);
		}
		else
		{
			fprintf(outfile,"0x%02X,  ",word_table[i]);
		}
	}
	if (((i)%12)==0)
	{
		fprintf(outfile,"\n\t0x%02X\n}; \n\n",word_table[i]);
	}
	else
	{
		fprintf(outfile,"0x%02X\n}; \n\n",word_table[i]);
	}
	
	fprintf(outfile,"\n");
	if (cont_pair_count==0)
		cont_pair_count=1;

	fprintf(outfile,"const unsigned char verb_pairs_cont2[%d][2]= { \n",cont_pair_count);
	for (i=0;i<cont_pair_count-1;i++)
	{
		fprintf(outfile,"\t{%4d,%4d},\n",cont_pairs[i][0],cont_pairs[i][1]);
	}
	fprintf(outfile,"\t{%4d,%4d}\n};\n\n",cont_pairs[i][0],cont_pairs[i][1]);
	if (disc_pair_count==0)
		disc_pair_count=1;

	fprintf(outfile,"const unsigned char verb_pairs_disc2[%d][2]= {\n",disc_pair_count);
	for (i=0;i<disc_pair_count-1;i++)
	{
		fprintf(outfile,"\t{%4d,%4d},\n",disc_pairs[i][0],disc_pairs[i][1]);
	}
	fprintf(outfile,"\t{%4d,%4d}\n};\n\n",disc_pairs[i][0],disc_pairs[i][1]);
	if (cont_triple_count==0)
		cont_triple_count=1;
	fprintf(outfile,"const unsigned char verb_pairs_cont3[%d][3]= {\n",cont_triple_count);
	for (i=0;i<cont_triple_count-1;i++)
	{
		fprintf(outfile,"\t{%4d,%4d,%4d},\n",cont_triples[i][0],cont_triples[i][1],cont_triples[i][2]);
	}
	fprintf(outfile,"\t{%4d,%4d,%4d}\n};\n\n",cont_triples[i][0],cont_triples[i][1],cont_triples[i][2]);
	if (either_pair_count==0)
		either_pair_count=1;
	fprintf(outfile,"const unsigned char verb_pairs_either[%d][2]= { \n",either_pair_count);
	for (i=0;i<either_pair_count-1;i++)
	{
		fprintf(outfile,"\t{%4d,%4d},\n",either_pairs[i][0],either_pairs[i][1]);
	}
	fprintf(outfile,"\t{%4d,%4d}\n};\n\n",either_pairs[i][0],either_pairs[i][1]);
	if (conj_words_count==0)
		conj_words_count=1;
	fprintf(outfile,"const unsigned char conj_words[%d][4]= {\n",conj_words_count);
	for (i=0;i<conj_words_count-1;i++)
	{
		fprintf(outfile,"\t{%4d,%4d,%4d,%4d},\n",conj_words[i][0],conj_words[i][1],conj_words[i][2],conj_words[i][3]);
	}
	fprintf(outfile,"\t{%4d,%4d,%4d,%4d}\n};\n\n",conj_words[i][0],conj_words[i][1],conj_words[i][2],conj_words[i][3]);


	fclose(infile);
	fclose(outfile);
}



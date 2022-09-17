/***********************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1995, 1996
**
**    All Rights Reserved.  Unpublished rights  reserved  under
**    the copyright laws of the United States.
**
**    The software contained on this media  is  proprietary  to
**    and  embodies  the  confidential  technology  of  Digital
**    Equipment Corporation.  Possession, use,  duplication  or
**    dissemination of the software and media is authorized only
**    pursuant to a valid written license from Digital Equipment
**    Corporation.
**
** NAME OF FILE
**    lts_dicp_us.c
**
** DESCRIPTION
**    This routine will process the SP dictionary by adding the new
**    changes into the existing dictionary
**
**     lts_dicp_sp  dic1  dic2  dic3
**     will merge dic2 into dic1 then create dic3
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         09/30/98        initial code
**
**
*/

/*
** Global include header files
*/

#include	<stdio.h>
#include 	<time.h>

/*
** Local include header files
*/

#include	"port.h"

#include	"lts_rule.h"
#include	"lts_util.h"

struct RULE_data *rule_list_head=0;
struct RULE_data *rule_list_tail=0;
struct RULE_data *rule_list_temp=0;

struct DICT_data *dict_list_head1=0;
struct DICT_data *dict_list_tail1=0;
struct DICT_data *dict_list_temp1=0;

struct DICT_data *dict_list_head2=0;
struct DICT_data *dict_list_tail2=0;
struct DICT_data *dict_list_temp2=0;

void add_list_tail(int code,
		   void **list_head,
                   void **list_tail,
                   void **list_item);
int is_vowel(unsigned char c);

int main(int argc, char *argv[])
{
	int	i,j,k,hit,hit1,hit2,hit3;
	int	status;
	char dicfile1[NOR_WORD_SIZE];
	char dicfile2[NOR_WORD_SIZE];
	char outfile[NOR_WORD_SIZE];
	char line_data[SPE_RECORD_SIZE]={""};
	char *record=line_data;
	char phoneme[NOR_WORD_SIZE]={""};
	char grapheme[NOR_WORD_SIZE]={""};
	char homoflag[NOR_WORD_SIZE]={""};
	char wordclass[NOR_WORD_SIZE]={""};
	char priority[NOR_WORD_SIZE]={""};
	unsigned int priority_no=0;
	unsigned int word_count=0;
	unsigned int line_no=0;

	char word[NOR_WORD_SIZE]={""};
	char total[NOR_WORD_SIZE]={""};
	
	FILE *fr1,*fr2,*fw;

	
	
	/* take "?" for quick help */
    if (argc >= 2 && !strcmp(argv[1],"?"))
	{
	   exit(0);
	}

	strcpy(dicfile1,argv[1]);
	fr1 = fopen(dicfile1,"r");

	strcpy(dicfile2,argv[2]);
	fr2 = fopen(dicfile2,"r");

	strcpy(outfile,argv[3]);
	fw = fopen(outfile,"w");


	word_count=0; line_no=0;
	while (fgets(record,SPE_RECORD_SIZE,fr1) != 0)
	{
		    int i,j,k;
            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t')
			{
				fprintf(fw,"%s",record);
				continue;
			}
			grapheme[0] = '\0';
			homoflag[0] = '\0';
			phoneme[0] = '\0';
			wordclass[0] = '\0';
			priority_no = 0;

			/* pick up grapheme */
			for (i=0,j=0;record[i]!=',';++i,++j)
				if (record[i] == '\\')
				{
					grapheme[j] = record[i++]; ++j;
					grapheme[j] = record[i];
				}
				else
					grapheme[j] = record[i];
			grapheme[j] = '\0';

			/* pick up homoflag */
			homoflag[0] = record[i+1];
			homoflag[1] = '\0';

			/* pick up phoneme */
			for (k=i+3,j=0;record[k]!=',';++j,++k)
				if (record[k] == '\\')
				{
					phoneme[j] = record[k++]; ++j;
					phoneme[j] = record[k];
				}
			else
				phoneme[j] = record[k];
			phoneme[j] = '\0';

			/* pick up wordclass */
			for (i=k+1,j=0;record[i]!=',';++i,++j)
				wordclass[j] = record[i];
			wordclass[j] = '\0';

			/* pick up priority */
			for (i=i+1,j=0;record[i]!='\n';++i,++j)
				priority[j] = record[i];
			priority[j] = '\0';
			priority_no = atoi(priority);

			if (strlen(grapheme) == 0) continue;

			word_count++;
			dict_list_temp1 = (struct DICT_data *)calloc(1, sizeof(struct DICT_data));
			if (dict_list_temp1 == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 1 entry.\n");
				exit(1);
			}
			dict_list_temp1->data = (char *)malloc(strlen(record) + 1);
			if (dict_list_temp1->data == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 1 data entry.\n");
				exit(1);
			}
			dict_list_temp1->grapheme = (char *)malloc(strlen(grapheme) + 1);
			if (dict_list_temp1->grapheme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 1 grapheme entry.\n");
				exit(1);
			}
			dict_list_temp1->phoneme = (char *)malloc(strlen(phoneme) + 5);
			if (dict_list_temp1->phoneme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 1 phoneme entry.\n");
				exit(1);
			}
			dict_list_temp1->homoflag = (char *)malloc(strlen(homoflag) + 1);
			if (dict_list_temp1->homoflag == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 1 homoflag entry.\n");
				exit(1);
			}
			dict_list_temp1->wordclass = (char *)malloc(strlen(wordclass) + 1);
			if (dict_list_temp1->wordclass == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 1 wordclass entry.\n");
				exit(1);
			}

			strcpy(dict_list_temp1->data,record);
			if (strlen(grapheme) == 1 && grapheme[0] == '\"')
				strcpy(dict_list_temp1->grapheme,grapheme);
			else
				strcpy(dict_list_temp1->grapheme,string_substitute(grapheme,"\"",""));
			strcpy(dict_list_temp1->phoneme,phoneme);
			strcpy(dict_list_temp1->homoflag,homoflag);
			strcpy(dict_list_temp1->wordclass,wordclass);
			dict_list_temp1->priority_no = priority_no;
			dict_list_temp1->match = 0;
			dict_list_temp1->line = ++line_no;

// printf("%s,%s,%s,%s,%s\n",grapheme,homoflag,phoneme,wordclass,priority);

			add_list_tail(1,(void **)&dict_list_head1,(void **)&dict_list_tail1,(void **)&dict_list_temp1);

	}

	word_count=0; line_no=0;
	while (fgets(record,SPE_RECORD_SIZE,fr2) != 0)
	{
		    int i,j,k;
            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t')
			{
				fprintf(fw,"%s",record);
				continue;
			}
			grapheme[0] = '\0';
			homoflag[0] = '\0';
			phoneme[0] = '\0';
			wordclass[0] = '\0';
			priority_no = 0;

			/* pick up grapheme */
			for (i=0,j=0;record[i]!=',';++i,++j)
				if (record[i] == '\\')
				{
					grapheme[j] = record[i++]; ++j;
					grapheme[j] = record[i];
				}
				else
					grapheme[j] = record[i];
			grapheme[j] = '\0';

			/* pick up homoflag */
			homoflag[0] = record[i+1];
			homoflag[1] = '\0';

			/* pick up phoneme */
			for (k=i+3,j=0;record[k]!=',';++j,++k)
				if (record[k] == '\\')
				{
					phoneme[j] = record[k++]; ++j;
					phoneme[j] = record[k];
				}
			else
				phoneme[j] = record[k];
			phoneme[j] = '\0';

			/* pick up wordclass */
			for (i=k+1,j=0;record[i]!=',';++i,++j)
				wordclass[j] = record[i];
			wordclass[j] = '\0';

			/* pick up priority */
			for (i=i+1,j=0;record[i]!='\n';++i,++j)
				priority[j] = record[i];
			priority[j] = '\0';
			priority_no = atoi(priority);

			if (strlen(grapheme) == 0) continue;

			word_count++;
			dict_list_temp2 = (struct DICT_data *)calloc(1, sizeof(struct DICT_data));
			if (dict_list_temp2 == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 entry.\n");
				exit(1);
			}
			dict_list_temp2->data = (char *)malloc(strlen(record) + 1);
			if (dict_list_temp2->data == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 data entry.\n");
				exit(1);
			}
			dict_list_temp2->grapheme = (char *)malloc(strlen(grapheme) + 1);
			if (dict_list_temp2->grapheme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 grapheme entry.\n");
				exit(1);
			}
			dict_list_temp2->phoneme = (char *)malloc(strlen(phoneme) + 1);
			if (dict_list_temp2->phoneme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 phoneme entry.\n");
				exit(1);
			}
			dict_list_temp2->homoflag = (char *)malloc(strlen(homoflag) + 1);
			if (dict_list_temp2->homoflag == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 homoflag entry.\n");
				exit(1);
			}
			dict_list_temp2->wordclass = (char *)malloc(strlen(wordclass) + 1);
			if (dict_list_temp2->wordclass == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 wordclass entry.\n");
				exit(1);
			}

			strcpy(dict_list_temp2->data,record);
			if (strlen(grapheme) == 1 && grapheme[0] == '\"')
				strcpy(dict_list_temp2->grapheme,grapheme);
			else
				strcpy(dict_list_temp2->grapheme,string_substitute(grapheme,"\"",""));
			strcpy(dict_list_temp2->phoneme,phoneme);
			strcpy(dict_list_temp2->homoflag,homoflag);
			strcpy(dict_list_temp2->wordclass,wordclass);
			dict_list_temp2->priority_no = priority_no;
			dict_list_temp2->match = 0;
			dict_list_temp2->line = ++line_no;

// printf("%s,%s,%s,%s,%s\n",grapheme,homoflag,phoneme,wordclass,priority);

			add_list_tail(1,(void **)&dict_list_head2,(void **)&dict_list_tail2,(void **)&dict_list_temp2);

	}


    dict_list_temp1 = dict_list_head1;
    while (dict_list_temp1)
    {
		dict_list_temp2 = dict_list_head2;
		while (dict_list_temp2)
		{
			hit = 0;
			if (!strcmp(dict_list_temp1->grapheme,dict_list_temp2->grapheme))
			{
				strcpy(dict_list_temp1->phoneme,dict_list_temp2->phoneme);
				strcpy(dict_list_temp1->wordclass,dict_list_temp2->wordclass);
				break;
			}
			dict_list_temp2 = dict_list_temp2->next;
		}
		dict_list_temp1 = dict_list_temp1->next;
    }


	dict_list_temp1 = dict_list_head1;
    while (dict_list_temp1)
    {
		fprintf(fw,"%s,%s,%s,%s,%d\n",dict_list_temp1->grapheme,
				dict_list_temp1->homoflag,
				dict_list_temp1->phoneme,
				dict_list_temp1->wordclass,
				dict_list_temp1->priority_no);
		dict_list_temp1 = dict_list_temp1->next;
    }




	fclose(fr1);
	fclose(fr2);
	fclose(fw);

}

/***********************************************************************
**
** DESCRIPTION
**
**  The add_list_tail() function will do the following task:
**
**  1). add list_item to the list tail
**
**      incoming arguments:
**
**               code		 0 for RULE_data
**				 1 for DICT_data
**               **list_head     pointer to pointer of list head
**               **list_tail     pointer to pointer of list tail
**               **list_item     pointer to pointer of list item adding to list tail
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
void add_list_tail(int code,
		   void **list_head,
                   void **list_tail,
                   void **list_item)
{

    /* if list is empty, add the list_item to the list head */
    if (*list_head == 0)
    {
       *list_head = *list_item;
       *list_tail = *list_item;
    }
    else
    /* if list is not empty, add the list_item to the list tail */
    {
	if (code == 0)  ((struct RULE_data *)*list_tail)->next = (struct RULE_data *)*list_item;
	if (code == 1)  ((struct DICT_data *)*list_tail)->next = (struct DICT_data *)*list_item;
	*list_tail = *list_item;
    }
    return;

}

int is_vowel(unsigned char c)
{
	unsigned char vowel[]={
		'i',
		'I',
		'e',
		'E',
		'@',
		'a',
		'A',
		'W',
		'^',
		'c',
		'o',
		'O',
		'U',
		'u',
		'R',
		'Y',
		'x',
		'|',
		'L',
		0
	};
	int i;
	int hit=0;

	for (i=0;vowel[i]!=0;++i)
	{
		if (c == vowel[i])
		{
			hit = 1;
			break;
		}
	}

	return(hit);
}

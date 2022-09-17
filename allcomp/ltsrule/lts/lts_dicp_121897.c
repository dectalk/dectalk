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
**    lts_dicp.c
**
** DESCRIPTION
**
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         11/29/97        initial code
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
	int	i,j,k,hit,hit1,hit2;
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


/* suffix tag */
unsigned char *suff_tag[]={
"s",
"s'",
"'s",
"es",
"ies",
"ed",
"er",
"ers",
"ings",
"ing",
"able",
"less",
"ment",
"ness",
"ship",
"dom",
"ify",
"ism",
"ize",
"ly",
"or",
"our",
"ful",
"ish",
"hood",
"craft",
"lings",
"ling",
"*"
};
	
	
	
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
#if defined (LINKR) || defined (UNSTRESS)
				fprintf(fw,"%s",record);
#endif
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
			dict_list_temp1->phoneme = (char *)malloc(strlen(phoneme) + 1);
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

//printf("%s,%s,%s,%s,%s\n",grapheme,homoflag,phoneme,wordclass,priority);

			add_list_tail(1,(void **)&dict_list_head1,(void **)&dict_list_tail1,(void **)&dict_list_temp1);

	}

#ifdef UNSTRESS

    dict_list_temp1 = dict_list_head1;
    while (dict_list_temp1)
    {
		hit = 0;
		if (strstr(dict_list_temp1->wordclass,"art") ||
		    strstr(dict_list_temp1->wordclass,"pron") ||
		    strstr(dict_list_temp1->wordclass,"prep") ||
		    strstr(dict_list_temp1->wordclass,"part") ||
		    strstr(dict_list_temp1->wordclass,"aux") ||
		    strstr(dict_list_temp1->wordclass,"conj") ||
		    strstr(dict_list_temp1->wordclass,"poss") ||
		    strstr(dict_list_temp1->wordclass,"that") ||
		    strstr(dict_list_temp1->wordclass,"to") ||
		    strstr(dict_list_temp1->wordclass,"who") ||
		    strstr(dict_list_temp1->wordclass,"neg") ||
		    strstr(dict_list_temp1->wordclass,"func") ||
		    strstr(dict_list_temp1->wordclass,"det"))
		{
			if ((dict_list_temp1->phoneme[0] == '\'') ||
			   (dict_list_temp1->phoneme[0] == '\`'))
				hit = 1;
			if (!is_vowel(dict_list_temp1->phoneme[0])  && 
			   ((dict_list_temp1->phoneme[1] == '\'') ||
			   (dict_list_temp1->phoneme[1] == '\`')))
				hit = 2;
		}
		if (hit == 1)
		{
			//printf("%s\n",dict_list_temp1->phoneme);
			string_shift(1,1,dict_list_temp1->phoneme);
			//printf("%s\n\n",dict_list_temp1->phoneme);
		}
		if (hit == 2)
		{
			printf("%s\n",dict_list_temp1->phoneme);
			string_shift(1,1,&(dict_list_temp1->phoneme[1]));
			printf("%s\n\n",dict_list_temp1->phoneme);
		}

		fprintf(fw,"%s,%s,%s,%s,%d\n",dict_list_temp1->grapheme,
				dict_list_temp1->homoflag,
				dict_list_temp1->phoneme,
				dict_list_temp1->wordclass,
				dict_list_temp1->priority_no);
		dict_list_temp1 = dict_list_temp1->next;

    } /* while (dict_list_temp1) */



#endif





#ifdef LINKR
	word_count=0; line_no=0;
	while (fgets(record,SPE_RECORD_SIZE,fr2) != 0)
	{
            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t') continue;

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

//printf("%s,%s,%s,%s,%s\n",grapheme,homoflag,phoneme,wordclass,priority);

			add_list_tail(1,(void **)&dict_list_head2,(void **)&dict_list_tail2,(void **)&dict_list_temp2);

	}

	
    dict_list_temp1 = dict_list_head1;
    while (dict_list_temp1)
    {
		hit = 0;
		dict_list_temp2 = dict_list_head2;
		while (dict_list_temp2)
		{
			if (dict_list_temp1->grapheme[0] != dict_list_temp2->grapheme[0])
			{
				dict_list_temp2 = dict_list_temp2->next;
				continue;
			}
			if (!strcmp(dict_list_temp1->grapheme,dict_list_temp2->grapheme))
			{
				if (((dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='R') &&
				    (dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='r') &&
					(dict_list_temp2->phoneme[strlen(dict_list_temp2->phoneme)-1]=='R')) ||
				   ((dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='r') &&
					(dict_list_temp2->phoneme[strlen(dict_list_temp2->phoneme)-1]=='r') &&
					(dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='R') &&
					(dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='F') &&
					(dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='K') &&
					(dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='P') &&
					(dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='M') &&
					(dict_list_temp1->phoneme[strlen(dict_list_temp1->phoneme)-1]!='j')))
				{
					hit = 1;
//printf("%s,%s,%s,%s,%d\n",dict_list_temp1->grapheme,
//							dict_list_temp1->homoflag,
//							dict_list_temp1->phoneme,
//							dict_list_temp1->wordclass,
//							dict_list_temp1->priority_no);
//printf("%s,%s,%s,%s,%d\n\n",dict_list_temp2->grapheme,
//							dict_list_temp2->homoflag,
//							dict_list_temp2->phoneme,
//							dict_list_temp2->wordclass,
//							dict_list_temp2->priority_no);
				}
			}
			dict_list_temp2 = dict_list_temp2->next;
		} /* while (dict_list_temp2) */
		if (hit==1)
		{
			fprintf(fw,"%s,%s,&%sr,%s,%d\n",dict_list_temp1->grapheme,
							dict_list_temp1->homoflag,
							dict_list_temp1->phoneme,
							dict_list_temp1->wordclass,
							dict_list_temp1->priority_no);
		}
		else
		{
			fprintf(fw,"%s,%s,%s,%s,%d\n",dict_list_temp1->grapheme,
							dict_list_temp1->homoflag,
							dict_list_temp1->phoneme,
							dict_list_temp1->wordclass,
							dict_list_temp1->priority_no);
		}		

       dict_list_temp1 = dict_list_temp1->next;
    } /* while (dict_list_temp1) */
	
#endif
	

#ifdef WORDLIST
	word_count=0; line_no=0;
	while (fgets(record,SPE_RECORD_SIZE,fr2) != 0)
	{
            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t') continue;

			word[0] = '\0';
			total[0] = '\0';

			/* pick up grapheme */
			sscanf(record,"%s %s",word,total);

			/* remove the single character entry and single character abb. */
		    if ((word[1] == '\0') || (word[1] == '.'))
			continue;

			/* remove all the abb. */
		    if (strstr(word,"."))
			continue;

			/* remove all the crazy word */
		    if (strstr(word,"[") || word[strlen(word)-1] == '-')
			continue;

			/* remove the 1 show-up count entry */
//		    if ((total[0] == '1') && (total[1] == '\0'))
//			continue;

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
			dict_list_temp2->grapheme = (char *)malloc(strlen(word) + 1);
			if (dict_list_temp2->grapheme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 grapheme entry.\n");
				exit(1);
			}
			dict_list_temp2->phoneme = (char *)malloc(strlen(total) + 1);
			if (dict_list_temp2->phoneme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for dict 2 phoneme entry.\n");
				exit(1);
			}

			if (isupper(record[0]) && islower(record[1]) && record[1] != '\'') record[0] = tolower(record[0]);
			if (isupper(word[0]) && islower(word[1]) && word[1] != '\'') word[0] = tolower(word[0]);
			strcpy(dict_list_temp2->data,record);
			strcpy(dict_list_temp2->grapheme,word);
			strcpy(dict_list_temp2->phoneme,total);
			dict_list_temp2->line = ++line_no;

//printf("%s %s\n",word,total);

			add_list_tail(1,(void **)&dict_list_head2,(void **)&dict_list_tail2,(void **)&dict_list_temp2);

	}
	
    dict_list_temp2 = dict_list_head2;
    while (dict_list_temp2)
    {
		hit = 0;
		/* don't process the single character entry */
		if ((dict_list_temp2->grapheme[1] == '\0') ||
		   (dict_list_temp2->grapheme[1] == '.'))

		{
			dict_list_temp2 = dict_list_temp2->next;
			continue;
		}

		dict_list_temp1 = dict_list_head1;

		while (dict_list_temp1)
		{
			if (dict_list_temp1->grapheme[0] != dict_list_temp2->grapheme[0])
			{
				dict_list_temp1 = dict_list_temp1->next;
				continue;
			}
			if (!strcmp(dict_list_temp1->grapheme,dict_list_temp2->grapheme))
			{
				hit = 1;
				break;
			}
			dict_list_temp1 = dict_list_temp1->next;
		} /* while (dict_list_temp1) */

		if (hit==0)
		{

			char temp[NOR_WORD_SIZE]="";
			hit1=0;
			/* if miss then strip the suffix search again */
			for (i=0;suff_tag[i][0]!='*';++i)
			{
				if (!strncmp_tail(dict_list_temp2->grapheme,suff_tag[i],strlen(suff_tag[i])))
				{	hit1=1; break; }
			}
			if (hit1 == 1)
			{
				strcpy(temp,dict_list_temp2->grapheme);
				temp[strlen(temp)-strlen(suff_tag[i])] = '\0';
//printf("%s %s\n",dict_list_temp2->grapheme,temp);

				hit2=0;
				dict_list_temp1 = dict_list_head1;
				while (dict_list_temp1)
				{
					if (dict_list_temp1->grapheme[0] != temp[0])
					{
						dict_list_temp1 = dict_list_temp1->next;
						continue;
					}
					if (!strcmp(dict_list_temp1->grapheme,temp))
					{
						hit2 = 1;
						break;
					}
					dict_list_temp1 = dict_list_temp1->next;
				} /* while (dict_list_temp1) */

			}
			
			if ((hit1 == 0) || (hit2 == 0))
//				fprintf(fw,"%s	%s\n",dict_list_temp2->grapheme,dict_list_temp2->phoneme);
				fprintf(fw,"%s",dict_list_temp2->data);
		}
       dict_list_temp2 = dict_list_temp2->next;
    } /* while (dict_list_temp2) */

#endif

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
		'F',
		'K',
		'P',
		'M',
		'j',
		'B',
		'L',
		'V',
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

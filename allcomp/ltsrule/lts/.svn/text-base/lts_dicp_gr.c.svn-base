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
**    lts_dicp_gr.c
**
** DESCRIPTION
**    This program will search for double consonant and add "&" before associated
**    phoneme for DOUBLCONS
**    IGCHANGE will change all the words with -ig ending from "k" phoneme to "x"
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         06/16/98        initial code
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

int is_vowel(unsigned char c);
int how_many(char *word, unsigned char c);

int main(int argc, char *argv[])
{
	int	i,j,k,hit,hit1,hit2,hit3;
	int	status;
	char dicfile[NOR_WORD_SIZE];
	char outfile[NOR_WORD_SIZE];
	char line_data[SPE_RECORD_SIZE]={""};
	char *record=line_data;
	char phoneme[NOR_WORD_SIZE]={""};
	char phoneme_t[NOR_WORD_SIZE]={""};
	char grapheme[NOR_WORD_SIZE]={""};
	char grapheme_t[NOR_WORD_SIZE]={""};
	char homoflag[NOR_WORD_SIZE]={""};
	char wordclass[NOR_WORD_SIZE]={""};
	char priority[NOR_WORD_SIZE]={""};
	char marker[NOR_WORD_SIZE]={""};

	unsigned int priority_no=0;
	unsigned int target_hit1=0;
	unsigned int target_hit2=0;
	unsigned int find_vowel=0;
	unsigned int grapheme_size=0;
	unsigned int phoneme_size=0;
	unsigned int first_half1=0;
	unsigned int first_half2=0;
	unsigned int occ_before=0;
	unsigned int wc1=0;
	unsigned int wc2=0;
	unsigned int wc3=0;
	unsigned int wc4=0;

	char word[NOR_WORD_SIZE]={""};
	char temp[NOR_WORD_SIZE]={""};
	
	FILE *fr,*fw;


/* suffix tag */
unsigned char con_list[]={
'c', 'k', 0,
'f', 'f', 0,
'l', 'l', 0,
'm', 'm', 0,
'n', 'n', 0,
'p', 'p', 0,
//'s', 's', 0,
't', 't', 0,
'0', '0', '0'
};
	
	
	
	/* take "?" for quick help */
    if (argc >= 2 && !strcmp(argv[1],"?"))
	{
	   exit(0);
	}

	strcpy(dicfile,argv[1]);
	fr = fopen(dicfile,"r");

	strcpy(outfile,argv[2]);
	fw = fopen(outfile,"w");

#ifdef DOUBLCONS
	while (fgets(record,SPE_RECORD_SIZE,fr) != 0)
	{
		    int i,j,k,l,m;
			int mark=0;

            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t')
			{
				fprintf(fw,"%s",record);
				continue;
			}
			marker[0] = '\0';
			grapheme[0] = '\0';
			grapheme_t[0] = '\0';
			homoflag[0] = '\0';
			phoneme[0] = '\0';
			phoneme_t[0] = '\0';
			wordclass[0] = '\0';
			priority_no = 0;
			target_hit1 = 999;
			target_hit2 = 999;
			find_vowel = 0;
			first_half1=0;
			first_half2=0;
			occ_before=0;

			/* pick up grapheme */
			for (i=0,j=0;record[i]!=',';++i,++j)
			{
				if (record[i] == '\\')
				{
					grapheme[j] = record[i++]; ++j;
					grapheme[j] = record[i];
				}
				else
					grapheme[j] = record[i];
			}
			grapheme[j] = '\0';
			grapheme_size=strlen(grapheme);
			strcpy(grapheme_t,grapheme);

			/* check the word with double consonant */
			for (l=0;grapheme[l]!='\0';++l)
			{
				for (k=0;con_list[k]!='0';++k)
				{
					if (((grapheme[l] == con_list[k]) && (grapheme[l+1] == con_list[k])) ||
					    ((grapheme[l] == con_list[k]) && (grapheme[l] == 'c') && (grapheme[l+1] == 'k')))
					{
						if (target_hit1 == 999)
						{
							if (l <= (grapheme_size/2)) first_half1=1;
							else
								first_half1=0;
							target_hit1 = k;
							grapheme_t[l] = '\0';
							occ_before = how_many(grapheme_t,con_list[k]);
							wc1++;
							break;
						}
						if (target_hit1 != 999 && target_hit2 ==999)
						{
							if (l <= (grapheme_size/2)) first_half2=1;
							else
								first_half2=0;
							target_hit2 = k;
							wc2++;
							break; 
						}
						if (target_hit1 != 999 && target_hit2 != 999)
						{
							strcpy(marker,"++>");
							wc3++;
//							printf("Find 3 double consonant->%s\n",grapheme);
//							exit(0);
						}
						break;
					}
					++k; ++k;
				}
			}

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
			phoneme_size=strlen(phoneme);
			strcpy(temp,phoneme);
			strcpy(phoneme_t,phoneme);

			/* pick up wordclass */
			for (i=k+1,j=0;record[i]!=',';++i,++j)
				wordclass[j] = record[i];
			wordclass[j] = '\0';

			/* pick up priority */
			for (i=i+1,j=0;record[i]!='\n';++i,++j)
				priority[j] = record[i];
			priority[j] = '\0';

			mark=0;
			/* process the double consonant marking  for one occurance*/
			if (target_hit1 != 999 && target_hit2 == 999)
			{
				/* marking the phoneme with double consonant */
				for (l=0,m=0;phoneme[l]!='\0';++l,++m)
				{
					if (find_vowel == 0)
					{
						if ((find_vowel = is_vowel(phoneme[l])) == 1)
						{
							phoneme_t[m] = phoneme[l];
							continue;
						}
					}
					
					if (find_vowel != 0 && mark == 0)
					{
						if (phoneme[l] == con_list[target_hit1+1] ||
							phoneme[l] == con_list[target_hit1+2])
						{
							temp[l] = '\0';
							/* if it is the only one */
							if (how_many(phoneme,phoneme[l]) == 1)
							{
								phoneme_t[m++] = '&';
								mark = 1;
							}
							else
							{
								if (first_half1 == 1 && l <= (phoneme_size/2))
								{
									phoneme_t[m++] = '&';
									mark = 1;
								}
								if (first_half1 == 0 && l > (phoneme_size/2))
								{
									phoneme_t[m++] = '&';
									mark = 1;
								}
							}
							/* if it has the same order*/
							if (mark == 0 && how_many(temp,phoneme[l]) == occ_before)
							{
								phoneme_t[m++] = '&';
								mark = 1;
							}
						}
					}
					phoneme_t[m] = phoneme[l];
					if (phoneme[l+1] == phoneme[l])
						phoneme_t[++m] = phoneme[++l];
				}
				phoneme_t[m] = '\0';

				if (mark == 0 && strlen(marker) == 0) strcpy(marker,"==>");
#if 0
				printf("%s%s-%c-%d-%s\n",marker,grapheme,
									con_list[target_hit1+1],
									first_half1,
									phoneme_t);
#endif
			}

			mark = 0;
			/* process the double consonant marking  for two occurance*/
			if (target_hit1 != 999 && target_hit2 != 999)
			{
				
				/* marking the phoneme with double consonant */
				for (l=0,m=0;phoneme[l]!='\0';++l,++m)
				{
					if (find_vowel == 0)
					{
						if ((find_vowel = is_vowel(phoneme[l])) == 1)
						{
							phoneme_t[m] = phoneme[l];
							continue;
						}
					}
					
					if (find_vowel != 0 && mark < 2)
					{
						if ((mark == 0 && phoneme[l] == con_list[target_hit1+1]) || 
							(mark == 1 && phoneme[l] == con_list[target_hit2+1]))
						{
							temp[l] = '\0';
							if (how_many(phoneme,phoneme[l]) == 2)
							{
								phoneme_t[m++] = '&';
								mark++;
							}
							else
							{
								if (mark == 0)
								{
									if (first_half1 == 1 && l <= (phoneme_size/2))
									{
										phoneme_t[m++] = '&';
										mark++;
									}
									if (first_half1 == 0 && l > (phoneme_size/2))
									{
										phoneme_t[m++] = '&';
										mark++;
									}
								}
								else
								{
									if (first_half2 == 1 && l <= (phoneme_size/2))
									{
										phoneme_t[m++] = '&';
										mark++;
									}
									if (first_half2 == 0 && l > (phoneme_size/2))
									{
										phoneme_t[m++] = '&';
										mark++;
									}
								}
							}
							/* if it has the same order*/
							if (mark == 0 && how_many(temp,phoneme[l]) == occ_before)
							{
								phoneme_t[m++] = '&';
								mark = 1;
							}
						}
					}
					phoneme_t[m] = phoneme[l];
					if (phoneme[l+1] == phoneme[l])
						phoneme_t[++m] = phoneme[++l];
				}
				phoneme_t[m] = '\0';
				if (mark == 0 && strlen(marker) == 0) strcpy(marker,"-->");
//#if 0
				printf("%s%s-%c%c-%s\n",marker,grapheme,
										con_list[target_hit1+1],
										con_list[target_hit2+1],
										phoneme_t);
//#endif
			}
			
			if (strlen(marker) != 0) wc4++;
			fprintf(fw,"%s%s,%s,%s,%s,%s\n",marker,grapheme,homoflag,phoneme_t,wordclass,priority);
	}
	printf("wc1 %d, wc2 %d, wc3 %d, wc4 %d\n",wc1,wc2,wc3,wc4);
#endif /* end of #ifdef DOUBLCONS */
	
#ifdef IGCHANGE
	while (fgets(record,SPE_RECORD_SIZE,fr) != 0)
	{
		    int i,j,k,l,m;
			int mark=0;

            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t')
			{
				fprintf(fw,"%s",record);
				continue;
			}
			grapheme[0] = '\0';
			homoflag[0] = '\0';
			phoneme[0] = '\0';
			phoneme_t[0] = '\0';
			wordclass[0] = '\0';
			priority_no = 0;

			/* pick up grapheme */
			for (i=0,j=0;record[i]!=',';++i,++j)
			{
				if (record[i] == '\\')
				{
					grapheme[j] = record[i++]; ++j;
					grapheme[j] = record[i];
				}
				else
					grapheme[j] = record[i];
			}
			grapheme[j] = '\0';
			grapheme_size=strlen(grapheme);

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
			phoneme_size=strlen(phoneme);
			strcpy(temp,phoneme);
			strcpy(phoneme_t,phoneme);

			/* pick up wordclass */
			for (i=k+1,j=0;record[i]!=',';++i,++j)
				wordclass[j] = record[i];
			wordclass[j] = '\0';

			/* pick up priority */
			for (i=i+1,j=0;record[i]!='\n';++i,++j)
				priority[j] = record[i];
			priority[j] = '\0';

			/* check the word with -ig ending */
			if (grapheme[grapheme_size-1] == 'g' && grapheme[grapheme_size-2] == 'i' &&
				phoneme[phoneme_size-1] != 'g')
			{
				phoneme[phoneme_size-1] = 'g';
				printf("%s %s -> %s\n",grapheme,phoneme_t,phoneme);
			}
			fprintf(fw,"%s,%s,%s,%s,%s\n",grapheme,homoflag,phoneme,wordclass,priority);
}
#endif /* end of #ifdef IGCHANGE */
	

	fclose(fr);
	fclose(fw);
	exit(0);
}


int is_vowel(unsigned char c)
{
	unsigned char vowel[]={
		'a',
		'E',
		'V',
		'@',
		'I',
		'c',
		'Q',
		'U',
		'Y',
		'1',
		'2',
		'7',
		'3',
		'4',
		'q',
		'5',
		'y',
		'A',
		'W',
		'H',
		'8',
		'^',
		'9',
		'%',
		'j',
		'L',
		'M',
		'N',
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

int how_many(char *word, unsigned char c)
{
	int i;
	int count=0;

	for (i=0;word[i]!='\0';++i)
	{
		if (c == word[i] || c == (word[i]+32))
		{
			count++;
		}
	}

	return(count);
}

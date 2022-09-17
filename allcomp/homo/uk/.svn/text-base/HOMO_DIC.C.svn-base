/*
 *  build the homograph table compiler 
 */

#include	<stdio.h>
#include	<ctype.h>
#ifdef VMS
/*#include <fcntl.h>*/
#include <types.h>
#include <stat.h>
#else
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#endif
#include	<string.h>
#include	<time.h>

/*
 * general defines ...
 */

#define	true	1
#define	false 0
#define	failure 1
#define	success 0

struct	homo_rule	{
	long					h_suffix;
	long					h_context;
	long					h_select;
	long					h_elim;
};


struct	homo_rule	homo_table[256];
int		homo_rules;
char		line[256];
int		input_line;

#define	HR	homo_table[homo_rules]

/*
 *  function protos ...
 */

char *squish_white(char *);
error_exit(char *,char *);
char *get_fc(char *, long *);

main(argc,argv)
int argc;
char *argv[];
{

	FILE *ftab,*fdic;
	char fnam_t[80];
	char fnam_d[80];
	char *hl;
	int i;
#ifdef VMS
        unsigned int start_wall_time=0;
        struct tm tm_s;
#endif

/*
 *  check out the input line parameters ...
 */

	if (argc < 2)
		{
		printf("  Usage : homo_dic <rulename> <outname>");
		exit(1);
		}

/*
 *  open the build file ...
 */

	strcpy(fnam_t,argv[1]);
	i = strcspn(fnam_t,".");
	strcpy(&fnam_t[i],".tab");
	if ((ftab=fopen(fnam_t,"r")) == NULL)
		{
		printf("  Can't open homograph table : %s",fnam_t);
		exit(1);
		}

	if(argc > 2)
		strcpy(fnam_d,argv[2]);
	else
		strcpy(fnam_d,argv[1]);

	i = strcspn(fnam_d,".");
	strcpy(&fnam_d[i],".h");
	if ((fdic=fopen(fnam_d,"w")) == NULL)
		{
		printf("  Can't open homograph 'h' file : %s",fnam_d);
		exit(1);
		}

	printf("\nStarting homograph compile ...\n");
	input_line = 0;
	homo_rules = 0;
	while(fgets(line,sizeof(line),ftab))
		{
		input_line += 1;
		printf("\r  Processing line : %d",input_line);
		hl = squish_white(&line[0]);
		if(*hl != '[' && *hl != ':')
			continue;
/*
 *  Now we must be a rule, so check for the proper syntax ...
 */
		HR.h_suffix = 0L;
		HR.h_context = 0L;
		HR.h_select = 0L;
		HR.h_elim = 0L;
		if(*hl == '[')
			{
			hl = get_fc(hl+1,&HR.h_suffix);
			hl = squish_white(hl);
			}
		if(*hl++ != ':')
			error_exit(hl,"No conversion introducer");
		hl = squish_white(hl);
		if(*hl++ != '[')
			error_exit(hl,"No conversion field");
		if(*hl == '+')
			hl = get_fc(hl+1,&HR.h_select);
		else if(*hl == '-')
			hl = get_fc(hl+1,&HR.h_elim);
		else
			error_exit(hl,"Conversion must select or eliminate");
		hl = squish_white(hl);
		if(*hl++ == '/')
			{
			hl=squish_white(hl);
			if(*hl++ != '[')
				error_exit(hl,"No context found");
			hl = get_fc(hl,&HR.h_context);
			hl = squish_white(hl);
			if(*hl++ != '-')
				error_exit(hl,"Bad context field");
			hl=squish_white(hl);
			}
		if(*hl != '\0' && *hl != '\n')
			error_exit(hl,"Bad character in rule");
		homo_rules += 1;
	  }

/*
 *  write out the file header ...
 */

	fprintf(fdic,"/*");
	fprintf(fdic,"\n *  Homograph disambiguation rules.");
	fprintf(fdic,"\n *  Generated from : %s",fnam_t);
	fprintf(fdic,"\n *  Written to file : %s",fnam_d);

        /* get starting wall time */
#ifdef VMS
        start_wall_time = time(0);
        fprintf(fdic,"\n *  Created on : %s ",asctime(localtime((time_t *)&start_wall_time)));
#else
	_strdate(line); 
	fprintf(fdic,"\n *  Created on : %s ",line);
	_strtime(line);
	fprintf(fdic,"at %s",line);
#endif

	fprintf(fdic,"\n */");

	fprintf(fdic,"\n#ifndef HOMOH\n");
	fprintf(fdic,"#define HOMOH 1\n\n");

/*
 *  source code in an .h file so write out the structure def and some
 *  defines ...
 */

	fprintf(fdic,"\n\n#define MAX_HOMO_RULE %d",homo_rules);
	fprintf(fdic,"\n");

	fprintf(fdic,"\nstruct	homo_rule	{");
	fprintf(fdic,"\n	S32					h_suffix;");
	fprintf(fdic,"\n	S32					h_context;");
	fprintf(fdic,"\n	S32					h_select;");
	fprintf(fdic,"\n	S32					h_elim;");
	fprintf(fdic,"\n};");
	fprintf(fdic,"\n");
	fprintf(fdic,"\nstruct	homo_rule	homo_table[MAX_HOMO_RULE] = {\n");

/*
 *  write out the table ...
 */

	for(i=0;i<homo_rules;i++)
		{
		fprintf(fdic,"\n0x%08lx,",homo_table[i].h_suffix);
		fprintf(fdic," 0x%08lx,",homo_table[i].h_context);
		fprintf(fdic," 0x%08lx,",homo_table[i].h_select);
		if(i+1 != homo_rules)
			fprintf(fdic," 0x%08lx,",homo_table[i].h_elim);
		else
			fprintf(fdic," 0x%08lx",homo_table[i].h_elim);
		}
	fprintf(fdic,"\n};\n");
	fprintf(fdic,"#endif\n");
	printf("\nHomograph compile complete ... %d bytes",homo_rules*16);
	fclose(fdic);
	fclose(ftab);
}


/*
 *  get_fc() is used to return the form class of the string in the 
 *  table ...
 */

char *fc_strings[] = {
	"adj", "adv", "art",	"aux", "be", "bev", "conj", "ed",
	"have", "ing", "noun", "pos", "prep", "pron", "subconj",
	"that", "to", "verb", "who", "neg", "inter", "ref", "part",
	"func" , "cont", "char", "refr", "mark", "cont", "homo" }; 


char *get_fc(buff,fc)
char *buff;
long *fc;
{
	int	i;
	char	*fcs,*cps;

	while(*buff != ']')
	  {
		for(i=0;i<32;i++)
			{
			cps = buff;
			fcs = fc_strings[i];
			while(*fcs != '\0' && *cps == *fcs)
				{
				cps++ ; fcs++;
				}
			if(*fcs == '\0' && (*cps == ']' || *cps == ' ' || *cps == '\t' || *cps == '\0' || *cps == '\n'))
				{
				*fc |= (1L<<i);
				break;
				}
			}
		if(i == 32)
			error_exit(buff,"Illegal form class specified");
		buff = squish_white(cps);
		}
	return(buff+1);
}

char *squish_white(s)
char *s;
{
	while(*s == ' ' || *s == '\t')
		s++;
	return(s);
}

error_exit(bad,str)
char *str;
char *bad;
{
	int	i;

	printf("\nHomograph compiler error found on line %d",input_line);
	printf("\n  --> %s",str);
	printf("\n  --> %s",line);
	if(bad)
		{
		printf("  --> ");
		for(i=0;&line[i] != bad;i++)
			if(line[i] == '\t')
				printf("\t");
			else
				printf(" ");
		printf("^");
		}
	exit(1);
}

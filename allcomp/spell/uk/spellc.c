/*
 *  compile and write out spell tables  
 */

#include	<stdio.h>
#include	<ctype.h>
#include	<string.h>
#ifdef VMS
/*#include <fcntl.h>*/
#include <types.h>
#include <stat.h>
#else
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#endif
#include	<time.h>

/*
 * general defines ...
 */

#define	true	1
#define	false 0
#define	failure 1
#define	success 0


unsigned char	spell_it[26][26];

#define	SPELL_END			0x01			/* spell if pair at end of word */
#define	SPELL_BEGIN			0x02			/* speel if pair at start of word */

main(argc,argv)
int argc;
char *argv[];
{

	FILE *ftab,*fdic;
	char fnam_t[80];
	char fnam_d[80];
	char line[256];
	char *rl;
	int	i,j,line_number,line_max;
#ifdef VMS
        unsigned long start_wall_time=0;
        struct tm tm_s;
#endif

/*
 *  check out the input line parameters ...
 */

	if (argc < 2)
		{
		printf("  Usage : spellc <rulename> <outname>");
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
		printf("  Can't open spell table : %s",fnam_t);
		exit(1);
		}

	if(argc > 2)
		strcpy(fnam_d,argv[2]);
	else
		strcpy(fnam_d,argv[1]);

	i = strcspn(fnam_d,".");
	strcpy(&fnam_d[i],".c");
	if ((fdic=fopen(fnam_d,"w")) == NULL)
		{
		printf("  Can't open table 'c' file : %s",fnam_d);
		exit(1);
		}

	for(i=0;i<26;i++)
		for(j=0;j<26;j++)
			spell_it[i][j] = 0;

	line_number = 0;
	while(fgets(line,sizeof(line),ftab))
		{
		line_number += 1;
/*
 *  rules take the form xx# or #xx, so look for case and set up the markers
 *  semi-colons are unconditional comment lines and null lines are allowed
 */

		if(line[0] == ';')
			continue;
		if(line[0] == '#' && is_upper(line[1])	&& is_upper(line[2]))
			spell_it[line[1]-'A'][line[2]-'A'] |= SPELL_BEGIN;
		else if(line[2] == '#' && is_upper(line[0])	&& is_upper(line[1]))
			spell_it[line[1]-'A'][line[0]-'A'] |= SPELL_END;
		else if(non_white(&line[0]))
			{
			printf("\nBad rule found at line number %d",line_number);
			printf("\n --> %s",&line[0]);
			exit(1);
			}
		}
/*
 *  write out the file header ...
 */

	fprintf(fdic,"/*");
	fprintf(fdic,"\n *  Spell vs. Speak rules table.");
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

	fprintf(fdic,"\nunsigned char spell_it[26][26] = {");
	line_max = 0;
	for(j=0;j<26;j++)
		for(i=0;i<26;i++)
			{
			if(line_max == 0)
				fprintf(fdic,"\n   ");
			line_max = (line_max < 8) ? line_max+1 : 0;
			if(i < 25 || j < 25)
				fprintf(fdic,"  0x%02X,",spell_it[j][i]);
			}
	fprintf(fdic,"  0x%02X };\n",spell_it[25][25]);
	fclose(fdic);
	fclose(ftab);
}

is_upper(c)
char c;
{
	if(c>='A' && c<='Z')
		return(true);
	return(false);
}

non_white(lp)
char *lp;
{
	while(*lp != '\n' && *lp != '\0')
		if(*lp == ' ' || *lp == '\t')
			lp++;
		else return(true);
	return(false);
}

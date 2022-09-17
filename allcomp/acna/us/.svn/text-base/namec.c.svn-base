/*
 *  acna name trigram table compiler  
 */

#include	<stdio.h>
#include	<ctype.h>
#include <fcntl.h>
#include	<string.h>
#include <sys\types.h>
#include <sys\stat.h>
#include	<time.h>
#include <stdlib.h>

/*
 * general defines ...
 */

#define	true	1
#define	false 0
#define	failure 1
#define	success 0

#define _far

#define	TG_start	0x80
#define	TG_end	0x40

#define ENGLISH  0
#define FRENCH   1
#define GERMAN   2
#define IRISH    3
#define ITALIAN  4
#define JAPANESE 5
#define SLAVIC   6
#define SPANISH  7

int	tri_grams[8][27][27][27];
int	at_end[8][27][27][27];
int	at_start[8][27][27][27];

int min,max;
int mind[8],maxd[8];
int entries;

#define MIN_CUTOFF 2

main(argc,argv)
int argc;
char *argv[];
{

	FILE *fnam[8],*fc;
	char fnam_t[80];
	char fnam_d[80];
	char line[256];
	int	i,j,k,l,size;
	int	total_names[8],total_trigrams[8],max_freq[8];
	long	total_checked[8];
	int	round_ups[8],round_downs[8];
	int	start_aff[8],end_aff[8];
	char	tri[8][4];
	float	scale;

	int all_total_trigrams=0;
	int new_all_total_tri=0;
	int count;
	int oldmax,oldoldmax;
	int value;
	unsigned char lowval,highval;


/*
 *  check out the input line parameters ...
 */

	if (argc < 1)
		{
		printf("  Usage : namec <table_name>");
		exit(1);
		}

/*
 *  open the build file ...
 */

	fnam[ENGLISH]=fopen("en.nam","r");
	fnam[FRENCH]=fopen("fr.nam","r");
	fnam[GERMAN]=fopen("ge.nam","r");
	fnam[IRISH]=fopen("ir.nam","r");
	fnam[ITALIAN]=fopen("it.nam","r");
	fnam[JAPANESE]=fopen("ja.nam","r");
	fnam[SLAVIC]=fopen("sl.nam","r");
	fnam[SPANISH]=fopen("sp.nam","r");


	
#if 0
	strcpy(fnam_t,argv[1]);
	i = strcspn(fnam_t,".");
	strcpy(&fnam_t[i],".nam");
	if ((fnam=fopen(fnam_t,"r")) == NULL)
		{
		printf("  Can't open name list : %s",fnam_t);
		exit(1);
		}

#endif
	strcpy(fnam_d,"acna.c");
	if ((fc=fopen(fnam_d,"w")) == NULL)
		{
		printf("  Can't open table 'c' file : %s",fnam_d);
		exit(1);
		}

	for (l=0;l<8;l++)
	for(i=0;i<27;i++)
		for(j=0;j<27;j++)
			for(k=0;k<27;k++)
				tri_grams[l][i][j][k] = at_end[l][i][j][k] = at_start[l][i][j][k] = 0;

/*
 *  the table is built with 0 = #, 1 = A, 2 = B, etc ...
 */


	for (l=0;l<8;l++)
	{
	tri[l][3] = 0;
	total_names[l] = 	total_trigrams[l] = 0;
	total_checked[l] = 0;
	max_freq[l] = 0;
	line[0] = 0;
	while(fscanf(fnam[l],"%s",&line[1]) != EOF)
		{
		for(size=1;line[size];size++)
			{
			if(line[size] >= 'A' && line[size] <= 'Z')
				line[size] -= ('A'- 1);
			else if(line[size] >= 'a' && line[size] <= 'z')
				line[size+1] -= ('a'- 1);
			else if(line[size] != 0)
				{
				printf("\n ?? Unknown character (%c) found on line %d",
					line[size],total_names[l]);
				exit(1);
				}
			}
		size -= 1;
		for(i=0;i<size;i++)
			{
			if(i == size-3 || i == size-2)
				at_end[l][line[i]][line[i+1]][line[i+2]]++;
			else if(i == 1 || i == 2)
				at_start[l][line[i]][line[i+1]][line[i+2]]++;
			if(tri_grams[l][line[i]][line[i+1]][line[i+2]] == 0)
				total_trigrams[l]+=1;
			tri_grams[l][line[i]][line[i+1]][line[i+2]] += 1;
			if(tri_grams[l][line[i]][line[i+1]][line[i+2]] > max_freq[l])
				{
				max_freq[l] = 	tri_grams[l][line[i]][line[i+1]][line[i+2]];
				for(j=0;j<3;j++)
					{
					if(line[i+j] != 0)
						tri[l][j] = line[i+j] + 'A' - 1;
					else
						tri[l][j] = '#';
					}
				}
			}
		total_names[l] += 1;
		total_checked[l] += size;
		printf("\rTri-grams(u:%d t:%ld) found in %d names (freq:%d [%s])",
			total_trigrams[l],total_checked[l],total_names[l],max_freq[l],&tri[l][0]);
	}
	printf("\n");	
	}


	for (l=0;l<8;l++)
	{
		all_total_trigrams+=total_trigrams[l];
	}
#if 0
	for(i=0;i<27;i++) {
		for(j=0;j<27;j++) {
			for(k=0;k<27;k++) {
				if(tri_grams[i][j][k])
				{
					fprintf(fc,"freq %04d %c%c%c start %d end %d\n",tri_grams[i][j][k],i+'@',j+'@',k+'@',at_start[i][j][k],at_end[i][j][k]);
				}
			}
		}
	}
				
	fclose(fnam);
	fclose(fc);
	exit(1);
#endif
	
	/*
	*  check start/end frequency and flag if greater than .75 ....
	*/
	for (l=0;l<8;l++) {
		for(i=0;i<27;i++) {
			for(j=0;j<27;j++) {
				for(k=0;k<27;k++) {
					if(tri_grams[l][i][j][k])
					{
						if((float)at_end[l][i][j][k]/tri_grams[l][i][j][k] > 0.85)
						{
							at_end[l][i][j][k] = true;
							at_start[l][i][j][k] = false;
						}
						else if((float)at_start[l][i][j][k]/tri_grams[l][i][j][k] > 0.85)
						{
							at_end[l][i][j][k] = false;
							at_start[l][i][j][k] = true;
						}
						else
						{
							at_end[l][i][j][k] = false;
							at_start[l][i][j][k] = false;
						}
					}
				}
			}
		}
	}


	/*
				*  run through and adjust the probabilites based on the word strings
 *  checked rather than the number of trigrams ...
 */
#if 0
	for(i=0;i<27;i++) {
		for(j=0;j<27;j++) {
			for(k=0;k<27;k++) {
				if(tri_grams[i][j][k])
				{
					fprintf(fc,"freq %04d %c%c%c start %d end %d\n",tri_grams[i][j][k],i+'@',j+'@',k+'@',at_start[i][j][k],at_end[i][j][k]);
				}
			}
		}
	}
				
	fclose(fnam);
	fclose(fc);
#endif
	for (l=0;l<8;l++)
	{
		scale = (float)1000/(float)total_names[l];
		round_ups[l] = round_downs[l] = 0;
		start_aff[l] = end_aff[l] = 0;
		printf("Normalizing table using %f as scale ...\n",scale);
		for(i=0;i<27;i++) {
			for(j=0;j<27;j++){
				for(k=0;k<27;k++){
					if(tri_grams[l][i][j][k])
					{
						tri_grams[l][i][j][k] = (int)((float)tri_grams[l][i][j][k]*scale);
						if(tri_grams[l][i][j][k] <= 0)
						{
							round_ups[l] += 1;
							// remove the really low frequency trigrams.
							tri_grams[l][i][j][k] = 0;
						}
						else if(tri_grams[l][i][j][k] >= 64)
						{
							tri_grams[l][i][j][k] = 63;
							round_downs[l] += 1;
						}
						if(at_start[l][i][j][k])
						{
							tri_grams[l][i][j][k] |= TG_start;
							start_aff[l]++;
						}
						else if(at_end[l][i][j][k])
						{
							tri_grams[l][i][j][k] |= TG_end;
							end_aff[l]++;
						}
					}
				}
			}
		}
	}

	/* do some size reduction of the tables */
	for(i=0;i<27;i++) {
		for(j=0;j<27;j++) {
			for(k=0;k<27;k++) {
				min=2000000000;
				max=0;
				count=0;
				for (l=0;l<8;l++) {
					if (tri_grams[l][i][j][k])
					{
						count++;
						if (tri_grams[l][i][j][k]<min)
						{
							min=tri_grams[l][i][j][k];
						}
					}
				}
				if (count==0)
				{
					continue;
				}
				for (l=0;l<8;l++)
				{
					mind[l]=tri_grams[l][i][j][k]-min;
					if (mind[l]<0)
					{
						mind[l]=-1;
					}
				}
				if (count==1)
				{
					if (min<MIN_CUTOFF)
					{
						for (l=0;l<8;l++)
						{
							maxd[l]=0;
						}
					}
				}
				else
				{
					min=2000000;
					oldmax=0;
					oldoldmax=0;
					max=0;
					for (l=0;l<8;l++)
					{
						if (mind[l]==-1)
							continue;
						if (mind[l]<min)
						{
							min=mind[l];
						}
						if (mind[l]>max)
						{
							oldoldmax=oldmax;
							oldmax=max;
							max=mind[l];
						}
					}
					if ((max-min)<=MIN_CUTOFF)
					{
						for (l=0;l<8;l++)
						{
							maxd[l]=0;
						}
					} 
					else 
					{	
#if 0
						if (oldmax &&(oldmax*3)<max)
						{
							for (l=0;l<8;l++)
							{
								if (mind[l]!=max)
								{
									mind[l]=0;
								}
							}
						}
#endif

						for (l=0;l<8;l++)
						{
							if (mind[l]-min<MIN_CUTOFF)
							{
								maxd[l]=0;
							}
#if 0
							else
							{
								if ((mind[l]*3)<max)
								{
									maxd[l]=0;
								}
#endif
								else
								{
									maxd[l]=1;
								}
#if 0
							}
#endif
						}
					}
				}
				for (l=0;l<8;l++)
				{
					if (maxd[l]==0)
					{
						tri_grams[l][i][j][k]=0;
						at_start[l][i][j][k]=0;
						at_end[l][i][j][k]=0;
					}
				}
			}
		}
	}


	/* recount the tri_grams */

	new_all_total_tri=0;
	for (l=0;l<8;l++) {
		for(i=0;i<27;i++) {
			for(j=0;j<27;j++) {
				for(k=0;k<27;k++) {
					if(tri_grams[l][i][j][k]) {
						new_all_total_tri++;
					}
				}
			}
		}
	}

	printf("new total tri-grams=%d old total tri-grams=%d\n",new_all_total_tri,all_total_trigrams);
	

	/*
 *  write out the file header ...
 */

	printf("Normalization complete ...\n");
	for (l=0;l<8;l++)
	{
		printf("%d rounded up, %d rounded down.",round_ups[l],round_downs[l]);
		printf("%d start marks, %d end_marks.\n",start_aff[l],end_aff[l]);
		fprintf(fc,"/*");
		fprintf(fc,"\n *  Trigram frequency tables for %s.","acna.c");
		fprintf(fc,"\n *  Generated from : %s","*.nam");
		fprintf(fc,"\n *  Written to file : %s",fnam_d);
		_strdate(line); 
		fprintf(fc,"\n *  Created on : %s ",line);
		_strtime(line);
		fprintf(fc,"at %s",line);
		fprintf(fc,"\n */");

		entries=0;
		
#define ENGLISH  0
#define FRENCH   1
#define GERMAN   2
#define IRISH    3
#define ITALIAN  4
#define JAPANESE 5
#define SLAVIC   6
#define SPANISH  7
		switch(l)
		{
		case 0:
			fprintf(fc,"\nunsigned char far %s = {","english");
			break;
		case 1:
			fprintf(fc,"\nunsigned char far %s = {","french");
			break;
		case 2:
			fprintf(fc,"\nunsigned char far %s = {","german");
			break;
		case 3:
			fprintf(fc,"\nunsigned char far %s = {","irish");
			break;
		case 4:
			fprintf(fc,"\nunsigned char far %s = {","italian");
			break;
		case 5:
			fprintf(fc,"\nunsigned char far %s = {","japan");
			break;
		case 6:
			fprintf(fc,"\nunsigned char far %s = {","slavic");
			break;
		case 7:
			fprintf(fc,"\nunsigned char far %s = {","spanish");
			break;
		}
		size = 0;
		for(i=0;i<27;i++)
		{
			printf("\rWriting file ... %d percent done.",(i*100)/27);
			for(j=0;j<27;j++)
				for(k=0;k<27;k++)
				{
//					if(i < 26 || j < 26 || k < 26)
					if (tri_grams[l][i][j][k])
					{
						if(size == 0)
							fprintf(fc,"\n   ");
						size = (size< 4) ? size+1 : 0;
						value=((i&0x1f)<<10) | ((j&0x1f)<<5) | ((k&0x1f));
						lowval=(value&0x000000ff);
						highval=(value&0x0000ff00)>>8;
						fprintf(fc,"0x%02X,0x%02X,0x%02X,",highval,lowval,tri_grams[l][i][j][k]);
						entries++;
					}
				}
		}
//		fprintf(fc,"0x%02X };\n",tri_grams[(unsigned)26][(unsigned)26][(unsigned)26]);
		fprintf(fc,"\b};\n");
		switch(l)
		{
		case 0:
			fprintf(fc,"unsigned int %s_entries = %d;\n","english",entries);
			break;
		case 1:
			fprintf(fc,"unsigned int %s_entries = %d;\n","french",entries);
			break;
		case 2:
			fprintf(fc,"unsigned int %s_entries = %d;\n","german",entries);
			break;
		case 3:
			fprintf(fc,"unsigned int %s_entries = %d;\n","irish",entries);
			break;
		case 4:
			fprintf(fc,"unsigned int %s_entries = %d;\n","italian",entries);
			break;
		case 5:
			fprintf(fc,"unsigned int %s_entries = %d;\n","japan",entries);
			break;
		case 6:
			fprintf(fc,"unsigned int %s_entries = %d;\n","slavic",entries);
			break;
		case 7:
			fprintf(fc,"unsigned int %s_entries = %d;\n","spanish",entries);
			break;
		}
		printf("\n");
	}
	fclose(fc);
	for (l=0;l<8;l++)
	{
		fclose(fnam[l]);
	}
#if 0
	for (i=0;i<27;i++)
	{
		for(j=0;j<27;j++)
		{
			for(k=0;k<27;k++)
			{
				if (tri_grams[i][j][k])
				{
					printf("%c%c%c\n",i?(i+'A'-1):'#',j?(j+'A'-1):'#',k?(k+'A'-1):'#');
				}
			}
		}
	}
#endif

}


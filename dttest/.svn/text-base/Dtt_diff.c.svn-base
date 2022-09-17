/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1997. All rights reserved.
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
 *    File Name:	dtt_diff.c
 *    Author:	Michael Garufi
 *    Creation Date:Apr. 2, 1998
 *
 *    Functionality:
 *	diffs two files and allows a designated tolerance for the arpa values 
 *
 ***********************************************************************
 *    Revision History:
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		MFG		10/30/1997	initial revision
 *	002		MFG		04/06/1998  extensivly modified
 */

#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dos.h>
//#include <conio.h>
#include <process.h>

#define PERCENT		10
#define MAXBLOCKSIZE 50
#define DIFF		-1
#define NODIFF		0

FILE *ftmp;

char fnam_bmk[40];
char fnam_log[40];
char fnam_tmp[40]={"tmppd.tmp"};


int compStrings(char *bmk,char *log);	// add a new item
int compPercent(char *bmk,char *log,int index);// print the differance


//
//
// diff the diff file blocks of data created by fc
//
//
int dtt_diff_diffBlocks(char *chk_file_name)
{
char *block_bmk[MAXBLOCKSIZE];
char *block_log[MAXBLOCKSIZE];

char line_cur[256]={""};  //current string being processed
char line_bmk[256]={""};
char line_log[256]={""};
char comp_bmk[256]={""};
char comp_log[256]={""};
char *ptr;


int bindex,lindex,i;

ftmp = fopen(chk_file_name,"r");
	

			if (fgets(line_cur,sizeof(line_cur),ftmp)==NULL)
			{
				printf("ERROR: dif input file is empty dtt_diff_diffblocks\n");
				exit(1);
			}



				strcpy(comp_bmk,"***** ");
//				strcat(comp_bmk,fnam_bmk);
				strcpy(comp_log,"***** ");
//				strcat(comp_log,fnam_log);


	while(fgets(line_cur,sizeof(line_cur),ftmp) !=NULL)
	{

				while(strncmp(line_cur,comp_bmk,5)!=0)	///don't start until *****
				{
				if (fgets(line_cur,sizeof(line_cur),ftmp)==NULL)
				fclose(ftmp);
				return NODIFF;											///end of file					
				}


				bindex=0;																													
				do										//load second diff block log file
				{

				if(strncmp(line_cur,comp_bmk,5)!=0)
				{
					ptr = (char *) malloc(strlen(line_cur)+1);	
					strcpy(ptr,line_cur);
					block_bmk[bindex++] = ptr;				
				}

					fgets(line_cur,sizeof(line_cur),ftmp);

				}while(strncmp(line_cur,comp_log,5)!=0);


				lindex=0;	
				do										//load second diff block log file
				{
					if(strncmp(line_cur,comp_log,5)!=0)
					{
					ptr = (char *) malloc(strlen(line_cur)+1);				
					strcpy(ptr,line_cur);
					block_log[lindex++] = ptr;				
					}
				
					fgets(line_cur,sizeof(line_cur),ftmp);

				}while(strncmp(line_cur,comp_log,5) !=0);



			//compare the blocks

				i=0;
				if(bindex == lindex)
				{

					for (i=0;i<bindex;i++)
					{
					strcpy(line_bmk,block_bmk[i]);
					strcpy(line_log,block_log[i]);

						if (compStrings(line_bmk,line_log) == DIFF)
						{
						fclose(ftmp);
						return DIFF;
						}
					}
				}
				else
				{
				fclose(ftmp);
				return DIFF;
                } 


	
	}

fclose(ftmp);			
return NODIFF;
}




//
//compare variable values with the designated percent
//
int compPercent(char *bmk,char *log,int index)
{
int store=0,j,per_val,diff_val;
int aval_bmk=0,bval_bmk=0,aval_log=0,bval_log=0;
char temp[256];


				store=index;

				j=0;					//extract values of benchmark string
				while(bmk[index]!=',')
				{
				index++;
				temp[j++]=bmk[index];
				}
				aval_bmk=atoi(temp);

				j=0;
				while(bmk[index]!='>')
				{
				index++;
				temp[j++]=bmk[index];
				}
				bval_bmk=atoi(temp);
				
				index=store;			

				j=0;					//extract values of log string
				while(log[index]!=',')	
				{
				index++;
				temp[j++]=log[index];
				}
				aval_log=atoi(temp);

				j=0;
				while(log[index]!='>')
				{
				index++;
				temp[j++]=log[index];
				}
				bval_log=atoi(temp);

			
			if (aval_bmk != aval_log)					//check first values
				return DIFF;

            if (bval_bmk != 0)
            {
			per_val = (PERCENT*bval_bmk)/100;  			//get torlarance
			}
			else
			{			
			per_val = 0;
			}
			
				
			diff_val = abs(bval_bmk - bval_log);

			
			if (diff_val > per_val)						// check second values with the tolerance
				return DIFF;

				

return NODIFF;
}

//
// compare and parse the string
//
int compStrings(char *bmk,char *log)
{
int i=0;

	if (strcmp(bmk,log) != 0)
	{
		
		if(((bmk[0]==0)&&(log[0]!=0)) 
			||((bmk[0]!=0)&&(log[0]==0)))
			return DIFF;

		while ((bmk[i]!=0)&&(log[i]!=0))
		{
			if ((bmk[i]=='<')&&(log[i]=='<'))	//get the variable values
			{
			return(compPercent(bmk,log,i));			
			}


			else if (bmk[i] != log[i])		//there's a differance
			{
			return DIFF;
			}
		i++;
		}
	}

return NODIFF;
}


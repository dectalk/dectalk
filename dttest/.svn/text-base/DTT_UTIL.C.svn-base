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
 *                                                      z
 ***********************************************************************
 *    File Name:	dtt_util.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest utility module
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *  002     G.L		09/16/1996  code cleanup.
 *	004		MFG		04/06/1998	added call dtt_diff_diffBlocks() for outphone diffs
 *  005		J.L		05/08/1998  merged the file dtt_diff.c
 *  006		MFG		06/17/1998	added dtt_util_mkdir() function
 *  007     JFH     07/24/1998	only check for negative values in compPercent() 
 *
 */

#include "dtt_data.h"       /* all data structure declear here       */
#include "dtt_defs.h"       /* all date value define here            */
#include "dtt_prot.h"       /* all functional proto type define here */

#include <stddef.h>
#include <stdlib.h>
#include <io.h>
#include <time.h>
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
int store=0,j; /* per_val,diff_val */
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



			if ((aval_bmk < 0) || (bval_bmk < 0) || (aval_log < 0) || (bval_log < 0))	//check negative values (JFH)
				return DIFF;
				
/*			if (aval_bmk != aval_log)					//check first values
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

*/
				

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


int dtt_exit(FILE *fptr, char *func_name, int value, char *message)
{

char temp_buff[50];
  
  if (FLOW==1) printf ("\n enter dtt_exit");

//  fprintf (fptr,"\n module - %s, message - %s", func_name, message);
  printf  ("\n module - %s, message - %s", func_name, message);
//  fprintf  (fptr,"\n DTtest stop with error !");
  printf  ("\n DTtest stop with error !");

//  fprintf(SYS_FPTR,"\n\n DTtest stopped !");
  printf ("\n\n DTtest stopped !");
  
  /* log the stopping time */
  _strtime(temp_buff);
//  fprintf (SYS_FPTR,"\t Test Stop  : %s ", temp_buff);
  printf  ("\t Test Stop  : %s ", temp_buff);
  /* strcpy ((test_entry->stop_time_p),temp_buff); */

  _strdate(temp_buff);
//  fprintf (SYS_FPTR,"\t %s ", temp_buff);
  printf  ("\t %s ", temp_buff);
  /* strcpy ((test_entry->stop_date_p),temp_buff); */
  
//  fprintf(SYS_FPTR,"\n ==========================================================================");
  printf ("\n ==========================================================================");
 
  _fcloseall();

  exit(value);

  return(0);
}

/*
 * file comarsion routine. 
 * mode -- 0, compare bmk and log files, do not display the failure 
 *         1, compare and display the failure
 *
 * return string.
 *               
 *         PASS  -- file match
 *         FAIL  -- file mismatch
 *         NEW   -- do not have the bmk file
 *         INCOM -- can not find the log file.
 *         ??    -- can not open the dif file
 */

char *dtt_util_file_compare(char *case_name, short mode)
{
char command[FILENAMESIZE]={""};   //mfg changed array size too small
char tmp_file_name[FILENAMESIZE]={"dtdif\\tmp.tmp"};
char bmk_file_name[FILENAMESIZE]={""};
char log_file_name[FILENAMESIZE]={""};
//char dif_file_name[FILENAMESIZE]={""};

char log_data[MAXRECORDSIZE];
char *data1=log_data;
char bmk_data[MAXRECORDSIZE];
char *data2=bmk_data;

FILE *fbmkptr,*flogptr,*ftmpptr;
//FILE *fdifptr;
short line_number=0;
short pass_fail=0;
//unsigned long i,j;

   /* construct the file name */
   strcpy(bmk_file_name,"dtbmk\\");
   strcat(bmk_file_name,case_name);
   strcat(bmk_file_name,".bmk");
   strcpy(log_file_name,"dtlog\\");
   strcat(log_file_name,case_name);
   strcat(log_file_name,".log");
//   strcpy(dif_file_name,"dtdif\\");
//   strcat(dif_file_name,case_name);
//   strcat(dif_file_name,".dif");

   /* checking the file existing or not */
   if (_access(bmk_file_name,0))
   {
      return("NEW");
   }

   /* use FC command to do the quick check */
   strcpy(command," fc ");
   strcat(command,bmk_file_name);
   strcat(command," ");
   strcat(command,log_file_name);
   strcat(command," > ");
   strcat(command,tmp_file_name);
   if (system(command) != 0)
   {
      printf ("\n Can not execute the system command /%s/ !",command);
      printf ("\n DTtest will not continue");
      printf ("\n DTtest finished with error !\n");
      exit(1);
   }

//   for (i=0; i<60000; ++i) j++;

   /* checking the file existing or not */
   ftmpptr = fopen(tmp_file_name,"r");
   if(ftmpptr == NULL)
   {
      printf("\n The temp file %s does not exist !", tmp_file_name);
      return("INCOM");
   }

   fgets(data1,MAXRECORDSIZE-1,ftmpptr);
   fgets(data1,MAXRECORDSIZE-1,ftmpptr);
   if (!_strnicmp(data1,"FC: no difference", 16)) //mfg xxx
   {
      fclose(ftmpptr);
//      system("del dtdif\\tmp.tmp");
      return("PASS");
   }
   else
   {
		if(dtt_diff_diffBlocks(tmp_file_name)==0)
		{
		fclose(ftmpptr);
//      system("del dtdif\\tmp.tmp");
		return("PASS");
		}
   }

   if (mode == 0)
   {
      fclose(ftmpptr);
//      system("del dtdif\\tmp.tmp");
      return("FAIL");
   }
   else
   {
      if((fbmkptr = fopen(bmk_file_name,"r")) == 0)
      {
         //printf("\n The benchmark file %s does not exist !", bmk_file_name);
         return("NEW");
      }
      /* checking the file existing or not */
      if((flogptr = fopen(log_file_name,"r")) == 0)
      {
         //printf("\n The datalog file %s does not exist !", log_file_name);
         return("INCOM");
      }
   	  /* compare the bmk and log file */
      pass_fail = 0;
      while(fgets(data1,MAXRECORDSIZE-1,flogptr) != NULL)
      {
   	     line_number++;
   	     /* fail if bmk shorter than log file */
         if (fgets(data2,MAXRECORDSIZE-1,fbmkptr) == NULL)
         {
         	pass_fail = 1;
         	break;
      	 }
      	 if (strcmp(data1,data2))
      	 {
         	pass_fail = 1;
         	break;
      	 }   
   	  }
      /* fail if bmk file longer than log file */
      if (pass_fail == 0)
      {
         if (fgets(data2,MAXRECORDSIZE-1,fbmkptr) != NULL)
         {
            pass_fail = 1;
         }
      }
      /* return the proper message */   
      if (pass_fail == 1)
      {
	     if (mode == 1)
	     {
		   printf("\n\n*** %s ***",bmk_file_name);
		   printf("\n%d\t%s",line_number,data2);
		   printf("\n*** %s ***",log_file_name);
		   printf("\n%d\t%s\n",line_number,data1);
	     }
	     fclose(fbmkptr);
	     fclose(flogptr);
   	     return("FAIL");
      }
      else
      {
	     fclose(fbmkptr);
	     fclose(flogptr);
         return("PASS");
      }
   }
}



 
/*
 * check to see if directies exist
 * if they don't create them
 *
 *	\dtlog \dtres \dtdif
 * 
 */
void dtt_util_mkdir()
{
FILE *f_dir_ptr;
char filestring[256];
int flag=0;


	system("dir /b/l dt* > tmp.tmp");
	
	f_dir_ptr = fopen("tmp.tmp","r");
	

	while(fscanf(f_dir_ptr,"%s",filestring) != EOF)
	{
		if ((strcmp(filestring,"dtlog")) == 0)
			flag++;			
	}

		
	if(flag == 0)
	{
	system("dtt_dir.bat");
	}

fclose(f_dir_ptr);
system("del tmp.tmp");

}
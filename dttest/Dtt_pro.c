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
 *    File Name:	dtt_pro.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest processor module
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *  002     G.L		09/16/1996  code cleanup.
 *  003		MFG		03/26/1998  made fc_command array bigger from 60 to 132 chars
 *	004		MFG		03/12/1998	added ".bat" file support
 *	003		MFG		03/26/1998	changed i<20 to i<FILENAMESIZE in "for" loops
 *	004		MFG		04/06/1998	added call to dtt_diff_diffBlocks() for outphone diffs
 *
 */

#include "dtt_data.h"       /* all data structure declear here       */
#include "dtt_defs.h"       /* all date value define here            */
#include "dtt_prot.h"       /* all functional proto type define here */

#include <ctype.h>
#include <stdlib.h>
#include <io.h>
#include <time.h>

/* global time/date */
extern char TIME_START[],DATE_START[];
extern int TEST_MODE;
extern int TEST_HALT;

  /* tells us what type of RUN to do */
int RUN_MODE = 0;
int RUN_MODE_c = 0;
int RUN_MODE_y = 0;
int RUN_MODE_z = 0;

int dtt_process(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{

  char temp_number[10];

  if (FLOW==1) printf ("\n enter dtt_process");

  if (_strnicmp (bg_stuff[2],"RUN",3) && TEST_MODE == 0)
    dtt_exit(SYS_FPTR, "dtt_process", 1,"only RUN MODE is suported at this time");
  if (bg_stuff[2][3] != '\0')
  {
printf("\nGOING INTO SPECIAL RUN MODE\n");
	/* only accept RUN1 through RUN5 */
	if (bg_stuff[2][3] >= 49 &&  bg_stuff[2][3] <= 53)
	  RUN_MODE = bg_stuff[2][3]-48;
	else
	{
	  printf ("\nError: Incorrect Run Mode.  Only RUN1 through RUN5 is supported.\n");
	  return (0);
	}
printf("\nRUN_MODE: %d", RUN_MODE);
	if (RUN_MODE >= 2 && RUN_MODE <= 5)
	{
	  /* set RUN_MODE_c to 1 if it we're dealing with test case */
	  if (bg_stuff[2][4] == 'c')
		RUN_MODE_c = 1;
printf ("\nRUN_MODE_c: %d", RUN_MODE_c);
	  /* get RUN_MODE_y */
	  if (strchr (bg_stuff[2], '_') != NULL)
	  {
		strcpy (temp_number, strchr (bg_stuff[2], '_')+1);
		if (strrchr (temp_number, '_') != NULL)
		  strrchr (temp_number, '_')[0] = '\0';
		if (strlen (temp_number) > 3)
		{
		  printf("\n A number in the RUN argument is too large.\n");
		  return (0);
		}
		sscanf (temp_number, "%u", &RUN_MODE_y);
printf ("\nRUN_MODE_y: %s", temp_number);
	  }
	  else
	  {
		printf("\nSyntax error: RUN2 to RUN5 requires an extra number");
		return (0);
	  }
	  /* get RUN_MODE_z if it exists */
	  if (strchr (strchr (bg_stuff[2], '_')+1, '_') != NULL)
	  {
	    strcpy (temp_number, (strchr (strchr (bg_stuff[2], '_')+1, '_')+1));
		if (strlen (temp_number) > 3)
		{
		  printf("\n A number in the RUN argument is too large.\n");
		  return (0);
		}
	    sscanf (temp_number, "%u", &RUN_MODE_z);
printf ("\nRUN_MODE_z: %s", temp_number);
      }
	  
	  /* Currently, we support RUN dealing with test case only */
/* TQL: let the user use c or no c */
/*	  if (RUN_MODE != 1 && RUN_MODE_c == 0)
	  {
		printf("\n Sorry, only RUN dealing with test case are available at this time");
		printf("\n syntax: dttest sample.grp run#c_###_###");
		return (0);
	  }
*/

	}
  }

  dtt_pro_execute(bg_stuff, test_entry);  
  dtt_pro_compare(bg_stuff, test_entry);
  dtt_pro_result (bg_stuff, test_entry);
  return(0);

}

int dtt_pro_execute(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;

/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;

char res_file_name[FILENAMESIZE];
char log_file_name[FILENAMESIZE];
char case_name[FILENAMESIZE];
char final_summary[MAXICASENUM][SMALLSIZE];
char test_status[SMALLSIZE];
char command_string[80];
short case_number=0;

char char_ptr[FILENAMESIZE];
char fname_ptr[FILENAMESIZE];
char txt_stuff[CHARARRAYSIZE];
char phony_stuff[CHARARRAYSIZE];

FILE *fptr;
FILE *flogptr;

TEST_HALT = 0;

  if (FLOW==1) printf ("\n enter dtt_pro_execute");

#ifndef MSVC4
  if (TEST_MODE == 0)
  install(0);
#endif
  is_file_name(bg_stuff[1]);

  /* execute debug switch in test sequence data structure */
  if (strlen(bg_stuff[3]) != 0)
  {
     strcpy(command_string,"[:debug ");
     strcat(command_string,bg_stuff[3]);
     strcat(command_string,"]");
#ifndef MSVC4
  if (TEST_MODE == 0);
     while ((sendb(command_string,strlen(command_string),0) != TSR_SUCCESS));
  }
#else
  }

  /* Set flag to indicate that the Engine needs to be started */
  TTS_flag = 1;

#endif

  /* if test input is a string only */
  if (STRING==1)
  {
    char file_name[FILENAMESIZE];

    if (strlen(bg_stuff[4]) == 0)
    {
      strcpy(file_name,"dtlog\\default.log");
    }
    else
    {
      strcpy(file_name,"dtlog\\");
      strcat(file_name,bg_stuff[4]);
      strcat(file_name,".log");
    }
    flogptr = fopen (file_name,"w");
    if (flogptr == NULL)
      dtt_exit(SYS_FPTR, "dtt_pro_execute", 1,
	           "The default log file dtlog\\default.log can not be opened");

    dtt_int_dectalk(bg_stuff[1], phony_stuff, flogptr, bg_stuff[6]);

    fclose(flogptr);

    return(0); 
  }

  /* get the result file name */                   
  if (strlen(bg_stuff[4]) == 0)
  {
      strcpy(res_file_name,"dtres\\");
      strcat(res_file_name,test_entry->command_string_p->test_input_p);   
  }
  else
  {
      strcpy(res_file_name,"dtres\\");
      strcat(res_file_name,bg_stuff[4]);
      strcat(res_file_name,".");
  }

  for (i=2;i<FILENAMESIZE;i++)
    if (*(res_file_name+i)=='.') break;
		i=i+1;
        
  strcpy((res_file_name+i),"res");

  /* initialize status to incomplete flag */
  (test_entry->status)=-2;

  do
  {
    cur_sg = (test_entry->test_group_p);
    (cur_sg->status)=-2;
    do
    {
	  /* if is STOP command set test_halt flag */
      if (!_strnicmp(cur_sg->command_string_p->command_p,"STOP",4))
      {
        	TEST_HALT = 1;
         	continue;
      }
	  /* if is CLEAN command skip to next group */
      if (!_strnicmp(cur_sg->command_string_p->command_p,"CLEAN",3))
      {
        	dtt_int_cleanup(0);
         	continue;
      }
      if (TRACE==3)
	  printf ("\n current sg number is %d ", cur_sg->test_group_number);

      if (TRACE==3)
	  {  if (cur_sg->skip==1) printf ("\n sg file was skipped");
         else printf ("\n we are in %s sg file",
                     cur_sg->command_string_p->test_input_p);
      }
      cur_case = (cur_sg->first_case_p);
	  (cur_case->status)=-2;
      do
      { 

		/* if is STOP command set test_halt flag */
        if (!_strnicmp(cur_case->command_string_p->command_p,"STOP",4))
        {
        	TEST_HALT = 1;
         	continue;
        }
		/* if is CLEAN command skip to next case */
        if (!_strnicmp(cur_case->command_string_p->command_p,"CLEAN",3))
        {
        	dtt_int_cleanup(0);
         	continue;
        }

        /* set up log file directory */
  		strcpy(log_file_name,"dtlog\\");
		if (cur_case->skip==1)
		{
		   if (strlen(cur_sg->command_string_p->output_file_name_p) == 0)
		   { 
              strcat(log_file_name,cur_sg->command_string_p->test_input_p);
			  strcpy(case_name,cur_sg->command_string_p->test_input_p);
			  case_name[strlen(case_name)-4] = '\0';
		   }
		   else 
		   {
              strcat(log_file_name,cur_sg->command_string_p->output_file_name_p);
              strcat(log_file_name,".");
			  strcpy(case_name,cur_sg->command_string_p->output_file_name_p);
		   }
		}
		else
		{  
		   if (strlen(cur_case->command_string_p->output_file_name_p) == 0) 
           {
              strcat(log_file_name,cur_case->command_string_p->test_input_p);
			  strcpy(case_name,cur_case->command_string_p->test_input_p);
			  case_name[strlen(case_name)-4] = '\0';
		   }
		   else
		   {
              strcat(log_file_name,cur_case->command_string_p->output_file_name_p);   
              strcat(log_file_name,".");
			  strcpy(case_name,cur_case->command_string_p->output_file_name_p);
           }
        }
		for (i=1;i<FILENAMESIZE;i++)
          if (*(log_file_name+i)=='.') break;

		i=i+1;
        strcpy((log_file_name+i),"log");
        flogptr = fopen (log_file_name,"w");

        if (flogptr == NULL)
        {
          fprintf (SYS_FPTR,"\n The log file %s can not be opened", log_file_name);
          printf  ("\n The log file %s can not be opened", log_file_name);
          dtt_exit(SYS_FPTR, "dtt_pro_execute", 1,"");
        }
        /* printf ("\n\t\t The log file %s just opened", log_file_name); */

		fprintf(flogptr,"\n ==========================================================================");
		if (cur_case->skip==1) 
		   fprintf (flogptr,"\n case file:      \n");
		else
		   fprintf (flogptr,"\n case file: %s[%s]\n",
                   cur_case->command_string_p->test_input_p,
                   cur_case->command_string_p->test_switch_p);

		cur_req = (cur_case->first_req_p);
     	(cur_req->status)=-2;

		do
        {
		   /* if is STOP command set test_halt flag */
           if (!_strnicmp(cur_req->command_string_p->command_p,"STOP",4))
           {
        	  TEST_HALT = 1;
         	  continue;
           }
		   /* if is CLEAN command skip to next case */

           if (!_strnicmp(cur_req->command_string_p->command_p,"CLEAN",3))
           {
           	   dtt_int_cleanup(0);
         	   continue;
           }

           if (TRACE==3)
		   {
			if (cur_req->skip==1)
			   printf ("\n rq file was skipped");
            else
               printf ("\n we are in %s req file",
                       cur_req->command_string_p->test_input_p);
		   }
		   /* do something here */

		   strcpy(char_ptr, cur_req->command_string_p->test_input_p);
		   is_file_name(char_ptr);
		   
		   if (REQUEST == 1)
           {
			 sprintf(fname_ptr,"dttxt\\%s",char_ptr);
			 fptr = fopen (fname_ptr,"r");
             if (fptr == NULL)
             {
               fprintf(SYS_FPTR,"\n The file %s can not be opened", char_ptr);
               printf ("\n The file %s can not be opened", char_ptr);
               dtt_exit(SYS_FPTR, "dtt_pro_execute", 1,"");
               exit(0);        
             }
		     while(read_input_string(fptr, txt_stuff))
			 {	   
                 dtt_int_dectalk(txt_stuff, phony_stuff, flogptr, bg_stuff[6]);
			 }
			 /* need to close each text file */
			 fclose(fptr);
		   }  
		   else if (dtt_pro_check_bat(char_ptr) != 1) //mfg
		   {
              dtt_int_dectalk(char_ptr, phony_stuff, flogptr, bg_stuff[6]);
           }

     	   (cur_req->status)=-1;
        } while ((cur_req = (cur_req->next_req_p)) != NULL && TEST_HALT == 0);
		fprintf(flogptr,"\n ==========================================================================");
        fclose(flogptr);

        /* check pass_fail for each case here */
        printf("\n\n ***************************************************************************");
		strcpy(test_status,dtt_util_file_compare(case_name,0));
        printf("\n Case #: %d\tCase name: %s\tStatus: %s",
        		cur_case->global_case_number,
        		case_name,
        		test_status);
        printf("\n ***************************************************************************\n");
        /* construct the final summary result array */
		strcpy(final_summary[case_number++],test_status);

		
		
   		/* if the second argument is RUN1 and this case fails, stop */
		if (RUN_MODE == 1 && !_strnicmp (test_status, "FAIL", 4))
		{
		  printf ("\n\nStopping on first failure...  ");
		  printf ("\nTest Case #%d has failed.\n", cur_case->global_case_number);
		  TEST_HALT = 1;
		}
		
		/* if the second argument is RUN2_y and the current case is y, stop */
		if (RUN_MODE == 2 && cur_case->global_case_number == RUN_MODE_y)
		{
		  printf ("\n\nStopping...  ");
		  printf ("\nDTtest has reached Test Case #%d.\n", cur_case->global_case_number);
		  TEST_HALT = 1;
		}
		


        (cur_case->status)=-1;
      } while ((cur_case = (cur_case->next_case_p)) != NULL && TEST_HALT == 0) ;  
      (cur_sg->status)=-1;
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL && TEST_HALT == 0) ;    
    (test_entry->status)=-1;
  } while (0);
  /* display the final summary result here */
  printf("\n\n ***************************************************************************");
  printf("\n Final test summary.\tRun mode: %s\tDebug switch: %s",bg_stuff[2],bg_stuff[3]);
  printf("\n Test result file: %s",res_file_name);
  printf("\n Total test case in this run: %d\n",case_number);
  for (i = 0; i < case_number; ++i)
  {
   	printf(" /(%d)%s",i+1,final_summary[i]);
   	if ((i != 0) && ((i % 6) == 0)) printf("\n");  
  }
  printf("\n ***************************************************************************");

#ifdef MSVC4
  /* Clear flag and call dtt_int_dectalk() one more time to shutdown */
  TTS_flag = 0;
  dtt_int_dectalk(char_ptr, phony_stuff, flogptr, bg_stuff[6]);
#endif

  return(0);
}                         

//mfg check and run bat file
int dtt_pro_check_bat(char *send_ptr)
{

int len,i;
char bat_file_name[FILENAMESIZE];
char ftype[4]={0,0,0,'\0'};


len=(strlen(send_ptr)-3);

	for(i=0;i<3;i++)
	{
	ftype[i]=send_ptr[i+len];	
	}

	if (strnicmp(ftype,"bat",3)==0)
	{
	strcpy(bat_file_name,"dttxt\\");
	strcat(bat_file_name,send_ptr);
	system(bat_file_name);
	return(1);
	}

return(0);
}


int dtt_pro_compare(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
FILE *f_dif_ptr;
	
/* integer loop index */
int i=0,j=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;

int test_entry_fail_flag=0;
int group_fail_flag=0;
int case_fail_flag=0;
int request_fail_flag=0;

/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;

char log_file_name[FILENAMESIZE];
char bmk_file_name[FILENAMESIZE];
char res_file_name[FILENAMESIZE];
char dif_file_name[FILENAMESIZE];
char re_direction[FILENAMESIZE];
char fc_command[FILENAMESIZE];

char answer[MAXRECORDSIZE];

  TEST_HALT = 0;

  if (FLOW==1) printf ("\n enter dtt_pro_compare");

  is_file_name(bg_stuff[1]);

  if (STRING==1) return(0);

  do
  {                             

    cur_sg = (test_entry->test_group_p);
    do
    {
	  /* if is STOP command set test_halt flag */
      if (!_strnicmp(cur_sg->command_string_p->command_p,"STOP",4))
      {
        	TEST_HALT = 1;
         	continue;
      }
	  /* if is CLEAN command skip to next group */
      if (!_strnicmp(cur_sg->command_string_p->command_p,"CLEAN",3))
      {
         	continue;
      }
      if (TRACE==3)
	  printf ("\n current sg number is %d ", cur_sg->test_group_number);

      if (TRACE==3)
	  {  if (cur_sg->skip==1) printf ("\n sg file was skipped");
         else printf ("\n we are in %s sg file",
                     cur_sg->command_string_p->test_input_p);
      }
	  
      cur_case = (cur_sg->first_case_p);
      do
      {
		/* if is STOP command set test_halt flag */
        if (!_strnicmp(cur_case->command_string_p->command_p,"STOP",4))
        {
        	TEST_HALT = 1;
         	continue;
        }
		/* if is CLEAN command skip to next case */
        if (!_strnicmp(cur_case->command_string_p->command_p,"CLEAN",3))
        {
         	continue;
        }
      
        strcpy(log_file_name,"dtlog\\");
        strcpy(bmk_file_name,"dtbmk\\");
        strcpy(res_file_name,"dtres\\");
        strcpy(dif_file_name,"dtdif\\");
        strcpy(re_direction," > ");
        strcpy(fc_command," fc ");

		if (cur_case->skip==1) 
        {
          if (strlen(cur_sg->command_string_p->output_file_name_p) == 0) 
          {
		     strcat(log_file_name,cur_sg->command_string_p->test_input_p);
		     strcat(bmk_file_name,cur_sg->command_string_p->test_input_p);
		     strcat(res_file_name,cur_sg->command_string_p->test_input_p);
		     strcat(dif_file_name,cur_sg->command_string_p->test_input_p);
		  }
		  else
		  {
		     strcat(log_file_name,cur_sg->command_string_p->output_file_name_p);
		     strcat(log_file_name,".");
		     strcat(bmk_file_name,cur_sg->command_string_p->output_file_name_p);
		     strcat(bmk_file_name,".");
		     strcat(res_file_name,cur_sg->command_string_p->output_file_name_p);
		     strcat(res_file_name,".");
		     strcat(dif_file_name,cur_sg->command_string_p->output_file_name_p);
		     strcat(dif_file_name,".");
		  }
		}
		else
        {
          if (strlen(cur_case->command_string_p->output_file_name_p) == 0) 
          {
		     strcat(log_file_name,cur_case->command_string_p->test_input_p);
		     strcat(bmk_file_name,cur_case->command_string_p->test_input_p);
		     strcat(res_file_name,cur_case->command_string_p->test_input_p);
		     strcat(dif_file_name,cur_case->command_string_p->test_input_p);
		  }
		  else
		  {
		     strcat(log_file_name,cur_case->command_string_p->output_file_name_p);
		     strcat(log_file_name,".");
		     strcat(bmk_file_name,cur_case->command_string_p->output_file_name_p);
		     strcat(bmk_file_name,".");
		     strcat(res_file_name,cur_case->command_string_p->output_file_name_p);
		     strcat(res_file_name,".");
		     strcat(dif_file_name,cur_case->command_string_p->output_file_name_p);
		     strcat(dif_file_name,".");
		  }
        }

		for (i=2;i<FILENAMESIZE;i++)
          if (*(log_file_name+i)=='.') break;
		i=i+1;
        
        strcpy((log_file_name+i),"log");
        /* printf ("\n the log name is %s", log_file_name); */
		
		for (i=2;i<FILENAMESIZE;i++)
          if (*(bmk_file_name+i)=='.') break;
		i=i+1;
        strcpy((bmk_file_name+i),"bmk");
		
		for (i=2;i<FILENAMESIZE;i++)
          if (*(res_file_name+i)=='.') break;
		i=i+1;
        strcpy((res_file_name+i),"res");
		
		for (i=2;i<FILENAMESIZE;i++)
          if (*(dif_file_name+i)=='.') break;
		i=i+1;
        strcpy((dif_file_name+i),"dif");
		
        i=strlen(fc_command);
		strcpy((fc_command+i),log_file_name);
		
		i=strlen(fc_command);
		strcpy(fc_command+i," ");

		i=strlen(fc_command);
		strcpy(fc_command+i,bmk_file_name);

		i=strlen(fc_command);
		strcpy(fc_command+i,re_direction);
        
		i=strlen(fc_command);
		strcpy(fc_command+i,dif_file_name);

	    /* printf ("\n ready to issue command %s",fc_command); */
		if (!_access(bmk_file_name,0))
		{
          /* printf ("\n bmk file %s exist ??",bmk_file_name); */
    	  //printf("\n running system FC command: \n /%s/\n",fc_command);
		  system(fc_command);
          /* get result from fc_command */
		  f_dif_ptr = fopen (dif_file_name,"r");
          if (f_dif_ptr == NULL)
          {
            fprintf (SYS_FPTR,"\n The file %s can not be opened", dif_file_name);
            printf  ("\n The file %s can not be opened", dif_file_name);
            dtt_exit(SYS_FPTR, "dtt_pro_compare", 1,"");
          }
		  // mfg added another if statement so result file would writ out correctly
          if  ((fgets(answer, MAXRECORDSIZE-1 , f_dif_ptr)) == NULL) 
          {
            fprintf (SYS_FPTR,"\n The dif file %s contain illegal character", dif_file_name); 
            printf ("\n The dif file %s contain illegal character", dif_file_name); 
	        dtt_exit(SYS_FPTR, "dtt_pro_compare", 1,"");
          }
          if  ((fgets(answer, MAXRECORDSIZE-1 , f_dif_ptr)) == NULL) 
          {
            fprintf (SYS_FPTR,"\n The dif file %s contain illegal character", dif_file_name); 
            printf ("\n The dif file %s contain illegal character", dif_file_name); 
	        dtt_exit(SYS_FPTR, "dtt_pro_compare", 1,"");
          }

	      /* if pass fprintf something */
	      fclose(f_dif_ptr);
		  

		  if (!_strnicmp(answer,"FC: no difference", 16))
		  {	
			/* set passing flag, summarize it */
			cur_case->status=1;
			if (cur_sg->status == -1) cur_sg->status = 1;  
			if (test_entry->status == -1) test_entry->status = 1;  
            /* delete log and dif file */
            strcpy(fc_command,"del ");
            strcat(fc_command,log_file_name);
            system(fc_command); 
            strcpy(fc_command,"del ");
            strcat(fc_command,dif_file_name);
            system(fc_command); 
			/* printf ("\n no difference"); */
          } 
		  else if (dtt_diff_diffBlocks(dif_file_name)==0)  //mfg check for outphone levels
		  {	
			/* set passing flag, summarize it */
			cur_case->status=1;
			if (cur_sg->status == -1) cur_sg->status = 1;  
			if (test_entry->status == -1) test_entry->status = 1;  
            /* delete log and dif file */
            strcpy(fc_command,"del ");
            strcat(fc_command,log_file_name);
            system(fc_command); 
            strcpy(fc_command,"del ");
            strcat(fc_command,dif_file_name);
            system(fc_command); 
			/* printf ("\n no difference"); */
          } 
		  else
          {

			  /* set failing flag, summarize it  */ 
			cur_case->status=2;  
			cur_sg->status=2;  
			test_entry->status=2;  
            /* printf ("\n we got %s",answer); */ 
		    /* printf ("\n FAIL !"); */
		  }		   

		}
        else
        {
          fprintf (SYS_FPTR,"\n The bmk file %s does not exist, compare will be skipped", bmk_file_name);
          printf ("\n The bmk file %s does not exist, compare will be skipped", bmk_file_name);
        }

	  } while ((cur_case = (cur_case->next_case_p)) != NULL && TEST_HALT == 0) ;  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL && TEST_HALT == 0) ;
  } while (0);
  return(0);
}

int dtt_pro_result(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;

/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;

char res_file_name[FILENAMESIZE];
FILE *fresptr=0;

char temp_buff[NORMALSIZE];
  
  TEST_HALT = 0;

  if (FLOW==1) printf ("\n enter dtt_pro_result");

  is_file_name(bg_stuff[1]);

  if (STRING==1) return(0);

  strcpy(res_file_name, test_entry->command_string_p->test_input_p);

  is_file_name(res_file_name);
  
  if (GROUP!=1 && CASE !=1 && REQUEST!=1) 
  {
    /* fprintf(SYS_FPTR,"\n %s not a former request, no res file generated",res_file_name); */
	return(0);
  }
  
  /* get the result file name */
  if (strlen(bg_stuff[4]) == 0)
  {
      strcpy(res_file_name,"dtres\\");
      strcat(res_file_name,test_entry->command_string_p->test_input_p);   
  }
  else
  {
      strcpy(res_file_name,"dtres\\");
      strcat(res_file_name,bg_stuff[4]);
      strcat(res_file_name,".");
  }

  for (i=2;i<FILENAMESIZE;i++)
    if (*(res_file_name+i)=='.') break;
		i=i+1;
        
  strcpy((res_file_name+i),"res");
 
  fresptr = fopen (res_file_name,"w"); 
  if (fresptr == NULL)
  {
    fprintf (SYS_FPTR,"\n The result file %s can not be opened", res_file_name);
    printf  ("\n The result file %s can not be opened", res_file_name);
    dtt_exit(SYS_FPTR, "dtt_pro_result", 1,"");
  }
  /* else printf ("\n\t\t The result file %s just opened", res_file_name); */
		
  do
  {

	fprintf(fresptr,"\n Result file:\t%s",res_file_name);            
	fprintf(fresptr,"   \tTest start: %s\t%s\n",TIME_START,DATE_START);
	fprintf(fresptr," Initiated:\t%s[%s]",
	  				test_entry->command_string_p->test_input_p,
	  				test_entry->command_string_p->test_switch_p);            
	fprintf(fresptr,"\n Remark:\t\"%s\"",
					test_entry->command_string_p->remark);            
    cur_sg = (test_entry->test_group_p);
    do
    {
	  /* if is STOP command set test_halt flag */
      if (!_strnicmp(cur_sg->command_string_p->command_p,"STOP",4))
      {
        	TEST_HALT = 1;
         	continue;
      }
	  /* if is CLEAN command skip to next group */
      if (!_strnicmp(cur_sg->command_string_p->command_p,"CLEAN",3))
      {
         	continue;
      }
      if (TRACE==3)
	  printf ("\n current sg number is %d ", cur_sg->test_group_number);

      if (TRACE==3)
	  {  if (cur_sg->skip==1) printf ("\n sg file was skipped");
         else printf ("\n we are in %s sg file",
                     cur_sg->command_string_p->test_input_p);
      }
	  
      cur_case = (cur_sg->first_case_p);
      do
      {
      	char case_name[NORMALSIZE]={""};

		/* if is STOP command set test_halt flag */
        if (!_strnicmp(cur_case->command_string_p->command_p,"STOP",4))
        {
        	TEST_HALT = 1;
         	continue;
        }
		/* if is CLEAN command skip to next case */
        if (!_strnicmp(cur_case->command_string_p->command_p,"CLEAN",3))
        {
         	continue;
        }
		fprintf(fresptr,"\n ==========================================================================");
		fprintf (fresptr,"\n Case #: %d ", cur_case->global_case_number);            


		if (cur_sg->skip==1) 
		   fprintf (fresptr,"\tgroup file:       \t");
        else
		   fprintf (fresptr,"\tgroup file: %s[%s]",
                   cur_sg->command_string_p->test_input_p,
                   cur_sg->command_string_p->test_switch_p);

		if (cur_case->skip==1) 
		   fprintf (fresptr,"\tcase file:       ");
        else                                        
		   fprintf (fresptr,"\tcase file: %s[%s]",
                   cur_case->command_string_p->test_input_p,
                   cur_case->command_string_p->test_switch_p);

		/* show case name for each case */
	    if (strlen(cur_case->command_string_p->output_file_name_p) == 0)
		{ 
            strcpy(case_name,cur_case->command_string_p->test_input_p);
            case_name[strlen(case_name)-4] = '\0';
		}
		else
		{
            strcpy(case_name,cur_case->command_string_p->output_file_name_p);
		}
	  	fprintf(fresptr,"\n Case name:\t%s \"%s\"",case_name,cur_case->command_string_p->remark);
//  	fprintf(fresptr,"\n Case name:\t%s",case_name);

  		fprintf(fresptr,"\n Status: ");
		if      ((cur_case->status)== 1) fprintf (fresptr,"PASS\t");
		else if ((cur_case->status)== 2) fprintf (fresptr,"FAIL\t");
		else if ((cur_case->status)== 0) fprintf (fresptr,"NOTEST\t");
		else if ((cur_case->status)==-1) fprintf (fresptr,"NEW\t");
		else if ((cur_case->status)==-2) fprintf (fresptr,"INCOM\t");
	
		cur_req = (cur_case->first_req_p);
		do
        {
		   /* if is STOP command set test_halt flag */
           if (!_strnicmp(cur_req->command_string_p->command_p,"STOP",4))
           {
        	  TEST_HALT = 1;
         	  continue;
           }
		   /* if is CLEAN command skip to next case */
           if (!_strnicmp(cur_req->command_string_p->command_p,"CLEAN",3))
           {
            	continue;
           }
           if (TRACE==3)
		   {
			 if (cur_req->skip==1) printf ("\n rq file was skipped");
             else printf ("\n we are in %s req file",
                         cur_req->command_string_p->test_input_p);
		   }
		   /* do something here */
           /* fprintf (fresptr,"\n "); */
           
           /* printf (" gn %d ", cur_sg->test_group_number); */           

           /* printf (" cnig %d ", cur_case->case_number_in_group);*/            

           /* printf (" gcn %d ", cur_case->global_case_number); */           

           /* printf (" rnic %d ", cur_req->request_number_in_case); */           

           /* printf (" rnig %d ", cur_req->request_number_in_group); */          

           /* printf (" grn %d ", cur_req->global_request_number); */            

           fprintf (fresptr,"/%s[%s]", 
			       cur_req->command_string_p->test_input_p,
			       cur_req->command_string_p->test_switch_p);
			       
        } while ((cur_req = (cur_req->next_req_p)) != NULL) ;
        fprintf (fresptr,"/");  
 
//        if(cur_case->status == 2 && !_strnicmp (bg_stuff[2],"RUN1" ,4))
//        {
//          TEST_HALT = 1;
//        }
      } while ((cur_case = (cur_case->next_case_p)) != NULL && TEST_HALT == 0) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL && TEST_HALT == 0) ;

  } while (0);
  fprintf(fresptr,"\n ===========================================================================");
  fprintf(fresptr,"\n Test Complete.");

  /* log the stopping time */
  _strtime(temp_buff);
  fprintf (fresptr,"\t\t\t\tTest Stop: %s ", temp_buff);

  _strdate(temp_buff);
  fprintf (fresptr,"\t%s ", temp_buff);

  fclose(fresptr);

  return(0);
}

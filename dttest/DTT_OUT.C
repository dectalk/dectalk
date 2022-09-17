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
 *                                                      
 ***********************************************************************
 *    File Name:	dtt_out.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest output module
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *  002     G.L		09/16/1996  code cleanup.
 *	003		MFG		03/26/1998	changed i<20 to i<FILENAMESIZE in "for" loops
 *	004		MFG		04/06/1998	added call dtt_diff_diffBlocks() for outphone diffs
 *	005		MFG		06/17/1998	added user feedback (y/n), on update command	
 *
 */

#include "dtt_data.h"       /* all data structure declear here       */
#include "dtt_defs.h"       /* all date value define here            */
#include "dtt_prot.h"       /* all functional proto type define here */
#include <stdlib.h>
#include <conio.h>
#include <io.h>

int dtt_out(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
  if (FLOW==1) printf ("\n enter dtt_out");
  /* if review, update or remove */
  /* call dtt_output(&test_entry) to execute all test */
  if (!(_strnicmp (bg_stuff[2],"REVIEW",6)))
     dtt_output_review(bg_stuff, test_entry);

  else if (!(_strnicmp (bg_stuff[2],"UPDATE",6)))
     dtt_output_update(bg_stuff, test_entry);

  
  else if (!(_strnicmp (bg_stuff[2],"REMOVE",6)))
     dtt_output_remove(bg_stuff, test_entry);
 
  return(0);

}

int dtt_output_review(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0,j=0; 
int fc_pass=0;
  
/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;

FILE *f_dif_ptr;
  
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
char command[132];
char answer[132];
char key[132];

  if (strlen(test_entry->command_string_p->output_file_name_p) == 0)
  {
      strcpy(res_file_name,"dtres\\");
      strcat(res_file_name,test_entry->command_string_p->test_input_p);   
  }
  else
  {
      strcpy(res_file_name,"dtres\\");
      strcat(res_file_name,test_entry->command_string_p->output_file_name_p);
      strcat(res_file_name,".");
  }

  for (i=2;i<FILENAMESIZE;i++)
    if (*(res_file_name+i)=='.') break;
		i=i+1;
        
  strcpy((res_file_name+i),"res");

  if (FLOW==1) printf ("\n enter dtt_output_review");
  do
  {
	printf("\n Test result file:\t%s",res_file_name);            
	printf("\n Test Initiated from:\t%s[%s]",
				test_entry->command_string_p->test_input_p,            
				test_entry->command_string_p->test_switch_p);            

    cur_sg = (test_entry->test_group_p);

	/* printf ("\n ready to issue command %s",command); */
    if (TRACE==3)
	  printf ("\n current sg number is %d ", cur_sg->test_group_number);

    if (TRACE==3)
	{ 
	  if (cur_sg->skip==1) printf ("\n sg file was skipped");
      else printf ("\n we are in %s sg file",
                   cur_sg->command_string_p->test_input_p);
    }
    do
    {

      cur_case = (cur_sg->first_case_p);      
      do
      {
      	char case_name[NORMALSIZE]={""};

	    strcpy(log_file_name,"dtlog\\");
        strcpy(bmk_file_name,"dtbmk\\");
        strcpy(res_file_name,"dtres\\");
        strcpy(dif_file_name,"dtdif\\");
        strcpy(re_direction," >");
        strcpy(command,"copy ");               
        
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

	    strcat(command,log_file_name);
	    strcat(command," ");
	    strcat(command,bmk_file_name);

        printf ("\n ===========================================================================");
		printf ("\n Case #: %d ", cur_case->global_case_number);            

		if (cur_sg->skip==1) 
		   printf ("\tgroup file:       \t");
        else
		   printf ("\tgroup file: %s[%s]",                                        
                   cur_sg->command_string_p->test_input_p,
                   cur_sg->command_string_p->test_switch_p);

		if (cur_case->skip==1) 
		   printf ("\tcase file:       ");
        else
		   printf ("\tcase file: %s[%s]",
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
  		printf("\n Case name:\t%s",case_name);


        if (!_access(log_file_name,00))
		{
		  if (_access(dif_file_name,00))
          {
//		    fprintf (SYS_FPTR,"\n The dif file %s does not exist !", dif_file_name);
		    printf  ("\n The dif file %s does not exist !", dif_file_name);
            fc_pass=0;
		  }
          else
          {
		    f_dif_ptr = fopen (dif_file_name,"r");
            if (f_dif_ptr == NULL)
            {
//			  fprintf (SYS_FPTR,"\n The file %s can not be opened", dif_file_name);
              printf ("\n The file %s can not be opened", dif_file_name);
              dtt_exit(SYS_FPTR, "dtt_output_review", 1,"");
            }
             
            if ((fgets(answer, 250, f_dif_ptr)) == NULL) 
            {
//            fprintf (SYS_FPTR,"\n The dif file %s contain illegal character", dif_file_name); 
              printf ("\n The dif file %s contain illegal character", dif_file_name); 
              dtt_exit(SYS_FPTR, "dtt_output_review", 1,"");
            }

            if  ((fgets(answer, 250, f_dif_ptr)) == NULL) // mfg added another fgets to compare 2nd line in file
            {
//            fprintf (SYS_FPTR,"\n The dif file %s contain illegal character", dif_file_name); 
              printf ("\n The dif file %s contain illegal character", dif_file_name); 
              dtt_exit(SYS_FPTR, "dtt_output_review", 1,"");
            }

//mfg
			if (_strnicmp(answer,"FC: no difference", 16))
            {  
			  printf ("\n Status: FAIL");
              fc_pass=0; 
            }
			else if (!dtt_diff_diffBlocks(dif_file_name)==0)
            {  
			  printf ("\n Status: FAIL");
              fc_pass=0; 
            }
			else
			{	
		      printf ("\n Status: PASS");
              fc_pass=1; 
            }
            fclose(f_dif_ptr); 
		  } /* end of else */

          if (fc_pass==0)
		  {         
		    do
			{
              printf ("\n Updte the BMK file?(Y/N)");
			  scanf("%s", key);
            } while (strnicmp(key,"y",1) && strnicmp(key,"n",1));

            if (strnicmp(key, "n", 1)) 
		    {	
    	      printf("\n running system COPY command: /%s/\n",command);
		      system(command);
              printf ("\n The BMK file %s just update",bmk_file_name);
		    }
		  }
		  else
          {
//		    fprintf (SYS_FPTR,", The bmk and log file are same, no need to update");
		    printf  (", The bmk and log file are same, no need to update");
          }
 		} /* end of if */
        else 
        {
//		  fprintf (SYS_FPTR,"\n The log file %s does not exist", log_file_name);
//		  fprintf (SYS_FPTR,"\n Without log file, update has to be be skipped !");
		  printf  ("\n The log file %s does not exist", log_file_name);
		  printf  ("\n Without log file, update has to be be skipped !");
		}

      } while ((cur_case = (cur_case->next_case_p)) != NULL) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL) ;

  } while (0);
  printf("\n ===========================================================================");
  printf("\n REVIEW Complete.");
  
  return(0);
}


int dtt_output_update(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0,j=0; 

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

char log_file_name[FILENAMESIZE];
char bmk_file_name[FILENAMESIZE];
char res_file_name[FILENAMESIZE];
char dif_file_name[FILENAMESIZE];
char re_direction[FILENAMESIZE];
char command[132];

  if (FLOW==1) printf ("\n enter dtt_output_update");
  do
  {
    cur_sg = (test_entry->test_group_p);
    do
    {
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
        
        strcpy(log_file_name,"dtlog\\");
        strcpy(bmk_file_name,"dtbmk\\");
        strcpy(res_file_name,"dtres\\");
        strcpy(dif_file_name,"dtdif\\");
        strcpy(re_direction," >");
        strcpy(command,"copy ");

        printf ("\n ===========================================================================");
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

		strcat(command,log_file_name);
		strcat(command," ");
		strcat(command,bmk_file_name);

	    /* printf ("\n ready to issue command %s",command); */
        if (_access(log_file_name,00))
        {
//		  fprintf (SYS_FPTR,"\n The log fil %s does not exist", log_file_name);
//		  fprintf (SYS_FPTR,"\n Without log file, update has to be be skipped !");
		  printf  ("\n The log fil %s does not exist", log_file_name);
		  printf  ("\n Without log file, update has to be be skipped !");
		}
        else
        {
    	  printf("\n Are you sure you want to update the benchmark file : %s (y/n)?",bmk_file_name);
			
			if (getch()=='y')
			{
			printf("y \n\n benchmark file is being updated \n"); 
    		printf("\n running system COPY command: /%s/\n",command);
		    system(command);
			}
			else
			{
			printf("n \n\n benchmark file was not updated \n"); 
			}

		}
      } while ((cur_case = (cur_case->next_case_p)) != NULL) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL) ;

  } while (0);
  printf("\n ===========================================================================");
  printf("\n UPDATE Complete.");

  return(0);


}



int dtt_output_remove(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0,j=0; 

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

char log_file_name[FILENAMESIZE];
char bmk_file_name[FILENAMESIZE];
char res_file_name[FILENAMESIZE];
char dif_file_name[FILENAMESIZE];
char re_direction[FILENAMESIZE];
char command[132];

  if (FLOW==1) printf ("\n enter dtt_output_remove");
  do
  {

    cur_sg = (test_entry->test_group_p);
    do
    {
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
        
        strcpy(log_file_name,"dtlog\\");
        strcpy(bmk_file_name,"dtbmk\\");
        strcpy(res_file_name,"dtres\\");
        strcpy(dif_file_name,"dtdif\\");
        strcpy(re_direction," > ");
        strcpy(command,"del ");

  		printf("\n ===========================================================================");
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

		strcat(command,log_file_name);
		
        if (_access(log_file_name,00))
        {
//		  fprintf (SYS_FPTR,"\n The log fil %s does not exist, remove is not needed !",log_file_name);
		  printf  ("\n The log fil %s does not exist, remove is not needed !",log_file_name);
		}
	    else
        {
    	  printf("\n running system DEL command: /%s/",command);
    	  system(command);
//		  fprintf (SYS_FPTR,"\n The log fil %s just deleted", log_file_name);
		  printf  ("\n The log fil %s just deleted", log_file_name);
		}
		
        strcpy(command,"del ");
		strcat(command,dif_file_name);
		
	    /* printf ("\n ready to issue command %s",command); */

        if (_access(dif_file_name,00))
        {
//		  fprintf (SYS_FPTR,"\n The dif file %s does not exist, remove is not needed !",dif_file_name);
		  printf  ("\n The dif file %s does not exist, remove is not needed !",dif_file_name);
		}
	    else
        {
    	  printf("\n running system DEL command: /%s/",command);
    	  system(command);
//		  fprintf (SYS_FPTR,"\n The dif file %s just deleted", dif_file_name);
		  printf  ("\n The dif file %s just deleted", dif_file_name);
		}
		
      } while ((cur_case = (cur_case->next_case_p)) != NULL) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL) ;

  } while (0);
  printf("\n ===========================================================================");
  printf("\n REMOVE Complete.");

	return(0);
}



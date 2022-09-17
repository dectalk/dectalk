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
 *    File Name:	dtt_in.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest input module.
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *  002     G.L		09/16/1996  code cleanup.
 *	003		MFG		03/26/1998	changed i<20 to i<FILENAMESIZE in "for" loops
 *  004		JHU		08/07/1998	added if(*(res_file_name+i)=='\0') for condition 
 *								checking when test_input is a string. 
 *								
 *
 */

#include "dtt_data.h"       /* all data structure declare here       */
#include "dtt_defs.h"       /* all date value define here            */
#include "dtt_prot.h"       /* all functional proto type define here */

#include <math.h>
#include <stdlib.h>

extern int NOT_REGULAR_CASE;
extern int TEST_MODE;
extern int TEST_HALT;

int dtt_in(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry)
{
                                            
  /* pointer point to command dst */
  COMMAND_STRING *bg_cmd_ptr;

  /* collect needed from prompt to the user */
  if (FLOW==1) printf("\n enter dtt_in");

  /* read dttest.ini file */

  /* build data structure */
  dtt_build_test_seq(bg_stuff, bg_cmd_ptr, test_entry);

  /*
     printf ("\n data structure building is completed ");  
     printf ("\n the command is %s",
	          test_entry->command_string_p->command_p);
  */

  if (!(strnicmp (test_entry->command_string_p->command_p,"SHOW",1)))
     dtt_input_show(test_entry);


  return(0);

}                  

int is_file_name(unsigned char *cptr)
{

int i=0, j=0;                                          
unsigned char lcptr[FILENAMESIZE];
   
   /* if the file type identified, the variable will be set to one */
   /* now initialize all to 0 first */  
   GROUP   =0;
   CASE    =0;
   REQUEST =0;
   PRI     =0;
   POS     =0;
   BAT     =0;
   STRING  =0;

   if (TRACE==1)
     printf("\n The original string %s has %d characters",cptr,strlen(cptr));
   
   if (FLOW==1) printf("\n enter is_file_name");
	
   j = strlen(cptr);
   
   /* if the file name is less than 4 characters, it must be a string */
   if (j < 5) 
   {
     STRING = 1;
     return(1);
   }
   
   strcpy(lcptr,cptr+j-4);
   /*
      printf("\n now examing %s ",lcptr); 
      printf("\n %s has %d characters",lcptr,strlen(lcptr));
   */
     
   if ( !(_strnicmp(lcptr,".grp",4)) ) 
   {
     /* printf("\n %s is a group file name ",cptr);  */
     GROUP = 1;
     return(1);
   }    
   else if ( !(_strnicmp(lcptr,".tst",4)) ) 
   {
     /* printf("\n %s is an case file name ",cptr); */
     CASE = 1;
     return(1);
   }    
   else if ( !(_strnicmp(lcptr,".txt",4)) ) 
   {
     /* printf("\n %s is an request file name ",cptr);   */
     REQUEST = 1;
     return(1);
   }    
   else if ( !(_strnicmp(cptr,".pri",4)) )
   {
     /* printf("\n %s is an pre file name ",cptr); */ 
     PRI = 1;
     return(1);   
   }  
   else if ( !(_strnicmp(cptr,".pos",4)) )
   {
     /* printf("\n %s is an post file name ",cptr); */ 
     POS = 1;
     return(1);   
   }  
   else if ( !(_strnicmp(cptr,".bat",4)) )
   {
     /* printf("\n %s is an batch file name ",cptr); */ 
     BAT = 1;
     return(1);   
   }  
   else
   {
     /* printf("\n %s is not a file name ",cptr); */
     STRING = 1;

     return(0);   
   }  
}          

/* this function pass 10 argument in stuff array such as bg_stuff, */
/* sg_stuff, then create a data structure and return a pointer point to */
/* a command string */
int create_command_dst(COMMAND_STRING **p, char ch_p[][FILENAMESIZE])
{

  if (FLOW==1) printf("\n enter create command dst");

  /* allocate the command data structure */
  *p=malloc(sizeof(COMMAND_STRING)); 
  if (*p == NULL)
     dtt_exit(SYS_FPTR, "create_command_dst", 1,
	          "Out of the memory at command string allocation");

  /* allocate and copy the 1st element in entry data structure */
  (*p)->test_input_p=malloc(strlen(ch_p[1])+2); 
  if ((*p)->test_input_p == NULL)
    dtt_exit(SYS_FPTR, "create_command_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->test_input_p,ch_p[1]);
  if (TRACE ==1) printf (" %s ",(*p)->test_input_p); 

  /* also identify the type of input */
  is_file_name(ch_p[1]);


  /* allocate and copy the 2nd element in entry data structure */
  (*p)->command_p=malloc(strlen(ch_p[2])+2); 
  if ((*p)->command_p == NULL)
     dtt_exit(SYS_FPTR, "create_command_dst", 1,
 	         "Out of the memory at test entry DST allocation");

  strcpy((*p)->command_p,ch_p[2]);
  if (TRACE ==1) printf ("\n  just receive %s ",(*p)->command_p); 


  /* allocate and copy the 3'th element in entry data structure */
  (*p)->test_switch_p=malloc(strlen(ch_p[3])+2); 
  if ((*p)->test_switch_p == NULL)
  dtt_exit(SYS_FPTR, "create_command_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->test_switch_p,ch_p[3]);

  if (TRACE ==1) printf (" %s ",(*p)->test_switch_p); 

  /* allocate and copy the 4'th element in entry data structure */
  (*p)->output_file_name_p=malloc(strlen(ch_p[4])+2); 
  if ((*p)->output_file_name_p == NULL)
  dtt_exit(SYS_FPTR, "create_command_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->output_file_name_p,ch_p[4]);
  if (TRACE ==1) printf (" %s ",(*p)->output_file_name_p); 


  /* allocate and copy the 5'th element in entry data structure */
  (*p)->output_file_enable = atoi(ch_p[5]);
  if (TRACE ==1) printf (" %d ",(*p)->output_file_enable); 

  /* allocate and copy the 6'th element in entry data structure */
  (*p)->speak_enable = atoi(ch_p[6]);
  if (TRACE ==1) printf (" %d ",(*p)->speak_enable); 

  /* allocate and copy the 7'th element in entry data structure */
  (*p)->work_dir_p=malloc(strlen(ch_p[7])+2); 
  if ((*p)->work_dir_p == NULL)
  dtt_exit(SYS_FPTR, "main.c", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->work_dir_p,ch_p[7]);
  if (TRACE ==1) printf (" %s ",(*p)->work_dir_p); 


  /* allocate and copy the 8'th element in entry data structure */
  (*p)->pre_file_p=malloc(strlen(ch_p[8])+2); 
  if ((*p)->pre_file_p == NULL)
  dtt_exit(SYS_FPTR, "create_command_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->pre_file_p,ch_p[8]);
  if (TRACE ==1) printf (" %s ",(*p)->pre_file_p); 

  /* allocate and copy the 9'th element in entry data structure */
  (*p)->pos_file_p=malloc(strlen(ch_p[9])+2); 
  if ((*p)->pos_file_p == NULL)
  dtt_exit(SYS_FPTR, "create_command_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->pos_file_p,ch_p[9]);
  if (TRACE ==1) printf (" %s ",(*p)->pos_file_p);

  /* allocate and copy the 10'th element in entry data structure */
  (*p)->remark=malloc(strlen(ch_p[10])+2); 
  if ((*p)->remark == NULL)
  dtt_exit(SYS_FPTR, "create_command_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  strcpy((*p)->remark,ch_p[10]);
  if (TRACE ==1) printf (" %s ",(*p)->remark); 

  return(1);
  
}
                  
FILE * open_input_file(char *char_ptr)
{

FILE *fptr;
char fname_ptr[FILENAMESIZE];

  if (TRACE==1) printf ("\n file name %s just passed", char_ptr);

  if (FLOW==1) printf("\n enter open_input_file");

  is_file_name(char_ptr);
  
  if (GROUP==1)   sprintf(fname_ptr,"dtgrp\\%s",char_ptr);
  if (CASE==1)    sprintf(fname_ptr,"dttst\\%s",char_ptr);
  if (REQUEST==1) sprintf(fname_ptr,"dttxt\\%s",char_ptr);

  fptr = fopen (fname_ptr,"r");

  if (fptr == NULL)
  {
//    fprintf (SYS_FPTR,"\n The file %s can not be opened", fname_ptr);
    printf  ("\n The file %s can not be opened", fname_ptr);
    dtt_exit(SYS_FPTR, "open_input_file", 1,"");
  }

  if (FLOW ==1) printf ("\n Now opening file %s ", fname_ptr);

  return(fptr);
}


/* read a line from a file, then parser it accordingly */
int read_input_file(FILE *fptr, char buff[][FILENAMESIZE])
{

char buffer[CHARARRAYSIZE];
char *line = buffer;
  
int i=0,j=0,k=0;
int string_begin=0; 
int go_back=0; 

  if (FLOW==1) printf("\n enter read_input_file");

  do
  {
    
    go_back =0;

    /* if eof occurred, return with zero */
    if ((fgets(buffer, CHARARRAYSIZE-1, fptr)) == NULL) return (0);
    
    if (TRACE==1) printf ("\n   read %s ",buffer); 

    /* if this line is a comment, skip and do nothing */
	if (buffer[0]==';') 
	{	
	  //printf ("\n one comment line is detected"); 
	  go_back=1;
	}

    /* if this line is a space, tab or carrage return, skip and do nothing */
	if (buffer[0]==0 || buffer[0]==9 || buffer[0]==10 || buffer[0]==12 ||
	    buffer[0]==20)
	{    
	  /* printf ("\n comment is detected"); */ 
	  go_back=1;
	}  

    /* if it does not start with DTTEST, it is still illegle character */
	if (_strnicmp(buffer,"DTTEST",6)) 
	{	
	  go_back=1;;
	}  
  } while (go_back==1);
  
  /* printf ("\n choose %s for further process ",buffer); */

  strcpy(buff[0],"DTTEST");
  

  /* now, the character must be legal */
  for (i=6,k=0,string_begin=0;i<CHARARRAYSIZE;i++)  
  {

    if (buffer[i]=='\0') break;

    if (k>(ARGUMENTSIZE-1)) break;

    if (buffer[i]==34) 
	{
      /* skip the quote */
	  i=i+1;
	  /* if the quote is the beginning of the string */
	  if (string_begin==0)
	  {  
	    string_begin=1;
		/* reset the j value */
		j=-1;           
		/* prepare the k'th element, ready to process 1- k'th element*/
		k=k+1;
      }
      /* if the quote is the end of the string */
	  else string_begin=0;	
	}
	
    if (k > (ARGUMENTSIZE-1)) break;
      
    if (string_begin==1) 
    {	  
      /* if it is double quote */
	  if (buffer[i]==34) 
      {
        j=0;
        buff[k][j]='\0';  
        string_begin=0;
      } 
      else		
	  {
	    j=j+1;
        buff[k][j]=buffer[i];  
        buff[k][j+1]='\0';    
      } 
    }
    /* don't handle any character string longer than 80 characters */
	if (strlen(buff[k]) > 80)
	{
          printf ("\n The DTtest argument can not longer than 80 characters\n");
          printf ("\n ---> \"%s\"",buff[k]);
          printf ("\n DTtest will not continue");
          printf ("\n DTtest finished with error !\n");
          exit(1);	  
	}

  } /* end of for loop */ 
   
  if (k <= (ARGUMENTSIZE-1))  
  {	
    /* fill up the remaining with "" */
    for (i=k+1;i<ARGUMENTSIZE;i++)
      strcpy(buff[i],"");
  }  
    
  if      (!_strnicmp(buff[5],"on",2)) strcpy (buff[5],"1");
  else if (!_strnicmp(buff[5],"of",2)) strcpy (buff[5],"0");
  else     strcpy  (buff[5],"1");
  

  if      (!_strnicmp(buff[6],"on",2)) strcpy (buff[6],"1");
  else if (!_strnicmp(buff[6],"of",2)) strcpy (buff[6],"0");
  else    strcpy  (buff[6],"1");

  if (TRACE==1)
  {
    printf ("\n total %d strings has been read",k); 
    printf ("\n they are /%s-%s-%s-%s-%s-%s-%s-%s-%s-%s/ ",
            buff[0],buff[1],buff[2],buff[3],buff[4],buff[5],buff[6],buff[7],buff[8],buff[9]); 
    printf ("\n remark: /%s/",buff[10]);
  }

	return (1);
}                                                               

int read_input_string(FILE *fptr, char buff[])
{

  if (FLOW==1) printf("\n enter read_input_string");

  if  ((fgets(buff, CHARARRAYSIZE, fptr)) == NULL) 
  {
    return (0);
  }
  else 
  {
      /* printf ("\n   read %s ",buff); */
	  return (1);
   }
}                                                               

int read_bg_file(FILE *bg_fptr, char bg_stuff[][FILENAMESIZE], char sg_stuff[][FILENAMESIZE])
{

  if (FLOW==1) printf("\n enter read_BG_file");
  /* fptr is the file pointer point to the only one big group file */
  /* buff is from the big group file or from one level above       */
  /* int_ptr is the integer point point to the index count         */

  is_file_name(bg_stuff[1]);

  /* The keyboard really contain a bg file name, */
  /* you can read the bg file and try to get sg file name */
  if (GROUP==1) 
  {
    if (read_input_file(bg_fptr, sg_stuff)) 
    {
      return (1);
    }
    else 
    {
        return (0);
    }
  }

  /* The keyboard does not contain a bg file name, */
  /* you can not read bg file and can't get sg file name */
  else 
  {

    strcpy(sg_stuff[0],bg_stuff[0]);  
    strcpy(sg_stuff[1],bg_stuff[1]);  
    strcpy(sg_stuff[2],bg_stuff[2]);  
    strcpy(sg_stuff[3],bg_stuff[3]);  
    strcpy(sg_stuff[4],bg_stuff[4]);  
    strcpy(sg_stuff[5],bg_stuff[5]);  
    strcpy(sg_stuff[6],bg_stuff[6]);  
    strcpy(sg_stuff[7],bg_stuff[7]);  
    strcpy(sg_stuff[8],bg_stuff[8]);  
    strcpy(sg_stuff[9],bg_stuff[9]);  
    strcpy(sg_stuff[10],bg_stuff[10]);  

    /* the BG file has been "read" once, no more bg while */
    if (BG_LOOPED==1)
    {
      if (FLOW ==1) printf ("\n one big group loop just completed.");
      BG_LOOPED=0;
      return(0);
    }
    /* the BG file has not been "read" yet first time goto bg while */
    else
    {
      return(1);
    }
  }
}

int read_sg_file(FILE *sg_fptr, char sg_stuff[][FILENAMESIZE], char case_stuff[][FILENAMESIZE])
{
  if (FLOW==1) printf("\n enter read_sg_file");
  /* fptr is the file pointer point to the only one big group file */
  /* buff is from the big group file or from one level above       */
  /* int_ptr is the integer point point to the index count         */

  is_file_name(sg_stuff[1]);

  /* The bg file really contain a sg file name, */
  /* you can read the sg file and get case file name */
  if (GROUP==1) 
  {
    if (read_input_file(sg_fptr, case_stuff)) 
    {
      return (1);
    }
    else 
    {
        return (0);
    }
  }
  /* The bg file does not contain a sg file name, */
  /* you can't read the sg file and can't get case file name */
  else 
  {
    strcpy(case_stuff[0],sg_stuff[0]);  
    strcpy(case_stuff[1],sg_stuff[1]);  
    strcpy(case_stuff[2],sg_stuff[2]);  
    strcpy(case_stuff[3],sg_stuff[3]);  
    strcpy(case_stuff[4],sg_stuff[4]);  
    strcpy(case_stuff[5],sg_stuff[5]);  
    strcpy(case_stuff[6],sg_stuff[6]);  
    strcpy(case_stuff[7],sg_stuff[7]);  
    strcpy(case_stuff[8],sg_stuff[8]);  
    strcpy(case_stuff[9],sg_stuff[9]);  
    strcpy(case_stuff[10],sg_stuff[10]);  

    /* the SG file has been "read" once, no more sg while */
    if (SG_LOOPED==1)
    {
      if (FLOW ==1) printf ("\n one small group loop just completed");
      SG_LOOPED=0;
      return(0);
    }
    /* first time through sg while loop */
    else
    {
      return(1);
    }
  }
}

int read_case_file(FILE *case_fptr, char case_stuff[][FILENAMESIZE], char req_stuff[][FILENAMESIZE])
{
  if (FLOW==1) printf("\n enter read_case_file");

  /* fptr is the file pointer point to the only one big group file */
  /* buff is from the case file or frpm group                      */
  /* int_ptr is the integer point point to the index count         */

  is_file_name(case_stuff[1]);

  /* The sg file really contain a case file name, */
  /* you can read the case file and get req file name */
  if (CASE==1) 
  {
    if (read_input_file(case_fptr, req_stuff)) 
    {
	  return (1);
    }
	else 
    {
      return (0);
    }
  }
  /* The sg file does not contain a case file name, */
  /* you can't read the case file and can't get req file name */
  else 
  {
    strcpy(req_stuff[0],case_stuff[0]);  
    strcpy(req_stuff[1],case_stuff[1]);  
    strcpy(req_stuff[2],case_stuff[2]);  
    strcpy(req_stuff[3],case_stuff[3]);  
    strcpy(req_stuff[4],case_stuff[4]);  
    strcpy(req_stuff[5],case_stuff[5]);  
    strcpy(req_stuff[6],case_stuff[6]);  
    strcpy(req_stuff[7],case_stuff[7]);  
    strcpy(req_stuff[8],case_stuff[8]);  
    strcpy(req_stuff[9],case_stuff[9]);  
    strcpy(req_stuff[10],case_stuff[10]);  
                     
    /* the case file has been "read" once, no more case while */
    if (CASE_LOOPED == 1)
    {
      if (TRACE ==1) printf ("\n one case loop just completed");
      CASE_LOOPED = 0;
      return(0);
    }
    /* first time through case while */
    else
    {  
      return(1);
    }
  }
}

int read_req_file(FILE *req_fptr, char req_stuff[][FILENAMESIZE], char txt_stuff[])
{
  if (FLOW==1) printf("\n enter read_req_file");
  /* fptr is the file pointer point to the only one big group file */
  /* buff is from test request file or from one or two level above */
  /* int_ptr is the integer point point to the index count         */

  is_file_name(req_stuff[1]);

  /* The case file really contain a req file name, */
  /* you can read the req file and get string */
  if (REQUEST==1) 
  {
    if (read_input_string(req_fptr, txt_stuff)) 
      return (1);
  }
  /* The case file does not contain a req file name, */
  /* you can't read the req file and can't get string */
  else 
  {
    strcpy(txt_stuff,req_stuff[1]);  
                     
    /* the req file has been "read" once, no more req while */
    if (REQ_LOOPED == 1)
    {
      if (TRACE ==1) printf ("\n one request loop completed");
      REQ_LOOPED = 0;
      return(0);
    }
    /* first time through req while */
    else
    {  
      return(1);
    }
  }
}

int create_bg_dst(TEST_GROUP **group, COMMAND_STRING **g_cmd_ptr)
{
  if (FLOW==1) printf("\n enter create_bg_dst");
	  
  /* allocate the test group data structure */
  *group=malloc(sizeof(TEST_GROUP)); 
  if (*group == NULL)
    dtt_exit(SYS_FPTR, "create_bg_dst", 1,
	         "Out of the memory at BG DST allocation");
  
  /* initial next group/case to NULL */
  (*group)->next_group_p = NULL;
  (*group)->next_case_p  = NULL;

  /* initial first case to 0 */
  (*group)->first_case_p  = NULL;

  /* attach the command pointer to bg dst */
  (*group)->command_string_p = *g_cmd_ptr;

  /* initial the test status to 0 */
  (*group)->status = 0;

  /* accumulate and assign the group number */
  BG_NUM = BG_NUM + 1;
  (*group)->test_group_number = BG_NUM;
  /* printf ("\n the new BG number is %d",BG_NUM); */

  if (GROUP == 1)
  {
    (*group)->skip = 0;
  }
  else
  {
    (*group)->skip = 1;
  }
  return(1);

}

int create_sg_dst(TEST_GROUP **group, COMMAND_STRING **g_cmd_ptr)
{                                              
  if (FLOW==1) printf("\n enter create_sg_dst");
  /* allocate the test group data structure */
  *group=malloc(sizeof(TEST_GROUP)); 
  if (*group == NULL)
    dtt_exit(SYS_FPTR, "create_sg_dst", 1,
	         "Out of the memory at SG DST allocation");
  
  /* initial next group/case to NULL */
  (*group)->next_group_p = NULL;
  (*group)->next_case_p  = NULL;

  /* initial first case to NULL */
  (*group)->first_case_p  = NULL;

  /* attach the command pointer to bg dst */
  (*group)->command_string_p = *g_cmd_ptr;

  /* initial the test status to 0 */
  (*group)->status = 0;

  /* accumulate and assign the group number */
  /* don't incease the case number if command is CLEAN or STOP */
  if (_strnicmp((*group)->command_string_p->command_p,"CLEAN",3) &&
      _strnicmp((*group)->command_string_p->command_p,"STOP",4))
  {
     SG_NUM = SG_NUM + 1;
     (*group)->test_group_number = SG_NUM;
  }
  else
  {
     (*group)->test_group_number = -1;
  }
  
  /* printf ("\n the new SG number is %d",SG_NUM); */

  if (GROUP == 1)
  {
     (*group)->skip = 0;
  }
  else
  {
     (*group)->skip = 1;
     /* clean up the sub-group data if skip is set */
     //memset((*group)->command_string_p,0,sizeof(COMMAND_STRING));
  }
  return(1);

}

int create_case_dst(TEST_CASE **case_p, COMMAND_STRING **case_cmd_ptr)
{
  if (FLOW==1) printf("\n enter create_case_dst");
  /* allocate the case data structure */
  *case_p=malloc(sizeof(TEST_CASE)); 
  if (*case_p == NULL)
    dtt_exit(SYS_FPTR, "create_case_dst", 1,
	         "Out of the memory at case DST allocation");
  
  /* initial next group/case to NULL */
  (*case_p)->next_group_p = 0;
  (*case_p)->next_case_p  = 0;

  /* initial first request to 0 */
  (*case_p)->first_req_p  = 0;

  /* attach the command pointer to bg dst */
  (*case_p)->command_string_p = *case_cmd_ptr;

  /* initial the test status to 0 */
  (*case_p)->status = 0;

  /* don't incease the case number if command is CLEAN or STOP */
  if (_strnicmp((*case_p)->command_string_p->command_p,"CLEAN",3) &&
      _strnicmp((*case_p)->command_string_p->command_p,"STOP",4))
  {
     /* accumulate and assign the group number */
     CASE_NUM_IN_GROUP = CASE_NUM_IN_GROUP + 1;
     GLOBAL_CASE_NUM = GLOBAL_CASE_NUM + 1;
     (*case_p)->case_number_in_group = CASE_NUM_IN_GROUP;
     (*case_p)->global_case_number   = GLOBAL_CASE_NUM;
  }
  else
  {
     (*case_p)->case_number_in_group = -1;
     (*case_p)->global_case_number   = -1;
  }
  (*case_p)->test_group_number = SG_NUM;

  if (CASE == 1)
  {
     (*case_p)->skip = 0;
  }
  else
  {
     (*case_p)->skip = 1;
     /* clean up the data if skip is set */
     //memset((*case_p)->command_string_p,0,sizeof(COMMAND_STRING));
  }
  return(1);

}


int create_req_dst(TEST_REQUEST **req, COMMAND_STRING **req_cmd_ptr)
{
  if (FLOW==1) printf("\n enter create_req_dst");
  /* allocate the request data structure */
  *req=malloc(sizeof(TEST_REQUEST)); 
  if (*req == NULL)
    dtt_exit(SYS_FPTR, "create_req_dst", 1,
	         "Out of the memory at req DST allocation");
  
  /* initial next request to NULL */
  (*req)->next_req_p = 0;

  /* attach the command pointer to bg dst */
  (*req)->command_string_p = *req_cmd_ptr;

  /* initial the test status to 0 */
  (*req)->status = 0;

  /* accumulate and assign the group number */
  /* don't incease the request number if command is CLEAN */
  if (_strnicmp((*req)->command_string_p->command_p,"CLEAN",3) &&
      _strnicmp((*req)->command_string_p->command_p,"STOP",4))
  {
     REQ_NUM_IN_CASE = REQ_NUM_IN_CASE + 1;
     REQ_NUM_IN_GROUP = REQ_NUM_IN_GROUP + 1;
     GLOBAL_REQ_NUM = GLOBAL_REQ_NUM + 1;
     (*req)->request_number_in_case  = REQ_NUM_IN_CASE;
     (*req)->request_number_in_group = REQ_NUM_IN_GROUP;
  }
  else
  {
     (*req)->request_number_in_case  = -1;
     (*req)->request_number_in_group = -1;
  }
  (*req)->global_request_number   = GLOBAL_REQ_NUM;
  
  if (REQUEST==1)
  {
     (*req)->skip = 0;
  }
  else
  {
     (*req)->skip = 1;
  }
  return(1);

}

int dtt_build_test_seq(char bg_stuff[][FILENAMESIZE], COMMAND_STRING *bg_cmd_ptr, TEST_ENTRY *test_entry)
{ 
/* integer loop index */
int i=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;

/* charcter stuff pointer, sg_stuff   contains DTTEST sg.grp .... */
/* charcter stuff pointer, case_stuff contains DTTEST case.grp .... */
/* charcter stuff pointer, req_stuff  contains DTTEST req.grp .... */
/* charcter stuff pointer, txt_stuff  contains sring */
char sg_stuff[ARGUMENTSIZE][FILENAMESIZE];           
char case_stuff[ARGUMENTSIZE][FILENAMESIZE];         
char req_stuff[ARGUMENTSIZE][FILENAMESIZE];          
char txt_stuff[CHARARRAYSIZE];          

/* file pointer */
FILE *bg_fptr; 
FILE *sg_fptr; 
FILE *case_fptr; 
FILE *req_fptr;                                          
                                            
/* command dst pointer */
COMMAND_STRING *sg_cmd_ptr=0;
COMMAND_STRING *case_cmd_ptr=0;
COMMAND_STRING *req_cmd_ptr=0;
  
/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;
  
  if (FLOW==1) printf("\n enter build_test_seq");
  /* create command dst for bg command pointer */
  /* whether GROUP == 1 is determined here */
  create_command_dst(&bg_cmd_ptr, bg_stuff);

  /* open the big group file and return a file pointer */
  if (GROUP == 1) bg_fptr = open_input_file((bg_cmd_ptr)->test_input_p); 

  /* link up   : none , because the test_entry is already top */
  /* connect to previous : none, because this is the only one */

  /* update the current pointer : none */
  
  /* read bg file to get sg_stuff */
  /* the sg_stuff may contain sg, case, req, txt */
  while(read_bg_file(bg_fptr, bg_stuff, sg_stuff))
  {
    /* create command dst for sg command pointer */
    /* whether GROUP == 1 is determined here */
    create_command_dst(&sg_cmd_ptr, sg_stuff);
    
    /* create small group dst */
    /* if it does not belong to this level, SG_NUM will be 0 */
    /* otherwise SG_NUM will increase */
    create_sg_dst(&cur_sg, &sg_cmd_ptr);
    /* printf("\n the small group number is %d",cur_sg->test_group_number); */


    /* if the small group stuff belong to this level */
    /* open the small group file, to obtain case stuff later */
    if (GROUP == 1) sg_fptr = open_input_file((sg_cmd_ptr)->test_input_p);

    /* if not belong to this level, after entered this while loop, */
    /* the next while loop will return 0 if BG_LOOPED == 1 */
    /* else BG_LOOPED = 1; */

    /* if bg itself is not a file, should only looped once */
    /* printf ("bg_stuff is %s",bg_stuff[1]); */

    is_file_name(bg_stuff[1]);
    if (GROUP == 0) BG_LOOPED = 1;

    /* link up */
    if (test_entry_linked==0)
    {
      /* printf ("\n link up to test_entry"); */
      test_entry_linked=1;
      ((test_entry)->test_group_p) = cur_sg;
    }
    /* connect to previous sg dst */
    else 
    { 
      /* printf ("\n link next to pre_sg"); */
      ((pre_sg)->next_group_p) = cur_sg;
    }
    
    /* update the sg dst pointer */
    pre_sg=cur_sg;
    /* read sg file to get case_stuff */
    /* the case_stuff may contain case, req, txt */
    while(read_sg_file(sg_fptr, sg_stuff, case_stuff))
    {
      /* create command dst for case command pointer */
      /* whether CASE == 1 is determined here */
      create_command_dst(&case_cmd_ptr, case_stuff);

      /* create case dst */
      /* if it does not belong to this level, CASE_NUM_IN_GROUP will be 0 */
      /* otherwise CASE_NUM_IN_GROUP will increase */
      create_case_dst(&cur_case, &case_cmd_ptr);

      /* if the content is case file name */
      if (CASE == 1) case_fptr = open_input_file((case_cmd_ptr)->test_input_p);

      /* if not belong to this level, after entered this while loop, */
      /* the next while loop will return 0 if SG_LOOPED == 1 */
      /* else SG_LOOPED= 1; */

      /* if sg itself is not a file, should only looped once */
      is_file_name(sg_stuff[1]);
      if (GROUP == 0) SG_LOOPED = 1;

      /* link up */
      if (sg_linked==0)
      {
        /* printf ("\n link up to cur_sg"); */
        sg_linked=1;
        ((cur_sg) -> first_case_p) = cur_case;
      }
      /* connect to previous case */
      else 
      {
        /* printf ("\n link next to pre_case"); */
        ((pre_case) -> next_case_p) = cur_case;
      }
      /* update the case dst pointer */
      pre_case=cur_case;

      /* read case file to get req_stuff */
      /* the req_stuff may contain req, txt */
      while(read_case_file(case_fptr, case_stuff, req_stuff))
      {
        /* create command dst for req command pointer */
        /* whether REQ == 1 is determined here */
        create_command_dst(&req_cmd_ptr, req_stuff);
        /* create req dst */
        /* if it does not belong to this level, REQ_NUM_IN_CASE will be 0 */
        /* otherwise REQ_NUM_IN_CASE, REQ_NUM_IN_GROUP will increase */
        create_req_dst(&cur_req, &req_cmd_ptr);

        if (REQUEST == 1) req_fptr = open_input_file((req_cmd_ptr)->test_input_p);

        /* if not belong to this level, after entered this while loop, */
        /* the next while loop will return 0 if CASE_LOOPED == 1 */
        /* else CASE_LOOPED = 1; */

        /* wrong qualifier will be terminated */
	    if ((GROUP == 1) || (CASE == 1))
     	{
	      fprintf (SYS_FPTR,"\n string : %s is not allowed in the case file name %s",
	               req_stuff[1], case_stuff[1]);
		  printf  ("\n string : %s is not allowed in the case file name %s",
	               req_stuff[1], case_stuff[1]);
          dtt_exit(SYS_FPTR, "dtt_build_test_seq", 1,"");
  
	    }

        /* if case itself is not a file, should only looped once */
        is_file_name(case_stuff[1]);
        if (CASE == 0) CASE_LOOPED = 1;

        /* link one level up to case */
        if (case_linked==0)
        {
          /* printf ("\n link up to cur_case"); */
          case_linked=1;
          (cur_case)->first_req_p=cur_req;
        }
        /* connect to previous req */
        else 
        {
          /* printf ("\n link next to pre_req"); */
          (pre_req)->next_req_p=cur_req;
        }
        /* update the req dst pointer */
        pre_req=cur_req;

        /* read req file to get txt_stuff */
        /* the txt_stuff must contain string */
        while(read_req_file(req_fptr, req_stuff, txt_stuff))
        {

          /* do something here */  
          /* printf ("\n content is : %s",txt_stuff); */
          /* if req itself is not a file, should only looped once */
          is_file_name(req_stuff[1]);
          if (REQUEST == 0) REQ_LOOPED = 1;

        } /* end of each request file */

        /* close req file to allow other open same req file */
        if (REQUEST == 1) fclose(req_fptr);
      } /* end of each case file */
      /* reset REQ NUM IN CASE*/
      REQ_NUM_IN_CASE=0;
      case_linked=0;

      /* close case file to allow other open same case file */
      if (CASE == 1) fclose(case_fptr);
    } /* end of each small group */
    /* reset REQ, CASE NUM */

    REQ_NUM_IN_GROUP=0;
    CASE_NUM_IN_GROUP=0;
    sg_linked=0;
                                   
    /* close group file to allow other open same sub-group file */
    if (GROUP == 1) fclose(sg_fptr);
  } /* end of each the big group */
  /* reset SG NUM */
  SG_NUM=0;

    /* close group file */
    if (GROUP == 1) fclose(bg_fptr);

#if 0
  /* we don't need these statement any more, files should be open->close one by one */
  _fcloseall();
  /* need to re-open sys log file */
  /* open the system log file at this time for RUN command only*/
  if (!_strnicmp (bg_stuff[2],"RUN",3))
  {
     SYS_FPTR = fopen (SYSLOG_FILE,"a+");
     if (SYS_FPTR == NULL)
     {
       printf ("\n The system file .\\dtsys\\dttest.log can not be opened");
       printf ("\n DTtest will not continue");
       printf ("\n DTtest request finished with error !");
       return(1);        
     }
  }
#endif
  
  return(0);

}

int dtt_input_show(TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;
short case_num=0;

/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;
char res_file_name[FILENAMESIZE];

  TEST_HALT = 0;

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

  if (FLOW==1) printf("\n enter dtt_input_show");
  do
  {

	printf("\n Result file:\t%s",res_file_name);            
	printf("\n Initiated:\t%s[%s]",
				test_entry->command_string_p->test_input_p,            
				test_entry->command_string_p->test_switch_p);            
	printf("\n Remark:\t\"%s\"",
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

      if (FLOW==1)
	  {  if (cur_sg->skip==1) printf ("\n sg file was skipped");
         else printf ("\n we are in %s sg file",
                     cur_sg->command_string_p->test_input_p);
      }
	  
      cur_case = (cur_sg->first_case_p);
      do
      {
        short i;
      	char case_name[NORMALSIZE]={""};
      	char case_name_array[MAXICASENUM+1][NORMALSIZE];

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
		printf("\n ==========================================================================");
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

		/* check illegal data structure */
		/* can not support the text string input in group file at this point */
		if (cur_case->skip==1 && NOT_REGULAR_CASE==0)
		{
         	printf ("\n\nIllegal or missing case file --> Case #: %d (#%d in %s)",
         	   		  cur_case->global_case_number,
         	   		  cur_case->case_number_in_group,
         	   		  cur_sg->command_string_p->test_input_p);
            printf ("\nCan't use text string as input in group file");
            printf ("\nDTtest will not continue");
           	printf ("\nDTtest finished with error !\n");
         	exit(1);
		}

		/* show case name for each case */
		if (STRING == 1)
  		{
	    	if (strlen(test_entry->command_string_p->output_file_name_p) == 0)
			{ 
            	strcpy(case_name,"default.log");
			}
			else
			{
            	strcpy(case_name,test_entry->command_string_p->output_file_name_p);
            	strcat(case_name,".log");
			}
  			printf("\n Log file name:\t%s \"%s\"\n",case_name,test_entry->command_string_p->remark);
  		}
        else
        {
	    	if (strlen(cur_case->command_string_p->output_file_name_p) == 0)
			{ 
            	strcpy(case_name,cur_case->command_string_p->test_input_p);
            	case_name[strlen(case_name)-4] = '\0';
			}
			else
			{
            	strcpy(case_name,cur_case->command_string_p->output_file_name_p);
			}
  			printf("\n Case name:\t%s \"%s\"\n",case_name,cur_case->command_string_p->remark);
//  		printf("\n Case name:\t%s\n",case_name);
        }
        /* checking the duplicated case name */
  		strcpy(case_name_array[case_num],case_name);
  		if (case_num >= 1)
  		{
        	for (i=0; i < case_num-1; ++i)
        	{
         		if (!strcmp(case_name_array[i],case_name))
         		{
         	   		printf ("\nDuplicated case name --> %s for (%s)(%s)",
         	   				case_name,
         	   				cur_case->command_string_p->test_input_p,
         	   				cur_sg->command_string_p->test_input_p);
               		printf ("\nDTtest will not continue");
           	   		printf ("\nDTtest finished with error !");
         	   		exit(1);
         		}
         	
        	}
        }
        case_num++;
        if (case_num >= MAXICASENUM)
        {
           printf ("\nExceed maximum case number !");
           printf ("\nDTtest will not continue");
           printf ("\nDTtest finished with error !");
           exit(1);
        }

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
           if (FLOW==1)
		   {
			  if (cur_req->skip==1) printf ("\n rq file was skipped");
              else printf ("\n we are in %s req file",
                         cur_req->command_string_p->test_input_p);
		   }
		   /* do something here */
           /* printf ("\n "); */
           
           /* printf (" gn %d ", cur_sg->test_group_number); */           

           /* printf (" cnig %d ", cur_case->case_number_in_group);*/            

           /* printf (" gcn %d ", cur_case->global_case_number); */           

           /* printf (" rnic %d ", cur_req->request_number_in_case); */           

           /* printf (" rnig %d ", cur_req->request_number_in_group); */          

           /* printf (" grn %d ", cur_req->global_request_number); */            

           printf (" /%s[%s]", 
			       cur_req->command_string_p->test_input_p,
			       cur_req->command_string_p->test_switch_p);

        } while ((cur_req = (cur_req->next_req_p)) != NULL && TEST_HALT == 0) ;
  
      } while ((cur_case = (cur_case->next_case_p)) != NULL && TEST_HALT == 0) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL && TEST_HALT == 0) ;

  } while (0);
  printf("\n ===========================================================================");
  printf("\n SHOW Complete.");

  return(0);
}

int dtt_input_check_casename(TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;
short case_num=0;

/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;
char res_file_name[FILENAMESIZE];

  TEST_HALT = 0;

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
    if (*(res_file_name+i)=='.'|| *(res_file_name+i)=='\0') break; /* added to check for'\0'(jhu) */
		i=i+1;
        
  strcpy((res_file_name+i),"res");

  if (FLOW==1) printf("\n enter dtt_input_check_casename");
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
      cur_case = (cur_sg->first_case_p);
      do
      {
        short i;
      	char case_name[NORMALSIZE]={""};
      	char case_name_array[MAXICASENUM+1][NORMALSIZE];

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

		/* check illegal data structure */
		if (cur_case->skip==1 && NOT_REGULAR_CASE==0)
		{
         	printf ("\n\nIllegal or missing case file --> Case #: %d (#%d in %s)",
         	   		  cur_case->global_case_number,
         	   		  cur_case->case_number_in_group,
         	   		  cur_sg->command_string_p->test_input_p);
            printf ("\nCan't use text string as input in group file");
            printf ("\nDTtest will not continue");
           	printf ("\nDTtest finished with error !\n");
         	exit(1);
		}
		
		/* catch the case name for each case */
	    if (strlen(cur_case->command_string_p->output_file_name_p) == 0)
		{ 
            strcpy(case_name,cur_case->command_string_p->test_input_p);
            case_name[strlen(case_name)-4] = '\0';
		}
		else
		{
            strcpy(case_name,cur_case->command_string_p->output_file_name_p);
		}

        /* checking the duplicated case name */
  		strcpy(case_name_array[case_num],case_name);
  		if (case_num >= 1)
  		{
        	for (i=0; i < case_num-1; ++i)
        	{
         		if (!strcmp(case_name_array[i],case_name))
         		{
         	   		printf ("\nDuplicated case name --> %s for (%s)(%s)",
         	   				case_name,
         	   				cur_case->command_string_p->test_input_p,
         	   				cur_sg->command_string_p->test_input_p);
               		printf ("\nDTtest will not continue");
           	   		printf ("\nDTtest finished with error !");
         	   		exit(1);
         		}
         	
        	}
        }
        case_num++;
        if (case_num >= MAXICASENUM)
        {
           printf ("\nExceed maximum case number !");
           printf ("\nDTtest will not continue");
           printf ("\nDTtest finished with error !");
           exit(1);
        }
        
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
           /* do nothing just walk through */
        } while ((cur_req = (cur_req->next_req_p)) != NULL && TEST_HALT == 0) ;
  
      } while ((cur_case = (cur_case->next_case_p)) != NULL && TEST_HALT == 0) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL && TEST_HALT == 0) ;

  } while (0);

  return(0);
}

void dtt_input_dump_test_seq(TEST_ENTRY *test_entry)
{
/* integer loop index */
int i=0; 

/* integer flag for test_entry_set */
int test_entry_linked=0;
int sg_linked=0;
int case_linked=0;
short case_num=0;

/* pointer for the following dst */
TEST_GROUP *cur_sg=0;
TEST_GROUP *pre_sg=0;

TEST_CASE *cur_case=0;
TEST_CASE *pre_case=0;

TEST_REQUEST *cur_req=0;
TEST_REQUEST *pre_req=0;

  /* can not do anything if test_entry is 0 */
  if (test_entry == NULL) return;
  
  if (FLOW==1) printf("\n enter dtt_input_dump_test_seq");
  do
  {
     printf("\n Test entry: |%s|%s|%s|%s|%d|%d|%s|%s|%s|",
      					test_entry->command_string_p->test_input_p,
      					test_entry->command_string_p->command_p,
      					test_entry->command_string_p->test_switch_p,
      					test_entry->command_string_p->output_file_name_p,
      					test_entry->command_string_p->output_file_enable,
      					test_entry->command_string_p->speak_enable,
      					test_entry->command_string_p->work_dir_p,
      					test_entry->command_string_p->pre_file_p,
      					test_entry->command_string_p->pos_file_p);
      printf("\n Remark: \"%s\"",test_entry->command_string_p->remark);
      printf("\n |STT|STD|SPT|SPD|: |%s|%s|%s|%s|",
          				test_entry->start_time_p,
          				test_entry->start_date_p,
          				test_entry->stop_time_p,
          				test_entry->stop_date_p);
      printf("\n |ST|TGP|TCP|TRP|SK|: |%d|%u|%u|%u|%d|",
      					test_entry->status,
          				(unsigned int)test_entry->test_group_p,
          				(unsigned int)test_entry->test_case_p,
          				(unsigned int)test_entry->test_req_p,
          				test_entry->skip);
	printf("\n ==========================================================================");
    cur_sg = (test_entry->test_group_p);
    do
    { 
//      if (cur_sg->skip == 1)
//      {
//         printf("\n Group:");
//         printf("\n Remark:");
//      }
//      else
//      {
         printf("\n Group: |%s|%s|%s|%s|%d|%d|%s|%s|%s|",
      					cur_sg->command_string_p->test_input_p,
      					cur_sg->command_string_p->command_p,
      					cur_sg->command_string_p->test_switch_p,
      					cur_sg->command_string_p->output_file_name_p,
      					cur_sg->command_string_p->output_file_enable,
      					cur_sg->command_string_p->speak_enable,
      					cur_sg->command_string_p->work_dir_p,
      					cur_sg->command_string_p->pre_file_p,
      					cur_sg->command_string_p->pos_file_p);
         printf("\n Remark: \"%s\"",cur_sg->command_string_p->remark);
//      }
      printf("\n |ST|TGN|SK|: |%d|%d|%d|",
          				cur_sg->status,
          				cur_sg->test_group_number,
          				cur_sg->skip);
      cur_case = (cur_sg->first_case_p);
      do
      {
//        if (cur_case->skip == 1)
//        {
//           printf("\n\t Case:");
//           printf("\n\t Remark:");
//        }
//        else
//        {
          printf("\n\t Case: |%s|%s|%s|%s|%d|%d|%s|%s|%s|",
      						cur_case->command_string_p->test_input_p,
      						cur_case->command_string_p->command_p,
      						cur_case->command_string_p->test_switch_p,
      						cur_case->command_string_p->output_file_name_p,
      						cur_case->command_string_p->output_file_enable,
      						cur_case->command_string_p->speak_enable,
      						cur_case->command_string_p->work_dir_p,
      						cur_case->command_string_p->pre_file_p,
      						cur_case->command_string_p->pos_file_p);
          printf("\n\t Remark: \"%s\"",cur_case->command_string_p->remark);
//		}
        printf("\n\t |ST|CNIG|GCN|TGN|SK|: |%d|%d|%d|%d|%d|",
          					cur_case->status,
          					cur_case->case_number_in_group,
          					cur_case->global_case_number,
          					cur_case->test_group_number,
          					cur_case->skip);
		cur_req = (cur_case->first_req_p);
		do
        {
          printf("\n\t\t Request: |%s|%s|%s|%s|%d|%d|%s|%s|%s|",
      						cur_req->command_string_p->test_input_p,
      						cur_req->command_string_p->command_p,
      						cur_req->command_string_p->test_switch_p,
      						cur_req->command_string_p->output_file_name_p,
      						cur_req->command_string_p->output_file_enable,
      						cur_req->command_string_p->speak_enable,       
      						cur_req->command_string_p->work_dir_p,
      						cur_req->command_string_p->pre_file_p,
      						cur_req->command_string_p->pos_file_p);
          printf("\n\t\t Remark: \"%s\"",cur_req->command_string_p->remark);
          printf("\n\t\t |ST|RNIC|RNIG|GRN|SK|: |%d|%d|%d|%d|%d|\n",
          					cur_req->status,
          					cur_req->request_number_in_case,
          					cur_req->request_number_in_group,
          					cur_req->global_request_number,
          					cur_req->skip);
        } while ((cur_req = (cur_req->next_req_p)) != NULL) ;
  
      } while ((cur_case = (cur_case->next_case_p)) != NULL) ;
  
    } while ((cur_sg = (cur_sg->next_group_p)) != NULL) ;

  } while (0);

  return;
}



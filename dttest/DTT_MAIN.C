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
 *    File Name:	dtt_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	Initial release.
 *  002     G.L		09/16/1996  Code cleanup.
 *	003		TQL		03/19/1997	Add support of dttest.ini.
 *	004		MFG		03/26/1998	changed i<20 to i<FILENAMESIZE in "for" loops
 *	005		MFG		06/17/1998	added call to dtt_util_mkdir()
 *	006		JHU		08/05/1998  Added supprot to Command Line Help.
 */                  

#include "dtt_data.h"       /* all data structure declared here       */
#include "dtt_defs.h"       /* all date value define here            */
#include "dtt_prot.h"       /* all functional proto type define here */

#include<time.h>
#include<stdlib.h>
#include<io.h>

/* loop count limited to one access if that parameter is skipped */
int BG_LOOPED=0;
int SG_LOOPED=0;
int CASE_LOOPED=0;
int REQ_LOOPED=0;

char VERSION[SMALLSIZE]={"1.00"};
/* global time/date */
char TIME_START[NORMALSIZE]={""};
char DATE_START[NORMALSIZE]={""};
char TIME_STOP[NORMALSIZE]={""};
char DATE_STOP[NORMALSIZE]={""};

/* global test number */
int BG_NUM=0;
int SG_NUM=0;

int CASE_NUM_IN_GROUP=0;
int GLOBAL_CASE_NUM=0;

int REQ_NUM_IN_CASE=0;
int REQ_NUM_IN_GROUP=0;
int GLOBAL_REQ_NUM=0;
int NOT_REGULAR_CASE=0;
int TEST_MODE=0;
int TEST_HALT=0;

/* debug switch, set to one to see the argument passing */
int TRACE = 0;

/* debug switch, set it to 1 will show the test flow */
int FLOW = 0;

/* system log file pointer */
FILE *SYS_FPTR;
FILE *INI_FPTR;

int main(int argc, char *argv[])
{

  /* integer declearation */
  int i,j;
  int ini_line_number = 0;
  char ini_line[256]={""};

  /* charcter stuff pointer : contains bg_stuff in DTTEST bg.grp */
  char bg_stuff[ARGUMENTSIZE][FILENAMESIZE] =
  {
   "",
   "",
   "RUN",
   "",
   "",
   "on",
   "on",
   "",
   "",
   "",
   "" 
  };           

  /* temperary buffer, store the date and time string */
  char logdata[RECORDSIZE];
  char *logdata_p = logdata;
  
  /* pointer point to command dst */
  COMMAND_STRING *bg_cmd_ptr;

  /* pointer point to TEST_ENTRY dst */
  TEST_ENTRY *test_entry;

  /* log the starting time/date */
  _strtime(TIME_START);
  _strdate(DATE_START);


  dtt_util_mkdir(); /* make directories \\log \\res \\bmk */

  if (FLOW==1) printf("\n enter main");
  /* receive the command line argument         */
  /* printf("\nThere are %d argument",argc);   */
  /* printf("\nThere are ");                   */
  /* for (i=0;i<argc;i++)                      */
  /*   printf("\n %s ", argv[i]);              */

  /* load the dttest.ini file */
  INI_FPTR = fopen (SYSINI_FILE, "r");
  

  if (INI_FPTR == NULL)
  {
	printf ("\nError opening dttest.ini\nPlease make sure it resides in dtsys\\\n");
	return (0);
  }

  while (fgets (ini_line, 256, INI_FPTR)!=NULL)
  {
	ini_line_number++;
	if (ini_line[0] == ';' || ini_line[0] == '\n');
	else if (!_strnicmp (ini_line, "arg_", 4))
	{
	  if (ini_line[4] >= 49 && ini_line[4] <= 57)
	  { 
		ini_line[strlen(ini_line)-1]='\0';
		strcpy (bg_stuff[ini_line[4]-48], strchr(ini_line, '=')+1);
	  }
	  else
	  {
		printf("\nError in dttest.ini\nInvalid argument on line %d\n", ini_line_number);
		return (0);
	  }
    }
	else
	{
	  printf("\nError in dttest.ini\nInvalid statement on line %i\n", ini_line_number);
	  return (0);
	}
  }

  /* catch the command line argument */
  for (i=0;i<argc;i++)
  {
	  /* can not allow remark go over 80 characters */
	  if (strlen(argv[i]) > 80)
	  {
          printf ("\n The DTtest remark can not longer than 80 characters\n");
          printf ("\n ---> \"%s\"",argv[i]);
          printf ("\n DTtest will not continue");
          printf ("\n DTtest finished with error !\n");
          return(1);	  
	  }
      strcpy (bg_stuff[i],argv[i]);
      
      /* remove the leading and trailing space */
      if (i != 1 && i != 10) sscanf(bg_stuff[i]," %s ",bg_stuff[i]);
	  /* special treatment for argument 1 */
	  if (i == 1)
	  {
        /* check to see if the argument 1 is Command Help or Test Input (jhu) */
		if( (!_strnicmp (bg_stuff[1],"/HELP",5)) || (!_strnicmp (bg_stuff[1],"HELP",4)) ||
			(!_strnicmp (bg_stuff[1],"/?",2))    || (!_strnicmp (bg_stuff[1],"?",1)) ) 
		{
			printf ("\nDTtest Command Line Format:");
			printf ("\n===========================\n");
			printf ("\n  dttest32 arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10\n\n");

			printf ("\n  arg1  - Test Input can be ASCII string (\"This an ASCII string\"),");
			printf ("\n          text file(*.txt), case file(*.tst) or group file(*.grp)."); 
			printf ("\n  arg2  - Command can be RUN (defaulted), RUN1, GOTO, SHOW, UPDATE,");
			printf ("\n          REMOVE, TEST, CLEAN, RESULT, PASS, FAIL, NEW, or DIF.");
			printf ("\n  arg3  - Debug Switch (optional)");
			printf ("\n  arg4  - Output File Name (optional)");
			printf ("\n  arg5  - ON/OFF (optional)");
			printf ("\n  arg6  - ON/OFF (optional)");
			printf ("\n  arg7  - Work Directory (optional)");
			printf ("\n  arg8  - Pre-Conditioning File (optional)");
			printf ("\n  arg9  - Post-Conditioning File (optional)");
			printf ("\n  arg10 - Remark (optional)\n\n");
			return(1);        
		}
		else
		{
			unsigned short j;
			for (j=0;j < strlen(bg_stuff[1]); ++j)
			{
	     		if ((bg_stuff[1][j] != ' ') && (bg_stuff[1][j] != '\t'))
	     		{
	     			strcpy(bg_stuff[1],&(bg_stuff[1][j]));
	     			break;
	     		}
			}
			for (j = strlen(bg_stuff[1])-1; j >= 0; --j)
			{
	     		if ((bg_stuff[1][j] != ' ') && (bg_stuff[1][j] != '\t'))
	     		{
	     			bg_stuff[1][j+1] = '\0';
	     			break;
	     		}	    
			}
		} 
	  }		
      /* if the user type too many argument, the remaining will be ignored */
      if (i==(ARGUMENTSIZE-1)) break;
  }

  /* check the legal command line argument */
  if(((_strnicmp (bg_stuff[2],"SHOW",1)))  &&
	((_strnicmp (bg_stuff[2],"REVIEW",3))) &&
	((_strnicmp (bg_stuff[2],"RUN",3)))    &&
	((_strnicmp (bg_stuff[2],"GOTO",4)))   &&
	((_strnicmp (bg_stuff[2],"TEST",3)))   &&
	((_strnicmp (bg_stuff[2],"RESULT",3))) &&
	((_strnicmp (bg_stuff[2],"FAIL",1)))   &&
	((_strnicmp (bg_stuff[2],"PASS",1)))   &&
	((_strnicmp (bg_stuff[2],"NEW",1)))    &&
	((_strnicmp (bg_stuff[2],"DIF",3)))    &&
	((_strnicmp (bg_stuff[2],"DUMP",3)))   &&
	((_strnicmp (bg_stuff[2],"CLEAN",3)))  &&
	((_strnicmp (bg_stuff[2],"UPDATE",3))) &&
	((_strnicmp (bg_stuff[2],"REMOVE",3))))
    {
       printf ("\n The DTtest command must be :\n");
       printf ("   SHOW,RUN,REVIEW,UPDATE,REMOVE,TEST,CLEAN or RESULT,PASS,FAIL,NEW");
       printf ("\n DTtest will not continue");
       printf ("\n DTtest finished with error !\n");
       return(1);        
     }
	         
  if      (!_strnicmp(bg_stuff[5],"on",2)) strcpy (bg_stuff[5],"1");
  else if (!_strnicmp(bg_stuff[5],"of",2)) strcpy (bg_stuff[5],"0");
  else     strcpy  (bg_stuff[5],"1");

  if      (!_strnicmp(bg_stuff[6],"on",2)) strcpy (bg_stuff[6],"1");
  else if (!_strnicmp(bg_stuff[6],"of",2)) strcpy (bg_stuff[6],"0");
  else    strcpy  (bg_stuff[6],"1");

  /* set test mode to skip DECtalk */
  if 	(!_strnicmp (bg_stuff[2],"TEST",4)) TEST_MODE = 1;
  
#if 0
  /* moving string from keyboard to bg_stuff */
  /* It could be BG, SG, CASE, REQ, TXT */
  /* this replaces the while read loop */
  strcpy(bg_stuff[1],"bg.grp");  
  strcpy(bg_stuff[2],"RUN");  
  strcpy(bg_stuff[3],"1");  
  strcpy(bg_stuff[4],"a.out");  
  strcpy(bg_stuff[5],"1");  
  strcpy(bg_stuff[6],"1");  
  strcpy(bg_stuff[7],"develop");  
  strcpy(bg_stuff[8],"a.pri");
  strcpy(bg_stuff[9],"a.pos");  
  strcpy(bg_stuff[10],"this is a test");  

  for (i=0;i<argc;i++)
  {
      printf("\n %s ", bg_stuff[i]);              
  }
#endif

  do
  {
    if ((strlen(bg_stuff[1]) == 0) && (_strnicmp (bg_stuff[2],"CLEAN",3))) /* TQL: why is the compare to CLEAN needed? */

    {
       /* make sure a non empty string */ 
       printf ("\n DTtest command line format:");
       printf ("\n arg. 1 - \"test input\", can be test string,");
       printf ("\n             text file(*.txt), test case file(*.tst) or group file(*.grp)"); 
       printf ("\n arg. 2 - \"command\", can be RUN(defaulted),RUN1,GOTO,SHOW,UPDATE,REMOVE");
       printf ("\n             TEST,CLEAN,RESULT,PASS,FAIL,NEW,DIF");
       printf ("\n arg. 3 - \"debug switch\"(optional), 4 digits hexicode,\n");
       printf ("\n             will be used in DECtalk command [:debug xxxx]");
       printf ("\n arg. 4 - \"output file name\"(optional), will be used to override");
       printf ("\n             the output file name picked up from *.txt, *.tst and *.grp");
       printf ("\n arg. 5 - \"ON/OFF\"(optional), for output loggind enable, defaulted is ON");
       printf ("\n arg. 6 - \"ON/OFF\"(optional), for output speak enable, defaulted is ON");
       printf ("\n arg. 7 - \"work directory\"(optional), defaulted is current directory");
       printf ("\n arg. 8 - \"pre-conditioning file\"(optional), for test pre-conditioning");
       printf ("\n arg. 9 - \"post-conditioning file\"(optional), for test post-conditioning");
       printf ("\n arg.10 - \"remark\"(optional), 80 characters maximum\n");
       return(1);        
    }
    else
    {
       /* find out what type of test input, set up NON_REGULAR_CASE flag */
       if (strlen(bg_stuff[1]) < 5) { NOT_REGULAR_CASE = 1; break; }
       is_file_name(bg_stuff[1]);
       NOT_REGULAR_CASE = STRING | REQUEST;
   	   GROUP   =0;
       CASE    =0;
       REQUEST =0;
       PRI     =0;
       POS     =0;
       BAT     =0;
       STRING  =0;
       break;
    }
  } while (1);
  
  /* execute the CLEAN command */
  /* clear up all the datalog setting */
  /* also clean up all TSR buffer */
  if(!(_strnicmp (bg_stuff[2],"CLEAN" ,3)))
  {
     dtt_int_cleanup(1);
     return(0);     
  }

  /* execute the RESULT command */
  if(!_strnicmp (bg_stuff[2],"RESULT" ,3) ||
     !_strnicmp (bg_stuff[2],"PASS" ,1)   ||
     !_strnicmp (bg_stuff[2],"NEW" ,1)   ||
     !_strnicmp (bg_stuff[2],"DIF" ,3)   ||
     !_strnicmp (bg_stuff[2],"FAIL" ,1))
  {
	 char command[FILENAMESIZE]={""};
	 char res_file_name[FILENAMESIZE]={""};
	 FILE *fresptr=0;
     short i;
     
	 /* construct the result file name */
     if (strlen(bg_stuff[4]) == 0)
     {
         strcpy(res_file_name,"dtres\\");
         strcat(res_file_name,bg_stuff[1]);   
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
     
     /* check to see the file existing or not */
     if (!_access(res_file_name,0))
     {
        if(!_strnicmp (bg_stuff[2],"RESULT" ,3))
        {
       	  /* construct the command string */
     	  strcpy(command,"type ");
     	  strcat(command,res_file_name);
     	  strcat(command," | more");
          system(command);
        }
        if(!_strnicmp (bg_stuff[2],"FAIL" ,1) ||
           !_strnicmp (bg_stuff[2],"NEW" ,1)  ||
           !_strnicmp (bg_stuff[2],"DIF" ,3)  ||
           !_strnicmp (bg_stuff[2],"PASS" ,1))
        {
		   short i=0;
		   FILE *ftp;
		   char data1[MAXRECORDSIZE]={""};
		   char data2[MAXRECORDSIZE]={""};
		   char data3[MAXRECORDSIZE]={""};
		   char data4[MAXRECORDSIZE]={""};

		   ftp = fopen(res_file_name,"r");
           while (fgets(data1,MAXRECORDSIZE-1,ftp) &&
                  fgets(data2,MAXRECORDSIZE-1,ftp) &&
                  fgets(data3,MAXRECORDSIZE-1,ftp) &&
                  fgets(data4,MAXRECORDSIZE-1,ftp))
           {
              if (!_strnicmp (bg_stuff[2],"FAIL" ,1))
              {
                 if (strstr(data4,"Status: FAIL") || i == 0)
                 printf("%s%s%s%s",data1,data2,data3,data4);
              }
              if (!_strnicmp (bg_stuff[2],"PASS" ,1))
              {
                 if (strstr(data4,"Status: PASS") || i == 0)
                 printf("%s%s%s%s",data1,data2,data3,data4);
              }
              if (!_strnicmp (bg_stuff[2],"NEW" ,1))
              {
                 if (strstr(data4,"Status: NEW") || i == 0)
                 printf("%s%s%s%s",data1,data2,data3,data4);
              }
              if (!_strnicmp (bg_stuff[2],"DIF" ,3))
              {
                 if (strstr(data4,"Status: FAIL") || i == 0)
                 {
                    char record[4][10];
                    char command[FILENAMESIZE]={""};
                    
                    printf("%s%s%s%s",data1,data2,data3,data4);
                    if (i > 0)
                    {
                       /* dump the dif file */
                       /* catch the case name first */
                       sscanf(data3," %s %s %s %s",record[0],record[1],record[2],record[3]);
                       strcpy(command,"type dtdif\\");
                       strcat(command,record[2]);
                       strcat(command,".dif | more");
                       system(command);
                       printf("\n type any key to continue.");
                       getchar();
                       
                    }
                  }
              }
              ++i;
		   }
		   printf ("%s%s",data1,data2); 
		   fclose(ftp);        
        }
     }
     else
     {
        printf ("\n The result file %s does not exist !", res_file_name);
     }  
  }

  /* execute other command */
  if (!_strnicmp (bg_stuff[2],"RUN",3) || TEST_MODE == 1)
  {
     /* open the system log file at this time for RUN command only*/
     SYS_FPTR = fopen (SYSLOG_FILE,"a+");
     if (SYS_FPTR == NULL)
     {
       printf ("\n The system file .\\dtsys\\dttest.log can not be opened");
       printf ("\n DTtest will not continue");
       printf ("\n DTtest finished with error !\n");
       return(1);        
     }

     /* start the logging display */
     system("cls");
     printf(" DTtester -- DECtalk Automatic Regression Tester.       Rev.: %s     GL/YL",VERSION);

     fprintf(SYS_FPTR,"\n ===========================================================================");
     printf ("\n ===========================================================================");
     fprintf(SYS_FPTR,"\n DTtest start !");
     printf ("\n DTtest start !");

     fprintf (SYS_FPTR,"\t\t\t\tTest Start: %s ", TIME_START);
     printf  ("\t\t\t\tTest Start: %s ", TIME_START);

     fprintf(SYS_FPTR,"\t %s\n", DATE_START);
     printf ("\t %s\n", DATE_START);
 
     fprintf (SYS_FPTR,"\n Input command : /%s-%s-%s-%s-%s-%s-%s-%s-%s/",
	          bg_stuff[1], bg_stuff[2], bg_stuff[3], 
	          bg_stuff[4], bg_stuff[5], bg_stuff[6], bg_stuff[7], 
	          bg_stuff[8], bg_stuff[9]); 
     fprintf (SYS_FPTR,"\n Remark        : /%s/",bg_stuff[10]);
  }
  
  /* create the test sequence */
  /* create command dst for bg command pointer */
  /* whether GROUP == 1 is determined here */
  create_command_dst(&bg_cmd_ptr, bg_stuff);

  /* create test entry dst */
  create_test_entry_dst(&test_entry, &bg_cmd_ptr);

  /* call ddt_in(bg_stuff, test_entry) to process input */
  /* build the data structure */
  /* execute help, show and build command */
  dtt_in(bg_stuff, test_entry);

  /* execute the DUMP command to dump out the data structure */
  /* dump before the test run */
  if(!(_strnicmp (bg_stuff[2],"DUMP" ,3)))
  {
     dtt_input_dump_test_seq(test_entry);
     return(0);     
  }

  /* checking the case name duplication and case name number */
  dtt_input_check_casename(test_entry);

  /* if run or stop, */
  /* call dtt_process(&test_entry) to execute all test */
  if(!(_strnicmp (bg_stuff[2],"RUN" ,3)) || TEST_MODE == 1)
  {
	 dtt_process(bg_stuff, test_entry);
  }
  /* if review, update or remove */
  /* call dtt_output(&test_entry) to execute all test */
  else
  {
     if((!(_strnicmp (bg_stuff[2],"REVIEW",3))) ||
	   (!(_strnicmp (bg_stuff[2],"UPDATE",3)))  ||
	   (!(_strnicmp (bg_stuff[2],"REMOVE",3))))
	 { 
     	dtt_out(bg_stuff, test_entry);
     }
  }

  
  /* log the stopping time/date */
  _strtime(TIME_STOP);
  _strdate(DATE_STOP);
  strcpy ((test_entry->stop_time_p),TIME_START);
  strcpy ((test_entry->stop_date_p),DATE_START);
  if (!_strnicmp (bg_stuff[2],"RUN",3) || TEST_MODE == 1)
  {
     fprintf(SYS_FPTR,"\n\n DTtest finished !");
     printf ("\n\n DTtest finished !");

     fprintf (SYS_FPTR,"\t\t\tTest Stop: %s ", TIME_STOP);
     printf  ("\t\t\tTest Stop: %s ", TIME_STOP);
     /* strcpy ((test_entry->stop_time_p),temp_buff); */

     fprintf (SYS_FPTR,"\t%s ", DATE_STOP);
     printf  ("\t%s ", DATE_STOP);
     /* strcpy ((test_entry->stop_date_p),temp_buff); */
     fprintf(SYS_FPTR,"\n ===========================================================================");
     printf ("\n ===========================================================================");
  
  
     fclose(SYS_FPTR);
    
     /* only keep the last 500 entries */
     SYS_FPTR = fopen(SYSLOG_FILE,"r");
     i=0;
     while (fgets(logdata_p,RECORDSIZE,SYS_FPTR))
     {
  	   if (strstr(logdata_p,"=============================="))  ++i;
     }
     fclose(SYS_FPTR);
     if (i >= MAXILOGSIZE*2)
     {
       FILE *ftp;  
       ftp = fopen(SYSTMP_FILE,"w");
       SYS_FPTR = fopen(SYSLOG_FILE,"r");
       j=0;
       while (fgets(logdata_p,RECORDSIZE,SYS_FPTR) != NULL)
       {
         if (strstr(logdata_p,"==============================")) ++j;
         if (j > (i - MAXILOGSIZE*2))
            fprintf(ftp,"%s",logdata_p); 
       }    
       /* copy the temp file become log file */    
       fclose(SYS_FPTR); fclose(ftp);
       system("copy dtsys\\dttest.tmp dtsys\\dttest.log /y > null");  
       system("del dtsys\\dttest.tmp");    
     }
  }

  /* execute the DUMP command to dump out the data structure */
  /* dump after the test run, for code debug only */
  if(!(_strnicmp (bg_stuff[2],"RUNDUMP" ,7)))
  {
     dtt_input_dump_test_seq(test_entry);     
  }
  return(0);

}

int create_test_entry_dst(TEST_ENTRY **test_entry, COMMAND_STRING **st_cmd_ptr)
{
  
  if (FLOW==1) printf("\n enter create_test_entry_dst");

  /* allocate the test entry data structure */
  *test_entry=malloc(sizeof(TEST_ENTRY)); 
  if (*test_entry == NULL)
    dtt_exit(SYS_FPTR, "create_test_entry_dst", 1,
	         "Out of the memory at test entry DST allocation");
  
  /* initialize the test group pointer to NULL */
  (*test_entry)->test_group_p = NULL;

  /* initialize the test case pointer to NULL */
  (*test_entry)->test_case_p = NULL;

  /* initialize the test requestpointer to NULL */
  (*test_entry)->test_req_p = NULL;

  /* attach the command pointer to bg dst */
  (*test_entry)->command_string_p = *st_cmd_ptr;

  /* initial the test status to 0 */
  (*test_entry)->status = 0;

  /* create memory for start/stop date/time */
  if 
  (
    ((((*test_entry)->start_date_p)=malloc(20))==NULL) ||
    ((((*test_entry)->start_time_p)=malloc(20))==NULL) ||
    ((((*test_entry)-> stop_date_p)=malloc(20))==NULL) ||
    ((((*test_entry)-> stop_time_p)=malloc(20))==NULL) 
  )
    dtt_exit(SYS_FPTR, "create_test_entry_dst", 1,
	  "Out of the memory at test entry DST allocation");

  strcpy (((*test_entry)->start_date_p),DATE_START);
  strcpy (((*test_entry)->start_time_p),TIME_START);
  strcpy (((*test_entry)->stop_date_p),DATE_STOP);
  strcpy (((*test_entry)->stop_time_p),TIME_STOP);

  return (1);
}


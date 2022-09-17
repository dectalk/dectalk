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
 *    File Name:		dtt_data.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest data declaration header file.
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *  002     G.L		09/16/1996  code cleanup.
 *
 *
 */
    
#ifndef DTTDATA
#define DTTDATA

#include <stdio.h>
#include <string.h>       /* standard string library */

#ifndef MSVC4
#include "dttsr.h"
#include "dtstart.h"
#include "dtstarp.h"
#endif


 typedef struct test_group
 {
    struct test_group     *next_group_p;     /* point to next group   */
    struct test_case      *next_case_p;  	 /* or point to next case */   
    struct test_case      *first_case_p;  	 /* or point to first case */   
                                            
    struct command_string *command_string_p; /* point to the command string */

    short status;                            /* 
											   0 : not tessted
                                               1 : PASSED  
											   2 : FAIL
                                              -1 : test completed
                                              -2 : test inompleted
                                             */

    short test_group_number;                 /* test number within a group */

    short skip;
 }TEST_GROUP;

 typedef struct test_case
 {
    struct test_case      *next_case_p;  	  /* point to next case */
    struct test_group     *next_group_p;      /* point to next group */

    struct test_request   *first_req_p;		  /* point to first request */
 
    struct command_string *command_string_p;  /* point to the command string */

    short status;                             /* 0 : not tessted
                                                 1 : PASSED
                                                 2 : FAIL
                                                -1 : test completed
                                                -2 : test inompleted
                                              */

    short case_number_in_group;               /* test number within a case */
    short global_case_number;                 /* global test number */

    short test_group_number;                  /* test number within a group */

    short skip;
 }TEST_CASE;

 typedef struct test_request
 {
    struct test_request   *next_req_p;		   /* point to next request */
    struct command_string *command_string_p;   /* point to the command string */
 
    short status;                              /* 0 : not tessted
                                                  1 : PASSED
                                                  2 : FAIL
                                                 -1 : test completed
                                                 -2 : test inompleted
                                               */

    short request_number_in_case;              /* test number within a case */
    short request_number_in_group;             /* test number within a group */
    short global_request_number;               /* global test number */

    short skip;
 }TEST_REQUEST;

 typedef struct command_string
 {
    char *test_input_p;		                    /* string or file name */
    char *command_p;			                /* test commnd pointer */
    char *test_switch_p;    	                /* HEX format switch */
    char *output_file_name_p;  
    short output_file_enable;                   /* 1 : ON */
    short speak_enable;                         /* 1 : ON */
    char *work_dir_p;
    char *pre_file_p;		                    /* pre  conditioning file */
    char *pos_file_p;		                    /* post conditioning file */
    char *remark;								/* DTtest remark */
                                    
 }COMMAND_STRING;
 
 typedef struct test_entry
 {
    struct test_group   *test_group_p;
    struct test_case    *test_case_p;
    struct test_request *test_req_p;
    
    struct command_string *command_string_p;     /* point to the command string */

    short status;                                /* 0 : not tested
                                                    1 : PASSED  
													2 : FAIL
                                                   -1 : test completed
                                                   -2 : test not completed
                                                 */

    char *start_date_p;
    char *start_time_p;
    char *stop_date_p;
    char *stop_time_p;
    short skip;
 }TEST_ENTRY;

   
 #endif 

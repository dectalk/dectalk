/***********************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1995, 1996
**
**    All Rights Reserved.  Unpublished rights  reserved  under
**    the copyright laws of the United States.
**
**    The software contained on this media  is  proprietary  to
**    and  embodies  the  confidential  technology  of  Digital
**    Equipment Corporation.  Possession, use,  duplication  or
**    dissemination of the software and media is authorized only
**    pursuant to a valid written license from Digital Equipment
**    Corporation.
**
** NAME OF FILE
**    lts_util.h
**
** DESCRIPTION
**    function declaration for lts_util.c
**    
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         6/19/95         initial code
**
**
**
*/

/*
** Global include header files
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
/* #include <math.h> */
#if VMS
#include <jpidef.h>
#include <unixlib.h>
/* #else */
/* #include <unistd.h> */
#endif

/*
**  MACRO DEFINITION
*/

#define ARR_SIZE 40
#define MOR_SIZE  3
#define MIN_WORD_SIZE    80
#define NOR_WORD_SIZE    132
#define MAX_WORD_SIZE    256
#define MAX_RECORD_SIZE  256
#define SPE_RECORD_SIZE  512


/*
**  FUNCTION DECLARATION
*/

unsigned int morph_catch(unsigned int source,
                         unsigned int mor_size,
                         char *c1,
                         char *c2,
                         unsigned int *t_string,
                         char string[][MAX_WORD_SIZE]);
unsigned int get_count(char *string,
                       char *sub_string);
char *string_substitute(char *main_string,
                        char *string_find,
                        char *string_sub);
char *string_substitute_first(char *main_string,
                        char *string_find,
                        char *string_sub);
char *string_catch(char *string,
                   char del_1,
                   char del_2);
void char_strip(char *input_data,
                char unwant);
char *case_change(char *string,
                  unsigned int code);
double get_weight(char *c1,
                  unsigned int base);
int strncmp_tail(char *string_1,
                 char *string_2,
                 int count);
char *strstr_special(char *string_1,
                   char *string_2);
void string_shift(unsigned int code,
                  unsigned int count,
                  char *string);

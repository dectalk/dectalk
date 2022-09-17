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
**    lts_util.c
**
** DESCRIPTION
**    This program contents all the common utility routines.
**    
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         6/19/95         initial code
**                                 the performance.
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
#include <math.h>
#ifdef VMS
#include <jpidef.h>
#include <unixlib.h>
#endif

#ifdef UNIX
#include <unistd.h>
#endif
#include "lts_util.h"

/*
**  MACRO DEFINITION
*/

#define ARR_SIZE 40
#define MOR_SIZE  3
#define MIN_WORD_SIZE    80
#define MAX_WORD_SIZE    256
#define MAX_RECORD_SIZE  256
#define SPE_RECORD_SIZE  512

#define PREFIX 1
#define SUFFIX 2
#define MIDDLE 0
#define BADTYPE 5

    
/***********************************************************************
**
** DESCRIPTION
**
**  The morph_catch() function will do the following task:
**
**  1). catch the common sub-string from two incoming strings.
**      store these sub-string in a local array.
**  2). fileter out the duplicated sub-string and copy back to the caller
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/

unsigned int morph_catch(unsigned int source,
                         unsigned int mor_size,
                         char *c1,
                         char *c2,
                         unsigned int *t_string,
                         char string[][MAX_WORD_SIZE])
{
unsigned int i,j,k,sf_no,ch_no,hit;
char sf[ARR_SIZE][MAX_WORD_SIZE];
unsigned int c1_size,c2_size;
unsigned int c1_dif,c2_dif,type,sf_size;

    c1_size = strlen(c1);
    c2_size = strlen(c2);

    c1_dif = c1_size-mor_size;
    c2_dif = c2_size-mor_size;

    if (c1 == 0 || c2 == 0)
       return(0);
    if (c1_size < mor_size || c2_size < mor_size)
       return(0);
    
    /* initialize the local array and counter */
    /* sf_no is used to index the array */
    /* ch_no is used to index each word */
    sf_no = 0;
    ch_no = 0;
    for (i=0;i<ARR_SIZE;++i)
         sf[i][0] = '\0';
/*    
if (source == 1) printf("1.*%s* *%s*\n",c1,c2);
*/
    /* then do the character to character compare and catch the common string */
    /* scan c1 with c2 */
    for (i=0; i<=c1_dif; ++i)
    {
    	  for (j=0,k=i; j<c2_size && k<c1_size; ++j,++k)
    	  {
    	    if (c1[k] == c2[j])
    	    {
    	       sf[sf_no][ch_no++] = c1[k];
    	       sf[sf_no][ch_no] = '\0';
               continue;
    	    }
    	    else
    	    {
    	       if (ch_no >= mor_size)
    	       {
    	          sf_no++;
    	          ch_no = 0;
                  continue;
    	       }
    	       else
    	       {
    	          sf[sf_no][0] = '\0';
    	          ch_no = 0;
                  continue;
    	       }
    	    }     
          }
          if (ch_no >= mor_size) sf_no++;
          ch_no = 0;
    }

    /* scan c2 with c1 */
    for (i=0; i<=c2_dif; ++i)
    {
          ch_no = 0;
          if (sf[sf_no][0] != '\0') sf_no++;
    	  for (j=0,k=i; j<c1_size && k<c2_size; ++j,++k)
    	  {
    	    if (c2[k] == c1[j])
    	    {
    	       sf[sf_no][ch_no++] = c2[k];
    	       sf[sf_no][ch_no] = '\0';
                   continue;
    	    }
    	    else
    	    {
    	       if (ch_no >= mor_size)
    	       {
    		  sf_no++;
    	          ch_no = 0;
                  continue;
    	       }
    	       else
    	       {
    	          sf[sf_no][0] = '\0';
    	          ch_no = 0;
                  continue;
    	       }
    	    }    
    
          }
          if (ch_no >= mor_size) sf_no++;
          ch_no = 0;
    }
    
    /* remove the duplicate entry, then copy all unique entry into caller's argrument */
    for (i=0,j=0,k=0; i<ARR_SIZE; ++i)
    {
      hit = 0; 
      sf_size = strlen(sf[i]);
      if (sf[i][0] != '\0' && sf_size >= mor_size)
      {
/*
if (source == 1) printf("2.*%s*\n",sf[i]);
*/
         type = BADTYPE;
         if (!strncmp(c1,sf[i],sf_size) && !strncmp(c2,sf[i],sf_size))
            type = PREFIX;
         if (!strncmp_tail(c1,sf[i],sf_size) && !strncmp_tail(c2,sf[i],sf_size))
            type = SUFFIX;
         if (strncmp(c1,sf[i],sf_size) && strncmp(c2,sf[i],sf_size) &&
             strncmp_tail(c1,sf[i],sf_size) && strncmp_tail(c2,sf[i],sf_size))
            type = MIDDLE;

         /* give it up if can't set a type for it */
         if (type == BADTYPE) continue;

         /* expect the same type if calling from source 1 */
         if (source == 1 &&  type != t_string[j]) continue;

         if (i == 0)
         {
            if (source == 0) t_string[j] = type;
            strcpy(string[j++],sf[i]);
         }
         else
         {
    	   for (k=0; k < j; k++)
    	   {
    	     if (sf[i][0] != string[k][0] ||
    	         sf[i][1] != string[k][1] ||
                 type != t_string[k])
                continue;
    	     if (!strcmp(sf[i],string[k]) && type == t_string[k])
    	     {
    	        hit = 1;
    	        break;
             }
          }
          if (hit == 0)
          {
             if (source == 0) t_string[j] = type;
             strcpy(string[j++],sf[i]);
          }
        }
      }
      else
      break;  
    }
    
    return(0);
    
}
    
/***********************************************************************
**
** DESCRIPTION
**
**  The get_count() function will do the following task:
**
**  1). count the  sub_string occurrence in this string
**
**
** RETURN VALUE:
**
**  integer count of sub_string occurrence in this string
**
** SPECIAL NOTES:
**
**  none
**
*/
unsigned int get_count(char *string, char *sub_string)
{
char temp_string[MAX_WORD_SIZE];
char *temp_string_p=0;
char mask='*';
unsigned int  count=0;
unsigned int  i;
unsigned int  size;

    size = strlen(sub_string);
    
    if (strstr_special(string,sub_string) == 0) count = 0;
    else
    {
       strcpy(temp_string,string);
       while(strstr_special(temp_string,sub_string))
       {
         count++;
         temp_string_p = strstr_special(temp_string,sub_string);
         for (i=0; i<size; ++i)
         {
           temp_string_p[i] = mask;
         }
       }
    }
    return(count);
    
}
/***********************************************************************
**
** DESCRIPTION
**
**  The string_substitute() function will do the following task:
**
**  1). perform the string substitute to the incoming string
**
**      incoming arguments:
**
**               main_string     incoming main string
**               string_find     section of string to be replaced
**               string_sub      section of string to replace string_find
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
char *string_substitute(char *main_string,
                        char *string_find,
                        char *string_sub)
{
    char temp_string_r[SPE_RECORD_SIZE]={""};
    static char temp_string[SPE_RECORD_SIZE]={""};
    static char *temp_string_p = temp_string;
    unsigned int size,size_find,size_sub;
    unsigned int hit = 0;
    unsigned int i = 0;
    unsigned int j = 0;
    unsigned int k = 0;
    unsigned int ii = 0;
    unsigned int iii = 0;
    unsigned int i_s = 0;
    unsigned int delta = 0;

    strcpy(temp_string,main_string);
    strcpy(temp_string_r,main_string);
    size = strlen(main_string);
    size_find = strlen(string_find);
    size_sub = strlen(string_sub);

    if (!strstr_special(main_string,string_find)) return(temp_string_p);
    if (size_find > size) return(temp_string_p);

    while (strstr_special(temp_string_r,string_find))
    {
      /* find the target string */
      for (i=i_s,j=0;i<strlen(temp_string);++i)
      {
        hit = 1;
        for (ii=i,j=0;j<size_find;++j,++ii)
            if (temp_string[ii] != string_find[j]) { hit = 0; break; }
        if (hit == 1) { k = i + size_find - delta; break; }
      }

      /* replace with string_sub */
      for (ii=i,j=0;j<size_sub;++ii,++j)
          temp_string[ii] = string_sub[j];

      i_s = ii;
      /* update the delta between main_string and temp_string */
      delta = delta + (size_sub - size_find);

      /* copy over the rest of string */
      for (j=k,iii=0;j<size;++iii,++ii,++j)
      {
        temp_string[ii] = main_string[j];
        temp_string_r[iii] = main_string[j]; /* save the rest of string */
      }
      temp_string_r[iii] = '\0';
      temp_string[ii] = '\0';
    } /* end of while */

    return(temp_string_p);
}
/***********************************************************************
**
** DESCRIPTION
**
**  The string_substitute_first() function will do the following task:
**
**  1). perform the string substitute to the incoming string
**      only apply to the first sub_string found.
**
**      incoming arguments:
**
**               main_string     incoming main string
**               string_find     section of string to be replaced
**               string_sub      section of string to replace string_find
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
char *string_substitute_first(char *main_string,
                              char *string_find,
                              char *string_sub)
{
    char temp_string_r[SPE_RECORD_SIZE]={""};
    static char temp_string[SPE_RECORD_SIZE]={""};
    static char *temp_string_p = temp_string;
    unsigned int size,size_find,size_sub;
    unsigned int hit = 0;
    unsigned int i = 0;
    unsigned int j = 0;
    unsigned int k = 0;
    unsigned int ii = 0;
    unsigned int iii = 0;
    unsigned int i_s = 0;
    unsigned int delta = 0;

    strcpy(temp_string,main_string);
    strcpy(temp_string_r,main_string);
    size = strlen(main_string);
    size_find = strlen(string_find);
    size_sub = strlen(string_sub);

    if (!strstr_special(main_string,string_find)) return(temp_string_p);
    if (size_find > size) return(temp_string_p);

    if (strstr_special(temp_string_r,string_find))
    {
      /* find the target string */
      for (i=i_s,j=0;i<strlen(temp_string);++i)
      {
        hit = 1;
        for (ii=i,j=0;j<size_find;++j,++ii)
            if (temp_string[ii] != string_find[j]) { hit = 0; break; }
        if (hit == 1) { k = i + size_find - delta; break; }
      }

      /* replace with string_sub */
      for (ii=i,j=0;j<size_sub;++ii,++j)
          temp_string[ii] = string_sub[j];

      i_s = ii;
      /* update the delta between main_string and temp_string */
      delta = delta + (size_sub - size_find);

      /* copy over the rest of string */
      for (j=k,iii=0;j<size;++iii,++ii,++j)
      {
        temp_string[ii] = main_string[j];
        temp_string_r[iii] = main_string[j]; /* save the rest of string */
      }
      temp_string_r[iii] = '\0';
      temp_string[ii] = '\0';
    } /* end of if (strstr...) */

    return(temp_string_p);
}
/***********************************************************************
**
** DESCRIPTION
**
**  The string_catch() function will do the following task:
**
**  1). catch and return the sub-string surround by del_1 and del_2
**
**      incoming arguments:
**
**               *string         incoming main string
**               del_1           delima before target sub-string
**               del_2           delima after target sub-string
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
char *string_catch(char *string,
                   char del_1,
                   char del_2)
{
    static char string_catch[MAX_RECORD_SIZE]={""};
    static char *string_catch_p = string_catch;
    unsigned int i,j,size;
    unsigned int hit = 0;

    size = strlen(string);
    for (i=0,j=0;i<size;++i)
    {
        if (hit == 0 && string[i] == del_1)
        {
            hit = 1;
            continue;
         }
/*
        if (hit == 1 && string[i] == del_1) { hit = 1; j = 0; continue; }
*/
        if (hit == 1 && string[i] != del_2)
        {
           string_catch[j++] = string[i];
           string_catch[j] = '\0';
        }
        if (hit == 1 && string[i] == del_2)
        {
           string_catch[j] = '\0';
           break;
         }
    }

    /* if there is no del found in the incoming string */
    if (hit == 0) string_catch[0] = '\0';

    return(string_catch_p);
}
/***********************************************************************
**
** DESCRIPTION
**
**  The char_strip() function will do the following task:
**
**  1). strip unwanted character from incoming data.
**
**      incoming arguments:
**
**               *input_data     incoming main string
**               unwant          unwanted character
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
void char_strip(char *input_data,
                     char unwant)
{
    unsigned int i,j;

    if (input_data[0] != '\0')
    {
      for (i=0;(input_data[i] != '\0');++i)
      {
        if (input_data[i] == unwant)
        {
          for (j=i;(input_data[j] != '\0');++j)
              input_data[j] = input_data[j+1];
        }
      }
      strcat(input_data,"\0");
    }

return;
}
/***********************************************************************
**
** DESCRIPTION
**
**  The case_change() function will do the following task:
**
**  1). perform the case change to the incoming string
**
**      incoming arguments:
**
**               string          incoming string
**               code            1  --> upper to lower, change incoming string
**                               2  --> lower to upper, change incoming string
**                               3  --> upper to lower, not change incoming string
**                               4  --> lower to upper, not change incoming string
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
char *case_change(char *string,unsigned int code)
{
    unsigned int i;
    static char temp_string[SPE_RECORD_SIZE];
    unsigned int size;

    size = strlen(string);

    if (code == 1 || code == 2)
    {
      for (i=0;i < size;++i)
      {
         if (code == 1)
         {
           /* upper to lower */
           if (string[i] >= -60 && string[i] <= -36)
               string[i] = string[i] + 32;
           if (string[i] >= 65 && string[i] <= 90)
               string[i] = string[i] + 32;
         }
         if (code == 2)
         {
           /* lower to upper */
           if (string[i] >= -28 && string[i] <= -4)
               string[i] = string[i] - 32;
           if (string[i] >= 97 && string[i] <= 122)
             string[i] = string[i] - 32;
         }
      }
      return(string);
    }

    temp_string[0] = '\0';
    if (code == 3 || code == 4)
    {
      strcpy(temp_string,string);
      for (i=0;i < size;++i)
      {
         if (code == 3)
         {
           /* upper to lower */
           if (temp_string[i] >= -60 && temp_string[i] <= -36)
               temp_string[i] = temp_string[i] + 32;
           if (temp_string[i] >= 65 && temp_string[i] <= 90)
               temp_string[i] = temp_string[i] + 32;
         }
         if (code == 4)
         {
           /* lower to upper */
           if (temp_string[i] >= -28 && temp_string[i] <= -4)
               temp_string[i] = temp_string[i] - 32;
           if (temp_string[i] >= 97 && temp_string[i] <= 122)
               temp_string[i] = temp_string[i] - 32;
         }
      }
      return(temp_string);
    }
}
/***********************************************************************
**
** DESCRIPTION
**
**  The get_weight() function will do the following task:
**
**  1). return the weight for each incoming string.
**
**      incoming arguments:
**
**               *c1       pointer to character string.
**               base      base for pow()
**
**
** RETURN VALUE:
**
**  double number for the weight
**
** SPECIAL NOTES:
**
**  none
**
*/
double get_weight(char *c1,unsigned int base)
{
unsigned int i;
double w=0.0;
unsigned int c1_size;
char c1_temp[SPE_RECORD_SIZE]={""};

    c1_size = strlen(c1);
    strcpy(c1_temp,case_change(c1,4));
    /* get the weight of each character string */
    for (i=0; i<c1_size; ++i)
    {
        w = w + (double)((int)(c1_temp[i]) * (int)pow(base,(c1_size - i - 1)));
    }
/*
printf("%s %f\n",c1,w);
*/

    return(w);
}
/***********************************************************************
**
** DESCRIPTION
**
**  The strncmp_tail() function will do the following task:
**
**  1). compare two strings with number of character counted
**      from the string tail.
**
**      incoming arguments:
**
**               *string_1      pointer to first incoming string
**               *string_2      pointer to second incoming string
**               count          integer number of characters to compare
**
**
** RETURN VALUE:
**
**  0 - equal
**  1 - not equal
**
** SPECIAL NOTES:
**
**  none
**
*/

int strncmp_tail(char *string_1,char *string_2,int count)
{
int i=0;
int hit=0;
int size1,size2;

   size1 = strlen(string_1);
   size2 = strlen(string_2);

   if (size1 < count) return(1);

   for (i=0; i<count && i<size1 && i<size2; ++i)
   {
     if (string_1[size1-i-1] != string_2[size2-i-1])
     {
        hit = 1;
        break;
     }
   }
   return(hit);
}
/***********************************************************************
**
** DESCRIPTION
**
**  The strstr_special() function will do the following task:
**
**  1). search string_1 for string_2
**
**      incoming arguments:
**
**               *string_1      pointer to first incoming string
**               *string_2      pointer to second incoming string
**
**
** RETURN VALUE:
**
**  n - pointer to found string
**  0 - not found
**
** SPECIAL NOTES:
**
**  none
**
*/

char *strstr_special(char *string_1,char *string_2)
{
unsigned int i,j,k;
unsigned mis_match=0;
unsigned int size1,size2;

   size1 = strlen(string_1);
   size2 = strlen(string_2);

   if ((int)string_2[0] > 0) return((char *)strstr(string_1,string_2));

   if (size2 > size1) return(0);

   for (i=0;i<(size1-size2)+1 ; ++i)
   {
       mis_match = 0;
       for (j=0,k=i;j<size2; ++j,++k)
       {
           if (string_1[k] != string_2[j])
           {
              mis_match = 1;
              break;
           }
       }
       if (mis_match == 0) return((char *)&string_1[i]);
   }
   return(0);
}

/***********************************************************************
**
** DESCRIPTION
**
**  The string_shift() function will do the following task:
**
**  1). shift the string to left or right.
**
**      incoming arguments:
**
**               code           1 - shift left
**                              2 - shift right
**               count          shift count
**               *string        pointer to string for shifting
**
**
** RETURN VALUE:
**
**  none
**
** SPECIAL NOTES:
**
**  none
**
*/
void string_shift(unsigned int code,
                  unsigned int count,
                  char *string)
{
    unsigned int i;
    unsigned int range=0;
    unsigned int size;

    size = strlen(string);

    if (size < count) return;
    if (size == 0) return;

    /* shift to left */
    range = size - count;
    if (code == 1)
    {
       for (i=0; i < range; ++i)
           string[i] = string[i+count];
       string[range] = '\0';
    }

    /* shift to right */
    if (code == 2)
       string[size-count] = '\0';


    return;
}

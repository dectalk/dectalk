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
 *    File Name:  dic_cnvt.c
 *    Author:     JDB
 *    Creation Date: 5/21/96
 *
 *    Functionality: Convert dictionary source files from either of two
 *    formats, and produce an output file which PARDIC can compile.
 *    Has 2 modes: 
 *      mode 0: convert the Paradox style source text to the new format
 *      mode 1: convert a new format source file to Paradox format
 *             
 *    USAGE: 
 *    dic_cnvt <source filename> <mode>
 *      <source file name> is name of the file to convert
 *      <mode> is either 0 or 1, as above
 *    
 *    Output file is written to <source filename>.tmp
 *
 ***********************************************************************
 *    Revision History:
 *
 */                                                                          

#include <stdio.h>
#include <string.h>  
#include <stdlib.h>                     
#include <ctype.h>

#define BUFSIZE 250


/* function prototypes */
void OldToNew (char *, FILE *), NewToOld (char *, FILE *);
/* end prototypes */


void main (int argc, char ** argv)
{
   int i, comma_count = 0, quote_flag = 0, end_flag = 0;
   char buffer[BUFSIZE] = {'\0'}, outfile[15] = {'\0'};
   void (* ProcessFxn) ();

   FILE * fp_in, * fp_out;
 	
/* check args */ 	 
   if (argc != 3)
   {
      printf ("Usage: dic_cnvt <source filename> <mode flag>\n");
      printf ("mode flag: 0 for new format output\n"
              "           1 to convert new format to old\n");
      printf ("Ouput is written to <source filename>.tmp\n");
	  exit (1);
   }	 
                           
/* determine which mode we're running the program in, choose the
 * processing function to use based on this
 */
   switch (argv[2][0])
   {
      case '0':
         printf ("Writing output in new format\n");
         ProcessFxn = OldToNew;
         break;
      case '1':
         printf ("Writing output in old format\n");
         ProcessFxn = NewToOld;
         break;
      default:
         printf ("Error in second argument: must be 0 for new format "
                 "or 1 for old format.\n");
         exit (1);
         break; 
   }                   
                      
/* open the file, or quit if it's non-existent */
   fp_in = fopen (argv[1], "r");
   if (! fp_in) 
   {
      printf ("Couldn't find file %s\n", argv[1]);
      exit (1);
   }
                      

/* find the filename extension, and write out a similarly named .tmp file */
   strcpy (outfile, argv[1]);  
   i = strcspn (outfile, ".");
   outfile[i+1] = '\0';
   strcat (outfile, "tmp");
   fp_out = fopen (outfile, "w");


/* scan through the dictionary source file all the way to end */

   while (fgets (buffer, BUFSIZE, fp_in))
   {

/* skip any comments along the way- just read the next line */                       
      if (buffer[0] == ';') 
      {
         if (argv[2][0] == '0') 
         {
            fputs (buffer, fp_out);
            continue;
         }
         else 
         {
/* don't do any processing on the header comments, or paradox format
 * comments
 */    
            if ((buffer[1] == '\"') || (buffer[1] == '*')) 
            {
               fputs (buffer, fp_out);
               continue;
            }
         }
      }
      (* ProcessFxn) (buffer, fp_out);  
   }
}
    
  

                                
/* OldToNew: take a text input file in the old-style dictionary format
   and write an output file in the new style 
                                                     
   args: buffer- the text for the current dictionary entry
         fp_out- the file ptr of the destination file                                                     
   returns: nothing
*/             
void OldToNew (char * buffer, FILE * fp_out)
{                     
   int i, quote_flag = 0, end_flag = 0, comma_count = 0;

   for (i=0; (i < BUFSIZE) && (buffer[i] != '\0'); i++) 
   {        
      switch (buffer[i])
      {                 
         case '\"':
                     
/* if we're not inside quotes already, we are now- set flag */
            if (! quote_flag)
               quote_flag = 1;                                
                  
/* otherwise, we've found a new quote while we're inside quotes. decide if
   it's closing the current quotes or if it's really nested
*/                  
            else
            {   
               if (buffer[i+1] == '\"')
               {
                  fputc ('\"', fp_out);
                  i++;
               }
               else 
                  quote_flag = 0;    
            }
            break;

/* we have to count commas outside of quotes, to know that we've passed the
 * phonetic data and T's and F's should be replaced with 1's and 0's...
 */
         case ',':
            if (! quote_flag)                                  
               comma_count++;
            if ((comma_count <= 3) && !quote_flag)  
               fputc (',', fp_out);
            else 
            {
               if (quote_flag)
               {
                  fputc ('\\', fp_out);
                  fputc (',', fp_out);
               }
            }   
            break;
               
               
         case '\\':
            fputc ('\\', fp_out);
            fputc ('\\', fp_out);
            break;   
                                   
/* if we see T's and F's inside quotes, after the original phonetic info,
 * replace them with ones and zeroes 
 */            
         case 'T':
            if ((comma_count > 2) && (quote_flag)) 
               fputc ('1', fp_out);
            else 
               fputc ('T', fp_out);                
            break;                 
                     
         case 'F':
            if ((comma_count > 2) && (quote_flag))
               fputc ('0', fp_out);
            else 
               fputc ('F', fp_out);
            break;
               
/* if it's not one of these special chars, just print it out normally */
         default:
            
/* when we reach the number at the very end of the line, be sure to write
 * a comma first to separate the number from the bit string before it
 */ 
            if (buffer[i] == ';')
               fputc ('\\', fp_out);
             
            if ((comma_count > 2) && (!end_flag) && (isdigit (buffer[i])))
            {
               end_flag = 1;
               fputc (',', fp_out);
            }                         
               
            fputc (buffer[i], fp_out); 
            break;
      }
   }
}                                            



             
/* NewToOld: read in a dictionary source file which uses the new format,
   and write a dictionary file in the Paradox format

   args: buffer- the text for the current dictionary entry
         fp_out- the file ptr of the destination file
*/
void NewToOld (char * buffer, FILE * fp_out) {
   int i, comma_count = 0, bits_flag = 0;                                              
      
   fputc ('\"', fp_out);   
   for (i=0; (i < BUFSIZE) && (buffer[i] != '\0'); i++)
   {     
   
/* reverse the process used above... */   
      switch (buffer[i]) 
      {              
         case '\\':
            switch (buffer[i+1]) 
            {   
               case '\\':
                  fputc ('\\', fp_out);
                  break;
               case ',':
                  fputc (',', fp_out);
                  break;
               case ';':
                  fputc (';', fp_out);
                  break;
            } 
            i++;
            break;
                                                                   
         case ',':
            fputc ('\"', fp_out);
            fputc (',', fp_out);
            fputc ('\"', fp_out);
            comma_count++;
            break;
            
         case '0':
            if (comma_count == 3) 
            {                   
               if (! bits_flag) 
                  bits_flag = 1;
               else
                  fputc ('\"', fp_out);               
               fputc ('F', fp_out);
               if (buffer[i+1] != ',')
               {
                  fputc ('\"', fp_out);
                  fputc (',', fp_out);
               }                       
            }                      
            else
               fputc ('0', fp_out);   
            break;
            
         case '1':
            if (comma_count == 3) 
            {                   
               if (! bits_flag) 
                  bits_flag = 1;
               else
                  fputc ('\"', fp_out);               
               fputc ('T', fp_out);
               fputc ('\"', fp_out);
               if (buffer[i+1] != ',')
                  fputc (',', fp_out);                       
            }                      
            else
               fputc ('1', fp_out);   
            break;
            
         case '\n':
            fputc ('\"', fp_out);
            fputc ('\n', fp_out);
            break;
            
         case '\r':
            fputc ('\"', fp_out); 
            fputc ('\n', fp_out);
            break;   
            
         default:
            if (buffer[i] == '\"')
               fputc ('\"', fp_out);
            fputc (buffer[i], fp_out);
            break;
      }                  
   }
}



     
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
 *    File Name:	glblclvr.c
 *    Author:		John Bartels
 *    Creation Date:07/06/95
 *
 *    Functionality:
 * GLBLCLVR.C: parse the dtpcmacr.mak file to determine all relations
 * between target, source, and include files. output the resulting structure
 * to a file called "globals".
 *
 ***********************************************************************
 *    Revision History:
 *  created  7/6/95  jdb 
 *  modified 7/12/95 jdb - add scanning of ASM file includes, improve 
 *                         handling of spacing syntax in makefiles   
 *           7/20/95 jdb - add externs and code to allow linking with the
 *                         variable finding src file.
 *           7/21/95 jdb - add protos for FindVarsASM 
 *           7/24/95 jdb - add recognition of "extern" text and building
 *                         of nodes for extern decs. fix bug in 
 *                         storage of variable's "declared_in" field.
 *           8/3/95  jdb - remove the code for handling .DIC/.ZIP renaming,
 *                         treat the externs as special case in IsC, add
 *                         extern handling flags for C source searches. also
 *                         added scope checking of vars, with respect to
 *                         source and target file. add clean up fxns, and
 *                         define MAKEFILE_SEARCH_STRING.
 *           8/31/95 jdb - add time/date stamp and banner to top of 
 *                         "fileorgn.txt" output file, update the 
 *                         command instructions for users.
 *           9/22/95 jdb - fixed filename reporting bug, and made 
 *                         CleanDefs non-recursive to ease resources...
 */

   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>  
   #include <ctype.h>
   #include <time.h>
   #include "defdecs.h"

/* GLOBAL VARS:  */ 

/* some fxns & vars declared in var.c & report.c files... */

   extern void SetupC (void);
   extern void FindVars (FILE *, struct lister *);
   extern void FindVarsASM (FILE *, struct lister *);
   extern int  GLOBALS_FOUND;
   extern void Display (struct lister *); 
   extern void AllVars (char *);
   extern void VarUsedIn (char *, char *);
   extern void VarsByFile (char *, char *);
   extern void UnusedReport (char *);
   extern struct Cword * DefaultCTail; 
   
   extern struct variable * VarHead;
   extern struct Cword * CHead;
   extern struct function * FxnHead; 


/* stream to which we'll write results */
   FILE * OUTFILE;

/* define the string we'll search for in the makefile */
   #define MAKEFILE_SEARCH_STRING "TARGET_OF_ALL_TARGETS"


/* keep a global list of the target nodes, and the hdr nodes ...
   these markers help searching and adding nodes */


   struct lister * TargHead = NULL;
   struct lister * TargTail = NULL;
   
   struct lister * HdrHead = NULL;
   struct lister * HdrTail = NULL;
                                
/* a global temporary var used to hold some data between fxns */            
   struct lister * TMP = NULL;
                          
/* flag which is set if the program doesn't have to do any variable 
   reporting: don't waste time reading vars if you just want a file list
*/
   int Variables_Off= 0;                          
/* END OF GLOBAL DECLARATIONS */

                    
/* FUNCTION PROTOTYPES */

void SearchCore (char *, FILE *, void (*) () ), Target (char *),
     Sources (char *), UpCase (char *), LowCase (char *),
     VisitIncludes (struct included_file *), CleanDefs (struct Cword *),
     FindHdrs (char *), PurgeMem (void), PurgeVars (struct variable *),
     PurgeListers (struct lister *), PurgeC (struct Cword *),
     PurgeFxns (struct function *), ShowOptions (void);
struct node * MakeNode (char *, int);
struct lister * MakeList (struct node *);
struct included_file * MakeIncludedFile (char *),
		     * AddIncludes (struct included_file *, char *);
int FindSrc (char *, int);
/* END OF PROTOTYPES */
                                                             
                    
                    
                                         
/* MAIN: initiates search for TARGET_ALL, which will cause us to 
   recursively trickle down to the last entry.
   TARGET_PTR is a pointer to the Target function which is used by
   core when searching TARGET* labels.
   
   cmd line args: receives a character which selects the report mode
   to use, next arg is the name of the file to write the report to.
   
   Currently available report flags as of 8/2/95:
   * no args: default- just write the globals file hierarchy list
  
   The following report options require an argument after them, specifying
   the output file to write the report to. All of these reports will also
   generate the globals hierarchy file.
  
   * a: print each variable, where it's declared & where it's used   
   * v: print a list of all files using "var"
   * f: print a list of all variables found in "file" specified as next arg
   * u: print a list of all unused variables (ie. declared but never used) 
    
   example: glblcl v out.txt 
*/                          

   void main (int argc, char * argv[]) {
      FILE * f1;
      char time[9], date[9];
      void (* Target_PTR) ();                 
      OUTFILE = fopen ("fileorgn.txt", "w");    
      Target_PTR = Target;
 
 /* put a banner on top of the "fileorgn.txt" file */ 
      fprintf(OUTFILE, "Written by glblclvr.exe at %s on %s.\n", _strtime (time), _strdate (date));
      fprintf(OUTFILE, "\nThis file contains a list of buildable targets, the soure files that\n");
      fprintf(OUTFILE, "make up each target, and the header files that each source file includes.\n\n");
        
    
    
 /* open the makefile */
      if (! (f1 = fopen ("dtpcmacr.mak", "r"))) {
	     printf ("Can't find DTPCMACR.MAK file!\n");
	     exit(1);
      }         
      
/* if the program is called incorrectly */      
      if ((argc > 1) && (argv[1][0] != '/')) {
         ShowOptions ();
         exit(1);
      }

 /* TARGET_ALL holds definitions of all targets built by makefile, so
    go find it and follow the links there */   
 
      if (argc == 1)
         Variables_Off = 1;
      else {      
         argv[1][1] = tolower (argv[1][1]);
         switch (argv[1][1]) {
            case 'a':
                if (argc != 3) {
                   printf ("This option is followed by an output filename argument\n");
                   exit(1);
                } 
                printf ("Generating list of all vars\n");
                break;
            case 'v':
                if (argc != 4) {
                   printf ("This option is followed by a var name and output filename\n");
                   exit(1);
                } 
                printf ("Generating list of all files using var\n");
                break;
            case 'f':
               if (argc != 4) {
                  printf ("This option is followed by a file name and output filename\n");
                  exit(1);
               }
               printf ("Generating list of all vars used by file\n");
               break;
            case 'u':
               if (argc != 3) {
                  printf ("This option is followed by an output filename\n");
                  exit(1);
               }
               printf ("Generating list of all unused vars\n");
               break;
            default:
               ShowOptions();
               exit(1);
               break;
         }
      }
               
      SetupC ();
      SearchCore (MAKEFILE_SEARCH_STRING, f1, Target_PTR); 
/*     printf ("TOTAL FOUND: %i\n", GLOBALS_FOUND); */ 
      Display (TargHead);
      fclose (OUTFILE);

/* print result option */
      if (argc > 1) {
         switch (argv[1][1]) {
            case 'a':
               AllVars (argv[2]);
               break;
            case 'v':
               VarUsedIn (argv[2], argv[3]);
               break;            
            case 'f':
               VarsByFile (argv[2], argv[3]);
               break;
            case 'u':
               UnusedReport (argv[2]);
               break;
         }                  
         
/* free up the lists used */
         PurgeMem ();  
      }       
      
/* free up all the list space used in a non-variable checking run*/
      else {
         PurgeListers(TargHead);
         PurgeListers(HdrHead);
         PurgeC (CHead);
      }
   }                                   
   
   
/* SEARCHCORE: the basic function required for searching through 
TARGET and SRCS files. It holds the code which is common to all
searches, and calls a function ptr to the particular search type
function to handle cases individually. Goal is the string to find, fp
points to the file we're searching, handler is the function it will call
on a find.
*/


   void SearchCore (char * goal, FILE * fp, void (*Handler) ()) {
      int flag = 1, i, j, length;
      char buffer[200] = {'\0'};
                        
      length = strlen (goal);

/* keep reading from file until we exhaust it or find the goal */

      while (strncmp (buffer, goal, length) != 0) {
	     if (!fgets (buffer, 200, fp)) {
	        fclose (fp);
	        return;
	     }
      }

      j = strcspn (buffer, "=");

/* move the stuff from the right of the = to start of string */

      for (i= j + 1; i<= (signed) strlen (buffer); i++)
	     buffer[i- (j + 1)] = buffer[i];

/* as long as there's a \ at end of line, we keep reading (set flag) */

      while (flag) {  
      
/* handle some makefile syntax: if a \ follows the =, read the next 
   line
*/      
	     if ((buffer[0] == '\\') || (buffer[1] == '\\'))
	        fgets (buffer, 200, fp);

/* clear flag if no \, put a terminating null over \n's or \\'s... */

	     if (buffer [strlen(buffer) - 2] != '\\') {
	        flag = 0;
	        buffer [strlen(buffer) - 1] = '\0';
	     }
	     else buffer[strlen(buffer) - 2] = '\0';                   
	     
	     
/* shift the entire string one space to left (to account for the
   spacing conventions in makefile 
*/	     
	     for (i=1; i <= (signed) strlen (buffer); i++)
	        buffer[i-1] = buffer[i];

/* if you find non-$(*) text, then we have reached the bottom level
   of the search mode we're currently in. Call the function which
   is particular to the search, to determine what to do with it 
*/ 
	     if (buffer[0] != '$') {
	        if (buffer[0] != '\n') {
	           UpCase (buffer);
	           (* Handler) (buffer);
	        }
	     }
	     else {

/* if we find a $(*) string, we need to continue the search at the
   next level down, so recursively call a search (passing the same
   handler as the one we're set for in the current call
*/

	        if (buffer[0] == '$') {
	           for (i=2; i <= (signed) strlen (buffer); i++) {
		          if (buffer[i] == ')')
		          buffer[i] = '\0'; 
		          buffer[i-2] = buffer[i];
	           }  
	           SearchCore (buffer, fopen ("dtpcmacr.mak", "r"),
	           (*Handler));
	        }
	     }

/* read in the next line if we should... */

	     if (flag)
	        fgets (buffer, 200, fp);
       }                                    
      
/* clean up */

       fclose (fp);
       return;
    }





/* TARGET: the routines to handle a target search which turns up a
   non-$ piece of text. Buffer is the name of the target we've found.
*/

   void Target (char * buffer  ) {
      int i;                                        
      char * token;

/* pointers to handling functions which can be called from here */
      void (* Sources_PTR) ();

      struct node * new_node;
      Sources_PTR = Sources;

/* add the file to a list of nodes */
     
      new_node = MakeNode (buffer, 0);

      if (TargTail) {
         TargTail->next = MakeList (new_node); 
         TargTail = TargTail->next;
      }    
      else {
         TargHead = MakeList (new_node);
         TargTail = TargHead;
      }

/* extract the relevant parts of the file name, and go look up the
   associated SRCS_* file.
*/
      for (i= 0; buffer[i] != '.'; i++);
	  buffer[i] = '_';
	                  
/* set up the strings in the format we need to search the makefile */
	                  
      token = malloc ( (strlen (buffer) + 6) * sizeof (char));
      if (! token) {
	     printf ("Malloc failed!\n");
	     exit(1);
      }
      strcpy (token, "SRCS_");
      strcat (token, buffer);
      token[strlen(token)] = '\0';

      SearchCore (token, fopen ("dtpcmacr.mak", "r"), Sources_PTR);

/* once the SRCS files are done, set up for an ASM file search
   with this file name */

      for (i= strlen (token); token[i] != '_'; i--);
      i++;
      token[i] = '\0';
      strcat (token, "ASM");
      token[strlen(token)] = '\0';
      
/* now go see if you can dig up any ASM files associated with 
   this source name */      
      
      SearchCore (token, fopen("dtpcmacr.mak", "r"), Sources_PTR);
      free (token); 
      
/* Clear out all of the types declared under each target, so that old
   ones which are not present now will not be left defined.
*/               
      if (DefaultCTail->next) {
         CleanDefs (DefaultCTail->next);
         DefaultCTail->next = NULL;
      }
   }
                        
  
  
  
                        
/* SOURCES: the routines to handle a SRCS level search which finds
   a non-$ piece of text.
*/

   void Sources (char * buffer) {
      FILE * f2, * src_fp;
      char input[200] = {'\0'};                    
      struct included_file * top = NULL;
      int i, j, k, flag = 1, src_type = 0, done = 0;

/* add a node for this source file to the list of files, insert it
   after the last source file under the current target file. call FindSrc
   to check for previously built source nodes, and set up appropriate
   links in the list */                    
 
/* we have to search in lowercase ... */   
      LowCase (buffer);               

      for (i=0; buffer[i] != '.'; i++);

/* find out if we're reading an ASM or c file... */
      switch (buffer[i+1]) {
         case 'c':
            src_type = 1;
            break;
         case 'a':
            src_type = 2;
            break;
         default:
            src_type = 0;
            break;
      }

      if (! (FindSrc (buffer, src_type))) {

/* if we haven't seen this source file before, read its dep file */

         buffer[i+1] = '\0';
         strcat (buffer, "DEP");
         f2 = fopen (buffer, "r");   
         if (!f2) {
            printf ("File '%s' not found!\n", buffer);
            return;
         }   
         buffer[i] = '_';

/* read through the dep file until we find input's match, or until
   we exhaust the file
*/      
         while (strncmp (input, buffer, strlen(buffer)) != 0) {
	        if (!fgets (input, 200, f2)) {
	           fclose (f2);
	           return;
	        }
         }               

         j = strcspn (input, "=") + 2;
         
/* take what's to the right of the =, and make that input*/

         for (k=j; k <= (signed) strlen (input); k++)
            input[k-j] = input[k];
            
/* get new line on input that has only a backslash */            
         if (input[0] == '\\') 
            fgets (input, 200, f2);

/* as long as we should keep reading, read and print out the lines
   in the dep file
*/                             
         while (flag) {
            if (! isalpha(input[0]) ) {
               for (j=0; !(isalpha (input[j])); j++);
               for (k=j; k <= (signed) strlen (input); k++)
                  input[k-j] = input[k];
            }
                      
            if (input[strlen(input)-2] != '\\') {
               flag = 0;                           
               input[strlen(input)-1] = '\0';
            }
            else input[strlen(input) - 2] = '\0';             
            
/* filter out garbage... */

            if (isalpha(input[0])) { 
               if (strlen (input) > 2) {
            
/* insert a node for hdr file under source file's include field */
		          top = AddIncludes (top, input);
		   }
		}
/* only read more if we know there's more to read here */
            
            if (flag) 
               fgets (input, 200, f2);
         }  
         fclose (f2);

/* now we want to read the dep file's listing of includes... */         
         if (top) 
            VisitIncludes (top);
     
	     buffer[i] = '.';
	     
/* if we need some form of var reporting... */
         if (!Variables_Off) {                 
/* for C files */
            if (src_type == 1) {
               buffer[i+1] = 'c';
               buffer[i+2] = '\0';
               if (src_fp = fopen (buffer, "r")) {
  /*                printf ("FOR: %s\n", buffer);  */
                  if (TMP) {
                     if (TMP->next)
                        FindVars (src_fp, TMP->next);
                     else FindVars (src_fp, TargTail->data->includes);
                  }    
                  else FindVars (src_fp, TargTail->data->includes);
                  fclose (src_fp);
               }
            }
            else {       
/* if it's an ASM file */         
               if (src_type == 2) {
                  buffer[i+1] = 'a';
                  buffer[i+2] = 's';
                  buffer[i+3] = 'm';
                  buffer[i+4] = '\0';   
                  if (src_fp = fopen (buffer, "r")) {
 /*              printf ("FOR: %s\n", buffer);  */
                     if (TMP && TMP->next)
                        FindVarsASM (src_fp, TMP->next);
                     else FindVarsASM (src_fp, TargTail->data->includes);
                     fclose (src_fp);
                  }
               }
            } 
         }              
      }
   }       
                                                        
                                                        
                                                                      
                                                                      
/* UpCase: capitalize all text in a string 
*/
   void UpCase (char * string) {
      int i;
      for (i=0; i <= (signed) strlen (string); i++)
	     string[i] = toupper(string[i]);
   }
                                             
                                                        
                                                        
                                                        
/* LowCase: make all chars in a string into lowercase 
*/
   void LowCase (char * string) {
      int i;
      for (i=0; i <= (signed) strlen (string); i++)
	     string[i] = tolower(string[i]);
   }                               
   
    
    
/* FINDSRC: check if we've already built a node for this source file. if
so use a ptr to it, else create a new node for it. return a one on a find,
zero on failure. buffer is the name of the file we're looking for, 
src_type is the code assigned to source (C or ASM int code)
*/

   int FindSrc (char * buffer, int src_type) {

      struct node * previous = NULL;
      struct lister * current;  
     
/* first check for a match of the source file name in any previously built
   nodes, set previous to any structures which match the name */
      
      current = TargHead;
      while (current) {
         if (current->data->includes) {
            TMP = current->data->includes;
            while (TMP) { 
	           if (strcmp (TMP->data->name, buffer) == 0) {
	              previous = TMP->data;                    
	              break;
	           } 
	           else TMP = TMP->next;
	        }    
	     }
	     if (previous)
	        break;
         else
            current = current->next;
      }
                          
/* now determine where to make insertion */
      TMP = NULL;
      if (TargTail->data->includes) {
         TMP = TargTail->data->includes;         

/* go to the last file in the list */
	     while (TMP->next)
	        TMP = TMP->next;

/* build new nodes if appropriate, or just wrap up an old one in a lister
   struct and put it in the list */

	     if (previous) {
	        TMP->next = MakeList (previous);
	        return 1;
	     }
	     TMP->next = MakeList (MakeNode (buffer, 1));
      }
      else {
	     if (previous) 
	        TargTail->data->includes = MakeList (previous);
	     else 
	        TargTail->data->includes = MakeList (MakeNode (buffer, 1));
      }   
      return 0;
   }
    



/* FINDHDRS: checks to see if we've encountered a given hdr file before.
   if so, we'll reuse the structure that stores its data, else we'll make
   a new one for it. return 1 on a successful find, 0 on failure.
*/

   void FindHdrs (char * buffer) {

      int dot_mark = 0;           
      struct lister * tmp, * insert_hdr, * insert_hdr2;
      struct node * previous = NULL, * new_node;
      FILE * hdr_fp;      

/* first search the hdr list for a match */

      tmp = HdrHead;
      while (tmp) {
	     if (strcmp (tmp->data->name, buffer) == 0)
	        previous = tmp->data;
	     tmp = tmp->next;
      }

/* now find where we should insert to */

      if (previous) {
	     insert_hdr = MakeList (previous);
	     insert_hdr2 = MakeList (previous);
      }
      else {
	     new_node = MakeNode (buffer, 2);
	     insert_hdr = MakeList (new_node);
	     insert_hdr2 = MakeList (new_node);
      }

/* find the last source file under the current target */

      tmp = TargTail->data->includes;
      while (tmp->next)
	     tmp = tmp->next;
	  
 /* now find the last hdr under the current source file */

      if (tmp->data->includes) {
	     tmp = tmp->data->includes;
	     while (tmp->next)
	        tmp = tmp->next;
	     tmp->next = insert_hdr;
	  }
      else 
	     tmp->data->includes = insert_hdr;
      
         
 /* update the global hdr listing to reflect new nodes created... */

      if (!previous) {
	     if (HdrHead) {
	        HdrTail->next = insert_hdr2;
	        HdrTail= HdrTail->next;
	     }
	     else {
	        HdrHead = insert_hdr2;
	        HdrTail = HdrHead;
	     }  
 /*	     printf("FOR: %s\n", buffer);  */

         if (!Variables_Off) {
	        if (hdr_fp = fopen (buffer, "r")) {
	           if (buffer[strcspn (buffer, ".")+1] == 'a')
	              FindVarsASM (hdr_fp, insert_hdr2);
		       else FindVars (hdr_fp, insert_hdr2);
	           fclose (hdr_fp);
	        }
         }
      }
   }




   
/* MAKENODE: creates and returns nodes for lists of files and their
   includes
*/
   
   struct node * MakeNode (char * string, int node_kind) {
      struct node * new;
      static target_code = 0;
      new = malloc (sizeof (struct node));
      if (!new) {
        printf ("malloc failed!\n");
        exit(1);
      }
      new->name = malloc ((strlen (string) + 1) * sizeof (char));
      if (!new->name) {
         printf ("malloc failed!\n");
         exit(1);
      }
      strcpy (new->name, string);                 
      new->type = node_kind; 
      if (node_kind == 0) {
         target_code++;
         new->targ_code = target_code;
      }
      else new->targ_code = 0;
      new->targ_globals_list = NULL;
      new->includes = NULL;
      return new;
   }                             
   
    
    
/* MAKELIST creates & returns a list node to store ptrs to file-info nodes */

   struct lister * MakeList (struct node * item) {
      struct lister * new;
      new = malloc (sizeof (struct lister));
      if (!new) {
         printf ("malloc failed!\n");
         exit (1);
      }            
      new->targ_code = item->targ_code;
      new->data = item;
      new->next = NULL;       
      new->parents_name = NULL;
      return new;
   }                         
   
   
/* ADD INCLUDES: receives a new include file name as an arg, and 
   places it into the list of the other include files for this src
   code
*/

   struct included_file * AddIncludes (struct included_file * top, char * input) {
      struct included_file * current= NULL, * copy= NULL, * copy_p= NULL,
         * prev= NULL;  
      int done = 0;
      
      if (top) {      
         current = top;
	     while (1) {
	        if (strcmp (current->name, input) == 0) {
	           copy = current;
	           copy_p = prev;
	        }
	        if (current->next) {
	           prev = current;
	           current= current->next;
	        } 
	        else {
	           if (copy && (copy != current)) {
		          copy_p->next = copy->next;
		          copy->next = NULL;
		          current->next = copy;
		          return top;
	           }
	           else {
		          if (!copy)
		             current->next = MakeIncludedFile (input);
		          return top;
               }
	        }
	     }
      }
      else top = MakeIncludedFile (input);
      return top;
   }
         
            
   
   
   
                 
   
    
/* VISIT INCLUDES is a recursive function which allows us to read the
   list of inluded files in BACKWARD order from a dep file. this is
   important because we need to know the bottom level of includes
   in case any higher includes refer to info there before we'd see it
   in a straightforward reading scheme... 
*/     
   
   void VisitIncludes (struct included_file * current) {
      if (current->next) 
         VisitIncludes (current->next);
      FindHdrs (current->name);
      free (current->name);
      free (current);
   }
                                                          
      
/* MakeIncludedFile: receives string an builds an included_file node
   around it... returns ptr to this structure.
*/                                                          
                                                          
   struct included_file * MakeIncludedFile (char * input) {
      struct included_file * new;
      new = malloc (sizeof (struct included_file));
      if (!new) {
         printf("malloc failed!\n");
         exit(1);
      }
      new->name = malloc ((1+strlen(input)) * sizeof(char));
      if (!new->name) {
         printf ("malloc failed!\n");
         exit(1);
      }
      strcpy (new->name, input);
      new->next = NULL;
      return new;
   }               
   
   
/* CLEANDEFS: recursively remove all of the new C types which were added 
   inside the current target file 
*/
   
   void CleanDefs (struct Cword * current) {
      struct Cword * next = NULL;
      while (current) {
         next = current->next;
         free (current);
         current = next;
      }
   }                            
   
   
   
/* PURGE MEM: call memory routines to free up all struct nodes in lists */   
   void PurgeMem (void) {
      PurgeVars (VarHead);
      PurgeListers (TargHead);
      PurgeListers (HdrHead);
      PurgeC (CHead);
      PurgeFxns (FxnHead);      
   }
                                                                          
                                                                          
                                                                          
/* PURGE VARS: free up all members of variable list */   
   void PurgeVars (struct variable * current) {    
      struct variable * next;
      while (current) {
         next = current->next;
         free (current);
         current = next;
      }
   }
   
   
                                          
/* PURGE LISTERS: free up all members of Targ and Hdr lists */                                          
   void PurgeListers (struct lister * current) {
      struct lister * next;
      while (current) {
         next = current->next;
         free (current);
         current = next;
      }
   }
   
   
/* PURGE C: free up all members of the C lists */   
   void PurgeC (struct Cword * current) {
      struct Cword * next;
      while (current) {
         next =  current->next;
         free (current);
         current = next;
      }
   }                              
   
   
/* PURGE FXNS: free up all members of the function list */
   void PurgeFxns (struct function * current) {
      struct function * next;
      while (current) { 
         next= current->next;
         free (current);
         current = current->next;
      }
   }
                                                                             


/* ShowOptions: error message to tell user proper calling procedure */   
   void ShowOptions (void) {
      printf ("Invalid call to program! Prototype is:\n");
      printf ("glblclvr /option arg1 arg2\n");
      printf ("\nAvailable options are: \n A: Generate report of all vars, write output to file 'arg1'.\n");
      printf (" F: write report of all variables used in file 'arg1', to file 'arg2'.\n");
      printf (" V: write report of all files using variable 'arg1'to file 'arg2'.\n");
      printf (" U: write report of all unused variables to file 'arg1'.\n");
      printf (" No arguments: write file hierarchy list to file 'fileorgn.txt'.\n");
      printf ("ALL other calls automatically generate 'fileorgn.txt' as well.\n");
   }      
   
       
       
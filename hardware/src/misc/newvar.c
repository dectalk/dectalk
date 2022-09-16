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
 *    File Name:	newvar.c
 *    Author:		John Bartels
 *    Creation Date:07/01/95
 *
 *    Functionality:
 * VARS.C: this file contains code to parse source (.c and .h) files 
 * and pull out the global variables it finds within them. nodes are
 * created for these variables, and stored in a global list 
 *
 ***********************************************************************
 *    Revision History:
 *  7/95     jdb - file created
 *  8/7/95   fixed errors inside comments, improved code to remove chars from
 *          front of identifier names.
 */
                                  
   #include <stdio.h>
   #include <stdlib.h>        
   #include <string.h>         
   #include <ctype.h>  
   #include "defdecs.h"   


/* --- GLOBAL VARIABLE DECLARATIONS --- */     

/* variables declared in glblclvr.c that we'll need in this file */
   extern struct lister * MakeList (struct node *);   
   
   extern struct lister * TargTail;   


/* ptr to head  & tail of the list of reserved C phrases */
   struct Cword * CHead= NULL;
   struct Cword * CTail= NULL;
   struct Cword * DefaultCTail = NULL;
                         
/* ptrs to head & tail of variable and function name lists */
   struct variable * VarHead = NULL;
   struct variable * VarTail = NULL;
   struct function * FxnHead = NULL;
   struct function * FxnTail = NULL;
                         
/* a flag which tells us when we have found a new user-defined type,
   and a backup flag used when we have nested definitions (ie. 
   typedef'ing struct dec's...)
*/
   int User_Def_Flag = 0;                 
   int User_Def_Bak = 0;

/* get a count of all of the variables we've seen */
   int GLOBALS_FOUND = 0;
    
/* a flag to notice when #define's have caused a make var, so that we can
   question "useless" #def's
*/
   int PD_DEF_FLAG = 0;    
    
/* --- END OF GLOBAL DECLARATIONS --- */

	 
/* -- FUNCTION  PROTOTYPES -- */
void FindVars (FILE *,struct lister *),FindVarsASM (FILE *, struct lister *),
     Variable (char *, int, struct lister *, int), Function (char *),
     SetupC (void);
int IsC (char *), AddType (char *);
struct Cword * MakeC (char *, int);   
struct variable * MakeVariable (char *, struct lister *, int);
struct function * MakeFunction (char *);  
struct t_globals * MakeTGlobal (struct variable *);
/* -- END OF PROTOTYPES -- */
   
   
   void FindVars (FILE * fp, struct lister * open_file) {
      char special_char = '\0', buffer[200] = {'\0'},
	     * kill_delimits = " =,\t&|+-<>!%", 
	     * keep_delimits = "\'\\;(*])[\"{/}\n",
	     * ident_name = NULL, * token = NULL;
      int i, index, keep_index =0, kill_index = 0, CommentFlag=0,
	     QuoteFlag=0, SingleQuoteFlag = 0, ParenCnt=0, BraceCnt=0,
	     declare_flag = 0, fxn_dec = 0, shift, token_type,
	     extern_dec = 0, def_extend = 0, def_cnt = 0;


/* keep reading the file as long as there's more text */
      while (1) {

	     if (!fgets (buffer, 200, fp)) {
	        if (token)
	           free (token);
	        return;               
	     }
		
/* determine where token separators occur */            
	     kill_index = strcspn (buffer, kill_delimits);          
	     keep_index = strcspn (buffer, keep_delimits);     
	 
/* as long as we have some text left in the string... */         
	     while (keep_index || kill_index) {          
	 
/* if the first character is ignorable, then throw it out and 
   shift the buffer left until the first useful character is in the
   0 index of the array 
*/                   
	        if (token) {
	           free(token);
	           token = NULL;
            }
            
	        if (keep_index && (! kill_index)) {
	           shift = strspn (buffer, kill_delimits);
	           for (i=shift; i <= (signed) strlen(buffer); i++)
		          buffer[i-shift] = buffer[i];
	           keep_index -= shift;
	           kill_index = strcspn (buffer, kill_delimits);
	        } 
                                                       

/* break at the first separator, and if it's a keep delimit, store it
   for later use
*/
	        if (kill_index < keep_index)
	           index = kill_index;
	        else {
	           index = keep_index;
	           special_char = buffer[keep_index];
	        }   
	        
	        


/* if identifier name already exists, then determine if it represents
   a function name or var name */
   
	        if (ident_name) {
	           if (special_char != '/') {
		          if (special_char == '(') {
		             Function (ident_name);
		             fxn_dec = 1;
	 	          }
		          else {
		             if ((declare_flag) && (!fxn_dec)) 
		                Variable (ident_name, 1, open_file, extern_dec);   
		          }
		          free (ident_name);
		          ident_name = NULL;
	           }
	        }

/* allocate space for the new token, and copy it from the buffer */
	        if (index > 0) {
	           token = malloc ((1+strlen(buffer)) * sizeof(char)); 
	           if (!token) {
	              printf ("malloc failed!\n");
	              exit(1);
	           }
	           for (i=0; i < index; i++)
		          token[i] = buffer[i];
	           token[i] = '\0';
	        }

/* shift the chars of the buffer left to put the next character in  
   the 0th index of the array 
*/
	        for (i=index+1; i <= (signed) strlen(buffer); i++)
	           buffer[i-(index+1)] = buffer[i];

/* because of spacing conventions... */

	        if (fxn_dec && special_char == '{') {
	           fxn_dec = 0;
/*	           declare_flag = 0; */ 
/*           BraceCnt++; */
	        }
                                
                                
	        if (token != NULL) {
	        
/* ignore stuff inside comments and quotations */
               if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag) {

/* if we're outside of functions, or declaring an enumeration, and not
   declaring a function, then continue here
*/
	              if ((!BraceCnt) || (User_Def_Flag == ENUM_DEF)) {

/* if it's a reserved word, see if it's a declarator */
		             token_type = IsC(token);

/* token type is 1 if it's a C token, > 1 if it's a declarator...
   if neither, it's zero
*/
			         if (token_type) {
					    
/* If it's a declarator, check if we're inside the parens of a fxn.
   If we are (fxn_dec is 1), then we should ignore all of the 
   data inside them. But if we have just exited the parens of a
   fxn dec, we may find one of 2 cases: either 0 or more fxn decs
   may follow, ending with a semicolon, OR we may actually define the
   fxn itself. To avoid recognizing non-ANSI C argument decs as 
   globals, we set fxn_dec to 2, which instructs us to ignore 
   everything we see until we reach a brace. */
   					       
   					       
					    if (token_type > 1) {    
					       if (token_type == 2)
					          extern_dec = 1;
					       if (fxn_dec == 1 && !ParenCnt) 
					          fxn_dec=2;
					          
/* ignore contents of parens */
  					       if (fxn_dec != 1)
  					          declare_flag = token_type;
					       
					    }
					    else declare_flag = 0;
					  
/* ignore the non-ANSI args */
					    if (fxn_dec == 2)
					      declare_flag = 0;
				     }        
				     
				     
/* if the token isn't C, see if it's a user definition of a new 
   type 
*/				     
			         else {
			            if (User_Def_Flag) {
			               if (BraceCnt && (User_Def_Flag == ENUM_DEF) && !(fxn_dec)) 
			                  Variable (token, 1, open_file, extern_dec);
			               else {
			                  if (User_Def_Flag == POUND_DEF) {
			                     def_cnt++; 

/* if it's just a simple 2 piece (non-macro) pound def, see if the second
   phrase is a declarator. if so, then we should count the subsitute name
   as a valid type, too.
*/
			                     if (def_cnt == 2) {
			                       if ( (IsC(token)) > 2)
			                          AddType (token);
			                     }
			                /*     printf ("Def'd: %s\n", token); */
			                  }
			                  else {
			                     if (fxn_dec != 1) {
				                    declare_flag = AddType (token);
				      /*              printf("udf now: %i\n", User_Def_Flag); */    
				                 }
				              }                                    
				           }
				        }             
			            else {

/* if the token conforms to C rules for identifier names, store it 
   as a valid ident name
*/
			               if ((isalpha (token[0]) || token[0]=='_') 
			                   && (!ParenCnt)) {
				              ident_name = malloc ((1+strlen(token))*sizeof(char));
				              if (!ident_name) {
				                 printf ("malloc failed!\n");
				                 exit(1);
				              }
				              strcpy (ident_name, token);
			               } 
			            }
			         }
			      }
/* otherwise, we're inside a function, so look for references to 
   variables. note the 0 flag in Variable call: globals to be ref'd
   should already have been declared, so if we have a token name
   that wasn't previously dec'd, DON'T make a new node for it */			      
			      else {

			         if ((isalpha(token[0]) || token[0] == '_') &&
			             (!User_Def_Flag) && (!User_Def_Bak)) {


			        /*    printf ("died here!\n"); */
			        /*    exit(1); */
		            /*    printf ("udf: %i\n", User_Def_Flag); */
			            if ((! IsC (token)) && (!fxn_dec)) 
			               Variable (token, 0, open_file, -1);
			         }
			      }
		       }
	        }      

/* analyze any special characters found as keep delimits, and take
   necessary actions
*/                                         

	        if (special_char) {        
               switch (special_char) {
                             
/* treat brackets like braces: look for references inside them */
                  case '[':
                     if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag)
                        BraceCnt++;
                     break;
                     
                  case ']':
                     if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag)
                        BraceCnt--;
                     break;                             
                             
/* track C++ comments */
	              case '\\':
	                 if (User_Def_Flag == POUND_DEF) 
	                    def_extend = 1;
	                 if (QuoteFlag || SingleQuoteFlag) 
	                    buffer[0] = ' ';
	                 break;
	                    
/* look out for quotes */	                    
		          case '\'':
		             if (!CommentFlag && !QuoteFlag)
		                SingleQuoteFlag = 1 - SingleQuoteFlag; 
		             break;
		          case '"':
		             if (!CommentFlag && !SingleQuoteFlag)
			            QuoteFlag = 1 - QuoteFlag;
		             break;
		             
/* on braces, clear the fxn_dec flag */		             
		          case '{':
		             if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag){
			            BraceCnt++;                                      
			            fxn_dec = 0;
			         }
		             break;
		          case '}':
		             if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag)
			            BraceCnt--;
                     if (User_Def_Flag == ENUM_DEF)
                        User_Def_Flag = 0;
		             break;            

/* track paren balancing */
		          case '(':
		             if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag) 
			            ParenCnt++;
		             if (ident_name) {
			            Function (ident_name);
			            fxn_dec = 1;
			            free (ident_name);
			            ident_name = NULL;
		             }
		             break;
		          case ')':
		             if (!CommentFlag && !QuoteFlag && !SingleQuoteFlag)
			            ParenCnt--;
		             break;
		             
/* if we see comment delimits, set flag to ignore contents*/
		          case '/':
		             if (!QuoteFlag && !SingleQuoteFlag) {
			            if (buffer[0] == '*') {
			               CommentFlag = 1;
			               for (i=1; i <= (signed) strlen(buffer); i++)
			                  buffer[i-1] = buffer[i];
			               buffer[i] = '\0';
			            }
			            else {
			               if (buffer[0] == '/') {
			                  if (!fgets (buffer, 200, fp)) { 
			                     if (token)
			                        free (token);
			                     return;
			                  }
			               }
			            }
		             }
		             break;

/* clean up everything at the end a cmd */
		          case ';':
		             if (!BraceCnt && User_Def_Bak == 4) {
		                User_Def_Bak = 0;
		                User_Def_Flag = TYPEDEF_DEF;
		                AddType (token);
		                User_Def_Flag = 0;
		             }
		             
		             if (declare_flag && ident_name) {
		    
/* if we've got a structure declaration nested inside a typedef, don't 
   make this ident_name a variable, it's really a type name definition
*/		    
		                if (User_Def_Bak == 4) {
                           User_Def_Bak = 0;
                           User_Def_Flag = 0;  
                           declare_flag = 0;
                        }
                        else {
                           if ((!fxn_dec) && (!(User_Def_Flag == POUND_DEF)) ) 
				               Variable (ident_name, 1, open_file, extern_dec);
				        }
				        declare_flag = 0;     
				        extern_dec = 0;
			            free (ident_name);
			            ident_name = NULL;
		             } 
		             if (!BraceCnt) { 
		                if (User_Def_Flag != POUND_DEF)     
		                   User_Def_Flag = 0;
		                User_Def_Bak = 0;
			         }
			         if (fxn_dec == 1)
				        fxn_dec = 0;		    
			         break;
                                          
/* look for end of comment */
		          case '*':
		             if (buffer[0] == '/') {
			            if (!QuoteFlag && !SingleQuoteFlag && CommentFlag) {
			               CommentFlag = 0;
			               for (i=1; i<= (signed) strlen(buffer); i++)
			                  buffer[i-1] = buffer[i];
			            }
		             }
		             else {
			            if (declare_flag)
			               declare_flag++;
		             }
		             break;    
		          
/* reset #define flag on a newline */		          
		          case '\n':
		             if ((User_Def_Flag == POUND_DEF) && (def_extend != 1)) {
		                User_Def_Flag = 0;
		                def_cnt = 0;           
                     }
		             def_extend = 0;   
		             break;
		             
	           }
	           if ((declare_flag) && (special_char != '(') &&
		           (special_char != '*') && (ident_name) ) {
		          Variable (ident_name, 1, open_file, extern_dec);
		          free (ident_name);
		          ident_name = NULL;
	           }
	           special_char = '\0';                   
	        }                
	        
/* find indices for the next pass... */	        
	        keep_index = strcspn (buffer, keep_delimits);
	        kill_index = strcspn (buffer, kill_delimits);
	     }
      }
      return;
   }                               
   
   

   
/* FindVarASM: identify all global variables inside asm files. 
   IMPORTANT NOTE: due to complexity of parsing the asm files, references
   to variables are NOT checked here. The program ASSUMES that all vars
   declared in asm files are used in that file. Since the
   asm files are few, this can be easily done by hand if necessary.  
*/  

   void FindVarsASM (FILE * fp, struct lister * open_file) {
      char buffer[200] = {'\0'}, * token, special_char='\0', 
           * keep_delimits = ";", * kill_delimits = " \t\v\n";
      int kill_index, keep_index, index, shift, i, external_flag = 0,
          dec_flag = 0;


/* keep reading the file as long as there's more text */
      while (1) {

	     if (!fgets (buffer, 200, fp)) {
	        if (token) 
	           free (token);
	        return;               
	     }
		
/* determine where token separators occur */            
	     kill_index = strcspn (buffer, kill_delimits);          
	     keep_index = strcspn (buffer, keep_delimits);     
	 
/* as long as we have some text left in the string... */         
	     while (keep_index || kill_index) {          
	 
/* if the first character is ignorable, then throw it out and 
   shift the buffer left until the first useful character is in the
   0 index of the array 
*/                   
	        if (token) {
	           free(token);
	           token = NULL;
            }
            
	        if (keep_index && (! kill_index)) {
	           shift = strspn (buffer, kill_delimits);
	           for (i=shift; i <= (signed) strlen(buffer); i++)
		          buffer[i-shift] = buffer[i];
	           keep_index -= shift;
	           kill_index = strcspn (buffer, kill_delimits);
	        } 
                                                       

/* break at the first separator, and if it's a keep delimit, store it
   for later use
*/
	        if (kill_index < keep_index)
	           index = kill_index;
	        else {
	           index = keep_index;
	           special_char = buffer[keep_index];
	        }

/* allocate space for the new token, and copy it from the buffer */
	        if (index > 0) {
	           token = malloc ((1+strlen(buffer)) * sizeof(char)); 
	           if (!token) {
	              printf ("malloc failed!\n");
	              exit(1);
	           }
	           for (i=0; i < index; i++)
		          token[i] = buffer[i];
	           token[i] = '\0';
	        }

/* shift the chars of the buffer left to put the next character in  
   the 0th index of the array 
*/
	        for (i=index+1; i <= (signed) strlen(buffer); i++)
	           buffer[i-(index+1)] = buffer[i];
                        
/* if it's a comment, skip the rest of the line */                        
            if (special_char == ';') {            
               if (!fgets(buffer, 200, fp)) {
                  if (token)
                     free (token);
                  return;
               }
               special_char = '\0';
            }                     
/* else, examine what we've found */     
            else {                         
               if (token) {      
           
/* if we were expecting something to be declared, store it */
                  if (dec_flag) {
                     Variable (token, 1, open_file, external_flag);
                     dec_flag = 0;
                     external_flag = 0;
                  }          
               
/* otherwise, if it signals a dec coming, set flags */
                  else {
                     if (strcmp (token, "public") == 0) 
                        dec_flag = 1;
                     else {
                        if (strcmp (token, "extrn") == 0) {
                           dec_flag = 1;
                           external_flag =1;                  
                        }
                     }
                  }
               }
            }
                        
/* set up for next pass */
            keep_index = strcspn (buffer, keep_delimits);
            kill_index = strcspn (buffer, kill_delimits);
         }
      }          
      if (token)
         free (token);
      return;
   } 



  
      
/* IsC: takes a character string token as an arg, determines if it is
   a reserved word in C language. returns 1 if so, 0 if not 
*/      
   int IsC (char * token) {
      struct Cword * current;
      current = CHead;
      while (current) {
	     if (strcmp (current->name, token) == 0) { 
		    if (strcmp (token, "struct") == 0) {
		       if (User_Def_Flag)
		          User_Def_Bak = User_Def_Flag;
		       User_Def_Flag = STRUCT_DEF;
		    }
		    if (strcmp (token, "enum") == 0) {
		       if (User_Def_Flag)
		          User_Def_Bak = User_Def_Flag;  
		       User_Def_Flag = ENUM_DEF;      
		    }
		    if (strcmp (token, "union") == 0) {
		       if (User_Def_Flag)
		          User_Def_Bak = User_Def_Flag;
		       User_Def_Flag = UNION_DEF;      
		    }
		    if (strcmp (token, "typedef") == 0) {
		       if (User_Def_Flag)
		          User_Def_Bak = User_Def_Flag;
		       User_Def_Flag = TYPEDEF_DEF;    
		    }
		    if (strcmp (token, "#define") == 0) {
		       if (User_Def_Flag)
		          User_Def_Bak = User_Def_Flag;
		       PD_DEF_FLAG = 1; 
		       User_Def_Flag = POUND_DEF;      
		    }

/* externs have a special return val- see MakeC for details */
		    if (strcmp (token, "extern") == 0)
		       return 2;
		    if (current->is_type > 0)
		       return current->is_type;
		    else return 1;
	     }
	     else current = current->next;
      }
      return 0;
   }
                                     
                                     
                                     
/* AddType: builds a new type-defined node in the list of reserved C
   phrases, given the new type name and the kind of type definition
*/
   int AddType (char * token) {
      char * type_preface= "", * new_name;
      struct Cword * current = CHead;

      switch (User_Def_Flag) {
	     case STRUCT_DEF:
	        type_preface= "struct ";
/*	        User_Def_Flag = 0; */
	        break;
	     case ENUM_DEF:
	        type_preface= "enum ";
	        break;
	     case UNION_DEF:
	        type_preface= "union "; 
/*	        User_Def_Flag = 0; */
	        break;              
	     case TYPEDEF_DEF:
	        type_preface = "";
	        break;
	     case POUND_DEF:
	        type_preface = "";
	        break;
      }
      new_name= malloc((1+strlen(token)+strlen(type_preface))*sizeof(char));
      if (!new_name) {
	     printf ("malloc failed!\n");
	     exit (1);
      }
      strcpy (new_name, type_preface);
      strcat (new_name, token);
      while (current) {
	     if (strcmp (current->name, new_name) == 0) {
	        free (new_name);
	        User_Def_Flag = 0;
	        return current->is_type;
	     }
	     else current= current->next;
      }
      CTail->next = MakeC (new_name, 1);
      CTail = CTail->next;           
  /*    printf ("Added type: %s\n", new_name); */
      free (new_name);
      return CTail->is_type;
   }

   

/* VARIABLE: do setup when a variable is found. build flag tells the
   function how to handle an unsuccessful search: on a 0, no node is
   built with that name; on a 1 a new node is made with that name*/
   
   void Variable (char * ident_name, int build_flag,
                  struct lister * open_file, int ext_flag) {        
      int i;  
      struct lister * current_user = NULL, * global_refs= NULL;
      struct variable * current_var = NULL;  
      struct t_globals * global_item = NULL;  
      
      open_file->parents_name = TargTail->data->name;
      
      
/* cut the string off when we hit any unwanted chars at the end */            
      for (i=0; i <= (signed) strlen(ident_name); i++) 
         if ((ident_name[i] == '[') || (ident_name[i] =='.') ||   
             (ident_name[i] == ':') ||
             ((ident_name[i] == '-') && (ident_name[i+1] == '>'))) 
            ident_name[i] = '\0';    
                            
/* if there's something in the variable list */                            
      if (VarHead) {
         current_var = VarHead;       
                  
/* as long as the list continues... */         
         while (current_var) { 
/*            printf ("current var: %s\n", current_var->name);  */

/* check if the names match at this variable, and their declared_in fields
   are files under the same target 
*/
            if ((strcmp (current_var->name, ident_name) == 0) &&
                ( (strcmp (current_var->declared_in->data->name, open_file->data->name) == 0)
                || ( (current_var->declared_in->targ_code = TargTail->targ_code)
                 || (current_var->extern_dec ) || (ext_flag == 1)))) {

/* if so, then if one of the vars is an extern, or if we've got a reference  
   to this variable....
*/
               if ( (current_var->extern_dec) || (ext_flag == 1) ||
                    ((!build_flag) && (strcmp (open_file->data->name, current_var->declared_in->data->name) == 0))) {

/* if we've found the original declaration of something that's extern,
   copy that declare file data into the extern version
*/
                  if ( (current_var->extern_dec) && (ext_flag == 0)) {
                     current_var->declared_in = MakeList (open_file->data);
/* EXPERIMENT: try copying the target code of the new target into the old one */
                     current_var->declared_in->targ_code = TargTail->targ_code;
                  }
           
/* now check the list to see if we already know that this var is used by
   this file
*/
                  if (current_var->used_by) {
                     current_user = current_var->used_by;
                     while (current_user) {

/* if so, return */
                        if (current_user->data->name == open_file->data->name)
                           return;

/* otherwise, keep going */
                        if (current_user->next) 
                           current_user = current_user->next;

/* when we reach the end of the list, add a new node for the reference */
                        else {
                           current_user->next = MakeList (open_file->data);
                           current_user->next->parents_name = open_file->parents_name; 

/* now update the list of vars which are global to this target */                           
                           if (TargTail->data->targ_globals_list) {
                              global_item = TargTail->data->targ_globals_list;

/* check if this is already in the list, if not make a new node */
                              while (global_item) {
                                 if (strcmp (global_item->name, ident_name) == 0) {
                                    if (global_item->also_in) {
                                       global_refs = global_item->also_in;
                                       while (global_refs->next)
                                          global_refs = global_refs->next;
                                       global_refs = MakeList (open_file->data);
                                       return;
                                    }
                                    else {
                                       global_item->also_in = MakeList (open_file->data);
                                       return;
                                    }
                                 }
                                 if (global_item->next)
                                    global_item = global_item->next;
                                 else {
                                    global_item->next = MakeTGlobal (current_var);
                                    return;
                                 }
                              }
                           }
                           else {
                              TargTail->data->targ_globals_list = MakeTGlobal (current_var);
                              return;
                           }
                        }
                     }
                  }
                  else {
                     current_var->used_by = MakeList (open_file->data);
                     current_var->used_by->parents_name = open_file->parents_name; 
                     return;
                  }
               }
            }
      
            current_var = current_var->next;
         }
      }            

/* otherwise, this variable has not been found yet, so put it in the 
   list of vars
*/    if (build_flag) {
         if (!VarHead) {
            VarHead = MakeVariable (ident_name, open_file, ext_flag);
            VarTail = VarHead;                           
                
/* if this is a .ASM file, assume the variable is used */        
   
            if ((open_file->data->name)[strcspn(open_file->data->name, ".")+1] == 'a') 
               VarHead->used_by = MakeList (open_file->data);
         }
         else {
            VarTail->next = MakeVariable (ident_name, open_file, ext_flag);
            VarTail = VarTail->next;                           

/* if this is a .ASM file, assume the variable is used */                
            if ((open_file->data->name)[strcspn(open_file->data->name, ".")+1] == 'a')
               VarTail->used_by = MakeList (open_file->data);
         }     
      }
   }
      
                           
                           
                           
                           

/* FUNCTION: do setup when a function is found */
   void Function (char * ident_name) { 
      struct function * current_fxn = FxnHead;
      
      while (current_fxn) {
         if (strcmp (current_fxn->name, ident_name) == 0)
            return;
         current_fxn = current_fxn->next;
      }
      if (!FxnHead) {
         FxnHead = MakeFunction (ident_name);
         FxnTail = FxnHead;
      }
      else {
         FxnTail->next = MakeFunction (ident_name);
         FxnTail= FxnTail->next;
      }
   }


/* MakeVariable: builds and returns nodes for newly found variables 
*/
   struct variable * MakeVariable (char * ident_name, struct lister * open_file,
                                   int ext_flag) {
      struct variable * new;
      new = malloc (sizeof (struct variable));
      if (!new) {
         printf ("malloc failed!\n");
         exit (1);
      }
      new->name = malloc ((1+strlen(ident_name))*sizeof (char));
      if (!new->name) {
         printf ("malloc failed!\n");
         exit (1);
      }
      strcpy (new->name, ident_name);
      new->type = 0;
      new->next = NULL;
      new->used_by = NULL;
      new->declared_in = open_file;            
      if (ext_flag) 
         new->extern_dec = 1;
      else new->extern_dec = 0;
      GLOBALS_FOUND++;         
      new->pd_def_flag = PD_DEF_FLAG;
      PD_DEF_FLAG = 0;
 /*     printf ("Variable: %s\n", ident_name); */
      return new;
   }                                        
   
   
/* MakeFuntion: creates and returns nodes for newly found functions 
*/

   struct function * MakeFunction (char * ident_name) {
   
      struct function * new;
      new = malloc (sizeof (struct function));
      if (!new) {
         printf ("malloc failed!\n");
         exit (1);
      }
      new->name = malloc ((1+strlen(ident_name))*sizeof (char));
      if (!new->name) {
         printf ("malloc failed!\n");
         exit (1);
      }
      strcpy (new->name, ident_name);
      new->next = NULL;
/*      printf ("Function: %s\n", ident_name); */
      return new;
   }                                        


/* MakeC: creates and returns a reserved word node
*/
   struct Cword * MakeC (char * buffer, int type) {
   
/* current_type_index is used to give a unique int code to every 
   type-declarator. it works in conjunction with ISC. when ISC determines
   if something is a C token, it returns 0 if it is not, and 1 if it
   is a plain, non-declarator C token. It returns > 1 if it is a 
   declarator token. However, we must treat extern decs specially for
   purposes of var tracking, so ISC will return a 2 for externs.
   Non-extern, declarator tokens will have vals > 2. Since we inc the
   current_type_index each time before it used, we start the
   count at 2... so that the first assigned val is 3. Note that we
   also skip the next digit, which is reserved for ptrs to the previous
   type. (ex: if int is 3, int * is 4, then float could be 5... etc).
*/ 
      static current_type_index = 2;
      struct Cword * new;
      new = malloc (sizeof (struct Cword));
      if (!new) {
	     printf ("malloc failed!\n");
	     exit (1);
      }
      new->name = malloc ((strlen (buffer) + 1) * sizeof (char));
      if (!new->name) {
	     printf ("malloc failed here!\n");
	     exit (1);
      }
      strcpy (new->name, buffer);              
      if (type) {
         current_type_index++;
         new->is_type = current_type_index;
         current_type_index++;
      }
      else new->is_type = 0;
      new->next = NULL;
      return new;
   }

   
   
   
/* SetupC: creates the global list of a priori reserved words, which
   the lexer can ignore
*/
   void SetupC (void) {
      struct Cword * current;   
      CHead = MakeC ("auto", 0);
      current = CHead;
      current->next = MakeC ("#define", 0);
      current = current->next;
      current->next = MakeC ("break", 0);
      current = current->next;
      current->next = MakeC ("case", 0);
      current = current->next;
      current->next = MakeC ("char", 1);
      current = current->next;
      current->next = MakeC ("const", 0);
      current = current->next;
      current->next = MakeC ("continue", 0);
      current = current->next;
      current->next = MakeC ("default", 0);
      current = current->next;
      current->next = MakeC ("do", 0);
      current = current->next;
      current->next = MakeC ("double", 1);
      current = current->next;
      current->next = MakeC ("else", 0);
      current = current->next;
      current->next = MakeC ("enum", 0);
      current = current->next;
      current->next = MakeC ("extern", 0);
      current = current->next;      
      current->next = MakeC ("far", 1);
      current = current->next;          
      current->next = MakeC ("_far", 1);
      current = current->next;
      current->next = MakeC ("__far", 1);
      current = current->next;
      current->next = MakeC ("FILE", 1);
      current = current->next;
      current->next = MakeC ("float", 1);
      current = current->next;
      current->next = MakeC ("for", 0);
      current = current->next;
      current->next = MakeC ("goto", 0);
      current = current->next;
      current->next = MakeC ("if", 0);
      current = current->next;
      current->next = MakeC ("int", 1);
      current = current->next;
      current->next = MakeC ("long", 1);
      current = current->next;
      current->next = MakeC ("near", 1);
      current = current->next;
      current->next = MakeC ("NULL", 0);
      current = current->next;
      current->next = MakeC ("register", 0);
      current = current->next;
      current->next = MakeC ("return", 0);
      current = current->next;
      current->next = MakeC ("short", 1);
      current = current->next;
      current->next = MakeC ("signed", 0);
      current = current->next;
      current->next = MakeC ("sizeof", 0);
      current = current->next;
      current->next = MakeC ("static", 0);
      current = current->next;
      current->next = MakeC ("struct", 0);
      current = current->next;
      current->next = MakeC ("switch", 0);
      current = current->next;
      current->next = MakeC ("typedef", 0);
      current = current->next;
      current->next = MakeC ("union", 0);
      current = current->next;
      current->next = MakeC ("unsigned", 0);
      current = current->next;
      current->next = MakeC ("void", 1);
      current = current->next;
      current->next = MakeC ("volatile", 0);
      current = current->next;
      current->next = MakeC ("while", 0);
      CTail = current->next;   
      DefaultCTail = CTail;
   }  
   
   
   
/* MakeTGlobal: creates and returns structure nodes for variables which
   are global to a target file
*/

   struct t_globals * MakeTGlobal (struct variable * current_var) { 
      struct t_globals * new;
      new= malloc (sizeof (struct t_globals));
      if (!new) {
         printf ("malloc failed!\n");
         exit (1);
      }
      new->name= current_var->name;
      new->also_in = NULL;
      new->next = NULL;   
      return new;
   }
   
   
   
   

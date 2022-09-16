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
 *    File Name:	defdecs.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * macros for the different type declarations which may be found
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
   #define STRUCT_DEF 1
   #define ENUM_DEF 2
   #define UNION_DEF 3
   #define TYPEDEF_DEF 4
   #define POUND_DEF 5

/* structure for storing files & their include data
   Integer types are associated with each node: 0 for target nodes,
   1 for source nodes, and 2 for header nodes
*/
   struct node {
      int type;
      int targ_code;  /* unique code to differentiate all targets */
      char * name;
      struct lister * includes; 
      struct t_globals * targ_globals_list;
   };                                      
   
   
/* structure for storing pointers to all variables which are local to
   a given target file node 
*/
   struct t_globals {
      char  * name;             /* name of the current var */
      struct t_globals * next;  /* ptr to rest of vars */
      struct lister * also_in;  /* list of files where var appears */
   };
   
   
                               
/* structure for holding lists of file info nodes (above) */

   struct lister {   
      int targ_code;
      char * parents_name;
      struct node * data;
      struct lister * next;
   };
   
   
/* structure for storing information about variable names and where
   the var is used
*/                
   struct variable {
      char * name;
      char * target_name;
      int type;            
      int extern_dec;    
      int pd_def_flag;
      struct lister * declared_in;
      struct lister * used_by;
      struct variable * next;
   };                     


/* structure for storing information about function names and uses */
   struct function {
      char * name;
      struct function * next;
   };
             

/* structure for temporary lists of include files found in .dep files */
    struct included_file {
       char * name;
       struct included_file * next;
    }; 


/* structure for C tokens */

   struct Cword { 
      char * name;
      int is_type;
      struct Cword * next;
   };
                                 
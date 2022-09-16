/************************************************/    
/* Created by:	Carl Leeber						*/
/* Created on:	21-NOV-1994						*/
/* Name:		depend.cpp						*/
/* Function:	Find #includes and nested		*/	  
/*				#includes in C/CPP programs	and	*/
/*				list in MAKe dependency format	*/
/************************************************/
/* Modification History							*/
/************************************************/
/*	29-NOV-1994	Carl Leeber, Dependencies work	*/
/*	30-NOV-1994 Carl Leeber, Date/Time works	*/
/*	 1-DEC-1994	Carl Leeber, Fix Pgm Rnt value	*/
/*	 7-DEC-1994 Carl Leeber, Add ASM depends	*/
/*	 9-DEC-1994 Carl Leeber, Add DEBUG stmts	*/		
/*  13-APR-1995 Carl Leeber, Add semi-colon cntr*/
/*  26-JUL-1995 JohnBartels, *p.h errs non-fatal*/
/*  27-JUL-1995 JohnBartels,Add *p.h dummy-write*/
/*  15-JAN-1996 Steven Kaufman, Comment Handling*/
/*	01-FEB-1996 Steven Kaufman, Matthew Schnee	*/
/*		support for #ifdef, #ifndef, etc.       */
/*  07-FEB-1996 Carl Leeber, Added p.h back in. */
/*  13-FEB-1996 Carl Leeber, Add /D options.    */
/*  18-JUL-1996	Matthew Schnee, added more #if  */
/*      handling.                               */
/* It supports 	defined SYMBOL 					*/
/*				!defined SYMBOL					*/
/*				||, |, &&, &    				*/
/*				numbers							*/
/* 				!numbers						*/
/*  30-JUL-1996 John Bartels, Fix bugs in /D    */
/*      option.                                 */
/*  31-JUL-1996 John Bartels, Changes to support*/
/*      tree structure of sources				*/ 
/*  30-JAN-1997 Trung Ly, Added multi-level path*/
/*		capability for include files.           */
/*  05-FEB-1997 Trung Ly, Fix it so that it correctly
/*              prints to the .dep files                */
/*	16-MAR-1998	Matthew Schnee, fixed null pointer */
/* 				assignment with dectalkf.h */
/************************************************/
/*	Detailed Functional Description				*/
/************************************************/
/* user provides file name as argv to main		*/
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <time.h>  
#include <stdlib.h>
   
//#define DEBUG 
// #define DEBUG1
// #define FILENAME_DEBUG         

/* EXIT_CODE can be any negative number except -1 SIK, MGS*/ 
#define EXIT_CODE -2  /* Value returned to filescan() by any parsing function when current file should be exited */


/*	declare linked list of file names/ptrs		*/
class incldnms /* single linked file list		*/
	{
public:
	char incldnm[256];	/* include file name	*/
	class incldnms *incldnmpn;/* next child		*/
	int beenread; /* been read flag				*/
	int semicnt; /* number of semi-colons found*/
	};
class incldnms incldnml;
/*	declare ptr to head of name list classs		*/
class incldnms *incldnmph = NULL;
/*	declare ptr to tail of name list classs		*/
class incldnms *incldnmpt = NULL;
/*	declare ptr to current element of class		*/
class incldnms *incldnmpc = NULL;					 

#define MAX_LEVELS 200 /* maximum allowable levels of nesting #if's, #ifdefs, etc. */

struct defines_s    /* Linked list of defined symbols */
{
	char name[256];		/* the name of the thing defined */
 	int value;			/* the value of the defined thing */
	struct defines_s *next;
};

typedef struct defines_s *defines_t;

#define HASH_ENTRIES 101 	/* Its a big prime number used for the ash table SIK,MGS */
defines_t defines_table[HASH_ENTRIES];	/* Hash table for define list */ 
 
enum File_Type {C_File,ASM_File,RC_File} file_type;  /* Type of current input file SIK,MGS */

/*	declare time varable and pointer			*/
time_t ltime;
struct tm *gmt;

/* This structure stores variables which are common to filescan() and to all functions that filescan() calls. SIK,MGS */
struct scan_vars_s
{    
	char filename[256];	/* Holds the name of the current file being processed */
	char readline[400]; /* string of chars to store include file names	*/
	int line_length;	/* holds the line length */
	char readname[56];  /* stores include file name taken out of readline */
	char *curperiod;	/* stores pointer from strtok while parsing curflname */
	FILE *infile;		/* pointer to the input file */
	int ifdef_count;	/* Stores the current level of nesting within an #if-type block */ 
					 	 /* positive number represents the nesting level of #ifdef's */
	int ifdef_process[MAX_LEVELS];  /* variable to simulate a stack to store information about */
									/* 	the current and previous ifdef blocks */    
									
	int warnings[MAX_LEVELS];  /* Tells if we are in a logical block whose state could not be determined */
	int warning_index;
};	

typedef struct scan_vars_s *scan_vars_t;

/*	declare global function prototypes			*/
scan_vars_t initialize_scan_vars(void);
int filescan(char*);
FILE *fopeni(char *);
FILE *fopeno(char *);
int fcloseio(FILE *);
void wrtsemcnt(FILE *);
void delincldnms(void);
void makeincldnms(char *); 

/* These functions are used to parse remaining text on a line after a # followed by an e, u, d or i is encountered. SIK,MGS */
int process_pound_e(scan_vars_t scan_vars,int i);
int process_pound_u(scan_vars_t scan_vars,int i);
int process_pound_d(scan_vars_t scan_vars,int i);
int process_pound_i(scan_vars_t scan_vars,int i); 

/* These functions are used to process remaining line after any of the keywords are found */
/*	i.e. those after parse_ in the function name SIK,MGS */
int parse_endif(scan_vars_t scan_vars,int i);
int parse_else(scan_vars_t scan_vars,int i);
int parse_undef(scan_vars_t scan_vars,int i);
int parse_define(scan_vars_t scan_vars,int i);
int parse_elif(scan_vars_t scan_vars,int i);
int parse_if(scan_vars_t scan_vars,int i, int from_elif = 0);
int parse_ifndef(scan_vars_t scan_vars,int i);
int parse_ifdef(scan_vars_t scan_vars,int i);
int parse_include(scan_vars_t scan_vars,int i); 

int parse_asm_file(scan_vars_t scan_vars,int i);  /* Parses current line in an asm file. SIK,MGS */

char *newtok(scan_vars_t scan_vars,int &i,char *delimiters); /* Returns next valid token from current line of input file being read. SIK,MGS */
int is_delimiter(char c,char *delimiters);  /* Called by newtok(). SIK,MGS */
void cant_handle(scan_vars_t scan_vars);    /* Called by parse_if() when a #if is encountered with an expression type not supported. SIK,MGS */
int check_token(char *token);   /* Called by parse_if(); used to determine if the current token is a #if expression which is supported. SIK,MGS */
int check_token_new(char *token);   /* Called by parse_if(); used to determine if the current token is a #if expression which is supported. SIK,MGS */
int check_rest_of_line(scan_vars_t scan_vars,int i);  /* Called by parse_if(); used to determine if the current line has symbols which are not */
													  /* supported for #if expressions. SIK,MGS */

int strip_comments(scan_vars_t scan_vars,int i);	/* Used to skip past the contents of comments and continue reading the file. SIK,MGS */
							 
int is_all_digit(char *str);  						/* Decides if string contains all digits. SIK,MGS */
int add_include_name(char *filename); 				/* check list of include files. SIK,MGS */
void add_define_to_list(char *name, int value);     /* Adds name and value of a defined symbol to linked list. SIK,MGS */
defines_t look_up_define(char *name);               /* Checks list of defined symbols for an occurance of the name passed to it. SIK,MGS */
void remove_define(char *name);                     /* Removes defined symbol from list. SIK,MGS */
void free_defines();                                /* Deletes linked list of defined names. SIK,MGS */
	                           

/*	declare Input and Output File Pointers		*/
/* FILE *ifp;*/  /* the file have to be local to() */
FILE *ofp;
FILE *ofp2;

/*	declare char array for current file names	*/
char curflname[256];
char curiflname[256];
char curoflname[256];
char curiflext[256];
char curiflopt[256];
char curifltoken[256];

/* 	create dependency file from supplied argv	*/
main(int argc, char *argv[])
	{
       int index;                   
       char path[256]={'\0'};
       for (index=0;index<HASH_ENTRIES;index++)
       		defines_table[index]=NULL;
/*	if no args; print error */
	if (argc == 1)
		{
		printf("\nDEPEND-E-NOARG: No input arguments detected\n");
		return (1); /* signal error			*/			
		}
	else
		{
/*	save argv in buffer							*/
		strcpy(curflname, argv[1]);
/*	establish input file extension				*/
		strcpy(curiflext, strrchr(curflname,'.'));
/*	2nd & 3rd argument in cmd line?				*/
        if(argc >= 3)
		{
                        for (int i=2; i < argc; i++) {
                                if (strcmp ("/D", argv[i])==0) {
                                        continue;
                                }
                                if (strncmp ("/D", argv[i], 2)==0) {
                                        add_define_to_list (argv[i]+2, 1);
                                        continue;
                                }
                                else
                                        add_define_to_list (argv[i], 1);

                        }
		}
/*	create input file name						*/
		strcpy(curiflname,curflname);
/*	establish base file name					*/

// JDB: ...but first extract the path name
        strcpy (path, curflname);
        *((strrchr (path, '\\'))+1) = '\0';
		*(strrchr (curflname, '.')) = '\0';
//		printf("\nTrung Test:  curflname is %s\n", curflname);
                                       		
/*	create curoflname (w/.DEP) from base name	*/
		strcpy(curoflname,curflname);
		strcpy(curoflname,strcat(curoflname,".DEP"));
/*	verify file extension is a supported type 	*/
		if (strcmp(curiflext,".c") == 0)
		{
			file_type=C_File;
		}
		else  /* Store the input file type for future reference. SIK,MGS */
		{
			if (strcmp(curiflext,".asm")== 0)
			{
				file_type=ASM_File;
			}
			else
			{
				if (strcmp(curiflext,".rc") == 0)
				{
					file_type=RC_File;
				}
				else
				{
					printf("\nDEPEND-E-NOSUP: No support for file type: %s\n", curiflext);
					return (1); /* signal error			*/			
				}
			}
		}

/*	open output file, establish ofp				*/
		if ((ofp = fopeno(curoflname)) == NULL)
			return (1); /* signal error			*/
/*	write the date and time to the ofp			*/
		time(&ltime);
		gmt = localtime(&ltime);
		fprintf(ofp,"#This is file %s .\n",curoflname);
		fprintf(ofp,"#%s",asctime(gmt));
/*	write the input file name to output file	*/
		if(strrchr(curflname,'\\') != NULL)
			strcpy(curflname,(strrchr(curflname,'\\'))+1);
		fprintf(ofp,"%s_DEP = ",curflname);
/*	create a class object to hold file name		*/
		makeincldnms(curiflname);
		incldnmpc->beenread = 1;
	   
	   
/* the call to the recursive version of filescan */
/* filescan takes  2 parameters the file name to search 
   and the output file pointer */							
		
		#ifdef DEBUG
			printf("DEPEND-D-going into filescan from main\n");
			printf("DEPEND-D-current input file name %s\n",curiflname);
		#endif       
		
		filescan(curiflname); 	/* a recursive function to search for #include's. SIK,MGS */
		
		#ifdef DEBUG
			printf("DEPEND-D-left filescan-back in main\n");
		#endif
								
		/* Loop thru entire list of include files writing each name to the output file: */
		incldnmpc = incldnmph->incldnmpn;
		while(incldnmpc != NULL)
		{
			fprintf(ofp," \\\n\t%s",incldnmpc->incldnm); 
			incldnmpc = incldnmpc->incldnmpn;
		}

/*	write 'closing' line of output file			*/
		fprintf(ofp,"\n");						
/*	write compile dependency line				*/
		if( (strcmp(curiflext,".c") == 0) ||
			(strcmp(curiflext,".asm") == 0))
			{
			fprintf(ofp,
				"\n%s.obj : %s $(%s_DEP) %s.dep \n\n",
				curflname,path,curflname,curflname);
			}
		else
			{
			fprintf(ofp,
				"\n%s.res : %s $(%s_DEP) %s.dep \n\n",
				curflname,path,curflname,curflname);
			}
/*		fprintf(ofp,"\n%s.obj : %s.c $(%s_DEP)\n\n",curflname,curflname,curflname); */

/*	write out file name and semi count			*/
		wrtsemcnt(ofp);

/*	close open output file						*/
		fcloseio(ofp);
		} /* endif for args test				*/

/*	travel list of objects, delete 'em all		*/
	delincldnms();
	free_defines(); /* Delete the list of defined expressions */
	return 0;
	}
								   
								   
/* Searches for #include's in current input file, skipping all comments and handling all #ifdef, #if, etc. 		   */
/* appropriately. On finding a #include, the .h file specified in the #include statement is searched immediately.  */
/* This is done by calling filescan() recursively, passing in the name of the .h file found. SIK,MGS */
int filescan(char *filename)
{
	scan_vars_t scan_vars;
	class incldnms* current_incld = incldnmpt;
	int semicount = 0;   	/*	init semi-colon counter						*/
	int i;	/* loop counter */
	int Done = 0; /* Used to determine if we are done scanning a line */
	int dot_mark;
	FILE *ofp2;
    static int lvl_count = 0;
    static char original_name[256] = {'\0'};
    char * dir_name;
    char path_name[256] = {'\0'};           
    char current_name[256] = {'\0'};
    
// JDB: support file searching in the new source tree structure...    
    if (lvl_count == 0) {
       strcpy (original_name, filename);
       if ((dir_name = strrchr (original_name, '\\')))
          *(dir_name+1) = '\0';
       else 
          original_name[0] = '\0'; 
    }
    else { 
    	if (filename[0] != '\\') {  
    	    strcpy (current_name, filename);
       		strcpy (path_name, original_name);
       		strcat (path_name, filename);
       		strcpy (filename, path_name);
       	}                                         
    }                    
    
    lvl_count++;
        
	#ifdef FILENAME_DEBUG
		printf("DEPEND-D-Current file is: %s\n", filename);
	#endif
	
	#ifdef DEBUG 
		printf("DEPEND-D-entering filescan with the input %s\n",filename);
	#endif						

	scan_vars=initialize_scan_vars();
    strcpy(scan_vars->filename, filename); /* This is done so that any function called by */
    									   /*  filescan can reference the current filename in case any */
    									   /*  warning message needs to be printed. */
	/* Open the input file here */		 
	#ifdef DEBUG
		printf("DEPEND-D-DEPEND-D-About to open the file %s\n",filename);
	#endif          


// JDB: important- if we used a path name, we have to replace the name
// that was originally stored for this include file!
    if ((scan_vars->infile=fopen(filename, "r"))) { 
// printf ("opened: %s\n", filename);
       strcpy (incldnmpt->incldnm, filename);      

    }
    else 
	{
	
/* find the dot in filename */ 
		dot_mark= strcspn (filename, "."); 
/* if filename is of format: *p.h, then don't trigger fatal error, just
   skip the rest of procedure for this .h file 
*/			                                        

// for prototype files, look in protos dir first... 
		if ((filename[dot_mark-1] == 'p') &&
		   (filename[dot_mark+1] == 'h')) {        
		   strcpy (filename, ""); 
//		   strcpy (filename, "protos\\");
		   strcat (filename, current_name);

		   
			if ((scan_vars->infile=fopen (filename, "r"))) {
				strcpy (incldnmpt->incldnm, filename);      
			}
			else {		   
				printf("DEPEND-E-Can't open the file %s\n",filename);
				printf ("Continuing anyway...\n");  

/* write a dummy *p.h  file for this name...	*/		   
				if (! (ofp2 = fopeno (filename))) {
					printf ("Fatal err: Couldn't write dummy file!\n");
					exit(1);
				}
			
/* just write a blank comment in it and then close it up */
				strcpy (incldnmpt->incldnm, filename);                
				fputs ("/* */ ", ofp2);
				fclose (ofp2);         
				printf ("Wrote dummy file '%s'\n", filename);
				return(1);
			}
		}
		else
		{
			strcpy (filename, "");
			strcat (filename, current_name);
                                               
			if ((scan_vars->infile=fopen(filename,"r")))
				strcpy (incldnmpt->incldnm, filename);
			else
			{
				printf("DEPEND-E-file %s not found, exiting\n",incldnmpt->incldnm);  
				exit(3);
			}
			
		}		
	}
	#ifdef DEBUG
		printf("DEPEND-D-Opened the file %s\n",filename);
	#endif

/*	while no EOF has been encountered			*/
/*	read one record in open file				*/
	while ((fgets(scan_vars->readline,390,scan_vars->infile) != NULL)  && (i != EXIT_CODE))
		{		
		if (
			(( file_type == ASM_File) ||
			 ( file_type == RC_File)) ||
			(( file_type == C_File) &&
			 (strstr(scan_vars->readline,";") != NULL)) )
			{
/*	increment semi colon counter if true		*/
 
			semicount++;
			}
			
		scan_vars->line_length=strlen(scan_vars->readline); /* the length of the line */ 
		#ifdef DEBUG
			printf("DEPEND-D-the line is %s\n",scan_vars->readline);
		#endif
		i = 0; /* Counter used in text parsing */ 
		Done = 0;	/* Used to determine when we are done processing a line */  
		while (!Done) 	 /* (i=0;i<scan_vars->line_length;i++) */
		{			
			if (file_type==ASM_File)	  /* in an asm file */
			{
				i=parse_asm_file(scan_vars,i);
			}
			else   /* in a c or rc file */
			{
				switch (scan_vars->readline[i])  /* Parses the current line */
				{
					case '/':   /* Possibly found the start of a comment. */
						#ifdef DEBUG
							printf("DEPEND-D-calling strip_comments\n");
						#endif  
						i=strip_comments(scan_vars,i);
						if (i==EXIT_CODE) /* end of file is reached */ 
						{
							#ifdef DEBUG
								printf("DEPEND-D-strip comments got to EOF\n");
							#endif
						}
						break;  
					case '#':  /* we found a #  may be the start of something */
						#ifdef DEBUG
							printf("DEPEND-D-A # was found\n");
						#endif
						switch (scan_vars->readline[i+1])
						{
						case 'i': /* Process anything beginning with a #i */
							i=process_pound_i(scan_vars,i);
							break;	
						case 'd': /* Process anything beginning with a #d */ 
							i=process_pound_d(scan_vars,i);
							break;
						case 'u': /* Process anything beginning with a #u */
							i=process_pound_u(scan_vars,i);
							break;
						case 'e': /* Process anything beginning with a #e */
							i=process_pound_e(scan_vars,i); 
							break; /* switch scan_vars->readline[i+1] */
						}
						break; /* switch (scan_vars->readline[i]) */
					}	  
 
				if (i==EXIT_CODE)  /* Exit the while loop */
					break;		
			}
			i++; /* Increment counter */ 
			Done = (i >= scan_vars->line_length); 
		} /* end of the while loop */
		
/*	debug the data at this point				*/
		#ifdef DEBUG
			printf("DEPEND-D-scan_vars->readline: %s\n",scan_vars->readline);
		#endif
 
	 	
	} /* while loop */  
	fclose(scan_vars->infile);
	current_incld->semicnt = semicount;	 /* set semi-colon counter of the current file in the include list */
	#ifdef DEBUG
		printf("DEPEND-D-leaving filescan\n");
	#endif  
	free(scan_vars);
	return(0);
}						

/* Adds the name of the include file found to the linked list of type incldnms. SIK,MGS */ 
int add_include_name(char *filename)
{	
	class incldnms *temp_incld_ptr = incldnmph;
												
	#ifdef DEBUG
		printf("DEPEND-D-entering add_include_name\n");
	#endif												
	/* Searches through each element of the list or until match is found. */
	while (temp_incld_ptr != NULL)
	{
		/* Check if current filename equals name stored on list. */
		#ifdef DEBUG
			printf("DEPEND-D-processing element of the include name list %s\n",temp_incld_ptr->incldnm);
		#endif
		if (strcmp(filename, temp_incld_ptr->incldnm) == 0)
		{
			#ifdef DEBUG
				printf("DEPEND-D-exiting add_include_name 1\n");
			#endif
			return(1);
		} 
		temp_incld_ptr = temp_incld_ptr->incldnmpn;
	}
	#ifdef DEBUG
		printf("DEPEND-D-Adding filename %s to list\n", filename);
	#endif
	makeincldnms(filename);	/* Add filename to list if wasn't found on existing list */
	return(0);
	#ifdef DEBUG
		printf("DEPEND-D-exiting add_include_name 0\n");
	#endif
}

/************************************************/
/* open input file, establish and return fpi	*/
FILE *fopeni(char *fnamei)
	{									   
	FILE *fpi;
	if ((fpi = fopen(fnamei, "r")) == NULL)
		{
/*	if error:									*/
		printf("\nDEPEND-E-NOIF: Can't open %s\n", fnamei);
/*	return with error							*/
		}
	return fpi; /* success					*/
	}

/************************************************/
/*	open output file, establish fpo				*/
FILE * fopeno(char *fnameo)
	{
	FILE *fpo;
	if ((fpo = fopen(fnameo, "w")) == NULL)
		{
/*	if error:									*/
		printf("\nDEPEND-E-NOOF: Can't open %s\n", fnameo);
/*	return with error							*/
		}
	return fpo; /* success					*/
	}

/************************************************/
/*	close any file								*/
int fcloseio(FILE *fpio)
	{
	return (fclose(fpio));
	}

/************************************************/
/*	travel list of objects,						*/
/*	write out file name and semi count			*/
void wrtsemcnt(FILE *wofp)
	{
	int runcnt = 0;
/*	end last line and set incldnpc to head		*/
	fprintf(wofp,"\n");
	incldnmpc = incldnmph;
	while (incldnmpc != NULL)
		{
/*	write the commented file name and semi count*/
		fprintf(wofp,"# %s has count of: %d\n",
			incldnmpc->incldnm,incldnmpc->semicnt);
/*	Keep running total of counts				*/
		runcnt = runcnt + (incldnmpc->semicnt);
/*	get the pointer to the next object			*/
		incldnmpc = incldnmpc->incldnmpn; 
		}
/*	write out total semi count					*/
		fprintf(wofp,"#			Total count is: %d\n",runcnt);
	}

/************************************************/
/*	travel list of objects, delete 'em all		*/
void delincldnms(void)
	{
		while (incldnmph != incldnmpt)
		{
/*	save the pointer to the next object			*/
		incldnmpc = incldnmph->incldnmpn;
/*	delete the head of the list					*/
		delete incldnmph;
/*	set new head of the list of objects, loop...*/
		incldnmph = incldnmpc;
		}
/* delete the last one if it exists				*/
	if (incldnmph != NULL)
		delete incldnmph;
	}

/************************************************/
/*	create a new class object to hold file name	*/
void makeincldnms(char *wreadname)
{
/*	if the head list pointer is NULL...			*/
	if (incldnmph == NULL)
	{									 
/*	create 1st class, head, current, tail ptrs	*/
		incldnmph = new incldnms;
		incldnmpt = incldnmph;
		incldnmpc = incldnmph;
	}
	else   /* If list is NOT empty... */
	{
		incldnmpt->incldnmpn = new incldnms;
		incldnmpt = incldnmpt->incldnmpn;					
	}
	incldnmpt->incldnmpn = NULL;  /*	set next pointer to NULL */																
	incldnmpt->beenread = 0; /*	set been read flag to 0						*/
	incldnmpt->semicnt = 0; /*	set number of semi-colons found to 0		*/
	strcpy(incldnmpt->incldnm,wreadname); /*	copy file name to list element				*/
}
/************************************************/

int get_hash_pos(char *name)
{
	int index;
	int length;  
	int value=0;
	length=strlen(name);
	#ifdef DEBUG
		printf("DEPEND-D-entering get_hash_pos with parms %s \n",name);
	#endif
	for (index=0;index<length;index++)
		value+=name[index];
	#ifdef DEBUG
		printf("DEPEND-D-exiting get_hash_pos with parms %d\n",(value % HASH_ENTRIES));
	#endif
	return(value % HASH_ENTRIES);
}		
/************************************************/

void add_define_to_list(char *name, int value)  
{			   
	defines_t defines_p; /* pointer the temporary element */
	int table_index;	/* Index in hash table */ 
	#ifdef DEBUG
		printf("DEPEND-D-entering add_define_to_list with parms %s %d\n",name,value);
	#endif
	defines_p=look_up_define(name); /* is the current thing in the list */
	if (defines_p==NULL) /* not in the list */
	{
		defines_p=(defines_t)malloc(sizeof(struct defines_s)); /* allocate space fo the structure */
		if (defines_p==NULL)				  
		{
			printf("DEPEND: Out of memory\n"); /* no more memory */
			exit(-1);
		} 
		
		strcpy(defines_p->name,name); /* copy the name */
		table_index = get_hash_pos(name);
		defines_p->next=defines_table[table_index]; /* add item to the front of the list */
		defines_table[table_index]=defines_p;
	}                                                                                              
	
	else	   
	{		   /* the item is in the list so update the informataion */ 
	
		defines_p->value=value;			   /* copy the value */   
		
	}						
	#ifdef DEBUG
		printf("DEPEND-D-Exiting add_define_to_list\n");
	#endif
}
/******************************************************************************************/
	
defines_t look_up_define(char *name)
{
	defines_t defines_p;
	#ifdef DEBUG
		printf("DEPEND-D-entering look_up_define with parms %s\n",name);
	#endif
	if (name==NULL)
		return(NULL);
	defines_p=defines_table[get_hash_pos(name)];		/* find row of hash table */
	while (defines_p!=NULL)
	{   
		#ifdef DEBUG
			printf("DEPEND-D-look_up_define; processsing %s length: %d\n",defines_p->name, strlen(defines_p->name));
			printf("DEPEND-D-look_up_define; checking against %s length: %d\n", name, strlen(name));
		#endif						 
		if (strcmp(defines_p->name,name)==0)	/* do we have match */
			break;
		defines_p=defines_p->next;	/* move to the next element */
	}
	#ifdef DEBUG
		if (defines_p!=NULL)                                      
			printf("DEPEND-D-exiting look_up_define 1\n");
		else
			printf("DEPEND-D-exiting look_up_define 0\n");
	#endif
	return(defines_p);	/* return the found element or NULL */
	
}
/******************************************************************************************/	

void remove_define(char *name)
{
	defines_t defines_p,defines_q;
	#ifdef DEBUG
		printf("DEPEND-D-entering remove_define with parm %s\n",name);
	#endif
	defines_p=defines_table[get_hash_pos(name)]; /* points to the element being looked at */
	defines_q=NULL;			/* q is the element just before p */
	while (defines_p!=NULL)	/* find the element in the list */
	{
		if (strcmp(defines_p->name,name)==0)
			break;
		defines_q=defines_p;
		defines_p=defines_p->next;
	}   
	if (defines_p!=NULL)
	{
		if (defines_q==NULL) /* we are at the front of the list */
		{												 
			defines_table[get_hash_pos(name)]=defines_p->next;
			free(defines_p);	/* free the extra data */
		}
		else	/* we are anywhere else in the list */
		{
			defines_q->next = defines_p->next;
			free(defines_p);		/* free the data */
		}						  
	}   
	#ifdef DEBUG
		printf("DEPEND-D-exiting remove_define\n");
	#endif
}
/******************************************************************************************/
	
void free_defines()
{    
	int i;
	defines_t defines_p,defines_q;
	for(i=0; i<HASH_ENTRIES; i++)    /* Go through entire hash table */
	{
		defines_p=defines_table[i];
		defines_table[i] = NULL;
		while(defines_p!=NULL)   /* Detele everything on the defines linked list */
		{
			#ifdef DEBUG
				printf("DEPEND-D-free_defines: Deleting row %d entry %s\n", i, defines_p->name);
			#endif
			defines_q=defines_p;
			defines_p=defines_p->next;
			free(defines_q);
		}
	}
}					
/******************************************************************************************/

int is_all_digit(char *str)
{
	int i=0,length;   
	length=strlen(str);
	while (i<length)    /* Checks if every character in the string is a digit */
	{
		if (!isdigit(str[i]))
			return(0);
		i++;
	}
	return(1);	/* Return true if all chars were digits */
}
/******************************************************************************************/
				 
scan_vars_t initialize_scan_vars(void)  /* Creates scan_vars_s struct and init's all of the shared variables stored in the scan_vars_s structure */
{			 
	scan_vars_t scan_vars_p; /* Pointer to scan_vars_s struct */
	scan_vars_p=(scan_vars_t)malloc(sizeof(struct scan_vars_s));  /* Allocates new structure */
	if (scan_vars_p == NULL)
	{
		printf("DEPEND: Out of memory\n");
		exit(-1);
	}
	scan_vars_p->ifdef_process[0]=1;
	scan_vars_p->warning_index=0;
	scan_vars_p->warnings[0]=0;  
	scan_vars_p->ifdef_count=0;				 
	return(scan_vars_p);  /* Returns pointer to structure */
}
/******************************************************************************************/					

int parse_asm_file(scan_vars_t scan_vars,int i)
{					   
	#ifdef DEBUG
		printf("DEPEND-D-entering parse_asm_file\n");
	#endif
	if (scan_vars->readline[i]==';')	 /* in a .asm file-type comment */
	{		
		#ifdef DEBUG
			printf("DEPEND-D-Parse asm file - reading next line\n");
		#endif
		i=scan_vars->line_length+2;
	}
	else if (scan_vars->readline[i]=='i') /* we found an i, may be an include */
	{
		if (strncmp(scan_vars->readline+i,"include",7)==0)
		{									   
			i+=7;
			scan_vars->readname[0]='\0'; /* initialize the read name */
			strcpy(scan_vars->readname,strtok(scan_vars->readline+i," \t\n\r"));
			#ifdef DEBUG
				printf("DEPEND-D-the string read after an asm include is %s\n",scan_vars->readname);
			#endif
			#ifdef DEBUG
				printf("DEPEND-D-1: Calling filescan recursively::::::::::::::\n"); 
				printf("DEPEND-D-%s\n\n", scan_vars->readname);
			#endif
				if (strlen(scan_vars->readname)>0 && !add_include_name(scan_vars->readname)) 
					filescan(scan_vars->readname); /* changed from filename to scan_vars->readname to try to fix bug w/ .asm files */
		}
	}										
	#ifdef DEBUG
		printf("DEPEND-D-leaving parse_asm_file %d\n",i);
	#endif
	return(i);
}
/******************************************************************************************/

int process_pound_i(scan_vars_t scan_vars,int i)
{
	if ((strncmp(scan_vars->readline+i+1,"include",7)==0)&&
		(scan_vars->ifdef_process[scan_vars->ifdef_count] == 1)) 	/* If we found an #include AND ALL nested levels  */
				/* of #if's, #ifdefs, etc. up to this point are active... */
	{						 
		#ifdef DEBUG
			printf("DEPEND-D-found an include at position %d\n",i);
		#endif 
		i=parse_include(scan_vars,i);
	}
	else 
	{
		if (strncmp(scan_vars->readline+i+1,"ifdef",5)==0) 
		{
			i=parse_ifdef(scan_vars,i);
		}
		else 
		{
			if (strncmp(scan_vars->readline+i+1, "ifndef", 6)==0)
			{
				i=parse_ifndef(scan_vars,i);
			}
			else
			{
				if (strncmp(scan_vars->readline+i+1, "if", 2)==0) 
				{						   
					#ifdef DEBUG
						printf("DEPEND-D-Found an if\n");
					#endif 
					i=parse_if(scan_vars,i);
				}
			}
		}
	}
	return(i);
}
/******************************************************************************************/


int process_pound_d(scan_vars_t scan_vars,int i)
{
	if (strncmp(scan_vars->readline+i+1,"define",6)==0)
	{
	/* we found a #define */
	i=parse_define(scan_vars,i);
	/* add the define definition to the list of defines */
	}	  
	return(i);
}



int process_pound_u(scan_vars_t scan_vars,int i)
{
	if (strncmp(scan_vars->readline+i+1,"undef",5)==0)
	{
	/* we found a #undef */
	/* remove the define from the list of defines */
	}	  
	return(i);
}
/******************************************************************************************/


int process_pound_e(scan_vars_t scan_vars,int i)
{
	#ifdef DEBUG
		printf("DEPEND-D-An e was found\n");
	#endif
	if (strncmp(scan_vars->readline+i+1,"endif",5)==0)
	{	
		/* we found a #endif */   
		#ifdef DEBUG
			printf("DEPEND-D Found an endif\n");
		#endif
		i=parse_endif(scan_vars,i);
	} 
	else
	{
		if (strncmp(scan_vars->readline+i+1,"else",4)==0)
		{   
			#ifdef DEBUG
				printf("DEPEND-D-An else was found\n");
			#endif
			i=parse_else(scan_vars,i);
		}
		else
		{	  
			if (strncmp(scan_vars->readline+i+1,"elif",4)==0)
			{
				i=parse_elif(scan_vars,i);
			}
		}
	}        
	return(i);
}
/******************************************************************************************/

int parse_include(scan_vars_t scan_vars,int i)
{    
	static int first_warn = 1;	/* Tells if a warning was printed about this file already */
	int j,k;
	i += 8; /* Advance counter past include */
	/* we found a #include in a c file */
	/* deal with it */   
	scan_vars->readname[0]='\0';   /* initialize scan_vars->readname to null */
	for (j=i;j<scan_vars->line_length;j++)
	{
		switch (scan_vars->readline[j])
		{
		case '<':
			#ifdef DEBUG
				printf("DEPEND-D-found a standard include\n");
			#endif
			j++;
			while (scan_vars->readline[j]!='>'&&j<scan_vars->line_length)
				j++;
			i=j;
			j=scan_vars->line_length+2;
			break;
		case '"':
			#ifdef DEBUG
				printf("DEPEND-D-found a user include\n");
			#endif
			j++;
			k=0;
			while (scan_vars->readline[j]!='"'&&j<scan_vars->line_length)
			{
				scan_vars->readname[k]=scan_vars->readline[j];
				#ifdef DEBUG
					printf("DEPEND-D-%c",scan_vars->readname[k]);
				#endif
				k++; j++;
			}
			scan_vars->readname[k]='\0';
			#ifdef DEBUG
				printf("DEPEND-D-the include filename is %s\n",scan_vars->readname);
			#endif
			#ifdef DEBUG
				printf("DEPEND-D-the rest of the line is %s and %s\n",scan_vars->readline+i,scan_vars->readline+i+1);
			#endif
			if (strlen(scan_vars->readname)>0 && !add_include_name(scan_vars->readname)) 
			{   
				
				#ifdef DEBUG
					printf("DEPEND-D-Checking current warning status: index = %d value = %d\n", scan_vars->warning_index, 
						 	scan_vars->warnings[scan_vars->warning_index]);
				#endif	  
				if (scan_vars->warnings[scan_vars->warning_index] != 0)
				{ 
					if (first_warn)
					{
						printf("DEPEND: WARNING: #if type not supported while processing file: %s\n", scan_vars->filename);
					    first_warn = 0;
					}
					printf("\tIncluding file %s anyway.\n", scan_vars->readname); 
				}
				#ifdef DEBUG
					printf("DEPEND-D-2: Calling filescan recursively\n");
				#endif 
				if(EXIT_CODE == filescan(scan_vars->readname))
					return(EXIT_CODE); 
			}	
			i=j;
			j=scan_vars->line_length+2;
			break;
		case '/':
			j=strip_comments(scan_vars, j);	/* Quick fix to comment problem after a #include */
			i=++j;                                                                                  
			#ifdef DEBUG
				printf("DEPEND-D-parse_include; after skip comments; the line is %s\n",scan_vars->readline);
				printf("DEPEND-D-\t\tj=%d i=%d line_length=%d\n",j,i,scan_vars->line_length);
			#endif
			break;
		}				  
	}
	return(i);
}
/******************************************************************************************/

int parse_ifdef(scan_vars_t scan_vars,int i)
{
	char *tempp;
	defines_t sym_name;
	/* look up in the list of defines */
	#ifdef DEBUG
		printf("DEPEND-D-Found an ifdef\n");
	#endif
	scan_vars->ifdef_count++;	/* add level of nesting */											
	i+=6;
	tempp=newtok(scan_vars,i," \t\n\r");
	if (i!=EXIT_CODE)
	{
		if ((tempp!=NULL)&&(sym_name = look_up_define(tempp)) != NULL)  /* If symbol found in list */
		{ 
			/* The symbol is defined... */							
			/* change the array scan_vars->ifdef_process */ 
			/* do somehting with the info */ 
			#ifdef DEBUG
				printf("DEPEND-D-found define on list %s\n",sym_name->name);
			#endif
			if (scan_vars->ifdef_process[scan_vars->ifdef_count-1] != 0)  
				scan_vars->ifdef_process[scan_vars->ifdef_count] = 1;  /* We are processing this section */
		}
		else
		{
			#ifdef DEBUG
				printf("DEPEND-D-missed define on list %s\n",tempp);
			#endif
			scan_vars->ifdef_process[scan_vars->ifdef_count]= 0;  /* We are not processing this section */
		}
	}           
	free(tempp);
	return(i);
}
/******************************************************************************************/

int parse_ifndef(scan_vars_t scan_vars,int i) 
{
	char *tempp;
	defines_t sym_name;
	/* look up in the list of defines */ 
	#ifdef DEBUG
		printf("DEPEND-D-Found an ifndef\n");
	#endif
	scan_vars->ifdef_count++;	/* add level of nesting */											
	i+=7;
	tempp=newtok(scan_vars,i," \t\n\r");
	if (i!=EXIT_CODE)
	{
		#ifdef DEBUG
			printf("DEPEND-D-the identifier is %s\n",tempp);
		#endif
		if ((tempp!=NULL)&&(sym_name = look_up_define(tempp)) == NULL)  /* If symbol found in list */
		{ 
			/* The symbol is not defined... */							
			/* change the array scan_vars->ifdef_process */ 
			if (scan_vars->ifdef_process[scan_vars->ifdef_count-1] != 0)
				scan_vars->ifdef_process[scan_vars->ifdef_count] = 1;  /* We are processing this section */
		}
		else
		{
			scan_vars->ifdef_process[scan_vars->ifdef_count] = 0;  /* We are not processing this section */
		}
	}     
	free(tempp);
	return(i);
}
/******************************************************************************************/

int parse_if(scan_vars_t scan_vars,int i, int from_elif)
{    

	char *token;        
	char *token2;
	int invert_flag=1;		/* Keeps track of if expression has been NOT'ed */ // 0=invert  1=not inverted
	int tok_pos=0,tok_len,more_bangs=0; 
	int cant_process_this_tag=1;
	int value_of_if=-1; 	/* -1 is unset */
							/*  0 is a failure of the if condition */
							/*  1 is a success of the if contition */
	int and_or_flag=-1;     /* -1 is unset */
							/*  1 is for and -- && -- & */
							/*  2 is for or -- || -- | */
	int end_of_search=0;	/*  1 when the searching is over */
	int last_value=-1;		/*  the last result of the symbol match */
	defines_t sym_name;
	
	if (!from_elif)     /* don't execute this line if parse_elif called this function */
		scan_vars->ifdef_count++;
	i+=3;	/* Moves past #if */
	while (cant_process_this_tag!=0 && end_of_search==0 && i<scan_vars->line_length)
	 // we got to the end of line  nothing on the #if line
	{ 
		#ifdef DEBUG
			printf("at the top of the loop in parse_if\n");
		#endif
		while ((!more_bangs) && (i<scan_vars->line_length))
		{
			#ifdef DEBUG
				printf("newtok in more_bangs\n");
			#endif
			token = newtok(scan_vars,i," \t\n\r()");
			if (i==EXIT_CODE)
			{
				free(token);
				return(EXIT_CODE);
			}
			tok_pos=0;
			tok_len=strlen(token);
			while ((tok_pos<tok_len)&&(token[tok_pos]=='!'))
			{
				invert_flag^=1;
				#ifdef DEBUG
					printf("DEPEND-D-found a ! invert_flag=%d\n",invert_flag);
				#endif
				tok_pos++;
			}
			if (tok_pos<tok_len)
				more_bangs=1;
			else
				free(token);
		}
		if (i>=scan_vars->line_length)
			break;
		more_bangs=0;            
		token2=token+tok_pos;
		#ifdef DEBUG
			printf("DEPEND-D-the first token is %s i=%d line_length=%d\n",token2,i,scan_vars->line_length);
		#endif
		#ifdef DEBUG
			printf("DEPEND-D-the rest of the line if %s\n",scan_vars->readline+i);
		#endif
		if (strncmp(token2,"defined",7)==0)
		{
			/* we found a #if (!)defined */
			#ifdef DEBUG
				printf("DEPEND-D-Found a #if (!)defined\n");
			#endif
			free(token);
			#ifdef DEBUG
				printf("newtok in defined\n");
			#endif
			token=newtok(scan_vars,i," \t()\n\r");
			#ifdef DEBUG
				printf("DEPEND-D-Found a symbol %s on a #if line\n",token);
			#endif
			if (check_token(token))  
			{   
				sym_name=look_up_define(token);
				if (((invert_flag)&&(sym_name!=NULL))||((invert_flag==0)&&(sym_name==NULL)))
				{ 
					#ifdef DEBUG
						printf("DEPEND-D-found define on list %s invert_flag=%d\n",token,invert_flag);
					#endif
					last_value=1;
					if (value_of_if==-1)
					{
						value_of_if=1;
					}
					else
					{
						if (and_or_flag==1) /* this is an and */
						{
							if (value_of_if==0)
							{
								end_of_search=1;
								free(token);
								break;
							}
						}
						value_of_if=1;
					}
				}
				else
				{
					#ifdef DEBUG
						printf("DEPEND-D-missed define on list %s invert_flag=%d\n",token,invert_flag);
					#endif
					last_value=0;
					if (value_of_if==-1)
					{
						value_of_if=0;
					}
					if (and_or_flag==1)	/* this is an and */
					{
						
						if (value_of_if==0)
						{
							end_of_search=1;
							free(token);
							break;
						}
					}
				}
			}
			else
			{
				#ifdef DEBUG
					printf("DEPEND-D-can't handle #if: %s\n",scan_vars->readline);
				#endif
				cant_process_this_tag=0;
				free(token);
				break;
			}	
			free(token);
		}                
		else if (is_all_digit(token2))
		{
			/* we found a (!)number */         
			#ifdef DEBUG
				printf("DEPEND-D-Found a #if (!)num\n");
			#endif
			i+=strlen(token2);
			if (((invert_flag)&&(atoi(token2)))||((invert_flag==0)&&(atoi(token2)==0)))
			{ 
				#ifdef DEBUG
					printf("DEPEND-D-the number is %s invert_flag=%d\n",token2,invert_flag);
				#endif
				last_value=1;
				if (value_of_if==-1)
				{
					value_of_if=1;
				}
				else
				{
					if (and_or_flag==1) /* this is an and */
					{
						if (value_of_if==0)
						{
							end_of_search=1;
							break;
						}
					}
					value_of_if=1;
				}
			}
			else
			{
				#ifdef DEBUG
					printf("DEPEND-D-missed define on list %s invert_flag=%d\n",token,invert_flag);
				#endif
				last_value=0;
				if (value_of_if==-1)
				{
					value_of_if=0;
				}
				if (and_or_flag==1)	/* this is an and */
				{
					if (value_of_if==0)
					{
						end_of_search=1;
						break;
					}
				}
			}
		}
		else if ( (strcmp(token2,"||")==0) || (strcmp(token2,"|")==0))
		{
			and_or_flag=2;	/* value of an or */
		}
		else if ( (strcmp(token2,"&&")==0) || (strcmp(token2,"&")==0))
		{
			and_or_flag=1;	/* value of an and */
		}
		else
		{
			/* we found a (!) symbol */
			#ifdef DEBUG
				printf("DEPEND-D-Found a symbol %s on a #if line\n",token2);
			#endif
			if (check_token(token2)&&check_rest_of_line(scan_vars,i))   // cant support anything else on the line except a comment
			{                        
				sym_name=look_up_define(token2);
				if (((invert_flag)&&(sym_name!=NULL)&&(sym_name->value))||
					((invert_flag==0)&&(sym_name!=NULL)&&(sym_name->value==0)))
				{ 
					#ifdef DEBUG
						printf("DEPEND-D-found define on list %s invert_flag=%d\n",token2,invert_flag);
					#endif   
					last_value=1;
					if (value_of_if==-1)
					{
						value_of_if=1;
					}
					else
					{
						if (and_or_flag==1) /* this is an and */
						{
							if (value_of_if==0)
							{
								end_of_search=1;
								break;
							}
						}
						value_of_if=1;
					}
				}
				else
				{
					#ifdef DEBUG
						printf("DEPEND-D-missed define on list %s invert_flag=%d\n",token,invert_flag);
					#endif
					last_value=0;
					if (value_of_if==-1)
					{
						value_of_if=0;
					}
					if (and_or_flag==1)	/* this is an and */
					{
						if (value_of_if==0)
						{
							end_of_search=1;
							break;
						}
					}
				}
			}
			else
			{
				cant_process_this_tag=0;
			}		
		}
	}
	if (last_value==1)
	{
		if (and_or_flag==2) /* this is an or */
		{
			if (value_of_if==0)
			{
				value_of_if=1;
			}
		}
	}
	else
	{
		if (last_value==0)
		{
			if (and_or_flag==1)	/* this is an and */
			{
				value_of_if=0;
			}
		}
	}	
	if (end_of_search!=0 && cant_process_this_tag==0)
	{
		free(token);
		while (check_rest_of_line(scan_vars,i)==0 && (i<scan_vars->line_length))
		{
			#ifdef DEBUG
				printf("skipping until the end of the line or until a comment\n");
			#endif
			token = newtok(scan_vars,i," \t\n\r()");
			if (i==EXIT_CODE)
			{
				free(token);
				return(EXIT_CODE);
			}
			free(token);
		}
		if (!from_elif)    /* don't execute this line if parse_elif called this function */ 
			cant_handle(scan_vars);				
		return(i);		
	}       
	#ifdef DEBUG
		printf("the value of the if is %d\n",value_of_if);
	#endif
	if (value_of_if)
	{ 
		#ifdef DEBUG
			printf("DEPEND-D #if value is 1\n");
		#endif
		if (scan_vars->ifdef_process[scan_vars->ifdef_count-1] != 0)  
			scan_vars->ifdef_process[scan_vars->ifdef_count] = 1;  /* We are processing this section */
	}
	else
	{
		#ifdef DEBUG
			printf("DEPEND-D #if value is 0\n");
		#endif
		scan_vars->ifdef_process[scan_vars->ifdef_count]= 0;  /* We are not processing this section */
	}	
	free(token);
	return(i);
}





/******************************************************************************************/

int check_rest_of_line(scan_vars_t scan_vars,int i)
{               
	int j;  
	int in_comm=0,temp_pos=0;
	char temp[400];
	
	for (j=i;j<scan_vars->line_length;j++)
	{
		if (scan_vars->readline[j]=='/')   /* Ignore comments on this line */
		{
			if (scan_vars->readline[j+1]=='*')  /* Found a c comment */
			{
				in_comm=1;  
				j++;    
				continue;
			}
			if (scan_vars->readline[j+1]=='/')   /* Fund a c++ comment */
			{
				break;
			}
		}
		if (in_comm)
		{
			if ((scan_vars->readline[j]=='*')&&(scan_vars->readline[j+1]=='/'))  /* Found end of c comment */
				in_comm=0;
			j++;
			continue;
			
		}
		else
		{
			temp[temp_pos]=scan_vars->readline[j];  /* Copy characters outside of comment into temp */
			temp_pos++;
		}
	}
	temp[temp_pos]='\0';
	if (strlen(temp)==0)
	{
		return(0);
	}
	return(check_token(temp)); /* Check temp to see if its a legal token; return true or false */
}
/******************************************************************************************/

int check_token(char *token)
{
	#ifdef DEBUG
		printf("DEPEND-D-entering check_token with the string %s\n",token);
	#endif
	/* Searches for characters in the token which signify that the #if expression cannot be handled */
	if (strpbrk(token,"|&<>=!(~+-*^%,?:")==NULL)  // if we find any of the characters, return 0
	{
		#ifdef DEBUG
			printf("DEPEND-D-leaving check_token 1\n");
		#endif
		return(1);
	}
	else
	{
		#ifdef DEBUG
			printf("DEPEND-D-leaving check_token 0\n");
		#endif
		return(0);
	}
}    
/******************************************************************************************/

int check_token_new(char *token)
{
	#ifdef DEBUG
		printf("DEPEND-D-entering check_token with the string %s\n",token);
	#endif
	/* Searches for characters in the token which signify that the #if expression cannot be handled */
	if (strpbrk(token,"<>=~+-*^%,?:")==NULL)  // if we find any of the characters, return 0
	{
		#ifdef DEBUG
			printf("DEPEND-D-leaving check_token 1\n");
		#endif
		return(1);
	}
	else
	{
		#ifdef DEBUG
			printf("DEPEND-D-leaving check_token 0\n");
		#endif
		return(0);
	}
}    
/******************************************************************************************/           

void cant_handle(scan_vars_t scan_vars)
{
	if (scan_vars->warning_index < MAX_LEVELS)
		scan_vars->warning_index++;  /* Increment index of warning level */
	else
		printf("DEPEND: WARNING: Exceeded maximum #if nesting levels\n");
				
	if (scan_vars->ifdef_process[scan_vars->ifdef_count-1] != 0)  
		scan_vars->ifdef_process[scan_vars->ifdef_count] = 1;  /* We are processing this level of #if nesting */ 
		scan_vars->warnings[scan_vars->warning_index] = scan_vars->ifdef_count; /* Store in the warnings array the nesting */
																				/*	level number of where the warning occurred */
}
/******************************************************************************************/

int parse_define(scan_vars_t scan_vars,int i)
{
	char *tmp,*tempp;
	i+=7;
	tempp=newtok(scan_vars,i," \t\n\r");
	if (i!=EXIT_CODE)
	{
		#ifdef DEBUG
			printf("DEPEND-D-Found a define %s\n",tempp);
		#endif
		if (tempp!= NULL)
		{
			tmp=newtok(scan_vars,i," \t\n\r");
			if (tmp[0]!='\0')		 /* check to see if all the characters are digits */
									/* if so, it is value, otherwise it is a macro_type */
				add_define_to_list(tempp, atoi(tmp)); /* add name and value of constant to list */	
			else
				add_define_to_list(tempp,0); /* add name and value of constant to list */	
		 	free(tmp);
		}
		free(tempp);
	}						  
	return(i);
}

/******************************************************************************************/

int parse_undef(scan_vars_t scan_vars,int i)
{
	char *tempp;
	i+=6;
	tempp=newtok(scan_vars,i," \t\n\r");
	if (i!=EXIT_CODE)
	{
		if (tempp!=NULL)				
		{
			remove_define(tempp);
		}
	}           
	free(tempp);
	return(i);
}
/******************************************************************************************/

int parse_else(scan_vars_t scan_vars,int i) 
{
	if (scan_vars->warnings[scan_vars->warning_index] != scan_vars->ifdef_count)  /* Only toggle flag if we're not in a warning block - i.e. an #if. */
		if (scan_vars->ifdef_process[scan_vars->ifdef_count-1] != 0)	/* Since we don't know how to do the #if, we process code under the #if as well as the #else. */
			scan_vars->ifdef_process[scan_vars->ifdef_count] ^= 1; /* Toggle from 1 to 0 or 0 to 1 (I think???) */
		
	i += 5; /* change i */
	return(i);
}
/******************************************************************************************/

int parse_endif(scan_vars_t scan_vars,int i)
{
	/* set the array position for the scan_vars->ifdef_count to 0 */ 
	scan_vars->ifdef_process[scan_vars->ifdef_count] = 0; /* Set the current scan_vars->ifdef_process value indexed to 0 */
	if (scan_vars->warnings[scan_vars->warning_index] == scan_vars->ifdef_count)
	{
		scan_vars->warnings[scan_vars->warning_index] = 0;
		if (scan_vars->warning_index > 0)
			scan_vars->warning_index--;
	}	
	scan_vars->ifdef_count--; /* Go back 1 level of nesting */ 
	/* change i */
	i += 6;
	return(i);
}
/******************************************************************************************/

int parse_elif(scan_vars_t scan_vars,int i)
{
	/* we found a #elif */		  
	i += 2; /* change i */
	i=parse_if(scan_vars,i,1);
	return(i);
}
/******************************************************************************************/

int strip_comments(scan_vars_t scan_vars,int i)
{   
	int j; /* loop counter */
	if (scan_vars->readline[i]=='/')
	{
		switch (scan_vars->readline[i+1])
		{
			case '*':  /* c comment */
			{   
				#ifdef DEBUG
					printf("DEPEND-D-Found a valid c comment\n"); 
				#endif
				do 
				{
					#ifdef DEBUG
						printf("DEPEND-D-the line in skip_comments %s\n",scan_vars->readline);
					#endif
					if (i == EXIT_CODE)   /* Have we already read a line? */ 
					{
					 	i=-1;
						scan_vars->line_length = strlen(scan_vars->readline);	/* Reset line_length on every new line read. */		
					}
					for(j=i+1; j<scan_vars->line_length; j++)
					{
						if ((scan_vars->readline[j] == '*') &&
							 (scan_vars->readline[j+1] == '/'))
						{
							#ifdef DEBUG	
								printf("DEPEND-D-Strip_comments: found end of a valid c comment\n");
							#endif
							return(j+1);	/* return current position in file when a * and /  is found */
						}
					}
					#ifdef DEBUG	
						printf("DEPEND-D-Strip_comments:	didn't find end of c comment on current line\n");
					#endif
					i = EXIT_CODE;  /* We must reset i after every line read so that we start reading from the begining of the string. */ 
								/* i.e. j + i + 1 == 0 (initial condition of for loop) */
				}
				while (fgets(scan_vars->readline,390,scan_vars->infile) != NULL);		/* Read next line in file if we haven't found a  */
						                                                            /*	comment on the current line */ 
				#ifdef DEBUG	
					printf("DEPEND-D-Strip_comments: found EOF\n"); 
				#endif
				return(EXIT_CODE);  /* Found EOF */
			}   
			case '/': /* c++ comment */
			{   
				#ifdef DEBUG
					printf("DEPEND-D-Strip_comments: Found a valid c++ comment\n");    
				#endif
				return(scan_vars->line_length+2);
			}   
			default:   /* Didn't find any kind of comment */
				#ifdef DEBUG
					printf("DEPEND-D-Strip_comments: didn't find any comments\n");
				#endif
				return(i);
		} 
	}
	#ifdef DEBUG
		printf("DEPEND-D-Strip_comments: didn't find any comments\n");
	#endif
	return(i);
}
/******************************************************************************************/

/* Compares the character c to each of the characters in the string delimiters. Returns true */
/* when a match is found, false otherwise. */
int is_delimiter(char c,char *delimiters)
{
	int i=0,length;	    
	length=strlen(delimiters);
	while((i<length)&&(delimiters[i]!=c))
		i++;
	if (delimiters[i]==c)
		return(1);
	return(0);
}
/******************************************************************************************/

char *newtok(scan_vars_t scan_vars,int &i,char *delimiters)
{
	int done;		/* Used in while loop */
	char *out;  	/* String to which caracters in the token are to be copied to */
	int out_pos=0;	/* Position in character string that current character in token is copied to */  
	out=(char *)malloc(sizeof(char)*400);
	if (out == NULL) 
	{
		printf("DEPEND: Out of memory\n");
		exit(-1);
	}
	while ((i<scan_vars->line_length)&& (is_delimiter(scan_vars->readline[i],delimiters))) // skip leading delimiters 
		i++;
	done=(i>=scan_vars->line_length);
	while (!done)
	{
		if ((scan_vars->readline[i]=='/')&&(scan_vars->readline[i+1]=='*'))
		{   /* we found the start of a c comment */
			#ifdef DEBUG
				printf("DEPEND-D-newtok: entering strip_comments at pos %d\n",i);
			#endif	
			i=strip_comments(scan_vars,i);
			#ifdef DEBUG
				printf("DEPEND-D-newtok: left strip_comments with line %s at pos %d\n",scan_vars->readline,i);
			#endif
			if (out_pos==0)
			{
				done=0; 	// first thing is the comment 
				i++;
				while ((i<scan_vars->line_length)&& (is_delimiter(scan_vars->readline[i],delimiters))) // skip delimiters 
					i++;
			}
			else
			{
				done=1;  // found sonething before we found a comment
			}
		}
		else if ((scan_vars->readline[i]=='/')&&(scan_vars->readline[i+1]=='/'))
		{   /* we found the start of a c++ comment */
			#ifdef DEBUG
				printf("DEPEND-D-newtok: entering strip_comments at pos %d\n",i);
			#endif	
			i=strip_comments(scan_vars,i);
			#ifdef DEBUG
				printf("DEPEND-D-newtok: left strip_comments with line %s at pos %d\n",scan_vars->readline,i);
			#endif
			done=1;  /* Stop processing line when we find a c++ comment */
		}
		else
		{
			if (!is_delimiter(scan_vars->readline[i],delimiters))  /* If character is not a delimiter... */
			{    
				out[out_pos]=scan_vars->readline[i];   /* Copy the character into out */
				#ifdef DEBUG
					printf("DEPEND-D-the character copied is %c\n",scan_vars->readline[i]);
				#endif
				i++;
				out_pos++;
				done=(i>=scan_vars->line_length);
			}
			else
			{
				done=1;
			}
		}
	}
	out[out_pos]='\0';  /* Null-terminate the string */
	out=(char *)realloc(out,sizeof(char)*(strlen(out)+2));   /* Shrink size down to exact length of string */
	if (out == NULL)
	{
		printf("DEPEND: Out of memory\n");
		exit(-1);
	}	

	#ifdef DEBUG
		printf("DEPEND-D-out has the value %s i=%d line_length=%d\n",out,i,scan_vars->line_length);
	#endif
	return(out); /* return token */
}
			
			
		

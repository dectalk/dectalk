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
**    lts.c
**
** DESCRIPTION
**    This program is the Letter to sound testing program
**    it needs 6 words "lswtab" format. This is only understood
**    by "ls4.c" on VMS (there are some "#if" things at
**    the start of the file).
**
**    output_filter0   output grapheme file  1 - all grapheme
**                                           2 - grapheme with match phoneme
**                                           3 - grapheme with miss-match phoneme
**    output_filter1   allowable miss phoneme for Noun
**
**    output_filter2   allowable miss phoneme for non-Noun
**
**    output_filter3   dump the pipe data from dictionary search
**
**    maxi_allow       maximum allowable missing phoneme.
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         6/26/95         initial code based on old lts.c
**                                 keep all input option to maintain
**                                 same interface.
**  G. Lin         10/17/95        add dictionary search code.
**  G. Lin         2/8/96          don not the homograph words
**				                   from dictionary reduction.
**  G. Lin		   9/16/96         add switch to detec the format of dictionary
**                                 also only reduce "noun" for English
**                                 dictionary reduction.
**  G. Lin         9/29/97         add ENGLISH_UK support
**  G. Lin         9/30/97         use the new dictionary data structure
**  G. Lin         11/22/97        fix suffix crash problem
**
**
*/

/*
** Global include header files
*/

#include	<stdio.h>
#include 	<time.h>
#ifdef NO_NOUN
#include 	<math.h>
#endif
/*
** Local include header files
*/

#ifdef VMS

#include	"vms_port.h"

#else

#ifdef WIN32
#include	"tts.h"
#else
#include	"port.h"
#endif

#endif

#include	"lts_rule.h"
#include	"lts_util.h"

/*#include	"def.h"*/
#include	"defs.h"
#include	"ls_def.h"

/* SIK 10/21/96 Added to support compile */
#ifdef ENGLISH_US
#include 	"usa_def.h"
#include 	"usa_phon.tab"
#endif

#ifdef ENGLISH_UK
#include        "uk_def.h"
#include        "uk_phon.tab"
#endif

#ifdef GERMAN
#include 	"ger_def.h"
#include 	"ger_phon.tab"
#endif

#define MAXI_ALLOW	6

/*
**  Global variable declaration
*/

struct share_data *kernel_share;

LETTER	lword[NGWORD];			/* Unpacked working word.	*/
PHONE	pnode[NPNODE];			/* Pool of "PHONE" nodes.	*/

/* PHONE	pLts_t->phead;	*/		/* Listhead for "PHONE" nodes	*/

int	eflag	= FALSE;		/* -e dictionary dump flag	*/
int	fflag	= FALSE;		/* -f dictionary search flag	*/

int	bflag	= FALSE;		/* -b (block reduction) flag	*/
int	cflag	= FALSE;		/* -c (counts) flag not hit     */

int	aflag	= FALSE;		/* -a dictionary reduction flag	*/
int	ccflag	= FALSE;		/* -c (counts) flag for hit/match count, work with aflag */
int	ddflag	= FALSE;		/* -d (detail trace) flag  work with aflag */
int	ttflag	= FALSE;		/* -t (trace)  flag  work with aflag */
int	xxflag	= FALSE;		/* -x (rule display) flag aflag */

int	zflag	= FALSE;		/* -z (counts) flag hit		*/
#ifdef ACNA
int	yflag	= TRUE;	
#else
int	yflag	= FALSE;		/* -y ACNA flag    */
#endif
int	xflag	= FALSE;		/* -x (counts) flag and rule    */
int	dflag	= FALSE;		/* -d (debug) flag		*/
int	rflag	= FALSE;		/* -r (running commentary) flag	*/
int	sflag	= FALSE;		/* -s (speak) flag		*/
int	tflag	= FALSE;		/* -t (trace) flag		*/
int	gflag	= FALSE;		/* -g (gererate rule table) flag*/
							/* 0 - don't generate rule file */
							/* 1 - NON-ACNA			*/
							/* 2 - ACNA			*/
#ifdef ENGLISH_US
int	laflag	= LTS_ENGLISH;	/* -l (language) flag		*/
#endif
#ifdef ENGLISH_UK
int     laflag  = LTS_ENGLISH_UK;
#endif
#ifdef GERMAN
#define NGRAPH GNGRAPH
int	laflag	= LTS_GERMAN;	/* -l (language) flag		*/
#endif
								/* 1 - English			*/
								/* 2 - German			*/
								/* 3 - French			*/
								/* 4 - Spanish			*/
                                /* 5 - English_UK                  */

unsigned char    lsbtab[NBTAB];          /* Byte array.                  */
unsigned char    *lsbp;                  /* Work pointer into above.     */
unsigned short   lswtab[NWTAB];          /* Word array.                  */
unsigned short   *lswp;                  /* Work pointer into above.     */
unsigned int     lsb_size=0;
unsigned int     lsw_size=0;
unsigned int     line=0;
unsigned int     ngraph=NGRAPH;

unsigned int	 redirect_input=0;
FILE *ltsFile,*dicFile,*analyFile,*missFile;
char REV[]={"1.00"};
char HI_ON[]={""};
char HI_OFF[]={""};

struct RULE_data *rule_list_head=0;
struct RULE_data *rule_list_tail=0;
struct RULE_data *rule_list_temp=0;

struct DICT_data *dict_list_head=0;
struct DICT_data *dict_list_tail=0;
struct DICT_data *dict_list_temp=0;

extern	unsigned int gpfeat[];		/* Phoneme features, in "ls6.c"	*/
/* Commented out 10/14/96 SIK */
/* extern	unsigned int pfeat[]; */		/* Phoneme features, in "ls6.c"	*/
extern	char	pname[];		/* Phones Names, in "lsread".	*/
extern	char	gname[];		/* Graph Names, in "lsread".	*/

char asccode[NGWORD];
char arpacode[NGWORD];

/* English vowel list */
char evoc_list[]={
        'i',                            /* IY                           */
        'I',                            /* IH                           */
        'e',                            /* EY                           */
        'E',                            /* EH                           */
        '@',                            /* AE                           */
        'a',                            /* AA                           */
        'A',                            /* AY                           */
        'W',                            /* AW                           */
        '^',                            /* AH                           */
        'c',                            /* AO                           */
        'o',                            /* OW                           */
        'O',                            /* OY                           */
        'U',                            /* UH                           */
        'u',                            /* UW                           */
        'R',                            /* RR                           */
        'Y',                            /* YU                           */
        'x',                            /* AX                           */
        '|',                            /* IX                           */
	' '
};
/* UK English vowel list */
char uevoc_list[]={
        'i',                            /* IY                           */
        'I',                            /* IH                           */
        'e',                            /* EY                           */
        'E',                            /* EH                           */
        '@',                            /* AE                           */
        'a',                            /* AA                           */
        'A',                            /* AY                           */
        'W',                            /* AW                           */
        '^',                            /* AH                           */
        'c',                            /* AO                           */
        'o',                            /* OW                           */
        'O',                            /* OY                           */
        'U',                            /* UH                           */
        'u',                            /* UW                           */
        'R',                            /* RR                           */
        'Y',                            /* YU                           */
        'x',                            /* AX                           */
        '|',                            /* IX                           */
	' '
};
/* German vowel list */
char gvoc_list[]={
        'a',                            /* A                            */
        'E',                            /* E                            */
        'V',                            /* AE                           */
        '@',                            /* EX                           */
        'I',                            /* I                            */
        'c',                            /* O                            */
        'Q',                            /* OE                           */
        'U',                            /* U                            */
        'Y',                            /* UE                           */
        '1',                            /* AH                           */
        '2',                            /* EH                           */
        '7',                            /* AEH                          */
        '3',                            /* IH                           */
        '4',                            /* OH                           */
        'q',                            /* OEH                          */
        '5',                            /* UH                           */
        'y',                            /* UEH                          */
        'A',                            /* EI                           */
        'W',                            /* AU                           */
        'H',                            /* EU                           */
        '8',                            /* AN                           */
        '^',                            /* IM                           */
        '9',                            /* UM                           */
        '%',                            /* ON                           */
        'j',                            /* J                            */
        'L',                            /* EL                           */
        'M',                            /* EM                           */
        'N',                            /* EN                           */
        ' '
};

/* hack to run LTS with dictionary search rouitne */

unsigned long   fc_struct[128];
int     fc_index=0;
short   lphone=0;                         /* Last phoneme (from anybody). */

/* special output switch */
int filter0 = 0;
int filter1 = 0;
int filter2 = 0;
int filter3 = 0;

struct TTS_HANDLE_TAG hTTS;

LPTTS_HANDLE_T phTTS; 
LTS_T   Lts_t;
PLTS_T  pLts_t;

/*
**  FUNCTION DECLARATION
*/

LETTER	*getword();
static void fatal(char *s1, char *s2);
void lts_mktab(char *ltsFilename,char *rulFilename);
void add_list_tail(int code,
			void **list_head,
                   void **list_tail,
                   void **list_item);
char *get_rule_data(unsigned int line_number);
char *make_phones();
char *make_phones_code(char *asccode,char *arpacode);
int check_phones(char *string_1,char *string_2,char *miss);
int check_vowel(char char_check);
void *free_phones();
void lts_pfree(LPTTS_HANDLE_T phTTS, PHONE *pp);
void build_code(char *asccode,char *arpacode,int temp);
void lds_gsendphone(int ph);
void lds_sendphone(int ph);


int main(int argc, char *argv[])
{
	PHONE	*pp1;
	PHONE	*pp2;
	PHONE	*pp3;
	LETTER	*llp;
	LETTER	*rlp;
	int	c;
	int	i,j,k;
	char	*cp;
	char	*rfn;
	int	s;
	int	status;
/*
	int	ccflag=0;
	int	ddflag=0;
	int	ttflag=0;
	int	xxflag=0;
*/
	char		ltsdbuf[128];

	char temp_s[NOR_WORD_SIZE];
	char dicfile[NOR_WORD_SIZE];
	char dicbfile[NOR_WORD_SIZE];
	char analyfile[NOR_WORD_SIZE];
	char missfile[NOR_WORD_SIZE];
	char ltsfile[NOR_WORD_SIZE];
	char tabfile[NOR_WORD_SIZE];
	char line_data[SPE_RECORD_SIZE]={""};
	char *record=line_data;
	unsigned int line_no=0;
	unsigned int word_count,match_count,miss_count,miss_a_count,miss_b_count,
		     miss_s_count,miss_1_count,miss_2_count;
	int dic_hit_count = 0;
	int final_count = 0;
	int force_count = 0;
	int maxi_allow = MAXI_ALLOW;
	char filter_s[NOR_WORD_SIZE]={""};
	FILE *fw;
	char miss_char[3]={""};
#ifdef NO_NOUN
	int format=0;	/* 1 -- new format, 2 -- old format */
#endif

	phTTS=&hTTS;
  	/* MVP :Associate LTS thread specific data handle to the current speech object*/

  	phTTS->pLTSThreadData = &Lts_t;

	pLts_t = phTTS->pLTSThreadData;

	/* GL 04/16/1997 set up the kernel data space */
	kernel_share = (struct share_data *) malloc(sizeof(struct share_data));
	phTTS->pKernelShareData = kernel_share;	/* set a pointer to the KS structure */

	ls_util_lts_init(phTTS->pLTSThreadData,phTTS->pKernelShareData);
	phTTS->pKernelShareData->debug_switch = 0;

/* GL 11/22/1997 fix suffix crash problem */
#ifdef ENGLISH_US
		phTTS->pKernelShareData->lang_curr = LANG_english;
#endif
#ifdef ENGLISH_UK
		phTTS->pKernelShareData->lang_curr = LANG_british;
#endif
#ifdef GERMAN
		phTTS->pKernelShareData->lang_curr = LANG_german;
#endif


#ifdef ACNA
	lsa_util_init_lang();
#endif
        /* take "?" for quick help */
    if (argc >= 2 && !strcmp(argv[1],"?"))
	{
	   lts_help();
	   exit(0);
	}

	/* redirect to pick up the command line argument */
	argc = redirect(argc, argv);

	rfn = NULL;
        /* set the flag for each option */
	for (i=1; i<argc; ++i)
	{
		cp = argv[i];
		if (*cp == '-')
		{
			while ((c = *++cp) != 0)
			{
				switch (c)
				{
					case 'a':
						aflag = TRUE;
						sscanf(cp," %s ",dicfile);
						string_shift(1,1,dicfile);
						while ((c = *++cp) != 0) ;
						--cp;
						break;
					case 'f':
						fflag = TRUE;
						sscanf(cp," %s ",dicbfile);
						string_shift(1,1,dicbfile);
						while ((c = *++cp) != 0) ;
						--cp;
						break;
					case 'e':
						eflag = TRUE;
						break;
					case 'b':
						bflag = TRUE;
						break;
					case 'c':
						cflag = TRUE;
						break;
					case 'z':
						zflag = TRUE;
						break;
					case 'x':
						xflag = TRUE;
						break;
					case 'y':
						yflag = TRUE;
						break;
					case 'd':
						dflag = TRUE;
						break;
					case 'r':
						rflag = TRUE;
						break;
					case 's':
						sflag = TRUE;
						break;
					case 't':
						tflag = TRUE;
						break;
					case 'g':
						gflag = LTS_NO_ACNA;
						strncpy(temp_s,case_change(cp,4),3);
						if (!strncmp(temp_s,"GAC",3)) gflag = LTS_ACNA;
						while ((c = *++cp) != 0) ;
						--cp;
						break;
					case 'l':
						strncpy(temp_s,case_change(cp,4),3);
#ifdef ENGLISH_US
						if (!strncmp(temp_s,"LUS",3)) { laflag = LTS_ENGLISH; ngraph = NGRAPH; }
#endif
#ifdef ENGLISH_UK
						if (!strncmp(temp_s,"LUK",3)) { laflag = LTS_ENGLISH_UK; ngraph = NGRAPH; }
#endif
#ifdef GERMAN				
						if (!strncmp(temp_s,"LGE",3)) { laflag = LTS_GERMAN; ngraph = GNGRAPH; }
#endif
#ifdef FRENCH			
						if (!strncmp(temp_s,"LFR",3)) { laflag = LTS_FRENCH; ngraph = NGRAPH; }
#endif
#ifdef SPANISH			
						if (!strncmp(temp_s,"LSP",3)) { laflag = LTS_SPANISH; ngraph = NGRAPH; }
#endif			
						while ((c = *++cp) != 0) ;
						--cp;
						break;
					default:
						usage();
				}
			}
		} else  if (rfn == NULL)
			  rfn = cp;
			else
			  usage();
	} /* for ... */

	/* open to read ltsFile file */
	if (rfn == NULL)
	{
	   if (laflag == LTS_GERMAN)
       {
#ifdef VMS
           strcpy(ltsfile,"sys$login_device:[lin.lts.release]dtpc_gr.lts");
#else
           strcpy(ltsfile,"dtpc_gr.lts");        
#endif		 
       }
       if (laflag == LTS_ENGLISH)
	   {
	     if (yflag == TRUE || gflag == LTS_ACNA)
#ifdef VMS
                strcpy(ltsfile,"sys$login_device:[lin.lts.release]dtpc_us_ac.lts");
#else
                strcpy(ltsfile,"dtpc_us_ac.lts");       
#endif		 
		 else
#ifdef VMS
                strcpy(ltsfile,"sys$login_device:[lin.lts.release]dtpc_us.lts");
#else
                strcpy(ltsfile,"dtpc_us.lts");
#endif
	   }
       if (laflag == LTS_ENGLISH_UK)
	   {
	     if (yflag == TRUE || gflag == LTS_ACNA)
#ifdef VMS
                strcpy(ltsfile,"sys$login_device:[lin.lts.release]dtpc_uk_ac.lts");
#else
                strcpy(ltsfile,"dtpc_uk_ac.lts");       
#endif		 
		 else
#ifdef VMS
                strcpy(ltsfile,"sys$login_device:[lin.lts.release]dtpc_us_uk.lts");
#else
                strcpy(ltsfile,"dtpc_uk.lts");
#endif
	   }
	}
    else strcpy(ltsfile,rfn);
	if ((ltsFile = fopen(ltsfile,"r")) == 0)
	{
   	   printf("error input!! -- can not read from this file -->%s\n",ltsfile);
   	   exit(1);
	}

	/* create lsbtab[] and lswtab[] table */
	lsread();			/* create rule word tables.	*/

	fclose(ltsFile);

	/* reset acna flag if select German */
	if (laflag == LTS_GERMAN)
    {
	   yflag = FALSE;
       if (gflag == LTS_ACNA) gflag = LTS_NO_ACNA;
	} 
	/* reset all other flag except laflag and yflag if dictionary check flag is on */
	if (aflag == TRUE)
    {
           bflag = FALSE; 
           if (cflag == TRUE) { cflag = FALSE; ccflag = TRUE; }
           if (dflag == TRUE) { dflag = FALSE; ddflag = TRUE; }
           if (tflag == TRUE) { tflag = FALSE; ttflag = TRUE; }
           sflag = FALSE; 
           zflag = FALSE; 
           if (xflag == TRUE) { xflag = FALSE; xxflag = TRUE; }
           rflag = FALSE; 
           gflag = FALSE; 
    }

	/* prompt the message before doing any work */
	printf("LTS rule file: %s\n",ltsfile);
	if (yflag == true)
	   printf("ACNA switch: ON\n");
	else
	   printf("ACNA switch: OFF\n");
	switch(laflag)
	{
	  case 1: printf("Language selected: ENGLISH\n"); break;
	  case 2: printf("Language selected: GERMAN\n"); break;
	  case 3: printf("Language selected: FRENCE\n"); break;
	  case 4: printf("Language selected: SPANISH\n"); break;
      case 5: printf("Language selected: UK ENGLISH\n"); break;
	}
	if (gflag == FALSE && aflag == FALSE && redirect_input == FALSE)
	{
	   printf("Type in the word strings ending with <return>\n");
	   printf("Type ?<return> for help\n");
	   printf("Type ;<return> to exit\n\n");
	}


	/* gererate the rule table file if gflag is TRUE */
	/* program will be ended here */
	if (gflag != FALSE)
    {
/*	   strcpy(tabfile,ltsfile); */
/*	   strcat(tabfile,"_tab");  */
	   strcpy(tabfile,"out.tab"); 
	   printf("writing rule file.............\n");
	   lts_mktab(ltsfile,tabfile);
	   if (gflag == LTS_NO_ACNA)
	      printf("finish writing NON-ACNA rule file --> %s\n",tabfile);
	   else
	      printf("finish writing ACNA rule file --> %s\n",tabfile);
           exit(0);
    }


    /* load dictionary file if fflag is set */
	if (fflag == TRUE)
    {
	   unsigned int *dic_addr=0;
	   unsigned int *dic=0;
	   unsigned char *dic1=0;
	   unsigned char data;
	   unsigned int index=0;
	   unsigned int entries=0;
	   unsigned int dic_bytes=0;
	   FILE *fdic=0;

		if ((fdic=fopen(dicbfile,"r+b")) != NULL)
        {
			fread(&entries,4,1,fdic);
			fread(&dic_bytes,4,1,fdic);
#ifdef GLD
printf("entry/byte -> %d/%d\n",entries,dic_bytes);
#endif
            if ((dic = (unsigned int *)calloc(1, (entries*4)+dic_bytes+4)) == 0)
            {
                 printf("error memory allocation -- Can not allocate memory for dictionary file.\n");
                 exit(1);
            }

			/* assign the dictionary pointer to global pointer */
			if (laflag == LTS_GERMAN)
	        {
                KS.fdic[LANG_german] = dic;
				KS.fdic_entries[LANG_german] = entries;
	        }
	        if (laflag == LTS_ENGLISH)
	        {
                KS.fdic[LANG_english] = dic;
				KS.fdic_entries[LANG_english] = entries;
	        }
	        if (laflag == LTS_SPANISH)
	        {
                KS.fdic[LANG_spanish] = dic;
				KS.fdic_entries[LANG_spanish] = entries;
	        }
	        if (laflag == LTS_ENGLISH_UK)
	        {
                KS.fdic[LANG_british] = dic;
				KS.fdic_entries[LANG_british] = entries;
	        }
	        /* load the index section into memory */
	        /* need to adjust the addressing scheme for non-MSDOS environment */
	        dic_addr = dic;
	        for (i=0; i<entries; ++i)
	        {
				fread(&index,4,1,fdic);
#ifdef GLD
if (i < 11)
printf("%d index ** %u %08x\n",i,index,index);
#endif
				index =  ((index & 0xffff0000) >> 12) + (index & 0xf);
#ifdef GLD
if (i < 11)
printf("%d ** %04x %08x\n",i,index,dic_addr);
#endif

				index =  index + (unsigned int)dic_addr;
				*dic = index;
#ifdef GLD
if (i < 11)
printf("%d ** %08x %08x\n",i,(int)dic,*dic);
#endif
				dic++;
	        }

	        /* load the text section into memory */
	        dic1 = (unsigned char *)dic;
	        i = 0;
            while(fread(&data,1,1,fdic) != 0)
            {		
                *dic1 = (unsigned int)data;
#ifdef GLD
if (i < 101)
printf("%08x --> %04x %c\n",(int)dic1,*dic1,*dic1);
#endif
                dic1++; i++;
            }
            fclose(fdic);
            /* perform dictionary dump */
	        if (eflag == TRUE)
            {
				dic1 = dic;
				for (j=0; j<=i; ++j) 
				{
					/* skip the form class */
					for (k=0; k<=3; ++k)
					{ 
						dic1++;
						j++;
					}
					/* dump the grapheme */
					while (*dic1 != 0) { printf("%c",*dic1++); j++; }
					printf("\t"); dic1++; j++;
					/* dump the phoneme */
					while (*dic1 != 0)
					{
						printf("%c",pname[*dic1++]);
						j++; 
					}
					printf("\n"); dic1++;
				}
				exit(0);
			}
	     }
	     else
	     {
   				printf("error input!! -- can not read from this file -->%s\n",dicbfile);
   				exit(1);
		 }
	}

    /* build the rule file data structure if xflag is set */
	if ((xflag == TRUE || aflag == TRUE) && ccflag == FALSE )
    {
	    ltsFile = fopen(ltsfile,"r");
	    line_no = 0;
	    while (fgets(record,SPE_RECORD_SIZE,ltsFile) != 0)
	    {
			rule_list_temp = (struct RULE_data *)calloc(1, sizeof(struct RULE_data));
			if (rule_list_temp == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS rule entry.\n");
				exit(1);
			}
			rule_list_temp->data = (char *)malloc(strlen(record) + 1);
			if (rule_list_temp->data == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS rule data entry.\n");
				exit(1);
			}
			strcpy(rule_list_temp->data,record);
			rule_list_temp->line = ++line_no;

			add_list_tail(0,(void **)&rule_list_head,(void **)&rule_list_tail,(void **)&rule_list_temp);

	    }
	    fclose(ltsFile);
    }


	pp1 = &pnode[0];			/* Build pool.		*/
	while (pp1 < &pnode[NPNODE])
    {
		lts_pfree(phTTS, pp1);
		++pp1;
	}

	if (getenv("output_filter3") != 0)
	{
	     filter3 = atoi(getenv("output_filter3"));
	     printf("**filter 3 number %d\n",filter3);
	}

	/* process the dictionary checking if aflag is set */
	/* open the dictionary file and build a dictionary link list */
	if (aflag == TRUE)
    {
	   char grapheme[NOR_WORD_SIZE]={""};
	   char homoflag[NOR_WORD_SIZE]={""};
	   char phoneme[NOR_WORD_SIZE]={""};
#ifdef NO_NOUN
	   char formclass[NOR_WORD_SIZE]={""};
	   int formc=0;
	   int priority=0;
#endif
	   
	   char *temp;
	   unsigned long start_wall_time=0;
	   unsigned long intm_wall_time=0;
	   unsigned long stop_wall_time=0;
	   unsigned long total_wall_time=0;
	   struct tm tm_s;

    	   /* get starting wall time */
	   start_wall_time = time(0);
	   printf("Dictionary rule check start at:           %s%s%s",HI_ON,asctime(localtime((time_t *)&start_wall_time)),HI_OFF);

	   /* open the input dictionary file */
	   if ((dicFile = fopen(dicfile,"r")) == 0)
	   {
   	      printf("error input!! -- can not read from this file -->%s\n",dicfile);
   	      exit(1);
	   }

	   /* create the file name for analysis file and miss file */
/*
	   strcpy(analyfile,dicfile);
	   strcpy(missfile,dicfile);
	   strcat(analyfile,"_analysis");
	   strcat(missfile,"_miss");
*/
	   strcpy(analyfile,"out.analysis");
	   strcpy(missfile,"out.miss");

	   if (ccflag == FALSE)
	   {
	     /* open the output analy/miss files */
	     if ((analyFile = fopen(analyfile,"w")) == 0)
	     {
   	        printf("error input!! -- can not write to this file -->%s\n",analyfile);
   	        exit(1);
	     }
	     if ((missFile = fopen(missfile,"w")) == 0)
	     {
   	        printf("error input!! -- can not write to this file -->%s\n",missfile);
   	        exit(1);
	     }
	   }


	   if (getenv("output_filter0") != 0)
	   {
	        fw = fopen("grapheme.txt","w");
	        filter0 = atoi(getenv("output_filter0"));
	        printf("writing grapheme file %d.............(grapheme.txt)\n",filter0);
	   }


	   line_no = 0;
	   word_count = 0; match_count = 0; miss_count = 0; miss_s_count = 0;
	   miss_1_count = 0; miss_2_count = 0; miss_a_count = 0; miss_b_count = 0;
	   while (fgets(record,SPE_RECORD_SIZE,dicFile) != 0)
	   {
		    int i,j,k;
            /* skip the comment line */
			if (record[0] == ';' || record[0] == '\n' || record[0] == ' ' || record[0] == '\t') continue;

			grapheme[0] = '\0';
			homoflag[0] = '\0';
			phoneme[0] = '\0';
		phoneme[0] = '\0';
#ifdef NO_NOUN
		formclass[0] = '\0';
		formc = 0;
		priority = 0;

		/* determine the dictionary format */
      		if (format == 0)
      		{
         	   if (strstr(record,"0000000000")) format = 1;
         	   else
         	   format = 2;
      		}
		/* for new format like : grapheme,phoneme,homo,formclass,priority */
		if (format == 1)
		{
		   int i,j,k; /* i is index to record, j is index to each field, k is field index */
		   char temp[NOR_WORD_SIZE];
		   /* catch the grapheme and phoneme and other records */
		   /* need to scan the string since some phoneme has the space within phoneme */
		   for (i=0,j=0,k=0;i<strlen(record);++i)
		   {
			if (record[i] == '\\') { temp[j++] = record[i+1]; continue; }
			if (record[i] == ',' && record[i+1] == ',') continue;
			if ((record[i] == ',' && record[i+1] != ',') || record[i] == '\n' )
			{
			    k++; temp[j] = '\0';
			    j = 0;
			    switch (k)
			    {
				case 1 : strcpy(grapheme,temp); break;
				case 2 : strcpy(homoflag,temp); break;
				case 3 : strcpy(phoneme,temp); break;
				case 4 : strcpy(formclass,temp); break;
				case 5 : priority = atoi(temp); break;
			    }
			    continue;
			}
			temp[j++] = record[i];
		   }
		   /* convert the formclass string to a single unsiged 32 bits long word */
		   /* noun class should be */
		   for (i=27;i>=0;--i)
		   {
		   	if (formclass[i] == '1') formc = formc + (int)pow((double)2,(double)(27-i));
		   }
	 	} /* end of if (format == 1) */

		/* for old format like : "grapheme","phoneme","homo","formclass" */
		if (format == 2)
		{
#endif
			/* catch the grapheme and phoneme */
			/* for old dictionary format */
			if (record[0] == '\"')
			{
				sscanf(string_substitute(record,","," ")," %s %s %s ",grapheme,homoflag,phoneme);
				if (strlen(homoflag) != 0 && strlen(phoneme) == 0) strcpy(phoneme,homoflag);

				if (record[0] == '\"' && record[1] != ',')
				{
					temp = strstr(record,",");
					temp = strstr(temp+1,",");
					if (record[1] == '\"' && record[2] == '\"')
					{
						strcpy(grapheme,"\"");
					}
					strcpy(phoneme,string_catch(temp,'\"','\"'));
				}
				if (record[0] == '\"' && record[1] == ',')
				{
					temp = strstr(record,",");
					temp = strstr(temp+1,",");
					temp = strstr(temp+1,",");
					strcpy(grapheme,",");
					strcpy(phoneme,string_catch(temp,'\"','\"'));
				}
				if (strlen(homoflag) == 3 && homoflag[0] == '\"' && homoflag[2] == '\"')
				strcpy(homoflag,string_catch(homoflag,'\"','\"'));
			}
			else
			{
				/* for new dictionary format */
				for (i=0,j=0;record[i]!=',';++i,++j)
				if (record[i] == '\\')
				{ grapheme[j] = record[i+1]; ++i;}
				else
				  grapheme[j] = record[i];
				grapheme[j] = '\0';

				homoflag[0] = record[i+1];
				homoflag[1] = '\0';

				for (k=i+3,j=0;record[k]!=',';++j,++k)
				if (record[k] == '\\')
				{ phoneme[j] = record[k+1]; ++k;}
				else
				  phoneme[j] = record[k];
				phoneme[j] = '\0';
			}
#ifdef NO_NOUN
		} /* end of if (format == 2) */
#endif
		/* skip the non-word data */
/*		if (strlen(grapheme) == 0 || strlen(phoneme) == 0) continue;*/
			if (strlen(grapheme) == 0) continue;

			word_count++;
			dict_list_temp = (struct DICT_data *)calloc(1, sizeof(struct DICT_data));
			if (dict_list_temp == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS dict entry.\n");
				exit(1);
			}
			dict_list_temp->data = (char *)malloc(strlen(record) + 1);
			if (dict_list_temp->data == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS dict data entry.\n");
				exit(1);
			}
			dict_list_temp->grapheme = (char *)malloc(strlen(grapheme) + 1);
			if (dict_list_temp->grapheme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS dict grapheme entry.\n");
				exit(1);
			}
			dict_list_temp->phoneme = (char *)malloc(strlen(phoneme) + 1);
			if (dict_list_temp->phoneme == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS dict phoneme entry.\n");
				exit(1);
			}
			dict_list_temp->homoflag = (char *)malloc(strlen(homoflag) + 1);
			if (dict_list_temp->homoflag == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS dict homoflag entry.\n");
				exit(1);
			}
#ifdef NO_NOUN
			if (format == 2) record[0] = '\"';
#else
			//record[0] = '\"';
#endif
			strcpy(dict_list_temp->data,record);
#ifdef NO_NOUN
			if (format == 1)
				strcpy(dict_list_temp->grapheme,grapheme);
			if (format == 2)
			{
#endif
			if (strlen(grapheme) == 1 && grapheme[0] == '\"')
				strcpy(dict_list_temp->grapheme,grapheme);
			else
				strcpy(dict_list_temp->grapheme,string_substitute(grapheme,"\"",""));
#ifdef NO_NOUN
			}
#endif
			strcpy(dict_list_temp->phoneme,phoneme);
			strcpy(dict_list_temp->homoflag,homoflag);
			dict_list_temp->match = 0;
			dict_list_temp->line = ++line_no;
#ifdef NO_NOUN
			if (format == 1) dict_list_temp->formclass = formc;
#endif
			if (filter0 == 1)
				fprintf(fw,"%s\n",dict_list_temp->grapheme);
#ifdef NO_NOUN
/*
printf("entry -- %s\n%s %s %s %x %d\n",record,grapheme,homoflag,phoneme,formc,priority);
*/
#endif
			add_list_tail(1,(void **)&dict_list_head,(void **)&dict_list_tail,(void **)&dict_list_temp);
	   }

	   if (filter0 == 1)
	   {
	       fclose(fw);
 	       exit(0);
       }

	   /* get wall time after dictionary list build */
	   intm_wall_time = time(0);
	   printf("Dictionary rule check build link list:    %s%s%s",HI_ON,asctime(localtime((time_t *)&intm_wall_time)),HI_OFF);
	   if (getenv("output_filter1") != 0)
	   {
	        filter1 = atoi(getenv("output_filter1"));
			printf("**filter 1 number %d\n",filter1);
	   }
	   if (getenv("output_filter2") != 0)
	   {
	        filter2 = atoi(getenv("output_filter2"));
			printf("**filter 2 number %d\n",filter2);
	   }
	   if (getenv("special_filter") != 0)
	   {
	        strcpy(filter_s,getenv("special_filter"));
			printf("**special filter %s\n",filter_s);
	   }
	   if (getenv("maxi_allow") != 0)
	   {
	      maxi_allow = atoi(getenv("maxi_allow"));
	      printf("**maxi word size for signle miss match %d\n",maxi_allow);
	   }
	   else
	      maxi_allow = MAXI_ALLOW;

	   /* loop through the dictionary link list to feed every grapheme into rule engine */
	   dict_list_temp = dict_list_head;
	   while(dict_list_temp)
	   {
			char temp_char;
			char temp_string_1[NOR_WORD_SIZE];
			char temp_string_2[NOR_WORD_SIZE];
			int match = 0;
			int smatch = 0;

	        if (laflag == LTS_GERMAN)
			{
				/* remove the "=" from data string */
				char_strip(dict_list_temp->data,'=');
			}

			/* check the word must be saved. every record start with "!" will
				be saved, also save all the homograph words */
#ifdef NO_NOUN
			if ((dict_list_temp->data[0] == '!') || (dict_list_temp->homoflag[0] != 'N') ||
			((laflag == LTS_ENGLISH) && (format == 1) && (dict_list_temp->formclass != 0x20000)))
#else
			if (dict_list_temp->data[0] == '!' || dict_list_temp->homoflag[0] != 'N')
#endif
			{
				if (ccflag == FALSE)
				{
#ifdef NO_NOUN
					if (format == 2) dict_list_temp->data[0] = '\"';
#endif
					//dict_list_temp->data[0] = '\"';
					fprintf(missFile,"%s",dict_list_temp->data);
				}
				force_count++;
				final_count++;

				dict_list_temp = dict_list_temp->next;
				continue;
			}

        	/* perform dictionary search if fflag is set */
			if (fflag == TRUE)
        	{
				int c;

				/* convert the grapheme into lword[] structure without changing the case */
				rlp = &lword[0];
				for(i=0;i<strlen(dict_list_temp->grapheme);++i)
				{
                        rlp->l_ch = dict_list_temp->grapheme[i];
                        rlp->l_ip = NULL;
                        ++rlp;
						rlp->l_ch = NULL;
						rlp->l_ip = NULL;
				}

				/* 10/15/96 SIK gblook and blook merged and renamed to ls_dic_blook */
				/* 
				* if (laflag == LTS_GERMAN)
				*   c = gblook(&lword[0], rlp, FIRST);	
				*
				* else
				*/
				c = ls_dict_blook(phTTS, &lword[0], rlp, FIRST);
   				if (c == HIT)
                {
					dic_hit_count++;
					dict_list_temp = dict_list_temp->next;
					continue;
				}
			}

			/* convert the grapheme into lword[] structure */
			rlp = &lword[0];
			for(i=0;i<strlen(dict_list_temp->grapheme);++i)
			{
				temp_char = dict_list_temp->grapheme[i];
                if ((dict_list_temp->grapheme[i]>='A' && dict_list_temp->grapheme[i]<='Z') ||
                             (int)dict_list_temp->grapheme[i] == 196 || (int)dict_list_temp->grapheme[i] == -60 ||
                             (int)dict_list_temp->grapheme[i] == 214 || (int)dict_list_temp->grapheme[i] == -42 ||
                             (int)dict_list_temp->grapheme[i] == 220 || (int)dict_list_temp->grapheme[i] == -36)
                           temp_char += 0x20;
                rlp->l_ch = temp_char;
                rlp->l_ip = NULL;
                ++rlp;
				rlp->l_ch = NULL;
				rlp->l_ip = NULL;

			}

			/* perform the rule converting */
			if (yflag == FALSE)
			{
				/*
				*  if (laflag == LTS_GERMAN)
				*     ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);
				*  else
				*/
				ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);
			}
			else
			{
#ifdef ACNA
				short sel_lang;
				sel_lang =  lsa_util_id_name(&lword[0], rlp);
				ls_rule_lts(phTTS, &lword[0], rlp, NAME_ENGLISH, sel_lang);
#endif	
			}

			match = 99; smatch = 99;
			/* get the phonemes from rule engine */
            strcpy(temp_string_1,make_phones());
            strcpy(temp_string_2,dict_list_temp->phoneme);

			dict_list_temp->phoneme_lts = (char *)malloc(strlen(temp_string_1) + 1);
			if (dict_list_temp->phoneme_lts == 0)
			{
				printf("error memory allocation -- Can not allocate memory for LTS dict phoneme_lts entry.\n");
				exit(1);
			}

			/* save the phoneme_lts into link list */
            strcpy(dict_list_temp->phoneme_lts,temp_string_1);

			/* strip the syllable/norph  boundary before matching process */
			char_strip(temp_string_2,'*');
			char_strip(temp_string_2,'=');

			/* check the phoneme */
			if (!strcmp(temp_string_1,temp_string_2))
			{
				match = 0; smatch = 0;
				match_count++;

				/* display the rule decoding process */
				if (ddflag == TRUE)
				{
					printf("%-5u %d %d %s   %s\n",
					dict_list_temp->line,smatch,match,
					dict_list_temp->grapheme,
					dict_list_temp->phoneme);

					/* perform the rule converting one more time to get the trace information */
					tflag = TRUE;
					if (xxflag == TRUE) xflag = TRUE;
					if (yflag == FALSE)
					{
		   				if (laflag == LTS_GERMAN)
		      				ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);
		   				else
		      				ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);
					}
					else
					{
#ifdef ACNA
		   				short sel_lang;
		   				sel_lang =  lsa_util_id_name(&lword[0], rlp);
		   				ls_rule_lts(phTTS, &lword[0], rlp, NAME_ENGLISH, sel_lang);
#endif
					}
					tflag = FALSE; xflag = FALSE;

					/* get the phonemes from rule engine then clear the 
					->phead */
                    free_phones();

					printf("\t%s\n",
					dict_list_temp->phoneme_lts);
					printf("\t%s\n\n",
					string_substitute(dict_list_temp->phoneme,"=",""));

				}
			}

			if (match == 99 && smatch == 99)
			{
				int stress=0;

				/* get the miss count for single phoneme miss */
				match = check_phones(temp_string_1,temp_string_2,miss_char);

				if (match == 0) { match_count++; smatch = 0;}
				if (match == 1) miss_a_count++;
				if (match == 2) miss_b_count++;

/* "|| strstr(temp_string_2,"'") == 0" will remove the unstress miss match word */
/*		   if ((temp_string_1[0] == '\'' && temp_string_2[0] == '\'') || strstr(temp_string_2,"'") == 0) stress = 1;*/
				if ((temp_string_1[0] == '\'' && temp_string_2[0] == '\'')) stress = 1;
				else stress = 0;

				/* get the miss count for single phoneme miss after stripping stress */
				char_strip(temp_string_1,'\'');
				char_strip(temp_string_2,'\'');
				if ((smatch=check_phones(temp_string_1,temp_string_2,miss_char)) == 0 && match > 0)
				{
					if (stress == 0)
					{
						match = -1;
						smatch = 0;
						miss_s_count++;
					}
					else
					{
						match = 0;
						smatch = -1;
						match_count++;
					}
				}
/*		   if (match > 2) match = 0;*/
				if (smatch == 1) miss_1_count++;
				if (smatch == 2) miss_2_count++;
			}
			if (smatch > 0 || match == -1 || match > 0)
			{
				int g_size;
				if (smatch > 0)
					miss_count++;
				if (filter0 == 3)
					fprintf(fw,"%s\n",dict_list_temp->grapheme);
/*
		   if (ccflag == FALSE)
		   {
*/
				g_size = strlen(dict_list_temp->grapheme);
				/* for Noun  -- only write out the words with missing more than "filter1" number of phonemes */
				/* for other  -- only write out the words with missing more than "filter2" number of phonemes */
				if ((dict_list_temp->data[1] >= 'A' && dict_list_temp->data[1] <= 'Z') ||
					dict_list_temp->data[1]=='Ä' ||
					dict_list_temp->data[1]=='Ö' ||
					dict_list_temp->data[1]=='Ü')
				{
					if (match > filter1 || match == -1 || g_size < maxi_allow)
					{
		   				if (ccflag == FALSE)
						{
		           			fprintf(missFile,"%s",dict_list_temp->data);
						}
						final_count++;
					}
					else
					{
		   			if (filter0 == 31)
		      			fprintf(fw,"%s\n",dict_list_temp->grapheme);
				}
			}
		    else
		    {
		        if (match > filter2 || match == -1 || g_size < maxi_allow)
		        {
		   			if (ccflag == FALSE)
					{
		           		fprintf(missFile,"%s",dict_list_temp->data);
					}
					final_count++;
		        }
				else
				{
		   			if (filter0 == 31)
		      			fprintf(fw,"%s\n",dict_list_temp->grapheme);
				}
			}


	   	    if (ccflag == FALSE)
		        fprintf(analyFile,"%-5u %d %d %s   %s\n",
						dict_list_temp->line,match,smatch,
						dict_list_temp->grapheme,
						dict_list_temp->phoneme);
/*
		   }
*/

			/* display the rule decoding process */
			if (ttflag == TRUE)
			{
					printf("%-5u %d %d %s   %s\n",
					dict_list_temp->line,match,smatch,
					dict_list_temp->grapheme,
					dict_list_temp->phoneme);

					/* perform the rule converting one more time to get the trace information */
					tflag = TRUE;
					if (xxflag == TRUE) xflag = TRUE;
					if (yflag == FALSE)
					{
		   				if (laflag == LTS_GERMAN)
		      				ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);
		   				else
		      				ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);
					}
					else
					{
#ifdef ACNA
		   				short sel_lang;
		   				sel_lang =  lsa_util_id_name(&lword[0], rlp);
		   				ls_rule_lts(phTTS, &lword[0], rlp, NAME_ENGLISH, sel_lang);
#endif	
					}
					tflag = FALSE; xflag = FALSE;

					/* get the phonemes from rule engine then clear the pLts_t->phead */
					free_phones();

					printf("\t%s\n",
					dict_list_temp->phoneme_lts);
					printf("\t%s\n\n",
					string_substitute(dict_list_temp->phoneme,"=",""));

				}
				if (ccflag == FALSE)
				{
					fprintf(analyFile,"\t%s\n",
					dict_list_temp->phoneme_lts);
					fprintf(analyFile,"\t%s\n\n",
					string_substitute(dict_list_temp->phoneme,"=",""));
				}
			}
			else
			{
				if (filter0 == 2)
				fprintf(fw,"%s\n",dict_list_temp->grapheme);

			}

		/* display the phoneme */
/*
printf("%d %d %d %s   %s -- %s\n",dict_list_temp->line,match,smatch,dict_list_temp->grapheme,dict_list_temp->phoneme,dict_list_temp->phoneme_lts);
*/
			dict_list_temp = dict_list_temp->next;
		}

		/* get stop wall time and display the total wall time */
		stop_wall_time = time(0);
		total_wall_time = stop_wall_time - start_wall_time;
		tm_s  = *gmtime(&total_wall_time);


		printf("\nInput dict file      : %s\n",dicfile);
		if (ccflag == FALSE)
		{
	     printf("Output analysis file : %s\n",analyfile);
	     printf("Output miss file     : %s\n",missfile);
		}
		if (fflag == TRUE)
			printf("Dict. file(search)   : %s\n",dicbfile);
		printf("Total word count     : %6d\n",word_count);
		if (fflag == TRUE)
	      printf("Dicionary hit count  : %6d\n",dic_hit_count);
		printf("Fsave word count     : %6d\n",force_count);
		printf("Total word match     : %6d\n",match_count);
		printf("Total word miss      : %6d\n",miss_count);
		printf("Total word miss 1  s : %6d\n",miss_a_count);
		printf("Total word miss 2  s : %6d\n",miss_b_count);
		printf("Total word miss 1 ns : %6d\n",miss_1_count);
		printf("Total word miss 2 ns : %6d\n",miss_2_count);
		printf("Total word miss stre : %6d\n",miss_s_count);
		printf("\nDictionary rule check start time:         %s%s%s",HI_ON,asctime(localtime((time_t *)&start_wall_time)),HI_OFF);
		printf("Dictionary rule check stop time :         %s%s%s",HI_ON,asctime(localtime((time_t *)&stop_wall_time)),HI_OFF);
		printf("Dictionary rule check total elapsed time: %s%2d %2d:%02d:%02d%s\n",
			HI_ON,tm_s.tm_mday-1,tm_s.tm_hour,tm_s.tm_min,tm_s.tm_sec,HI_OFF);

		if (ccflag == FALSE)
		{
	     fprintf(analyFile,"\n;*Input dict file      : %s\n",dicfile);
	     fprintf(analyFile,";*Output analysis file : %s\n",analyfile);
	     fprintf(analyFile,";*Output miss file     : %s\n",missfile);
	     fprintf(analyFile,";*Final word count     : %6d\n",final_count);
	     fprintf(analyFile,";*Fsave word count     : %6d\n",force_count);
	     fprintf(analyFile,";*Total word count     : %6d\n",word_count);
	     fprintf(analyFile,";*Total word match     : %6d\n",match_count);
	     fprintf(analyFile,";*Total word miss      : %6d\n",miss_count);
	     fprintf(analyFile,";*Total word miss 1  s : %6d\n",miss_a_count);
	     fprintf(analyFile,";*Total word miss 2  s : %6d\n",miss_b_count);
	     fprintf(analyFile,";*Total word miss 1 ns : %6d\n",miss_1_count);
	     fprintf(analyFile,";*Total word miss 2 ns : %6d\n",miss_2_count);
	     fprintf(analyFile,";*Total word miss stre : %6d\n",miss_s_count);
	     fclose(dicFile);
	     fclose(analyFile);
	     fclose(missFile);
		}

		if (filter0 != 0)
		fclose(fw);

		exit(0);
	}

	/* start to take the input string if aflag is not set */
	line = 0;				/* Main loop.		*/
	while ((rlp=getword()) != NULL && aflag == FALSE)
	{
		/* if meet the exit flag ";"  then exit the loop */
        if ((&lword[0])->l_ch == ';' && redirect_input != TRUE)
           break;
        /* if meet the help flag "?"  then call help page */
        if ((&lword[0])->l_ch == '?' && redirect_input != TRUE)
		{
		   lts_help();
           continue;
		}
		++line;

        /* perform dictionary search if fflag is set */
		if (fflag == TRUE)
        {
			int c;
			/* 10/15/96 SIK Removed calls to blook and gblook */
			/*
		    * if (laflag == LTS_GERMAN)
		    *  c = gblook(&lword[0], rlp, FIRST);	
		    * else
		    */
		    c = ls_dict_blook(phTTS, &lword[0], rlp, FIRST);
   			if (c == HIT)  { printf("\n(dictionary hit)\n"); continue; }
			else
   			{ printf("\n(dictionary miss)\n"); continue; }

			}


			if (yflag == FALSE)
			{
				if (laflag == LTS_GERMAN)
					ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);	
				else
					ls_rule_lts(phTTS, &lword[0], rlp, 0, 0);	
			}
			else
			{
#ifdef ACNA
				short sel_lang;
				sel_lang =  lsa_util_id_name(&lword[0], rlp);
				ls_rule_lts(phTTS, &lword[0], rlp, NAME_ENGLISH, sel_lang);
#endif	
			}

			if (cflag == FALSE && zflag == FALSE)
			{		/* Show the result.	*/
				llp = &lword[0];
				while (llp != rlp)
				{
					putchar(llp->l_ch);
					++llp;
				}	
				if ((i = 20-(rlp-&lword[0])) <= 0)
				i = 1;
				while (i--)
					putchar(' ');
				if (sflag != FALSE)	/* Speak on.		*/
					printf("\033P;12;1z\033\\[");
				pp1 = pLts_t->phead.p_fp;	/* Display phonemes.	*/
				while (pp1 != &pLts_t->phead)
				{
					if ((pp1->p_flag&PFDASH) != 0)
						putchar('-');
					if ((pp1->p_flag&PFSTAR) != 0)
						putchar('*');
					if ((pp1->p_flag&PFHASH) != 0)
						putchar('#');
					/* Display the "+" only if the debug	*/
					/* flag is set; Tony uses a lot of'em.	*/
					if (dflag!=FALSE && (pp1->p_flag&PFPLUS)!=0)
						putchar('+');
					if ((pp1->p_flag&PFSYLAB) != 0)
						s = pp1->p_stress;
					if (laflag == LTS_ENGLISH || laflag == LTS_ENGLISH_UK)
					{
						if (s != SUN && (pfeat[pp1->p_sphone]&(PVOC|PBOTH)) != 0)
						{
							if (s == SPRI)
								putchar('\'');
							else if (s == SSEC)
								putchar('\`');
							s = SUN;
						}
					}
					if (laflag == LTS_GERMAN)
                                {
/*				   if (s != SUN+9 && (gpfeat[pp1->p_sphone]&(PVOC|PBOTH)) != 0) */
					if (s != SUN+9) 
					{
						if (s == SPRI+9)
							putchar('\'');
						else if (s == SSEC+9)
							putchar('\`');
						s = SUN+9;
					}
				}
				if (bflag!=FALSE && pp1->p_uphone!=SIL)
					putchar('[');
				putchar(pname[pp1->p_sphone]);
				if (bflag!=FALSE && pp1->p_uphone!=SIL)
				{
					putchar(pname[pp1->p_uphone]);
					putchar(']');
				}
				pp1 = pp1->p_fp;
			}
			if (sflag != FALSE)
			{
				putchar(']');
				putchar('.');
			}
			printf("\t%s",make_phones_code(asccode,arpacode));
			putchar('\n');
			printf("%s <==> ",asccode);
			printf("%s\n",arpacode);

			if (sflag != FALSE)
			{	/* Speak off.		*/
				printf("\033P;12;0z\033\\");
				fflush(stdout);
			}
		}
		pp1 = pLts_t->phead.p_fp;		/* Free "PHONE" chain	*/
		while (pp1 != &pLts_t->phead)
		{
			pp2 = pp1->p_ip;
			while (pp2 != NULL)
			{
				pp3 = pp2->p_ip;
				lts_pfree(phTTS, pp2);
				pp2 = pp3;
			}
			pp2 = pp1->p_fp;
			lts_pfree(phTTS, pp1);
			pp1 = pp2;
		}
	} /* end of while ((rlp=getword()) != NULL && aflag == FALSE) */


	if (cflag != FALSE || zflag != FALSE)			/* Print usage counts	*/
		showcounts(ltsfile);
	exit(0);
}

/*
 * Print the rule counts.
 * The counts are printed out in
 * line number order; this makes it a little
 * easier to associate the rules with the
 * input lines (I think).
 */
showcounts(char *ltsfile)
{
	int	nrule;
	int	i;
	int	j;
	int	k;
	int	*lbuf;			/* Line number []	*/
	int	*cbuf;			/* Rule counts []	*/
	int	total_hit=0;
	int	total_miss=0;

	nrule = 0;				/* Count the rules	*/
	for (i=0; i<ngraph; ++i)
		nrule += lswtab[2*i + 1];
	if ((lbuf = (int *)calloc(1, nrule*sizeof(int))) == NULL
	||  (cbuf = (int *)calloc(1, nrule*sizeof(int))) == NULL)
		fatal(0,"Sort malloc failed");

	nrule = 0;				/* Fill in the arrays	*/

	for (i=0; i<ngraph; ++i)
	{
		j = lswtab[2*i + 0];		/* Index		*/
		k = lswtab[2*i + 1];		/* Number of rules	*/
		while (k--)
		{
			lbuf[nrule] = lswtab[j+4];
			cbuf[nrule] = lswtab[j+5];
#ifdef debug
if (cbuf[nrule] != 0) printf("%d %d %d\n",nrule,lbuf[nrule],cbuf[nrule]);
#endif
			++nrule;
			j += 6;
		}
	}
	i = nrule;				/* Sort by line number	*/
	while (i >= 2)
	{
		j = 0;				/* Old best entry	*/
		for (k=1; k<i; ++k)
		{		/* Find largest		*/
			if (lbuf[k] > lbuf[j])
				j = k;
		}
		--i;
		if (j != i)
		{			/* Move to best spot	*/
			k = lbuf[j];
			lbuf[j] = lbuf[i];
			lbuf[i] = k;
			k = cbuf[j];
			cbuf[j] = cbuf[i];
			cbuf[i] = k;
		}
	}

	printf("Line   Count\n");		/* Print the list	*/
	printf("----   -----\n");
	for (i=0; i<nrule; ++i)
    {
        if (cflag == TRUE && cbuf[i] == 0)
        {
				total_miss++;
                if (xflag == TRUE)
                {
                    printf("%-4d   %-5d  ", lbuf[i], cbuf[i]);
                    printf("%s",get_rule_data(lbuf[i]));
                }
                else
                    printf("%-4d   %-5d\n", lbuf[i], cbuf[i]);
         }
         if (zflag == TRUE && cbuf[i] != 0)
         {
			total_hit++;
            if (xflag == TRUE)
            {
                    printf("%-4d   %-5d  ", lbuf[i], cbuf[i]);
                    printf("%s",get_rule_data(lbuf[i]));
            }
            else
                    printf("%-4d   %-5d\n", lbuf[i], cbuf[i]);
         }
    }
	printf("------------\n");
	printf("Rule file   : %s\n",ltsfile);
	printf("rule count  : %-5d\n",nrule);
    if (zflag == TRUE)
	   printf("rule hitted : %-5d\n",total_hit);
    if (cflag == TRUE)
	   printf("rule missed : %-5d\n",total_miss);

	free((char *) lbuf);			/* Release the space	*/
	free((char *) cbuf);
}

/*
 * Read a word. Put the word into
 * the "lword" array. Make sure all of the index
 * fields are NULL. Return the address in "lword"
 * to the right of the last letter on success,
 * and NULL on end of file. Some case mapping
 * is done for "ls4.c".
 */
LETTER	*getword()
{
	LETTER	*lp;
	int	c;

	while ((c=getchar())==' ' || c=='\t' || c=='\n')
		;
/*printf("input **%d**\n",(int)c);*/
	if (c == EOF)
		return (NULL);
	lp = &lword[0];
	do {
		if (lp < &lword[NGWORD])
		{
			if (fflag != TRUE)
			   if ((c>='A' && c<='Z') || (int)c == 196 || (int)c == 214 || (int)c == 220)
				c += 0x20;
			lp->l_ch = c;
			lp->l_ip = NULL;
			++lp;
			lp->l_ch = NULL;
			lp->l_ip = NULL;
		}
		c = getchar();
	} while (c!=EOF && c!=' ' && c!='\t' && c!='\n');
	ungetc(c, stdin);
	return (lp);
}

/*
 * This routine processes 
 * redirection arguments in a UNIX like
 * way. It scans across the args, squashing
 * out redirection args. and reopening the standard
 * input and output streams as required.
 * It returns the new value of the "argc" for
 * future use.
 */
redirect(int argc, char *argv[])
{
	char	*cp;
	int	oargc;
	int	nargc;
	int	fd;

	oargc = 0;
	nargc = 0;
	while (oargc < argc)
	{
		cp = argv[oargc++];
		if (*cp == '<')
		{
			++cp;
            redirect_input = TRUE;
			if (freopen(cp, "r", stdin) == NULL)
			{
				fprintf(stderr, "%s: cannot open\n", cp);
				exit(1);
			}
			continue;
		}
		if (*cp == '>')
		{
			++cp;
			if (*cp == '>')
			{
				++cp;
				if (access(cp, 2) == 0)
				{
					if (freopen(cp, "a", stdout) == NULL)
					{
						perror(cp);
						exit(1);
					}
					continue;
				}
			}
			if ((fd=creat(cp, 0666, "rfm=var", "rat=cr")) < 0
			|| dup2(fd, fileno(stdout)) < 0)
			{
				perror(cp);
				exit(1);
			}		
			continue;
		}
		argv[nargc++] = cp;
	}
	return (nargc);
}

/*
 * Print a usage message and
 * quit. The message is a one line
 * summary of the command syntax.
 */
usage()
{
	fprintf(stderr, "Usage: lts [-bcdrst] [rulefile]\n");
	exit(1);
}

static void fatal(char *s1, char *s2)
{
        fprintf(stderr, "Fatal: ");
        if (s1 != NULL)
                fprintf(stderr, "%s: ", s1);
        fprintf(stderr, "%s\n", s2);
        exit(1);
}



/*
** make the rule table
**
*/
void lts_mktab(char *ltsFilename,char *rulFilename)
{

FILE *rulFile;

/*char	*cp;*/
/*short	*sp;*/
unsigned char	*cp;
unsigned short	*sp;
int	nline;

long	total_bytes;

unsigned long start_wall_time=0;
struct tm tm_s;

    /* get starting wall time */
    start_wall_time = time(0);

    /* open to write rulFile file */
    if ((rulFile = fopen(rulFilename,"w")) == 0)
    {
       printf("error input!! -- can not write to this file %s\n",rulFilename);
       exit(1);
    }

/*
 *  write out the file header ...
 */

	fprintf(rulFile, "/*\n");
	fprintf(rulFile, " * LTS tables.\n");
	fprintf(rulFile, " * Read from file: %s\n",ltsFilename);
	fprintf(rulFile, " * Written to file: %s\n",rulFilename);

	fprintf(rulFile,"*  Created on : %s ",asctime(localtime((time_t *)&start_wall_time)));
	fprintf(rulFile,"\n */");

/*
 *  write out the index table ..
 */
	total_bytes = 0;
	nline = 0;
	if (gflag == LTS_NO_ACNA)
	   fprintf(rulFile, "\nU16 far lswtab[] = {\n\t");
	if (gflag == LTS_ACNA)
	   fprintf(rulFile, "\nU16 far acna_lswtab[] = {\n\t");

	sp = &lswtab[0];
	while (sp != lswp)
	{
		if (nline >= 5)
		{
			fprintf(rulFile, "\n\t");
			nline = 0;
		}
		fprintf(rulFile, "0x%04X", *sp++ & 0xFFFF);
		total_bytes+=2;
		if (sp != lswp)
			fprintf(rulFile, ",");
		++nline;
	}
	if (nline != 0)
		fprintf(rulFile, "\n");
	fprintf(rulFile, "};\n");
	fprintf(rulFile, "\n");

/*
 *  write out the grapheme and phoneme tables ...
 */

	if (gflag == LTS_NO_ACNA)
	   fprintf(rulFile, "\nunsigned char far lsbtab[] = {\n\t");
	if (gflag == LTS_ACNA)
	   fprintf(rulFile, "\nunsigned char far acna_lsbtab[] = {\n\t");

	nline = 0;
	cp = &lsbtab[0];
	while (cp != lsbp)
	{
		if (nline >= 8)
		{
			fprintf(rulFile, "\n\t");
			nline = 0;
		}
		++nline;
		fprintf(rulFile, "0x%02X", *cp++ & 0xFF);
		total_bytes++;
		if (cp != lsbp)
			fprintf(rulFile, ",");
	}
	if (nline != 0)
		fprintf(rulFile, "\n");
	fprintf(rulFile, "};\n");

/*
 *  close the files and say that we're all done ...
 */

	fclose(rulFile);

	return;
}

/***********************************************************************
**
** DESCRIPTION
**
**  The add_list_tail() function will do the following task:
**
**  1). add list_item to the list tail
**
**      incoming arguments:
**
**               code		 0 for RULE_data
**				 1 for DICT_data
**               **list_head     pointer to pointer of list head
**               **list_tail     pointer to pointer of list tail
**               **list_item     pointer to pointer of list item adding to list tail
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
void add_list_tail(int code,
					void **list_head,
					void **list_tail,
					void **list_item)
{

    /* if list is empty, add the list_item to the list head */
    if (*list_head == 0)
    {
		*list_head = *list_item;
		*list_tail = *list_item;
    }
    else
    /* if list is not empty, add the list_item to the list tail */
    {
		if (code == 0)  ((struct RULE_data *)*list_tail)->next = (struct RULE_data *)*list_item;
		if (code == 1)  ((struct DICT_data *)*list_tail)->next = (struct DICT_data *)*list_item;
		*list_tail = *list_item;
    }
    return;

}


/***********************************************************************
**
** DESCRIPTION
**
**  The get_rule_data() function will do the following task:
**
**  1). get the rule data from rule link list
**
**      incoming arguments:
**
**               line_number     line number of rule file
**
**
** RETURN VALUE:
**
**  rule data string
**
** SPECIAL NOTES:
**
**  none
**
*/
char *get_rule_data(unsigned int line_number)
{
    rule_list_temp = rule_list_head;
    while(rule_list_temp)
    {
        if (rule_list_temp->line == line_number)
           return(rule_list_temp->data);
        rule_list_temp = rule_list_temp->next;
    }

    return("");
}


/***********************************************************************
**
** DESCRIPTION
**
**  The make_phones() function will do the following task:
**
**  1). construct the phone string from PHONE data structure
**
**      incoming arguments:
**
**
**
** RETURN VALUE:
**
**  rule data string
**
** SPECIAL NOTES:
**
**  none
**
*/
char *make_phones()
{
	static char phones[NOR_WORD_SIZE]={""};
	PHONE	*pp1,*pp2,*pp3;
	int	s,i;

	strcpy(phones,"");
	i = 0;
	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead)
	{
		if ((pp1->p_flag&PFDASH) != 0)
		   phones[i++] = '-';
		if ((pp1->p_flag&PFSTAR) != 0)
		   phones[i++] = '*';
		if ((pp1->p_flag&PFHASH) != 0)
		   phones[i++] = '#';
		if ((pp1->p_flag&PFSYLAB) != 0)
			s = pp1->p_stress;
        if (laflag == LTS_ENGLISH || laflag == LTS_ENGLISH_UK)
        {
		   if (s != SUN && (pfeat[pp1->p_sphone]&(PVOC|PBOTH)) != 0)
		   {
			if (s == SPRI)
		 	   phones[i++] = '\'';
			else if (s == SSEC)
		 	   phones[i++] = '\`';
			s = SUN;
		   }
		}
		if (laflag == LTS_GERMAN)
        {
/*		   if (s != SUN+9 && (gpfeat[pp1->p_sphone]&(PVOC|PBOTH)) != 0) */
		   if (s != SUN+9)
		   {
				if (s == SPRI+9)
		 			phones[i++] = '\'';
				else if (s == SSEC+9)
		 			phones[i++] = '\`';
				s = SUN+9;
		   }
		}
		phones[i++] = pname[pp1->p_sphone];
		pp1 = pp1->p_fp;
	}
	phones[i] = '\0';

	/* Free "PHONE" chain  */
	free_phones();

	return(phones);
}
void *free_phones()
{
	PHONE	*pp1,*pp2,*pp3;

	/* Free "PHONE" chain  */
	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead)
	{
		pp2 = pp1->p_ip;
		while (pp2 != NULL)
		{
			pp3 = pp2->p_ip;
			lts_pfree(phTTS, pp2);
			pp2 = pp3;
		}
		pp2 = pp1->p_fp;
		lts_pfree(phTTS, pp1);
		pp1 = pp2;
	}

	return;
}

/***********************************************************************
**
** DESCRIPTION
**
**  The make_phones_code() function will do the following task:
**
**  1). construct the phone string from PHONE data structure
**
**      incoming arguments:
**
**
**
** RETURN VALUE:
**
**  rule data string
**
** SPECIAL NOTES:
**
**  none
**
*/
char *make_phones_code(char *asccode,char *arpacode)
{
	static char phones_code[MAX_WORD_SIZE]={""};
	PHONE	*pp1,*pp2,*pp3;
	int	s,i,temp;

	strcpy(asccode,"");
	strcpy(arpacode,"");
	strcpy(phones_code,"");
	i = 0;
	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead)
	{
		if ((pp1->p_flag&PFDASH) != 0)
		{
		   temp = SBOUND;
		   sprintf(phones_code,"%s(%d)",phones_code,temp);
		   build_code(asccode,arpacode,temp);
		}
		if ((pp1->p_flag&PFSTAR) != 0)
		{
		   temp = MBOUND;
		   sprintf(phones_code,"%s(%d)",phones_code,temp);
		   build_code(asccode,arpacode,temp);
		}
		if ((pp1->p_flag&PFHASH) != 0)
		{
		   temp = HYPHEN;
		   sprintf(phones_code,"%s(%d)",phones_code,temp);
		   build_code(asccode,arpacode,temp);
		}
		if ((pp1->p_flag&PFSYLAB) != 0)
			s = pp1->p_stress;
        if (laflag == LTS_ENGLISH || laflag == LTS_ENGLISH_UK)
        {
			if (s != SUN && (pfeat[pp1->p_sphone]&(PVOC|PBOTH)) != 0)
			{
				if (s == SPRI)
				{
/*		   			temp = SPRI;*/
		   			temp = 103;
		   			sprintf(phones_code,"%s(%d)",phones_code,temp);
					build_code(asccode,arpacode,temp);
				}
				else if (s == SSEC)
				{
/*		   			temp = SSEC;*/
		   			temp = 102;
		   			sprintf(phones_code,"%s(%d)",phones_code,temp);
					build_code(asccode,arpacode,temp);
				}
				s = SUN;
			}
		}
		if (laflag == LTS_GERMAN)
        {
/*		   if (s != SUN+9 && (gpfeat[pp1->p_sphone]&(PVOC|PBOTH)) != 0) */
		   if (s != SUN+9)
		   {
				if (s == SPRI+9)
				{
/*		   			temp = SPRI+9;*/
		   			temp = 103;
		   			sprintf(phones_code,"%s(%d)",phones_code,temp);
					build_code(asccode,arpacode,temp);
				}
				else if (s == SSEC+9)
				{
/*		   			temp = SSEC+9;*/
		   			temp = 102;
		   			sprintf(phones_code,"%s(%d)",phones_code,temp);
					build_code(asccode,arpacode,temp);
				}
				s = SUN+9;
		   }
		}
		temp = pp1->p_sphone;
		sprintf(phones_code,"%s(%d)",phones_code,temp);
		build_code(asccode,arpacode,temp);
		pp1 = pp1->p_fp;
	}

	strcat(phones_code,"\0");
	strcat(asccode,"\0");
	strcat(arpacode,"\0");

	return(phones_code);
}
void build_code(char *asccode,char *arpacode,int temp)
{
    if (laflag == LTS_GERMAN)
    {
#ifdef GERMAN
		sprintf(asccode,"%s(%c)",asccode,german_ascky[temp]);
		sprintf(arpacode,"%s(%c%c)",arpacode,german_arpa[temp*2],german_arpa[temp*2+1]);
#endif
	}
    else
    {
#ifdef ENGLISH_US
		sprintf(asccode,"%s(%c)",asccode,usa_ascky[temp]);
		sprintf(arpacode,"%s(%c%c)",arpacode,usa_arpa[temp*2],usa_arpa[temp*2+1]);
#endif    
#ifdef ENGLISH_UK
        sprintf(asccode,"%s(%c)",asccode,uk_ascky[temp]);
        sprintf(arpacode,"%s(%c%c)",arpacode,uk_arpa[temp*2],uk_arpa[temp*2+1]);
#endif    
	}
    return;
}

/***********************************************************************
**
** DESCRIPTION
**
**  The check_phones() function will do the following task:
**
**  1). compare the two incoming phoneme string
**
**      incoming arguments:
**
**               char *string_1  string 1
**               char *string_2  string 2
**		 char *miss_char miss match characters
**
**
** RETURN VALUE:
**
**  0 -- match
**  1 -- no match
**
** SPECIAL NOTES:
**
**  none
**
*/
int check_phones(char *string_1,char *string_2,char *miss)
{
int i,j;
int match=98;

    strcpy(miss,"  ");
    if ((strlen(string_1) == 0 && strlen(string_2) != 0) ||
       (strlen(string_1) != 0 && strlen(string_2) == 0))
	return(match);
    /* push the stress to the following vowel */
    for (i=0;i<strlen(string_1);++i)
    {
        if (string_1[i] == '\'')
        {
           if  (check_vowel(string_1[i+1]) == 1)
           {
               break;
           }
           else
           {
               string_1[i] = string_1[i+1];
               string_1[i+1] = '\'';
           }
        }
    }
    for (i=0;i<strlen(string_2);++i)
    {
        if (string_2[i] == '\'')
        {
           if  (check_vowel(string_2[i+1]) == 1)
           {
               break;
           }
           else
           {
               string_2[i] = string_2[i+1];
               string_2[i+1] = '\'';
           }
        }
    }

    match = 0;
    for (i=0,j=0;i<strlen(string_1) && j<strlen(string_2);++i,++j)
    {
		if (laflag == LTS_ENGLISH)
		{
/*
			if (string_1[i] == 'x' && string_2[j] == '|') continue;
			if (string_2[j] == 'x' && string_1[i] == '|') continue;
*/
			if (string_1[i] == 'x' && string_2[j] == '^') continue;
			if (string_2[j] == 'x' && string_1[i] == '^') continue;
			if (string_1[i] == 'I' && string_2[j] == '|') continue;
			if (string_2[j] == 'I' && string_1[i] == '|') continue;

			if (string_1[i] == 'Y' && string_2[j] == 'y' && string_2[j+1] == 'u')
			{ ++j;    continue; }
			if (string_2[j] == 'Y' && string_1[i] == 'y' && string_1[i+1] == 'u')
			{ ++i;    continue; }

			if (string_1[i] == 'N' && string_2[j] == 'x' && string_2[j+1] == 'n')
			{ ++j;    continue; }
			if (string_2[j] == 'N' && string_1[i] == 'x' && string_1[i+1] == 'n')
			{ ++i;    continue; }

			if (string_1[i] == 'M' && string_2[j] == 'x' && string_2[j+1] == 'm')
			{ ++j;    continue; }
			if (string_2[j] == 'M' && string_1[i] == 'x' && string_1[i+1] == 'm')
			{ ++i;    continue; }

			if (string_1[i] == 'R' && string_2[j] == 'x' && string_2[j+1] == 'r')
			{ ++j;    continue; }
			if (string_2[j] == 'R' && string_1[i] == 'x' && string_1[i+1] == 'r')
			{ ++i;    continue; }

			if (string_1[i] == 'L' && string_2[j] == 'x' && string_2[j+1] == 'l')
			{ ++j;    continue; }
			if (string_2[j] == 'L' && string_1[i] == 'x' && string_1[i+1] == 'l')
			{ ++i;    continue; }
		}
		if (laflag == LTS_GERMAN)
		{
			/* skip r/R, x/X allophone */
			if (string_1[i] == 'x' && string_2[j] == 'X') continue;
			if (string_1[i] == 'X' && string_2[j] == 'x') continue;
			if (string_1[i] == 'r' && string_2[j] == 'R') continue;
			if (string_1[i] == 'R' && string_2[j] == 'r') continue;

			/* skip glottal stop before we add this into rule engine */
			if (string_1[i] == '|' && string_2[j] != '|') { --j; continue;}
			if (string_1[i] != '|' && string_2[j] == '|') { --i; continue;}

#if 0
			/* skip b/p,g/k,d/t,v/f allophone */
			if (string_1[i] == 'b' && string_2[j] == x) continue;
			if (string_1[i] == 'd' && string_2[j] == 't') continue;
			if (string_1[i] == 'g' && string_2[j] == 'k') continue;
			if (string_1[i] == 'v' && string_2[j] == 'f') continue;
			if (string_1[i] == 'p' && string_2[j] == 'b') continue;
			if (string_1[i] == 't' && string_2[j] == 'd') continue;
			if (string_1[i] == 'k' && string_2[j] == 'g') continue;
			if (string_1[i] == 'f' && string_2[j] == 'v') continue;
#endif
		}

		if (string_1[i] != string_2[j])
/*	{ match = 1;    break; } */
		{ match++; miss[0] = string_1[i]; miss[1] = string_2[j]; }
    }

    if (i != strlen(string_1) || j != strlen(string_2))
    {
       int mmatch;
       mmatch = strlen(string_1) - strlen(string_2);
       if (mmatch < 0) mmatch = (-1)*mmatch;
       match = match + mmatch;
    }
    return(match);
}

int check_vowel(char char_check)
{
int i;

    if (char_check == ' ' || char_check == '\n' || char_check == '\t') return(0);

    if (laflag == LTS_GERMAN)
    {
       for (i=0;gvoc_list[i] != ' ';++i)
       {
         if (gvoc_list[i] == char_check) return(1);
       }
    }
    if (laflag == LTS_ENGLISH)
    {
       for (i=0;evoc_list[i] != ' ';++i)
       {
         if (evoc_list[i] == char_check) return(1);
       }
    }
    if (laflag == LTS_ENGLISH_UK)
    {
       for (i=0;uevoc_list[i] != ' ';++i)
       {
         if (uevoc_list[i] == char_check) return(1);
       }
    }

    return(0);
}


/***********************************************************************
**
** DESCRIPTION
**
**  The lts_help() function will do the following task:
**
**  1). display help screen
**
**      incoming arguments:
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
lts_help()
{
    printf("LTS tester/rule tab generator  rev: %s\n",REV);
    printf("command line argument:\n");
    printf("  -a -- (dictionary check) flag -b -- (block reduction) flag\n");
    printf("  -c -- (counts) flag. show count of each rule not hitted\n");
    printf("  -z -- (counts) flag. show count of each rule hitted\n");
    printf("  -x -- (rule) flag. show rule  -y -- (ACNA on) flag\n");
    printf("  -d -- (debug) flag.  -t -- (trace) flag\n");
    printf("  -s -- (speak) flag.  -r -- (running commentary) flag\n");
    printf("  -g -- (rule table generation) flag. EX: -gACNA or -g\n");
    printf("  -l -- (language) flag. EX: -lUS_engglish or -lGerman\n");
    printf("  <file_name    -- read input from file_name\n");
    printf("  >file_name    -- write output to file_name\n");
    printf("  >>file_name   -- append output to file_name\n");
    printf("  \"file_name\"   -- use rule file file_name\n");
    printf("Example:\n");
    printf("$ %slts -c <test.txt >test.out%s\n",HI_ON,HI_OFF);
    printf("  read test file %stest.txt%s\n",HI_ON,HI_OFF);
    printf("  get the rule count hit data then write to %stext.out%s\n",HI_ON,HI_OFF);
    printf("$ %slts -t \"dtpc.lts\"%s\n",HI_ON,HI_OFF);
    printf("  read rule file %sdtpc.lts%s\n",HI_ON,HI_OFF);
    printf("  go into %strace mode%s with interactive input mode\n",HI_ON,HI_OFF);
    printf("  ** terminated the input section by type in %s;%s\n",HI_ON,HI_OFF);
    return;
}

void lts_pfree(LPTTS_HANDLE_T	phTTS, PHONE *pp)
{
   PLTS_T pLts_t;
   pLts_t = phTTS->pLTSThreadData;

   /* 10/15/96 Removed to support VMS build */
   /*
    * if (laflag == LTS_GERMAN)
    *	gpfree(pp);
    * else
    */
	ls_rule_phone_free(pLts_t, pp);

   return;
}

void lds_sendphone(int ph)
{
   if (filter3 == 0 )
   {
     if (ccflag == FALSE && aflag == FALSE)
        if (ph == 111) printf(" ");
        else
        printf("%c",pname[ph]);
   }
   else
   {
#ifdef ENGLISH_US
	   printf("%d(%d)\n",(PFUSA<<PSFONT) + ph,ph);
#endif
#ifdef ENGLISH_UK
           printf("%d(%d)\n",(PFUK<<PSFONT) + ph,ph);
#endif
#ifdef GERMAN
	   printf("%d(%d)\n",(PFD<<PSFONT) + ph,ph);
#endif
   }
   return;
}


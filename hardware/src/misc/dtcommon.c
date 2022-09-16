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
 *    File Name:	dtcommon.c
 *    Author:		Carl Leeber
 *    Creation Date:07-JUL-1995
 *
 *    Functionality:
 *    Contains a collection of driver access functions used by
 *       DTSTART, DTDEMO and DTTEST (when it is written).
 *
 ***********************************************************************
 *    Revision History:
 * 000 cjl 07-JUN-1995, Create as a dummy file to be replaced later.
 * 001 adn  13-JUN-1995, Added the common functions of DTSTART and DTDEMO.
 * 002 cjl	31-JUL-1995, Added FDTSTARP.H & FDTDEMP.H.
 * 003 jdb  17-SEP-1995, replaced /n's with \n's. 
 * 004 gl   18-Oct-1995, replaced 011 with 013 to flush the . 
 * 005 jdb  23-Oct-1995, restored "reset" arrays to medium size 
 * 006 tek  31-oct-1995, changed sizeof to strlen for strings.
 * 007 adn  01-dec-1995, changed how you exit the typing and edit options.
 *                       Used to type an *, now just hit a return.
 * 008 gl   09-feb-1996, use "unsigned char" to replace "char" to support
 *                       move the index storage offset from 0xff to 0x100
 * 009 gl   12-feb-1996  increase the frame_data[] size to 64*8+1 to slove
 *                       problem of losing edit[] data.
 * 010 gl   03-May-1996  add space in the end of string for dtstart.
 *
 * 011 adn  05-Jun-1996  modified the printf statement in the 'install'
 *						 function. created an 'install2' function for a
 *						 new .exe called dtspeak.  dtspeak will not have
 *						 a pause after the dt_driv install check.
 *
 * 012 cjl  10-jun-1996  re-code changes from 011 & add install_pause
 *						 to dtstart function. remove dtspeak function.
 * 
 * 013 cjl  12-jun-1996  re-code changes from 012 & remove install_pause,
 *						 from dtstart; remove installcore & installnp
 *						 functions; add bell to install error msg.
 * 
 * 014 cjl  12-JUN-1996  add #ifndef for DTEX to noop unsupported options
 *						 remove one exit too many from install.
 * 015 MGS	24-JUL-1996	Fixed the problem with dtstart saying ":1u"
 * 016 TQL  05-FEB-1997 Included "dtdemp.h" instead of "dt_com_p.h"
 */


#include "dttsr.h"        /* header files */
#include "dtdemp.h"       /* English dtdemo prototype file */
#include "dtdemo.h"       /* External Declarations for xDTDEMO */
#include "dtstart.h"      /* External Declarations for xDTSTART */
#include <string.h>       /* standard string library */
#include <stdio.h>

/************************************************************************/
/* Variable Declarations from DTDEMO.C */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/************************************************************************/
unsigned char defbuf[CHARARRAYSIZL];

int ndect;                                  


/************************************************************************/
/* End of Variable Declarations from DTDEMO.C */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/************************************************************************/

/************************************************************************/
/* Variable Declarations from DTDEMO.C */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/************************************************************************/
unsigned int frame_data[64*8+1];
unsigned char sb_data[64*8*2];
int read_size,next_byte,next_sample;
unsigned char *bufptr;
FILE    *voc;
int voc_module;
struct dectalk_char_buff  dtbuf;
long pcount;
int lindx=1;          /* last index, used in sayit */
long safetycnt=0;     /* used in sayit */   

/* commented out as unused var - 8/9/95  JDB
int dtport =3;  */   /* DECtalk com port, used in sayit */

int insquare =0;      /* used in sayit */
int quit;             /* used in sendfil */
int outi;             /* used in index */
int icnt=1;           /* used in index */
int nindx=1;          /* next index, used in sayit */
int isent = 1;        /* used in sayit */
int gotsq=0;          /* used in sayit */
int phonemode = 0;    /* used in sayit */
int phmode =0;        /* used in sayit */
int parse;            /* used in sendfil */
int inphodur=0;       /* used in sendfil */
int inpdur=0;         /* used in sendfil */
unsigned char outb[2000];      /* used in index */
unsigned char tmp[253];                       /* used in sendfil */
unsigned int outj[1024];                     /* used in sendfil */

  /* the voice arrays are global to prevent stack overflow */
unsigned char sil[CHARARRAYSIZS];  /* used in sendfil */
unsigned char sync[CHARARRAYSIZS];
unsigned char paul[CHARARRAYSIZS];
unsigned char harry[CHARARRAYSIZS];
unsigned char frank[CHARARRAYSIZS];
unsigned char dennis[CHARARRAYSIZS];
unsigned char betty[CHARARRAYSIZS];
unsigned char ursula[CHARARRAYSIZS];
unsigned char rita[CHARARRAYSIZS];
unsigned char wendy[CHARARRAYSIZS];
unsigned char kit[CHARARRAYSIZS];
unsigned char song[CHARARRAYSIZS];
unsigned char song2[CHARARRAYSIZS];
unsigned char song3[CHARARRAYSIZS];

unsigned char clist[CHARARRAYSIZL];
unsigned char voices[CHARARRAYSIZL];
unsigned char next[CHARARRAYSIZM];

unsigned char editbuf[256];              /* used in edit and repeat command */
unsigned char getbuf[512];               /* used in get string of chars command */
unsigned char rate[CHARARRAYSIZS];       /* load change of speaking rate*/
unsigned char canned1[CHARARRAYSIZS];
unsigned char canned2[CHARARRAYSIZS];
unsigned char setup[CHARARRAYSIZM];
unsigned char list[CHARARRAYSIZS];
unsigned char warning[CHARARRAYSIZM];
unsigned char typing[CHARARRAYSIZS];
unsigned char recieved[CHARARRAYSIZS];
unsigned char incr[CHARARRAYSIZS];
unsigned char decr[CHARARRAYSIZS];
unsigned char volset[CHARARRAYSIZS];
unsigned char setting[CHARARRAYSIZS];
unsigned char edit[CHARARRAYSIZS];
unsigned char name[CHARARRAYSIZS];
unsigned char valid[CHARARRAYSIZS];
unsigned char nopen[CHARARRAYSIZS];
unsigned char nopen2[CHARARRAYSIZS];
unsigned char nonew[CHARARRAYSIZS];
unsigned char indexnum[CHARARRAYSIZS];
unsigned char num[2];                                     /* keeps track of the index num in case 'i' so that it may be spoken*/
unsigned char sayl[CHARARRAYSIZS];                        /* say letter at different rate than speech */
unsigned char invol[CHARARRAYSIZS];
unsigned char backs[CHARARRAYSIZS];                                       /* used so DECtalk says 'space', 'delete', 'backspace' */
unsigned char space[CHARARRAYSIZS];
unsigned char dels[CHARARRAYSIZS];
unsigned char dexit[CHARARRAYSIZS];
unsigned char defalt[CHARARRAYSIZS];
unsigned char reset[CHARARRAYSIZM];
unsigned char freset[CHARARRAYSIZM];
unsigned char voicesetup[CHARARRAYSIZS];	/* send a different voice to speak the canned message */
unsigned char nosup[CHARARRAYSIZS];         /* function not supported message */
union _REGS  regs;     
   
/* commented out as unused vars - 8/9/95  JDB   
unsigned char cmdbuf[CHARARRAYSIZL];                  
*/

/************************************************************************/
/* End of Variable Declarations from DTDEMO.C */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/************************************************************************/

void test(void)
{
  int modnum = 0;       
  unsigned char hi[]="This program tests the common functions of d t demo and d t start. ";
  unsigned char anne[]="anne. ";
  int i=0;        
  unsigned char test[1];

  install(modnum);                            /*testing install function*/
  sendb(hi,strlen(hi),modnum);  /*testing sendb function*/
  printf("Please input a letter you would like the DECtalk to say: ");
  test[i] = (unsigned char)_getch();
  printf("\nThe letter the DECtalk will say is '%c'.\n",test[i]);
  send_char(test[i],modnum);                            /*testing send_char*/
  send_char('\013', modnum); 
}


/************************************************************************/
/*  Common Support Functions */
/************************************************************************/

int install(int modnum)
{
	RB.ah = DECTALK_ID;             /*defined in TSR.H*/
	RB.al = INSTALL_CHECK;  		/*defined in TSR.H*/
	RW.si = modnum;                 /*which module 0-3*/
	_int86(0x2f,&regs,&regs);
	if (RB.al != INSTALLED)
		{
		printf("DECtalk tsr not installed, please install it and try again.\n");
	    printf("Press any key to continue.\n\a"); /* signal w/ bell too. */
		while (_getch() == (int)NULL);
		exit(1);	/* install error */
	   }
}/* install ok */

int sendb(unsigned char *thebuf,int count, int modnum)
{
	struct  dectalk_char_buff   cb;
	struct  dectalk_char_buff   __far *cbp;
	
	cb.buff=thebuf;
	cb.count=count;
	cbp = &cb;

	RW.bx = FP_OFF(cbp);  /* put offset to char buff struct in bx */
	RW.dx = FP_SEG(cbp);  /*put segment in dx */
	RB.ah = DECTALK_ID;   /*defined in TSR.H*/
	RB.al = SEND_BUFF;    /*defined in TSR.H*/
   RW.si = modnum;               /*which module 0-3*/
	 _int86(0x2f, &regs, &regs);
   return(RW.ax);
}

int send_char(unsigned char schar, int modnum)                                                         
{       
   do{    /*With out this do/while loop, the DECtalk would not speak*/
	RB.ah = DECTALK_ID;   /*defined in TSR.H*/
	RB.al = SEND_CHAR;    /*defined in TSR.H*/
	RB.bl = schar;
	RW.si = modnum;       /*which module 0-3*/
	 _int86(0x2f, &regs, &regs);
	}while( regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	return(RW.ax);
}

unsigned char get_char(unsigned char schar, int modnum)
{       
	RB.ah = DECTALK_ID;   /*defined in TSR.H*/
	RB.al = GET_CHAR;     /*defined in TSR.H*/
    RB.bl = ' ';
	RW.si = modnum;       /*which module 0-3*/
	_int86(0x2f, &regs, &regs);
    printf("character caught %d: %c-%c-%d\n",modnum,(unsigned char)RW.bx,RB.bl,(int)regs.x.ax);
	if (regs.x.ax == TSR_RETRY )
      RB.bl = '\0';
        return((unsigned char)RB.bl);
}

int getb(unsigned char *thebuf, int modnum)
{
	/*only a stub is written*/
	RB.ah = DECTALK_ID;    /*defined in TSR.H*/
	RB.al = GET_CHAR;      /*defined in TSR.H, need to change to GET_BUFF when defined*/
	RW.si = modnum;                   /*which module 0-3*/
	 _int86(0x2f, &regs, &regs);
	return(0);
}

	

int flush(int modnum)
{
	RB.ah = DECTALK_ID;    /*defined in TSR.H*/
	RB.al = FLUSH_TEXT;    /*defined in TSR.H*/
	RW.si = modnum;                   /*which module 0-3*/
	 _int86(0x2f, &regs, &regs);
	return(RW.ax);
}       

/************************************************************************/
/*  End of Common Support Functions */
/************************************************************************/

/*************************************************************************/
/* Main Function from dtstart.c */
/* This code originated in DTSTART.C 06-14-95 cjl */
/*************************************************************************/

int dtstart(int argc1,unsigned char **argv1)
{
        unsigned char dcharbuf[256];
	int size;
	int go;
	int tc=9;
	go=1;
   	install(0);
   	
	ndect=RW.si;

	switch(argc1)
	   {
	    case 1:/*NOinput specified sendthedefault */
		 sendb(defbuf,strlen(defbuf)+1,0);
		 break;
	    case 2: /*string to output */
	    	/* change size=1 to size=0 MGS */
		 for(size=0;argv1[1][size];size++);
		 sendb(argv1[1],size,0);
		 send_char('\013',0);
		 send_char(' ',0);
		 break;
	    default:
		 printf("Input format is incorrect the normal form is ..\n");
		 printf("START \"Type any text in quotes.\"\n");
		 printf ("You may type a string to be spoken now (no quotes needed).\n");
		 dcharbuf[0]='\0';
		 tc=0;
                 while ((dcharbuf[tc] = (unsigned char)_getch()) != '\r')
		    {
		    putchar(dcharbuf[tc++]);
		    if (dcharbuf[tc-1] == '\010'){
			putchar(' '); /* print space */
			putchar('\010'); /*and back up again*/
			tc=tc-2;
			}
		    if (dcharbuf[tc-1] == '\r'){
			dcharbuf[tc-1] = ' ';
			putchar('\n');
			putchar('\r');
			}
		    }
		dcharbuf[tc++]='\013';
		dcharbuf[tc]='\0';
		_cputs("\r\n");
		sendb(dcharbuf,tc,0);
		break;
		}
	return(0);
}

/*************************************************************************/
/* End of Main Function from dtstart.c */
/* This code originated in DTSTART.C 06-14-95 cjl */
/*************************************************************************/

/*************************************************************************/
/* Main Function from dtdemo.c */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/*************************************************************************/

void dtdemo(int argc1,unsigned char **argv1)
{
	 /* define local variables */
	int inp;                        /* input */
	int count=0;                    /* used in option 'i' to get index */
        unsigned char chbuf[30];                 /* used in volume, load file, hear voices command */
        unsigned char *chbptr;                 /* used in volume, load file, hear voices command */
	unsigned char inchar;           /* in character */
        unsigned char sayc[]="[:say clause]\013";  /* say clause */
	FILE  *fp;                   /* file pointer */
    int go=1;                       /* user hasn't typed 'q' for quit yet */
    int i=0;                        /* counter */
	int tc=9;                       /* index counter for edit buf array */
	int vol;                        /* inputed volume */
	int spoken=0;                   /* user doesn't want commands spoken */
    int hear;
	int resstat = 0;

	install(0);

	
	flush(0);                        /* asynchronously flushes buffer */
   do{
	   while(sendb(setup,strlen(setup),0) != TSR_SUCCESS); /* Is a spoken setup desired */
	   inp = _getch();
      if (inp=='\r')
	{
	     spoken=1;                  /* user does want commands spoken */
	}
	   } while(!(inp ==' ' || inp =='\r'));
	inp=0; 
   flush(0);    
	printf("%s",list);            /* prompt if want to see list of commands */
	if (spoken) while (sendb(list,strlen(list),0) != TSR_SUCCESS);
	printf("\n>");
	while (sendb(freset,strlen(freset)-1,0) != TSR_SUCCESS);     /* reset voice */
   
   while (go)                    /* have not hit 'q' yet*/
      {
		if (_kbhit())
			{
	      inp = tolower( _getch());  /* Get a command character from the keyboard*/
	      putchar(inp);
	 putchar('\n');
	if (spoken)
                                flush_char((unsigned char)inp);
			else
				flush(0);
			}
		if(inp != 0)  /* if valid command exists process it*/
			{
		resstat =0;
	   switch (inp)               /* do command */
	      {
	      case 't':               /* Typing demo.  uses the flush_char function */
		   printf("%s\n",typing);
	    if (spoken) while (sendb(typing,strlen(typing),0)!=TSR_SUCCESS);
	    while (sendb(rate,strlen(rate),0) != TSR_SUCCESS);       /* changes speaking rate */
		      do{
                         inchar = (unsigned char)_getch();     /* get character from keyboard until an '*' */
			 flush_char(inchar);          /* used in typing mode to speak faster */
	       if (inchar == '\b')    /* ADN for backspacing */
		  {        
		  putchar('\010');
		  putchar(' ');
		  }
		if (inchar != '\r')
		  putchar(inchar);
			 }while(inchar != '\r');
				inp=0;
		      break;

       /*  case 'z':       /* to get the DECtalk version number
	    if (status() == TSR_SUCCESS)
				inp = 0;
	    break;    */     

		 case 'a':     /* play a digitized file */
#ifndef DTEX
	    if ((voc=fopen("dec.voc","r+b")) == 0)
			{
				printf("  %s ",nopen);
	       if (spoken)
					   {
					   while(sendb(nopen,strlen(nopen),0) != TSR_SUCCESS);
				      inp =0;
					   }
			 break;
			 }
	    dtpc_cmd(DIGITIZED_MODE,0);
		      play_sb();
		 fclose(voc);
		dtpc_cmd(TEXT_MODE,0);
				inp =0;
#else
		      printf("%s",nosup);                          /* Prompt */
		      if (spoken) while (sendb(nosup,strlen(nosup),0) != TSR_SUCCESS);
			  inp = 0;
#endif
	    break;                              
      /*
       *  case i: to see the last index, has been commented out.  Developers
       *  might want to use it to get familiar with the indexing process, but
       *  customers have no use for it.
       */
	     /*case 'i':                           */ /* see last indexed processed 
	 count=get_index();               /* get index 
	  if (count == -1 )
	     {
		       printf("%s",nonew);
	     if (spoken) while (sendb(nonew,strlen(nonew),0) != TSR_SUCCESS);
	     }
		else
	    {
            num[0]=(unsigned char)count;
	    num[1]='\0';
		      printf("%s%d",indexnum,count); 
	    if (spoken) sendb(indexnum,strlen(indexnum),0);     */ /* print and say index 
	    if (spoken) sendb(num,strlen(num),0);           
	    }
			   inp =0;
		      break;       */

	  /*    case 'p':                          /* pause speaking 
		      if (spoken)
					while (sendb(warning,strlen(warning),0) != TSR_SUCCESS);
	    printf("%s",warning);           */ /* give warning 
		      if (stopit() == TSR_SUCCESS)             */ /*stop speaking --PAUSE-- 
					inp =0;
		      break;*/

	/* case '&':  is commented out.
	 case '&':
	    io_prior();
				inp =0;
	    break;       */
     /*
      * case g: to get a string of characters from the DECtalk is commented
      * out.  Developers might want to use it to see how to retrieve strings
      * from DECtalk.  Customers, on the other hand, would not want this
      * DECtalk option.          */
      
	       /* case 'g':
	    again:               i=0;
		      getbuf[0]=(int)'\0';
		      while ((getbuf[i] =  gtdch()) !=0 && i< 499)
			      {   
			      if (getbuf[i] == '\033')
		      {
				      getbuf[i++] = (int)'E';
				      getbuf[i++] = (int)'S';
				      getbuf[i] = (int)'C';
				      }
			 i++;
			 } 
		      getbuf[i]=(int)'\0';
		      printf ("RECIEVED FROM DT %s \n",getbuf);
	    if (spoken) sendb(recieved,strlen(recieved),0);
		      if (i>498) goto again;
		      if (spoken)
	       {     
		    sendb(recieved,strlen(recieved),0);
			 for (i=0;getbuf[i];i++)
		  {
				 if (getbuf[i] == '\b' || getbuf[i] == ' ' || getbuf[i] == '\177')
		     {    
				    sendb(sayc,strlen(sayc)-1,0); 
			    switch(getbuf[i])
			{ 
				    case '\b':
			   {   
				       sendb(backs,strlen(backs)-1,0);
				  break;
					  } 
				  case ' ':
			   {
					  sendb(space,strlen(space)-1,0);
					  break;
					  }
				       case '\177':
			   {
					  sendb(dels,strlen(dels)-1,0);
				    break;
				    }
				       }          
				       send_char(getbuf[i],0);
				    }        
				    else
			{   
                                       send_char((unsigned char)getbuf[i],0);
				       if (getbuf[i] == '[')
			   {
					  send_char('[',0);
					  send_char(']',0);
					  }
				      }    
			     }        
			  }
					 inp =0;
			  break;               */

	      case 'b':         /* Set the volume to a specific level */
#ifndef DTEX
		      printf("%s",invol);                       /* Prompt */
		      if (spoken) while (sendb(invol,strlen(invol),0) != TSR_SUCCESS);
		      i=0;
                      while ((chbuf[i] =  (unsigned char)_getch()) !='\r')
	       {                                     /*Get input */
			 if (spoken) flush(0);                  /*Flush speech if spoken. */
			 putchar(chbuf[i]);                    /* Echo input */
			 if (spoken) send_char(chbuf[i],0);      /* Audible echo */
			 send_char('\013',0);
			 i++;
			 }  
		      chbuf[i]='\0';
		      _cputs("\r\n");
				chbptr=chbuf; /* this code to stop compiler from complaining
					abut near/far mis-match */
		      vol = atoi(chbptr);                          /* Convert to a number */
		      if ((vol > 100) || vol<0)
	       {                       /*                Is input in range */
			 printf ("%s,%d\n",volset,vol);
			 if (spoken) while (sendb(volset,strlen(volset),0) != TSR_SUCCESS);
			 break;
			 }
		      if (set_vol(vol) == TSR_SUCCESS)    /* go set the volume */
					{
					printf("%s\n",setting);
					if (spoken)
						while (sendb(setting,strlen(setting),0) != TSR_SUCCESS);
					inp =0;
					}
#else
		      printf("%s",nosup);                          /* Prompt */
		      if (spoken) while (sendb(nosup,strlen(nosup),0) != TSR_SUCCESS);
			  inp = 0;
#endif
		      break;

	    case 'e':          /* Allow user to type in text, send to DECtalk */
	  editbuf[0] = '\0';
		    printf ("%s\n",edit);
		    if (spoken) while (sendb(edit,strlen(edit),0) != TSR_SUCCESS);         /* Prompt */
		    tc=0;

	 while(sendb(rate,strlen(rate),0) != TSR_SUCCESS);       /* changes speaking rate */
		      do{
                         inchar = (unsigned char)_getch();     /* get character from keyboard until an '*' */
	       editbuf[tc++] = inchar;
			 flush_char(inchar);          /* used in typing mode to speak faster */
	       if (editbuf[tc-1] == '\b')
		  {        
		  putchar('\010');
		  putchar(' ');
		  tc=tc-2;
		  }
	       if (editbuf[tc-1] == '\r')
	       {
				editbuf[tc-1] = ' ';
			putchar('\n');
			putchar('\r');
			      }
	       if (inchar != '\r')
		  putchar(inchar);
			 }while(inchar != '\r');

	    editbuf[tc++]=' '; 
	    editbuf[tc++]='\013'; 
			editbuf[tc]='\0';
		 _cputs("\r\n");
		      while (sendb(reset,strlen(reset)-1,0) != TSR_SUCCESS);
	    while (sendb(editbuf,tc,0) != TSR_SUCCESS);       /* send string to DECtalk */
			   inp =0;
		      break;

	     case 'r' :                             /* repeat text entered */
		      while (sendb(editbuf,tc,0) != TSR_SUCCESS);
			   inp =0;
	    break;

	case 'u':     /* Increment the volume by 1.*/
#ifndef DTEX
		  if (up_vol() == TSR_SUCCESS)
				{
	    if (spoken) while (sendb(incr,strlen(incr),0) != TSR_SUCCESS);
		      printf("%s",incr);
				inp = 0;
				}
#else
		      printf("%s",nosup);                          /* Prompt */
		      if (spoken) while (sendb(nosup,strlen(nosup),0) != TSR_SUCCESS);
			  inp = 0;
#endif
	   break;

	     case 'd':     /* Decrease the volume by 1.*/
#ifndef DTEX
		  if (dwn_vol() == TSR_SUCCESS)
				{
	    if (spoken) while (sendb(decr,strlen(decr),0) != TSR_SUCCESS);
	    printf("%s",decr);
				inp = 0;
				}
#else
		      printf("%s",nosup);                          /* Prompt */
		      if (spoken) while (sendb(nosup,strlen(nosup),0) != TSR_SUCCESS);
			  inp = 0;
#endif
		     break;

	 case 'l':     /* Send a file to the DECtalk to read*/
		     printf("%s\n",name);                /* Prompt */
		     if (spoken) while (sendb(name,strlen(name),0) != TSR_SUCCESS);
	   printf("  >>");
	   chbuf[0] = '\0';
		     i=0;
	 
	    while(sendb(rate,strlen(rate),0) != TSR_SUCCESS);       /* changes speaking rate */
		      do{
                         inchar = (unsigned char)_getch();     /* get character from keyboard until an '*' */
	       chbuf[i++] = inchar;
	       putchar(inchar);
			 if (spoken) flush_char(inchar);          /* used in typing mode to speak faster */
	       if (chbuf[i-1] == '\b')
		  {
	putchar(' ');
	     putchar('\010');
		  i=i-2;
		  }
	       if (chbuf[i-1] == '\r')
		  {
				   chbuf[i] = ' ';
			   putchar('\n');
				putchar('\r');
				 }
			 }while(inchar != '\r');
					i--;

	  chbuf[i]='\0';
	    _cputs("\r\n");
			 chbptr=chbuf; /*put in to avoid */

			 while (sendb(reset,strlen(reset)-1,0) != TSR_SUCCESS);
		    
			if ((fp=fopen(chbptr,"r")) == 0)
	    {                               /* Try to open and read file */
		      printf("  %s",nopen);
	    if (spoken)
					while (sendb(nopen,strlen(nopen),0) != TSR_SUCCESS);
				inp =0;
		      break;
		      }
			 
	       while ((getbuf[i] = gtdch()) != 0);

		    while (get_index() != -1);       /*clear out any pending indexs*/
		    sendfil(fp);                     /* Send the file to the screen and the DECtalk */
		    _fcloseall();                    /* close file */
			 inp =0;
		    break;

	 case 'v':             /* open the correct file to hear the voices */
		     printf("%s\n",voices);         /* Prompt */
		     if (spoken) while (sendb(voices,strlen(voices),0) != TSR_SUCCESS);
	   printf("  >>");
		     i=0;
	   hear = 1;
	   while (hear)
	    {
	    inp = _getch();
            printf("%c\n",(unsigned char)inp);
            if (spoken) flush_char((unsigned char)inp);
			   switch(inp)              /*  Speak non-printing char's of interest */
			    {
	    case 'v':
	       {
	       printf("%s\n",voices);         /* Prompt */
			 if (spoken) while (sendb(voices,strlen(voices),0) != TSR_SUCCESS);
	       break;
	       }
			    case 'p':
	      {
	      printf("%s",paul);
	      voicesetup[3] ='p';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			while (sendb(paul,strlen(paul),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
			     break;
	      }
			    case 'h':
	      {
			     printf("%s",harry);
	      voicesetup[3] ='h';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
	      while (sendb(harry,strlen(harry),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'f':
	      {
	      printf("%s",frank);
	      voicesetup[3] ='f';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(frank,strlen(frank),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'd':
	      {
	      printf("%s",dennis);
	      voicesetup[3] ='d';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(dennis,strlen(dennis),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'b':
	      {
	      printf("%s",betty);
	      voicesetup[3] ='b';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(betty,strlen(betty),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'u':
	      {
	      printf("%s",ursula);
	      voicesetup[3] ='u';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(ursula,strlen(ursula),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'r':
	      {
	      printf("%s",rita);
	      voicesetup[3] ='r';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(rita,strlen(rita),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'w':
	      {
	      printf("%s",wendy);
	      voicesetup[3] ='w';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(wendy,strlen(wendy),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'k':
	      {
	      printf("%s",kit);
	      voicesetup[3] ='k';
	      while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			     while (sendb(kit,strlen(kit),0) != TSR_SUCCESS);
	      printf("%s",next);
	      if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	      break;
			     }
	     case 'a':
	       {
	       voicesetup[3] ='p';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
		   while (sendb(paul,strlen(paul),0) != TSR_SUCCESS);
	       printf("%s",paul);
	       voicesetup[3] ='h';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(harry,strlen(harry),0) != TSR_SUCCESS);
	       printf("%s",harry);
	       voicesetup[3] ='f';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(frank,strlen(frank),0) != TSR_SUCCESS);
	       printf("%s",frank);
	       voicesetup[3] ='d';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(dennis,strlen(dennis),0) != TSR_SUCCESS);
	       printf("%s",dennis);
	       voicesetup[3] ='b';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(betty,strlen(betty),0) != TSR_SUCCESS);
	       printf("%s",betty);
	       voicesetup[3] ='r';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(rita,strlen(rita),0) != TSR_SUCCESS);
	       printf("%s",rita);
	       voicesetup[3] ='u';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(ursula,strlen(ursula),0) != TSR_SUCCESS);
	       printf("%s",ursula);
	       voicesetup[3] ='w';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(wendy,strlen(wendy),0) != TSR_SUCCESS);
	       printf("%s",wendy);
	       voicesetup[3] ='k';
	       while (sendb(voicesetup,strlen(voicesetup),0) != TSR_SUCCESS);
			      while (sendb(kit,strlen(kit),0) != TSR_SUCCESS);
	       printf("%s",kit);
	       printf("%s",next);
	       if (spoken) while (sendb(next,strlen(next),0) != TSR_SUCCESS);
	       break;
	      }
	     case 'm':
	      {
	      hear = 0;
				  inp =0;
	      break;
			     } 
	    default:
	      {
	      printf("%s\n",valid);
			     if (spoken) while (sendb(valid,strlen(valid),0) != TSR_SUCCESS);
			     break;
	      };
	    }
          if ((unsigned char)inp != 'm')
	     printf("\n  >>");
	  } /* while */ 
	  break;

       case 's':                          /* open song file and send to DECtalk */
	  while (sendb(song,strlen(song),0) != TSR_SUCCESS);
	  while (sendb(song2,strlen(song2),0) != TSR_SUCCESS);
	  while (sendb(song3,strlen(song3),0) != TSR_SUCCESS);
			 inp =0;
			 break;
	 
	    /*case 'c':                          /* Resume speaking after a stop.
		    if (resume() == TSR_SUCCESS)
				inp = 0;
		    break;*/

	    case 'f':                          /* Stop speaking and FLUSH */
		    if (flush(0) == TSR_SUCCESS) /* asynchronously flush the DECtalk */
				inp=0;
		    break;                 

	    case 'm':                          /* Send a buffer of data (canned message) */
		    while(sendb(canned1,strlen(canned1),0) != TSR_SUCCESS);
		    while(sendb(canned2,strlen(canned2),0) != TSR_SUCCESS);
	  printf("%s",canned2); /* buffer sent so print it*/
			 inp = 0;
		    break;

	    case 'q':                          /* QUIT this program*/
		    go=0;
	  if (spoken)
				{
				while(sendb(dexit,strlen(dexit),0) != TSR_SUCCESS);
				inp =0;
				}
		    break;

	    case '?':                          /* print list of commands */
		    if (spoken) while (sendb(clist,strlen(clist),0) != TSR_SUCCESS);
		    printf("%s",clist);
			 inp =0;
		    break;

	    default :
		    if (spoken)
				{
				while (sendb(defalt,strlen(defalt),0) != TSR_SUCCESS);
				printf ("%s",defalt);
				inp =0;
				}
			else
				{
		      printf ("%s",defalt);
				inp = 0;
				}
		   break;
	  }
   }

	else
		if (resstat == 0)
			{
			while (sendb(reset,strlen(reset)-1,0) != TSR_SUCCESS);
			resstat = 1;
			_cputs("\n\n\r>");                     /* command prompt */
			}
			
   }
}  

/************************************************************************/
/* End of Main Function from dtdemo.c */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/*************************************************************************/

/************************************************************************/
/* Support Functions from dtdemo.c */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/*************************************************************************/

index()
{
   int i,j;
   unsigned char inds[]=" [:i m    ]  ";
   unsigned char pindex[]="][:i m    ][ ";
   unsigned char indx[5];
	if (icnt >= 110)
	   icnt=1;
	bufptr=indx;   /* added to shut up compiler with dumb near/far mismatch
																						errors*/
	_itoa(icnt,bufptr,10);
	inds[8]=' ';               /*initalize  */
	inds[9]=' ';               /*initalize  */
	if (phonemode)
		{
		for (j=7;indx[j-7];j++)  /*Paste index into blank index reply string */
			{
			pindex[j]=indx[j-7];
			}
		icnt++;
		for (i=0;13-i;i++)
	      {
	      outb[outi++]=pindex[i]; /*add index to output buffer*/
	      }
		}
	else
		{
		for (j=7;indx[j-7];j++)  /*Paste index into blank index reply string */
			{
			inds[j]=indx[j-7];
			}
		icnt++;
				for (i=0;13-i;i++)
	      {
	      outb[outi++]=inds[i]; /*add index to output buffer*/
	      }
		}
	return(1);
}


sendfil(FILE  *ptr)
{
   int size,oldj,oi;
   int start,count=0;
   int lsaid;
   int j=0;
   int i=0;
   int jj=0;
      

   i=1;
   start=1;
   quit=0;
   icnt=1;
	oldj=0;
   oi=0;
	nindx=0;
	lindx=0;
   while((size = fread(tmp,1,250,ptr)) !=0  && quit == 0)   /*Read a buffer from the file */
	   {
	   if( _kbhit() !=0)             /*If a key is hit exit routine. */
	    {
	     flush(0);
	     _getch();
	     quit=1;
	    }
	   oldj=0;

	   for (j=0;(size-j);j++)    /* look for phrase to send   */
	    {
	    outj[oi++]=tmp[j];
		 if (tmp[j] == '[') parse=1;
		 if (parse && tmp[j] != ':')
			{
			parse =0;
			phmode=1;
			}
		 else
			{
			parse=0;
			}
	    switch(tmp[j])       /*If so we could have a potential problem with */
			{                                  /* DECtalk waiting for a clause boundary. */
			case ',':
			case '?':
			case '!':
			case '.':
			if(tmp[j+1] == ' '||  tmp[j +1 ] == '\t'||  tmp[j+1] == '\n' || tmp[j+1] =='\00')
			{
			   count=0;
				j++;
				if (j >= 250)   /*If we're at the end, go get more */
				{                 
				j=250-1;        /*set to size-1 to cause read after autoinc. */
				break;
				}
				/* what if duration with a punc mark in phonemic text */
			if (phmode )
				{
				outj[oi++] = ' ';
				outj[oi++] = ' ';
				}        
		
			if (!phmode)
				{
				outj[oi++]=' ';
				outj[oi++]='\013';
				outj[oi++]=' ';
				}
			if (size <250 && oi >= size) /*insert end of file*/
				{
				outj[oi++]='\0';
				}
			if (sayit(oi,outj) == 0)
				return(0);
			if (phmode && tmp[j] == ']')
				{
				outj[oi++] = tmp[j];
				sayit(oi,outj);
				}
	
			lsaid=j;
			oi = 0;
			oldj = j;
		   break;
		 }
		 default:
		 count++;
	  }
     if (count > 160 && j >= 250) /*Force clause boundary by end of buffer*/
	      {          
	      count = 0; /*reset count */

			/*Punt and force 
			if (sayit(size-j-lsaid, &tmp[lsaid]) == 0)return(0);  */ /* say entire buffer from lsaid. */
			while(sendb(sil,strlen(sil),0) != TSR_SUCCESS);                               /*guarantee mark gets out */
			oi=0;                                                 /*reset ouput buffer count */
			j=size-1;                                             /* and set j ready to abort after increment*/
		}                                         
	    tmp[size]='\0';
		 if (phmode && tmp[j] == ']')phmode=0;
		 if (phmode && tmp[j] == '<')inphodur=1;
		 if (inphodur && tmp[j] =='>')inphodur = 0;
	    }
	}
	return(1);
}


int sayit(int bsize, unsigned int *outj)         /*send output buffer and return when buffer lower */
{
	int j,temp,i;
	int abort=0;
   outi=0;

	for (j=0;bsize-j;j++)
	    {
            outb[outi++] = (unsigned char)outj[j]; /*copy to output buffer */


	    if (outi > 1900)
			{
			printf("outbuf overflow aborting\n");
			}

		 if (outj[j] >= 'A' && outj[j] <= '¨')
			isent=0;
		
		 if (phonemode && tmp[j] == '<')
			{
			inpdur = 1;
			}
		 if (gotsq == 1)
			{
			gotsq = 0;
			if (outj[j] == ':' )
				{
				insquare=1;
				}
				else
				{
				insquare = 0;
				phonemode = 1;
			   }
			}
		 if (outj[j] == '[' )
			{
			gotsq=1;
			
			}
		 if (insquare && outj[j] == ']') insquare=0;
		 if (phonemode && outj[j] == ']')
			{
			phonemode=0;
			}
		 if (!insquare && !inpdur )
			{
              if ((outj[j] ==' ' || outj[j] == '\t' || outj[j] == '\n') && isent != 1 )  /*and add in index */
			{
                                outj[j] = (unsigned int)(0x100+icnt);
				index();
				isent = 1;
				}
			}
	 if (inpdur && tmp[j] =='>') inpdur = 0;
		 }
	 while(sendb(outb,outi,0) != TSR_SUCCESS);

   for(i=0;bsize-1-i;i++)         /* is spoken, and before printing, remove any cntrl-k chars */
	    {                    
       if (outj[i]=='\013')         /* from buffer for better printing */
		  {
		  outj[i]=' ';
		  }

            if ((unsigned int)outj[i] >= 0x100)
			{
                        lindx = outj[i]&0xff;
			outj[i]=' ';
			}

	    if (outj[i] =='\10')   putchar('\n');
	    else  putchar(outj[i]);
	    if (outj[i+1] == '\0')
			{
			return(0);  /*end of file quit.    bryan dolan test*/
			}
	  
            if((unsigned int)outj[i+1] >= 0x100)
			/*If next thing is another index-check for last*/
			{

       /*  printf (" ni= %d lin = %d",nindx,lindx);   debug printout*/
			safetycnt=0;
			if (nindx < lindx || (lindx < 3 && nindx >= 108))   /*    Do we need to wait for an index?*/
				{
				nindx= -1;
				temp = -1;

				abort=0;
				if (insquare != 1)
					{
					do
						{
						nindx=get_index();
						if ((lindx > 108 && nindx <=2) && nindx != -1 )/* handle wrap around*/
							{                         /* knowing some might missed*/
							lindx  = nindx;
							}
			      safetycnt++;
			      if (safetycnt >128000)
							{
							printf (" %d,%d ",nindx,lindx);                  
							break;
							}       
					  
					/* indexs not set equal so we can print slightly ahead and allows some slop in checking times*/
						}while(nindx == -1 || nindx < (lindx) );/*eab*/
					}
				}
			}
	    }
   return(1);
}

/* int sendb(unsigned char *thebuf,int count) */

/* flush() */

int get_index()
{
	int tmp;
	do{
	RB.ah = DECTALK_ID;
	RB.al = LAST_INDEX;
	RW.si = 0;
   _int86(0x2f, &regs, &regs);
	tmp=regs.x.ax;
	}while(regs.x.ax == TSR_BUSY );
	if ( regs.x.ax == TSR_RETRY )
		{
		return(-1);
		}
	if ( regs.x.ax == TSR_FAILURE )
		printf("tsr get_index failed");
	return(regs.x.cx);
}

int resume(void)
{       
	RB.ah = DECTALK_ID;
	RB.al = RESUME_OUTPUT;
	RW.si = 0;
	_int86(0x2f, &regs, &regs);
	return(RW.ax);

}

int stopit(void)
{
	RB.ah = DECTALK_ID;
	RB.al = PAUSE_OUTPUT;
	RW.si = 0;
	 _int86(0x2f, &regs, &regs);
	return(RW.ax);
}

int flush_char(unsigned char fchar)
{

	RB.ah = DECTALK_ID;
	RB.al = 0x2A;
	RB.bl = fchar;
	RW.si = 0;
	_int86(0x2f, &regs, &regs);
	return(1);
}

int gt_stat(int dtport)
{
	do{
	RB.ah = _COM_status;
	RB.al = 0;
	RW.dx = dtport;
	RW.si = 0;
	_int86(0x14, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	return(RW.ax);
}

unsigned char gtdch()
{       
	do{
	RB.ah = DECTALK_ID;
	RB.al = GET_CHAR;
	RW.si = 0;
	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax != TSR_SUCCESS && (regs.x.dx & 0x2)); 
	if (regs.x.ax == TSR_RETRY )
      RW.bx = 0;
/*      if (regs.x.ax == TSR_BUSY )
		{
		printf(" busy ");
		}
	printf("ax=%d char=%d %c dx=%x \n",regs.x.ax,RW.bx,RW.bx,regs.x.dx);*/
        return((unsigned char)RW.bx);
}

/* send_char(unsigned char schar)*/

int io_prior(void)
{       
	do {
	RB.ah = DECTALK_ID;
	RB.al = IO_PRIORITY;
	RW.cx=0;
	RW.si = 0;
	 _int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	return(1);
}

int up_vol(void)
{       
	RB.ah = DECTALK_ID;
	RB.al = VOLUME_UP;
	RB.bl=5;
	RB.dl=0;
	RW.si = 0;
	 _int86(0x2f, &regs, &regs);
	return(RW.ax);
}

int status(void)    /* used in case 'z'.  Example '420' is version number 4.20*/
{
	int stat;
	RB.ah = DECTALK_ID;
	RB.al = GET_STATUS;
	RW.si = 0;
	 _int86(0x2f, &regs, &regs);
	stat=RB.ch;
   printf("The DECtalk version number is %d.\n",stat+256);
	return(RW.ax);
} 

int dwn_vol(void)
{       
	RB.ah = DECTALK_ID;
	RB.al = VOLUME_DOWN;
	RB.bl=5;
	RB.dl=1;
	RW.si = 0;
	 _int86(0x2f, &regs, &regs);
	return(RW.ax);
}

int set_vol(int vol)
{       
	RB.ah = DECTALK_ID;
	RB.al = VOLUME_SET;
	RW.bx = vol;
	RW.si = 0;
	_int86(0x2f, &regs, &regs);
	return(RW.ax);
}

int dtpc_cmd(int cmd, int value)
{
	   do{
			RW.bx = value;  /* put offset to char buff struct in bx */
			RB.ah = DECTALK_ID;
			RB.al = (unsigned char )cmd;
			RW.si = voc_module;
			_int86(0x2f, &regs, &regs);
			}while (regs.x.ax  == TSR_BUSY);
	      return(regs.x.ax);

}        

int play_wave(void)
{
	int     j,i,read_size;

	struct          dectalk_char_buff cb;
	struct          dectalk_char_buff _far *cbp;

	cbp = &cb;
	j=64;
	while(true)
		{
		read_size = fread(frame_data,2,sizeof(frame_data)/2,voc);
		if(read_size == 0)
			break;
		for(i=0;i<sizeof(frame_data)/2;i++)
			{
			frame_data[i] = frame_data[i]>>(j>>2);
			if (j>4)
				{
				j--;/*ramp up to avoid click*/
				}
			}
		if(read_size != (sizeof(frame_data)/2))
			{
			j=frame_data[i];
			for(i=read_size;i<sizeof(frame_data)/2;i++)
				{
				j=j>>1;
				frame_data[i] = j;
				}
			}

		(*cbp).count = 8;
		(*cbp).buff = (unsigned char _far *)frame_data;
		do{
			RB.ah = DECTALK_ID;
			RB.al = DIGITIZED_DATA;
			RW.dx = FP_SEG(cbp);
			RW.bx = FP_OFF(cbp);
			RW.si = voc_module;
			_int86(0x2f, &regs, &regs);
			}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);

/*              do {
			tsr_regs.h.ah = DECTALK_ID;
			tsr_regs.h.al = DIGITIZED_DATA;
			tsr_regs.x.dx = FP_SEG(cbp);
			tsr_regs.x.bx = FP_OFF(cbp);
			tsr_regs.x.si = voc_module;
			_int86(0x2f, &tsr_regs, &tsr_regs);
			} while (tsr_regs.x.ax != TSR_SUCCESS);*/
		}
   return(1);
}

#pragma pack(1)

struct  sb_header {

        unsigned char    sb_id[20];
	int     data_start;
	int     format;
	int     id;
};

#define SB_voc_terminator               0
#define SB_voc_data                             1
#define SB_voc_continue         2
#define SB_voc_silence                  3
#define SB_voc_marker                   4
#define SB_voc_ascii                    5
#define SB_voc_repeat                   6
#define SB_voc_end                              7


void play_sb(void)
{
	int     temp;
	struct sb_header *sbh;
	int     ratee;


	pcount=1000;
	read_size = fread(sb_data,1,sizeof(sb_data)/1,voc);
	sbh = (struct sb_header *)sb_data;
	if(_strnicmp((*sbh).sb_id,"Creative Voice File",19) != 0)
		{
		printf("\nBad voice file id field!");
		}
	next_byte = (*sbh).data_start;
	next_sample = 0;

	while(true)
		{

		switch(get_byte())      {
			case    SB_voc_terminator               :
				{
				return;

				}

			case    SB_voc_data                             :
				pcount=0;
				pcount = (long)get_byte();
				pcount += (long)get_byte()<<8;
				pcount += (long)get_byte()<<16;
				/* find module number of 8 bufs of data*/
				if((ratee=get_byte()) != 156)
					{
					ratee=1000/(256-ratee);
				   dtpc_cmd(SPC_RATE,ratee);
					}       
				if(get_byte() != 0)
					{
					printf("\nData must not be compressed!");
					}
				pcount -= 2;
				pack_buff();
				break;

			case    SB_voc_continue         :

				pcount = (long)get_byte();
				pcount += (long)get_byte()<<8;
				pcount += (long)get_byte()<<16;
				pack_buff();
				break;

			case    SB_voc_silence                  :

				pcount = (long)get_byte();
				pcount += (long)get_byte()<<8;
				pcount += (long)get_byte()<<16;
				temp  = (unsigned int)get_byte();
				temp += (unsigned int)get_byte()<<8;
				zero_buff(temp);
				break;

			case    SB_voc_marker                   :

				pcount = (long)get_byte();
				pcount += (long)get_byte()<<8;
				pcount += (long)get_byte()<<16;
				temp  = (unsigned int)get_byte();
				temp += (unsigned int)get_byte()<<8;
				printf("\nMarker: %u. ",temp);
				break;

			case    SB_voc_ascii                    :

				pcount = (long)get_byte();
				pcount += (long)get_byte()<<8;
				pcount += (long)get_byte()<<16;
				printf("\nString: ");
				while(pcount)
					{
					printf("%c. ",get_byte());
					pcount -= 1;
					}
				break;

			case    SB_voc_repeat                   :
				break;
			case    SB_voc_end                              :
				break;
			}

		
	}
}

/*
 *  get a byte from a sb file ... reloads the buffer if needed ...
 */

unsigned char get_byte(void)
{
	if(next_byte != read_size)
		return(sb_data[next_byte++]);
	read_size = fread(sb_data,1,sizeof(sb_data)/1,voc);
	next_byte = 0;
	if(read_size)
		return(sb_data[next_byte++]);
	printf("\nError, end of file with no end record!");
}

/*
 *  read sb data bytes and send them to the DECtalk-pc when needed ...
 */

void pack_buff(void)
{
	while(true)
		{
		while(next_sample<64*8)
			{
			frame_data[next_sample++] = (unsigned int)(((get_byte()<<7)-16000));
			pcount -= 1;
			if(pcount <= 0 )
				{
				send_frame();
				return;
				}

			}
		send_frame();
		}
}

void zero_buff(unsigned int pcount)
{
	while(true)
		{
		while(next_sample<64*8)
			{
			frame_data[next_sample++] =0;
			pcount -= 1;
			if(pcount == 0)
				return;
			}
		send_frame();
		}
}


/*
 *  send a built frame buffer over to the DECtalk ...
 */

void send_frame(void)
{
	struct dectalk_char_buff cb;
	struct dectalk_char_buff _far *cbp;
	if(next_sample)
		{
		cbp = &cb;

		while(next_sample<(64*8)+1)
			{
			frame_data[next_sample++] = 0;
			}
		(*cbp).count = 8;
		(*cbp).buff = (unsigned char _far *)frame_data;
		do {
			RW.bx = FP_OFF(cbp);  /* put offset to char buff struct in bx */
			RW.dx = FP_SEG(cbp);  /*put segment in dx */
			RB.ah = DECTALK_ID;
			RB.al = DIGITIZED_DATA;
			RW.si = voc_module;
			_int86(0x2f, &regs, &regs);
			}while (regs.x.ax != TSR_SUCCESS);
		next_sample = 0;
		}
}

/*************************************************************************/
/* End of Support Functions from dtdemo.c */
/* This code originated in DTDEMO.C 06-14-95 cjl */
/*************************************************************************/

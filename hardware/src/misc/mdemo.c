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
 *    File Name:	mdemo.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    		    	This program is included to provide an example
 * 	      	 	of coding to a DECtalk-PC in a system with mutliple module.
 *				 		It uses most of the TSR calls. It is not intended to
 *						be functionally or architecturally complete. For example it busy
 *                waits most TSR calls which is not an efficient use
 *                of the CPU's compute cycles.
 *						The main difference in coding to multiple modules is that
 *						you must include the module identifier in the in the si register
 *						you make a TSR call.
 *
 ***********************************************************************
 *    Revision History:
 * include "mdemp.h" 01-FEB-1995 cjl
 *
 */


#include "dttsr.h"
#include "mdemop.h"

struct dectalk_char_buff  dtbuf;  

/* commented out as unused var - 8/9/95  JDB
int  dtport =3;                             
*/

char windex[]="[:i m 1] [:sync] ";

/* commented out as unused vars - 8/9/95  JDB
char intro[]="DECtalk Demonstration program. \nTo run demonstration program, press enter, \
to quit, press any other key. \n ";
          
char tmp2[]="For list of commands, type question-mark. ";
char warnt[]="Warning! The p, or pause command must be followed by a c, or continue command. ";
char  texit[]="\n Exiting typing demonstration. \n";
char  rcvt[]="I have recieved from the dectalk,[:sync] [:sa le]\013 ";
char  vst[]="Loop value incorrect.  ";
*/
char  edt[]="Type an * to end input, type up to 500 characters of text! \n";
char  lot[]="Input name of file to be sent to dectalk. ";
char  nopnt[]="Couldn't find or open file. \n";
char  sayl[]="[:sa le][:ra 400][:phon arpa off]";
char  invs[]="Input numder of times to loop(1-100).";
char  backs[]="backspace\013";
char  aborts[]="Type any key to abort file send. ";
char  space[]="space\013";
char  dels[]="delete\013";
char  clist[]="To quit, type q. \n\
To enter text string, type e. \n\
To repeat text entered, type r. \n\
For volume up, type u. \n\
For volume down, type d. \n\
To see last index processed type i. \n\
To speak a canned message, type s. \n\
To pause speaking, type p. \n\
To flush speech, type f. \n\
To continue speaking, type c. \n\
To get a string of characters from the dectalk, type g. \n\
To copy a file to the dectalk, type l. \n";    

/* commented out as unused var - 8/9/95  JDB
char deft[]="Incorrect command, please type a ? for a list of commands. "; 
*/
char reset[]="[:np][:sa c][:pu so][:ra 220]DECtalk reseting. \013";
char cfbuf[30];                           

/* commented out as unused vars - 8/9/95  JDB
char wtype[]="Setting rate to 450 words per minute[:ra 450]. ";
char reply[80]="ESCP0;31;44zESC\\";
*/
char sayc[]="[:say clause]\013";
char flsh[]="[:fl all]\013 ";  

/* commented out as unused var - 8/9/95  JDB
char enable[]="[:en ]";                      
*/

char cancharbuf[]="[:nh]Hello, I'm DECtalk, the state of the art in text to speech synthesis[:np]. \n";

/* commented out as unused var - 8/9/95  JDB
char tbuf[]="[:np]1,[:nb]2,[:np]3,[:nb]4,[:np]5,[:np]1,[:nb]2,[:np]3,[:nb]4,[:np]5, ";
*/

char dcharbuf[256];
char indx[5];
char inds[]="[:i r     ]";
char  dtinbuf[500];           

/* commented out as unused var - 8/9/95  JDB
char ninp;                                  
*/

int     idx;            
int     failure=0;
int     lastfail=0;

union _REGS regs;

main(int argv, int argc)

{

	int inp;
	int count,done=0;
	char inbuf[100];
   FILE *fp;
   int go,i,ibufcnt;
	int tc=9;
	int init =1;
	int dnum;
	int nloop,loopcnt=0;
	flush(0);    /*Flush buffer in case anything was left inside the DECtalk */
	flush(1);       
	flush(2);  
	flush(3);  
	sendb(reset,sizeof(reset),0);
	sendb(reset,sizeof(reset),1);
	sendb(reset,sizeof(reset),2);
	sendb(reset,sizeof(reset),3);

	putchar('\n');
	go=1;
	printf ("DECtalk mutli-board test program type input sequence!\n");
	printf ("Input sequence of commands to loop on and * to finish. \n");
	printf("\n>");
	printf("%s",invs);                       /* Prompt */
	i=0;	 
	while ((cfbuf[i] =(char)_getch()) !='\r')
		{     /*Get input */
		putchar(cfbuf[i]);                    /* Echo input */
		send_char('\013',dnum);
		i++;
		}
	cfbuf[i]='\0';
	_cputs("\r\n");
	nloop=atoi(cfbuf);                         /* Convert to a number */
	if ((nloop > 100) || nloop < 0 )
		{                /* Is input in range? */
	   printf ("%s\n",nloop);
	   nloop=1;
		}
		
		

   ibufcnt=0;
	while (go)
		{
	   if (failure >> lastfail)
		  {
	     printf ("Got another failure. Have seen %d failures total.\n",failure);
		  lastfail=failure;
		  }
		if (init == 1)
		  {
		  printf("Input command. \n");
	     inp = tolower(_getch());                 /* Get a command character from the keyboard*/
	     putchar(inp);
		  inbuf[ibufcnt++]=(char)inp;
	     putchar('\n');
		  do
		    {
		    printf ("Input line number to use.");
		    gets(cfbuf);
		    dnum=atoi(cfbuf);
			 inbuf[ibufcnt++] = (char)dnum;
		    }while (dnum < 0 || dnum > 3);
		  putchar('\n');
		  }    
		else
			{
			inp=inbuf[ibufcnt++];
			dnum=inbuf[ibufcnt++];
			}
		if (ibufcnt >= 99)
		   {
		   inbuf[98] = '*';        /* due to symetry it must be set two back */
		   inp = '*';
		   }
	   if (inp == '*')
		   {
			loopcnt++;
			if (loopcnt >= nloop )exit(0);
		   ibufcnt =0;
		   init = 0;
			}
	   switch (inp)                        /* And based on it decide what to do (Case sensitive)*/
	      {
	      			
	      case    'w':  /*wait for me to catch up */
			  if (windex[6] == '1')
				{
				windex[6] = '0';
				count=0;
				}
			  else
				{
				windex[6]= '1';
				count = 1;
				}
			  sendb(windex,sizeof(windex),dnum);
			  while (get_index(dnum) != count);
			  break;

				case 'e':         /* Allow user to type in text, send to DECtalk */
			  /*  when a CR seen.*/

		dcharbuf[0]='\0';
		printf ("%s\n",edt);

		_cputs("Input text:\n\r");
		tc=0;
		sendb(sayl,sizeof(sayl)-1,dnum);
		while ((dcharbuf[tc] = (char)_getch()) != '*' && init){   /*Get input*/
		    if (dcharbuf[tc] == '\b' || dcharbuf[tc] == ' ' || dcharbuf[tc] == '\177'){
			sendb(sayc,sizeof(sayc)-1,dnum);
			switch(dcharbuf[tc]){                    /*Echo some characters not said */
			  case '\b':{                            /*not said by sayletter. */
			    sendb(backs,sizeof(backs)-1,dnum);
			    break;
			    }
			  case ' ':{
			    sendb(space,sizeof(space)-1,dnum);
			    break;
			    }
			  case '\177':{
			    sendb(dels,sizeof(dels)-1,dnum);
			    break;
			    }
			  }
			sendb(sayl,sizeof(sayl)-1,dnum);
			}
		    else
			  send_char((char)dcharbuf[tc],dnum);
		    if (dcharbuf[tc] == '['){
			send_char('[',dnum);
			send_char(']',dnum);
			}
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
		sendb(reset,sizeof(reset)-1,dnum);
		sendb(dcharbuf,tc,dnum);
		break;


			
			case 'i':
		     count=get_index(dnum);
		     if (count == -1 ) 
		       printf("No new index has been seen.\n");
		     else
		       printf("The last index was number %d \n",count);
		     break;
	      case 'p':
		     printf("Warning! This command must be followed by a \"c\" continue command!\n");

		     stopit(dnum);      /*stop speaking --PAUSE----*/

		     break;

	      case 'g':
		     /* Get a string of characters from the dectalk-one at a time*/
	
		     i=0;
		     dtinbuf[0]='\0';
		     while ((dtinbuf[i]=(char)gtdch(dnum)) !=-1)
				 {
		       if (dtinbuf[i] == '\033')        /*if an esc display it*/
			      {
			      dtinbuf[i++]='E';
			      dtinbuf[i++]='S';
			      dtinbuf[i]='C';
			      }
		       i++;
  		       }
		     dtinbuf[i]='\0';
		     printf ("RECIEVED FROM DT %s \n",dtinbuf); /* Print characters recieved */
			  break;

	case 'r' :
		sendb(dcharbuf,tc,dnum);
	case '\n':
		  break;

	case 'u':  /* Increment the volume louder by 1.*/
		  up_vol(dnum);
		  break;

	case 'd'  : /* Decrease the volume by 1.*/

		dwn_vol(dnum);
		break;
	case 'b' : /* FOrce an error */
		dwn_vol(4);
		break;
	case 'l'        : /* Send a file to the DECtalk*/
		flush(dnum);
		printf ("%s\n",lot);                       /* Prompt */
		sendb(sayl,sizeof(sayl)-1,dnum);
		i=0;
		if (init == 1){
		  while ((cfbuf[i] = (char)_getch()) != '\r'){          /* Get file name-with char echo and basic editing */
		   if (cfbuf[i] == '\b' || cfbuf[i] == ' ' || cfbuf[i] == '\177'){
			sendb(sayc,sizeof(sayc)-1,dnum);     /* Enter say clause mode */
			switch(cfbuf[i])               /* Speak non-printing char's of interest */
			  {
			  case '\b':{
			    sendb(backs,sizeof(backs)-1,dnum);
			    break;
			    }
			  case ' ':{
			    sendb(space,sizeof(space)-1,dnum);
			    break;
			    }
			  case '\127':{
			    sendb(dels,sizeof(dels)-1,dnum);
			    break;
			    };
			  }
			sendb(sayl,sizeof(sayl)-1,dnum);     /*Enter say letter mode */
			}
		    else
			send_char((char)cfbuf[i],dnum);     /* Regular char just send it */
		    if (cfbuf[i] == '['){             /* Special case for command introducer in say letter mode */
			send_char('[',dnum);
			send_char(']',dnum);
			}
		    putchar(cfbuf[i++]);
		    if (cfbuf[i-1] == '\010'){
			putchar(' ');                /* print space */
			putchar('\010');             /* and back up again*/
			i=i-2;
			}

		  }
		 cfbuf[i]='\0';
		 _cputs("\r\n");
		 for (i=0;cfbuf[i-1];i++)
			{
			inbuf[ibufcnt++]=cfbuf[i];
			}
		 sendb(reset,sizeof(reset),dnum);
		}
	  else
	   for(i=0;inbuf[ibufcnt];ibufcnt++)
		{
		cfbuf[i++]=inbuf[ibufcnt++];
		}
	  if ((fp=fopen(cfbuf,"r")) == 0){              /* Try to open file */
		    printf("%s\n",nopnt);
		    
		    break;
		    }
		else
		    sendb(aborts,sizeof(aborts),dnum);
		while ((dtinbuf[i]= (char)gtdch(dnum)) !=-1);
		sendfil(fp,dnum);                                     /* Send the file to the screen and the DECtalk */
		_fcloseall();
		break;
											
	case 'c'        : /* Resume speaking after a stop.*/
		resume(dnum);
		break;
	case 'f'        : /* Stop speaking and FLUSH */
		flush(dnum); /*asynchronously flush the dectalk */
		sendb(flsh,sizeof(flsh),dnum); /*synchronously flush the text*/
		break;                    /*stream pipe*/


	case 's':    /* Send a buffer of data   */
		sendb(cancharbuf,sizeof(cancharbuf),dnum);
		break;

	case 'q':      /* QUIT this program*/
		go=0;
		break;
	case '?':
		printf("%s\n",clist);
		break;
	case '*':
		break;
	default :
		printf ("INCORRECT COMMAND-TYPE ? FOR A LIST OF COMMANDS\n");
		if(init == 1)
			{
		   ibufcnt=ibufcnt-2;
			}
	}
	putchar((char)inp);
	_cputs("\n\r>");
 }
}

sendfil(FILE *ptr,int dt)


{
      int size,icnt;
      int start,count=0;
      int quit,i,found,j=0;
      char dtinbuf[10];
      static char tmp[253];
	   i=1;
	   start=1;
	   quit=0;
	   while((size = fread(tmp,1,250,ptr)) && quit == 0){  /*Read a buffer from the file */
			if(_kbhit() !=0){             /*If a key is hit exit routine. */
			   flush(dt);
			   _getch();
			   quit=1;
			}
			if (icnt>200)
			icnt=1;
			_itoa(icnt,indx,10);
			inds[8]=' ';               /*initalize  */
			inds[9]=' ';               /*initalize  */
			for (j=7;indx[j-7];j++){   /*Paste index into blank index reply string */
			 inds[j]=indx[j-7];
			}
			icnt++;
			sendb (inds,sizeof(inds),dt);  /* First send out an index and force it */
			if (start==1){
			    start=0;
			    send_char('\013',dt);      /*force first index*/
			}

			for (j=0;tmp[j];j++){       /*Does buffer end up with a large char count with no punctuation? */
			    switch(tmp[j]){         /*If so we could have a potetnial problem with */
						    /* DECtalk waiting for a clause boundary. */
			     case ',':
			     case '?':
			     case '!':
			     case '.':
				 if (tmp[j+1] ==' ');
				    count=0;
				 break;
			     default:
			       count++;
			    }
			}
			if (count > 120 && size>50){   /*Better try to insert a clause boundary */
			     found=0;                  /*if we're not near the end of the file. */
			     for (j=size;j;j--){       /* Insert clause boundary at a space if we can find one */
			      if (tmp[j] == ' '){
				tmp[j]='\013';
				j=1;
				found=1;
			      }
			     }
			     if (found == 0)            /*Can't find a space so punt and send force */
			       send_char('\013',dt);
			}
			sendb(tmp,size,dt);
			if (size<250)                   /*If size is less than 250 then this must be last buffer */
			    send_char('\013',dt);          /* of file so send a force at the end to be sure everything */
			for(i=0;(size-i);i++){          /* is spoken, and before printing, remove any cntrl-k chars */
			  if (tmp[i]=='\013')           /* from buffer for better printing */
			    tmp[i]=' ';
			  if (tmp[i] =='\10')
			    putchar('\n');
			  else
			    putchar(tmp[i]);
			}
			do{                               /* Wait for the index to come back before procedding */
			   idx=0;
			   do
			    {
			    if (idx==0 || dtinbuf[0] != '['){
				  dtinbuf[1]=' ';
				  dtinbuf[2]=' ';
				  dtinbuf[8]=' ';
				  dtinbuf[0]=' ';
				  idx=0;
			    }
			    while((dtinbuf[idx]=gtdch(dt)) ==-1 && quit == 0){
			     if(_kbhit() !=0){        /*If a key is hit exit routine. */
			       flush(dt);
			       _getch();
			       quit=1;
			     }
			    }
			    if(idx==1 && dtinbuf[1] != ':')
				 idx=-1;

			    if(idx==2 && dtinbuf[2] != 'i')
			       idx=-1;
			    if(i==6 && dtinbuf[6] != 'x')
			       idx=-1;
			    idx++;
			    if(_kbhit() !=0){         /*If a key is hit exit routine. */
			       flush(dt);
			       _getch();
			       quit=1;
			    }
			   }while(dtinbuf[idx-1] !=']' && idx < 7 && quit == 0);


			}while (_strnicmp(&dtinbuf[8],&inds[7],idx-7) != 0 && quit == 0);
			dtinbuf[i]='\0';
      }
      return(1);

}

snd_string(int dt)

{
	    int i;
	    char buf[]= "Setting rate to 450 words per minute[:np][:nv ][:ra 450]\013 ";
	for (i=0;buf[i];i++)
	  send_char(buf[i],dt);
	return(1);
}
union _REGS regs;

int sendb(unsigned char *thebuf,int count,int dt)
/*sendb(char *thebuf, int count,int dt)*/

{
	struct  dectalk_char_buff   cb;
	struct  dectalk_char_buff   _far *cbp;
	cb.buff=thebuf;
	cb.count=count;
	cbp = &cb;

	do{
	RW.bx = FP_OFF(cbp);  /* put offset to char buff struct in bx */
	RW.dx = FP_SEG(cbp);  /*put segment in dx */
	RB.ah = DECTALK_ID;
	RB.al = SEND_BUFF;
	RW.si = dt;
	_int86(0x2f, &regs, &regs);
	}while (regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;
		      
	return(RW.ax);

}

int gtdch(int dt)

{       

	do{
	RB.ah = DECTALK_ID;
	RB.al = GET_CHAR;
	RW.si=dt;
	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY); 
	if (regs.x.ax == TSR_RETRY)
	   RW.bx = -1;
	if (regs.x.ax == TSR_FAILURE) failure++;    
	return(RW.bx);

}


flush(int dt)

{



	do{
	RB.ah = DECTALK_ID;
	RB.al = FLUSH_TEXT;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY );
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(1);
}
flushs(int dt)

{

 

	do{
	RB.ah = DECTALK_ID;
	RB.al = FLUSH_SPEECH;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY );
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(1);
}

get_index(int dt)       /*not used here*/

{

 

	do{
	RB.ah = DECTALK_ID;
	RB.al = LAST_INDEX;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY );
	if ( regs.x.ax == TSR_RETRY )
		return(-1);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(regs.x.cx);
}




resume(int dt)

{       


	do{
	RB.ah = DECTALK_ID;
	RB.al = RESUME_OUTPUT;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);

}

stopit(int dt)

{

	do{
	RB.ah = DECTALK_ID;
	RB.al = PAUSE_OUTPUT;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);
}

int flush_char(unsigned char fchar,int dt)
/*flush_char(char fchar,int dt)*/
{
	RB.ah = DECTALK_ID;
	RB.al = 0x2A;
	RB.bl = fchar;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(1);
}

gt_stat(int dtport,int dt)

{


	do{
	RB.ah = _COM_STATUS;
	RB.al = 0;
	RB.dl = dtport;
	RW.si=dt;

	_int86(0x14, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);
}


int send_char(unsigned char schar,int dt)
/*send_char(char schar,int dt)*/

{       

	do {
	RB.ah = DECTALK_ID;
	RB.al = SEND_CHAR;
	RB.bl = schar;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while( regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);

}
up_vol(int dt)


{       


	do {
	RB.ah = DECTALK_ID;
	RB.al = VOLUME_UP;
	RB.bl=1;
	RB.dl=0;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);

} 
dwn_vol(int dt)

{       


	do{
	RB.ah = DECTALK_ID;
	RB.al = VOLUME_DOWN;
	RB.bl=1;
	RB.dl=1;
	RW.si=dt;
	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);
}
set_vol(int vol,int dt)
{       
	

	do{
	RB.ah = DECTALK_ID;
	RB.al = VOLUME_SET;
	RB.bl = vol;
	RW.si=dt;

	_int86(0x2f, &regs, &regs);
	}while(regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	printf("Setting the volume to %d\n.",vol);
	if (regs.x.ax == TSR_FAILURE) failure++;      
	return(RW.ax);
}

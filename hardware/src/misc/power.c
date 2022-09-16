/*
 * This is a program that finds the status of the DECtalk Express
 * battery or if it is using external power.
 *
 * 6/17/96 Anne Simoneau and Matthew Schnee and Tom Kopec and the ants
 *
 */
#include <stdio.h>        /* standard string library */
#include <stdlib.h>
#include <string.h>        /*standard string library */
#include <process.h>            
#include <conio.h>
#include "dttsr.h"         /* header files */


      /* define global variables */
char status[]="[:power speak][:sync] ";
union _REGS  regs;

extern	int sendb(unsigned char *thebuf,int count,int modnum);
extern	int flush(int modnum);

void main(void)
{
         /* define local variables */
    int modnum=0;
   
	RB.ah = DECTALK_ID;             /*defined in TSR.H*/
	RB.al = INSTALL_CHECK;  		/*defined in TSR.H*/
	RW.si = modnum;                 /*which module 0-3*/
	_int86(0x2f,&regs,&regs);
	if (RB.al != INSTALLED)
		{
		printf("DECtalk tsr not installed, please install and try again.\n");
	    printf("Press any key to continue.\n\a"); /* signal w/ bell too. */
		while (_getch() == (int)NULL);
		exit(1);	/* install error */
        }

	flush(modnum);                        /* asynchronously flushes buffer */
	sendb(status,sizeof(status),modnum);
	exit(0);
}

/*************************************************************************/
                           /* functions */


int sendb(unsigned char *thebuf,int count, int modnum)
{
	struct  dectalk_char_buff   cb;
	struct  dectalk_char_buff   __far *cbp;
	
	cb.buff=thebuf;
	cb.count=count;
	cbp = &cb;
do
{
	RW.bx = FP_OFF(cbp);  /* put offset to char buff struct in bx */
	RW.dx = FP_SEG(cbp);  /*put segment in dx */
	RB.ah = DECTALK_ID;   /*defined in TSR.H*/
	RB.al = SEND_BUFF;    /*defined in TSR.H*/
//    RW.si = 0; //modnum;       /*which module 0-3*/
	 _int86(0x2f, &regs, &regs);
	}while (regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
   return(RW.ax);	
   
}

 

flush(int modnum)
{
	RB.ah = DECTALK_ID;
	RB.al = FLUSH_TEXT;
	RW.si = 0; //modnum;
	 _int86(0x2f, &regs, &regs);
	return(RW.ax);
}



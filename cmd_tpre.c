#ifndef NO_CMD
#ifdef HACK_ALERT
/************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996. All rights reserved.
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
 *    File Name:	cmd_tpre.c
 *    Author:		Ed Bruckert
 *    Creation Date:05-FEB-1996
 *
 *    Functionality:
 *	Rule and Clause based parser routines.
 *
 ***********************************************************************
 *    Revision History:
 *
 * 	Rev	Who		Date		Description
 * 	---	-----	-----------	--------------------------------------------------
 * 	00?	GL      5/03/96     check the MARK_clause+MARK_space instead
 *							of MARK_clause + " " for clause boundary
 *							in the getclause() routine.
 *	002	MGS		29-May-1996	Fixed double Control-k in languages other than english
 *							in getclause
 *		
 */

#include        "cmd_def.h"
#include		"cmd_tpre.h"

/*#define DEBUGRULS	*/
/*#define DEBUGACT	1*/
/*#define DEBUGIND	*/
/*#define SHOWRULES  */

int	tmp,tmpcntr,incntr=1;
int rulsuc[MAXRULES];
unsigned char clausebuf[150];
int index=0;
int rcntr=0; /* rulecounter*/
int	outcntr=0;
char *prevwbound;
int done=0;
int previnserts=0;
int charseqcnt=0;/*count of the number of the same characters in a row*/





void textpreproc(void)
{
int stmpcntr;
/* have loop on text pre-processing rules here idelally base in catagories
so any rule set can abort i.e found a number rule that overules any follwoing 
numer rules*/
			
	/* First clear rulesuceess record*/

		for(tmpcntr=0;tmpcntr<=MAXRULES;tmpcntr++)
			{
			rulsuc[tmpcntr]=0;           
			}

		for(tmpcntr=0;tmpcntr<=incntr;tmpcntr++)
			{
			/*number rule add space before  numbers
			if n+1==number and char n is not */
#ifdef DEBUGRULS
			printf("at pos %d %d  goint into checkrule \n",tmpcntr,incntr);
#endif

			checkrule();
			}       
}

void insertchar( int posx,char addchar)

	  {	         
	  int lcntr;	  
	  for(lcntr=incntr-1;lcntr>posx;lcntr--)
	  		{
#ifdef DEBUGINSERT

	  		printf(" pos %d %c movingpos+1 %c \n",lcntr,clausebuf[lcntr],
	  		clausebuf[lcntr+1]); 
#endif	  		

 

	  	   clausebuf[lcntr+1]=clausebuf[lcntr];
	  		}	
	  	clausebuf[lcntr+1]=addchar;
	  	incntr++;	/*increment size of input buf*/
		}

void deletechar( int posx,char addchar)
	  {	         
int lcntr;	  
	  for(lcntr=posx;lcntr<=incntr;lcntr++)
	  		{
	  	   clausebuf[lcntr]=clausebuf[lcntr+1];
	  		}	
	  	incntr--;	/*decrease size of input buf*/
		}



void changchar( int posx,char newchar)
	  {	         
	  	clausebuf[posx]=newchar;
		}

void	checkrule(void)
		{
	int charseqcnt=0;
	int tcntr;          
	int tmp;
	int state=0;
	int done=0;
	int sucses=0;
	int failed=0;                          
	int rulecomplete=0;
		rcntr=0;
		previnserts=0;
		while (!done)
			{
#ifdef DEBUGRULS
			printf("starting rule search at pos %d rulechar %c\n",rcntr,ruleset[rcntr]);
#endif			
			switch (ruleset[rcntr])
				{

				case 'N': /*position relative to current pos n*/

					index=adjustindex(rcntr);
					rcntr++;
					if(index>incntr)
						{
						failed=1;
						}
					if(index< 0 )
						{
						failed=1;

						}

#ifdef DEBUGRULS
					printf("found index offset %d \n",index);
#endif
					break;
				case 'R': /*Specific the number of this rule*/
					rcntr++;
					rulenum=ruleset[rcntr];
					break;
				case '#': /*symbol marks end of conditional part of rule*/
					rulecomplete=1;
					break;

				case 'C': /* count the number of occurance of a char 
					repeated in sequence and store the result in charseqcnt */
					while(clausebuf[index+charseqcnt]==ruleset[rcntr])
						{
						charseqcnt++;
						}
					break;

				case 'S': /*look for sucess on previous rules*/
					while((tmp=ruleset[++rcntr]) != (int)' ')
						{
						if(ruleset[++rcntr] != rulsuc[tmp])
							{
/*							printf("failed prev rule test %d %d
						\n",ruleset[rcntr-1],rulsuc[tmp]);*/
							failed=1;
							}
						}
					if(failed != 1)
						sucses=1; /*If we didn't fail then we must have suceeded*/
					break;
					
				case ' ':
					break;
				case '[': /*check for a type */
#ifdef DEBUGRULS

					printf("%x chkrul  %x %x %c char %c index %d rc %d\n",nchar_types[0x2e],nchar_types[clausebuf[index]],ruleset[rcntr+2],
					ruleset[rcntr+2],clausebuf[index],index,rcntr);
#endif					



					if(ruleset[rcntr+1]=='!')
						{
						if(!(nchar_types[clausebuf[index]] & ruleset[rcntr+2]))
							{
/*							printf("%c hit on pos rule pos %d \n",clausebuf[index],rcntr);
							printf("%c -1",clausebuf[index-1]);
							printf("%c +1\n",clausebuf[index+1]);*/
							sucses=1;
							}
					  
							else	/*we failed the rule*/
							{
								{
/*								printf("failed neg rul at pos %d\n",rcntr);*/
								failed=1;
								}
							}								
						}

					if(ruleset[rcntr+1]==' ')
						{
#ifdef DEBUGRULS

						printf("chk rul%x %x \n",nchar_types[clausebuf[+index]],ruleset[rcntr+2]);
#endif

						if(nchar_types[clausebuf[index]] & ruleset[rcntr+2]) 
							{
#ifdef DEBUGRULS

							printf("hit pos on rule pos %d \n",rcntr);
#endif

							sucses=1;
							}
					  
							else	/*we failed the rule*/
							{
								{
#ifdef DEBUGRULS

								printf("failed pos rul at pos %d\n",rcntr);
#endif
								failed=1;

								}
							}								
						}
						rcntr+=2;
						break;	
						
				case '(': /*check for a exact character*/

#ifdef DEBUGRULS
						printf("comparing %c against %c \n",clausebuf[index],ruleset[rcntr+2]);
#endif

					if(ruleset[rcntr+1]=='!')
						{
						if(clausebuf[index] != ruleset[rcntr+2])
							{
							sucses=1;
							}
					  
							else	/*we failed the rule*/
							{
								{
/*								printf("failed neg rul at pos %d\n",rcntr);*/
								failed=1;
								}
							}								
						}

					if(ruleset[rcntr+1]==' ')
						{
						if(clausebuf[index] == ruleset[rcntr+2])
							{
#ifdef DEBUGRULS

							printf("hit pos on char match rule pos %d \n",rcntr);
#endif

							sucses=1;
							}
					  
							else	/*we failed the rule*/
							{
								{
#ifdef DEBUGRULS

								printf("failed pos rul at pos %d\n",rcntr);
#endif
								failed=1;

								}
							}								
						}
						rcntr+=2;
						break;

				case '{': /*check for a character match on either case */

					if(ruleset[rcntr+1]=='!')
						{
						if(clausebuf[index] != ruleset[rcntr+2])
							{
							sucses=1;
							}
					  	 /*add case check here*/
							else	/*we failed the rule*/
							{
								{
#ifdef DEBUGRULS
								printf("failed neg rul at pos %d\n",rcntr);
#endif
								failed=1;
								}
							}								
						}

					if(ruleset[rcntr+1]==' ')
						{
						if(clausebuf[index] == ruleset[rcntr+2])
							{
#ifdef DEBUGRULS

							printf("hit pos on char match rule pos %d \n",rcntr);
#endif

							sucses=1;
							}
					  
					  	 /*add case check here*/

							else	/*we failed the rule*/
							{
								{
#ifdef DEBUGRULS

								printf("failed pos rul at pos %d\n",rcntr);
#endif
								failed=1;

								}
							}								
						}
						rcntr+=2;
						break;	


			 	case '@':                            
#ifdef DEBUGRULS
			 			
						printf("At end of rules\n");
#endif
					 	done=1;
						break;
						
				default:
#ifdef DEBUGRULS
						printf("at chkr default with character %c\n",ruleset[rcntr]);
#endif
						break;
				
				}
			if(failed ) /*failed rule go to next rule*/
				{
#ifdef DEBUGRULS

				printf("rcntr %d failed going to next rule\n",rcntr);
#endif
				failed=0;
				while(ruleset[rcntr] != '$')
					rcntr++;
				}       
			if(rulecomplete)
				{

				rcntr++;
				if(sucses && !failed )
#ifdef DEBUGRULS

					printf("sucses on rule %d *********** at rcntr %d \n",rulenum,rcntr);
#endif
#ifdef	SHOWRULES
				printf("sucses on rule %d *********** at rcntr %d \n",rulenum,rcntr);
#endif
				rulsuc[rulenum]=1;
	  			rcntr=doaction(rcntr);
				previnserts=0;
				rulecomplete=0;
				sucses=0;
				failed=0;
				}
			rcntr++;
			}
	return;
	}

int adjustindex(int rcntr)
{
int offset;

	offset=tmpcntr;

 	if (ruleset[rcntr+1] == '+' )
		{
		offset=tmpcntr+ruleset[rcntr+2];
#ifdef DEBUGIND
		printf("tmpc %d ruledis %d offset %d\n",tmpcntr,(offset-tmpcntr),offset);
#endif
		rcntr +=2;
		return(offset);
		}
	else if( ruleset[rcntr+1] == '-')
	 	{
		offset=tmpcntr-ruleset[rcntr+2];
		rcntr+=2;
		return(offset);

		}
	else if( ruleset[rcntr+1] == ' ')
		{
		return(offset);
		}
	
#ifdef PRINT_OUTPUT
	printf("ahahah horrible death you feed me poison!\n");
	printf("oyu feed me a %c %d",ruleset[rcntr+1],ruleset[rcntr+1]);
#endif

	return(offset);
   }

int doaction(int rcntr)
{
	
	int tcntr,pipe_value;
	int tmp;	
	int done=0;
	int sucses=0;
	int failed=0;                          
	int tmpbuf[30];
	int charcnt=0;
		while (!done)
			{
			charcnt=0;
			switch (ruleset[rcntr])
				{
				printf("switching on  %c %d \n",ruleset[rcntr],rcntr);

				case 'I':
					do
						{
						rcntr++;
						/*initalize charcnt with previnserts this rule*/
						charcnt=previnserts;
#ifdef DEBUGACT
						printf("index %d charcnt  %d previnset %d \n",index,charcnt,previnserts);
#endif
						insertchar((index+charcnt),(char)ruleset[rcntr]);
						previnserts++;
						charcnt++;
				  		}while (ruleset[rcntr+1] != 0xff);
						charcnt=0;
						break;

				case 'D':
						rcntr++;
						if(ruleset[rcntr] <0)
							tcntr=charseqcnt-ruleset[rcntr];
						else if(ruleset[rcntr] ==0 )
							tcntr=charseqcnt;
						else
							tcntr=ruleset[rcntr];
						while(tcntr > 0)
							{
							deletechar(index+previnserts,(char)ruleset[rcntr]);
							tcntr--;
							}
						break;

				case 'O':
					charcnt=previnserts;
					do
						{
						rcntr++;
#ifdef DEBUGACT
						printf("changing pos%d to %c \n",(index+charcnt+previnserts),ruleset[rcntr]);
#endif
						changchar((index+charcnt+previnserts),(char)ruleset[rcntr]);
						charcnt++;
				  		}while (ruleset[rcntr+1] != 0xff);
						charcnt=0;
						break;

				case 'K':
						rcntr++;
						rulsuc[ruleset[rcntr]]=0;
						break;
				case ' ':
#ifdef DEBUGACT
					printf("null action");
#endif
					break;

				case 'N':
					
					index=adjustindex(rcntr);
#ifdef DEBUGACT
					printf("found action index offset %d \n",index);
#endif
					break;
				case 0xff :
					break;

				case '$':
					previnserts=0;
#ifdef DEBUGACT
						printf("actions completed \n");
#endif						
				done=1;		
				break;
				default:

#ifdef DEBUGACT
						printf("at act default with character %c %d \n",ruleset[rcntr],rcntr);
#endif

				rcntr++;
				}
			rcntr++;
			}
		return(rcntr-1);
		/* minus one so upper level cansee terminator*/
      }

void getclause(void)
{ 
int pipe_value;

				clausebuf[incntr++] = c;
/*				printf("at getc %c %d \n",c,c);*/
				if( c== 0xff)/* by definition commant or phonemes following
					don't do text proceesing any further*/
					{
					done=1;
					c=' ';
					}
				if(c == 0x11)		  /* this char comes at firsxt why??
					but I use it to know when to insert the first word boundary at start of clause*/
					{
					clausebuf[incntr++] = ' ';
					}
				/* fix for double Ctrl-k */
				if (c == 0x0b)
				{
					clausebuf[incntr++] = c;
					done=1;
				}
					

				/* now check to see if possible end of clause
				by looking for white space character preceeded by a punc*/
				if ((char_types[clausebuf[incntr-1]] & MARK_space) && 
				(char_types[clausebuf[incntr-2]] & MARK_clause))
					{
					/* Now make sure it wasn't an abbreviation
					if not we're done */
					if(clausebuf[incntr-2] == '.')
						{
						/*It had period now see if we get a dic hit incntr-3
							because we are looking without the period since we know
							its there. */
					done=1;
				  	if( (tmp=ablook(&clausebuf[incntr-2],prevwbound)) == 1)
  							{
  							done=0;
  							}
  						}
  					else
 						done=1; /*Was punc that wasn't period so can't be an abreev.*/
 							  /*but could have been a number of form 879.
 								I.E. a number followed by a decimal
 								point but no further digits which is
 								irregular except so assume end of sentence*/	
						}	
  					/* Remember ptr to beginning of word boundary */

  					if(char_types[clausebuf[incntr-2]] & MARK_space
  					&&  !(char_types[clausebuf[incntr-1]] & MARK_space))
  						prevwbound = &clausebuf[incntr-1];
  					/* now check to see if getting big and needs a forced boundary*/
  					if(incntr >125 && char_types[clausebuf[incntr]] & MARK_space)
  						{
  						clausebuf[incntr++]='.';
  						clausebuf[incntr++]=' ';
  						done=1;
  						}
  					/* too big incntr >147 just force it*/
  					if(incntr >147)
  						{
  						clausebuf[incntr++]='.';
  						clausebuf[incntr++]=' ';
  						done=1;
  						}
  					if(done)
  						{
  						outcntr=0;
  						/* here we do clause base rule processing */
  						textpreproc();
  					for(outcntr=0;outcntr<incntr;outcntr++)
  						{
#ifdef DEBUGPARS
						printf("# %c %d, %d \n",clausebuf[outcntr].clausebuf[outcntr],outcntr);
#endif
 						pipe_value = (PFASCII<<PSFONT)+clausebuf[outcntr];
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
 						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
					}
 					/*re-inti*/
 					
 					if (c == 0x0b)	/* fix for double Ctrl-k */
 					{
 						pipe_value = (PFASCII<<PSFONT)+0x0b;
#ifdef SINGLE_THREADED
						lts_loop(&pipe_value);
#else
 						write_pipe(KS.lts_pipe,&pipe_value,1);
#endif
 					} 						
					clausebuf[0]=' ';
 					incntr=1;  
 					done=0;
 					return;
 					}
 					
 }

int ablook(	unsigned char *end,unsigned char *start)
{   
int done=0;
int match=0;
unsigned char *wcntr;
unsigned char tmpwcntr;
unsigned char *abbrevp=&abbrev[0];

	do
		{
		wcntr=start;
		match=1;
		do	/* look for match note could fail faster
			but for now racing clock this
			leaves pointer alignd correctly*/
			{
			if(*abbrevp >= 'a' && *abbrevp <='z')
				{
				if(*wcntr >='A' && *wcntr <= 'Z')
					{
					tmpwcntr = *wcntr+0x20;
					}
				else
					tmpwcntr=*wcntr;
				}
/*			printf("inchk %c %c %d  match = %d\n",*abbrevp,*wcntr,*wcntr,match);*/
			if(tmpwcntr != *abbrevp )
				match=0;
			abbrevp++;
			wcntr++;
			if (match==1 && *abbrevp=='\n' &&wcntr==end)
				{
				return(1);
				}
																								  
			}while (*abbrevp != '\n' && wcntr != end && match ==1);
		while(*abbrevp != '\n' && done==0)
			{
			abbrevp++;
			if (*abbrevp == '\0')
				done=1;
			}
			abbrevp++;/*move to first char of next word*/
			if (*abbrevp == '\0')
				done=1;
		}while(done==0);
	return(0);        
}

#endif 
#endif
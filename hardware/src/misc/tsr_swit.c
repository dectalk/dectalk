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
 *    File Name:	tsr_swit.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	DECtalk tsr switch parser ... sets defaults for all settable
 * parameters then adds anyoverides from the command line.
 *
 * Switches are entered in upper or lower case preceded by a
 * "/" or "-" character, switches are order independent and whatever
 * is last, sticks ...
 *
 *   -C dd	... sets com port emulation 1 to 99 (default:4)
 *   -L dd	... sets lpt port emulation 1 to 99 (default:4)
 *   -R		... removes an already active tsr.
 *   -V		... enables verbose mode on prints.
 *   -B xxx 	... sets i/o base address to value
 *   -W     	... allocate Windows comm buffer. 
 *	 -S		... Select language for messages
 * for DTEX:
 *   -I d   	... sets interrupt value to x
 *   -N		... No return of version number (420) in BX from GET_STATUS
 *
 ***********************************************************************
 *    Revision History:
 * 28JUN95  ...CJL    Add in SEND_BUFF; TSR_MAX_SEND_BUFF (=64)
 *                                           & TSR_MAX_BUFF_SIZE (=256).
 * 02oct95	...tek		changed bases for dtpc2, removed
 *				.vector and .eoi stuff.
 * 17oct95			finished the above
 * 06nov95	...tek		change flush_char to use only the command/data
 *				regs rather than command/DMA to avoid a race.
 * 09nov95	...tek		fixed typos in help strings
 * 14feb96	...tek		merge DTEX
 * 16feb96  ...cjl (tek)	add Selected language option for messages.
 * 07may96  ...cjl		touched with latest 4-8 board fix.
 * 02dec96      ...gl           change version number to 4.4
 * 06AUG97	...DR		add british message language defines
 * 25JUN98		mfg		add Latin American message language defines
 */

#include "tsr.h"
#include "tsrp.h"

/*#define DEBUG*/

/*
 * Change number of elements in both dtlprot and dtbase to 4.
 * In the C++ version, module_index in TSR_MAIN follows DTBASE
 * in the address space and was being over written! 24-JAN-1994 cjl adn
 */         
 
/* commented out as unused var - 8/9/95  JDB 
int dtlprot[4];                             
*/

int dtbase[MAX_MODULES], dtvec[MAX_MODULES];
extern char _huge *tsrbottom;
base_found = 0;

#ifdef DTEX
// supported attached port irqs and their vectors
#define NUMIRQS (8)
// 0 = not supported. (just to keep painful conflicts from happening..)
unsigned short int irq2vec[NUMIRQS] = {
	0,		// IRQ0 (timer)
	0,		// IRQ1 (kb)
	0xa,		// IRQ2 (careful, this is the slave too!)
	0xb,		// IRQ3
	0xc,		// IRQ4
	0xd,		// IRQ5
	0xe,		// IRQ6 (careful, FDC!)
	0xf};		// IRQ7
#endif /*dtex*/

/* this is the line parser for the TSR */ 
int parse_switch(int argc,char *argv[])
/*int argc;*/
/*char *argv[];*/
{
	int	i,j,index;
	struct dectalk_control	_far *dtp;
	char	*wb;
	index=0;

#ifdef DTEX
	DTC.trap = 0;
	DTC.port = 0;
	DTC.lpt = 0;
	DTC.version_status = 1;	// yes, return it.
#endif /*dtex*/

/* removed duplicate initializing of array dtbase 1/24/95 cjl adn */
	
   for (i=1;  i < argc; i++)
		{

#ifdef DEBUG			
		printf("TSR-D-SWITCH TOP \n");
#endif

   	if ((argv[i][0] == '-') || (argv[i][0] == '/'))
			{
#ifdef DEBUG			
			printf("TSR-D-argv[i][0] = %c\n",argv[i][0]);
			printf("TSR-D-argv[i][1] = %c\n",argv[i][1]);
#endif			
			switch(toupper(argv[i][1]))
         	{
			 	case	'C'	:
#ifdef DEBUG			
						printf("TSR-D-switch C \n");
#endif			 	
					DTC.port = 3;
					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
						DTC.port = atoi(argv[i]);
						if(DTC.port < 0 || DTC.port > 99)
							{
							printf("\nBad com port value %d specified.",DTC.port);
							usage();
							}
						}
					DTC.trap |= TRAP_SERIAL;
					break;

				case	'L'	:
#ifdef DEBUG			
						printf("TSR-D-switch L \n");
#endif
					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
						DTC.lpt = atoi(argv[i]);
						if(DTC.lpt < 1 || DTC.port > 99)
							{
							printf("\nBad lpt port value %d specified.",DTC.lpt);
							usage();
							}
						}
					DTC.trap |= TRAP_PARALLEL;
					break;
#ifdef DTEX
	   			case 'N':
					DTC.version_status = 0;
					break;

            			case 	'I'	:

					i++;
					dtvec[0] = atoh(argv[i]);
					if (dtvec[0]<NUMIRQS)
						dtvec[0] = irq2vec[dtvec[0]];
					  else
						dtvec[0] = 0;
					if (dtvec[0] == 0)
						{
						printf("Invalid IRQ.\n");
						exit(1);
						}
						
				break;
#endif /*dtex*/


            		case 	'B'	:
#ifdef DEBUG			
						printf("TSR-D-switch B \n");
#endif
					i++;
					dtbase[index] = atoh(argv[i]);
#ifndef DTEX	/* no further validation for the express.. */
					/* dtpc-2 address validation is handled differently.. */
#ifdef DTPC2
					if ( ((dtbase[index]&0x7)==0)
					    &&(dtbase[index]<=DT_ADDR_HILIMIT)
					    &&(dtbase[index]>=DT_ADDR_LOLIMIT) )
						{
						base_found=1;
						index++;
						}       
					else /* this replaces if(j) below. */
#else /*DTPC2*/
					for(j=0;j<4;j++)
					 if(dtbase[index] == bases[j])
							{
							base_found=1;
							index++;
							break;
							}
					if(j == 4)
#endif /*DTPC2*/
						{
						printf("\nBad base value specified (0x%04x).",dtbase[index]);
						usage();
						}
#endif /*dtex*/
					break;
					

				case	'R'	:

#ifdef DEBUG			
						printf("TSR-D-switch R \n");
#endif				
					RB.ah = DECTALK_ID;
#ifdef DEBUG
					printf("\nTSR-SWIT-DEBUG-'DECTALK_ID' checked.\n");
#endif					
					RB.al = INSTALL_CHECK;
#ifdef DEBUG
					printf("\nTSR-SWIT-DEBUG-'INSTALL_CHECK' checked.\n");
#endif					
					_int86((unsigned)0x2f, &tsr_regs, &tsr_regs);
#ifdef DEBUG
					printf("\nTSR-SWIT-DEBUG-'_int86' entered.\n");
#endif

					if (RB.al == INSTALLED)
						{
						RB.ah = DECTALK_ID;
						RB.al = DECTALK_EXIT;
						RW.si = 0;
						_int86((unsigned)0x2f, &tsr_regs, &tsr_regs);
						printf("\nExisting DECtalk TSR removed.");
						exit(0);
						}
					else
						{
						printf("\nTsr not installed.");
						exit(1); /* tek 14feb96*/
					  /*	usage();*/
						}
					break;

				case	'V'	: 
#ifdef DEBUG			
						printf("TSR-D-switch V \n");
#endif				
					verbose = true;
               printf("\nThe DECtalk version number is 4.40.\n");
					break;

            case	'M'	:
#ifdef DEBUG			
						printf("TSR-D-switch M \n");
#endif	            
					usage();
					break;

				case	'W'	:
#ifdef DEBUG			
						printf("TSR-D-switch W \n");
#endif	
					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
						win_buff_size = atoi(argv[i]);
						}
					else
						win_buff_size = WIN_BUFF_SIZE;
					if(wb = malloc(win_buff_size))
						win_buff = (char _huge *)wb;
					else
						{
						printf("\nUnable to allocate Windows memory buffer.");
						exit(1);
						}
					break;
            case	'S'	:		/* Select a Message Language */
#ifdef DEBUG			
						printf("TSR-D-switch S \n");
#endif			
					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
#ifdef DEBUG			
						printf("TSR-D-argv[i][0] = %c\n",argv[i][0]);
						printf("TSR-D-argv[i][1] = %c\n",argv[i][1]);
#endif			
						if((toupper(argv[i][0]) == 'U') &&
							(toupper(argv[i][1]) == 'S')) {
							message_language = US_MESSAGE_LANGUAGE;
							}
						else if((toupper(argv[i][0]) == 'S') &&
							(toupper(argv[i][1]) == 'P')) {
							message_language = SP_MESSAGE_LANGUAGE;
							}
						else if((toupper(argv[i][0]) == 'L') &&
							(toupper(argv[i][1]) == 'A')) {
							message_language = LA_MESSAGE_LANGUAGE;
							}
						else if((toupper(argv[i][0]) == 'G') &&
							(toupper(argv[i][1]) == 'R')) {
							message_language = GR_MESSAGE_LANGUAGE;
							}
						else if((toupper(argv[i][0]) == 'F') &&
							(toupper(argv[i][1]) == 'R')) {
							message_language = FR_MESSAGE_LANGUAGE;
							}
                        else if((toupper(argv[i][0]) == 'U') &&
							(toupper(argv[i][1]) == 'K')) {
							message_language = UK_MESSAGE_LANGUAGE;
							}
						else
							{
							printf("\nTSR-E-Bad set message language value; %c%c specified.",
													toupper(argv[i][0]), toupper(argv[i][1]));
							usage();
							}
						}
					break;


            default:
					usage();
				}
			}
		}
return(1);
}

usage()
{
/*	printf("\nDECtalk PC com port emulation TSR.");*/
	printf("\nValid switches.");
	printf("\n    -C dd  ... enables serial port trapping.");
	printf("\n    -L dd  ... enable parallel port trapping.");
	printf("\n    -R     ... removes tsr from memory.");
	printf("\n    -B xxx ... sets module base value to <xxx> in hex.");
	printf("\n    -V     ... enables verbose message printing.");
    printf("\n    -M     ... show the valid switches.");
/*	printf("\n    -W dddd ... enable driver to Windows and reserves dddd byte buffer.");*/
#ifdef DTEX
	printf("\n    -I d   ... sets the attached port IRQ number.");
	printf("\n	-N	... don't report version number from GET_STATUS");
#endif /*DTEX*/      
	printf("\n    -S aa  ... Selects language for messages; US default.");
	printf("\n               where aa is:");
	printf("\n                      US: American English.");
	printf("\n                      SP: Spanish.");
	printf("\n                      GR: German.");
	printf("\n                      FR: French.");
    printf("\n                      UK: British English.");
    printf("\n                      LA: Latin American.");
	printf("\n  Notes:");
	printf("\n      1) Default serial port is 3 (COM4: from dos)."); 
	printf("\n      2) Default parallel port is 2 (LPT3: from dos)."); 
	exit(1);
}

/*
 * ascii string in hex to unsigned int conversion
 */

unsigned int atoh(char *s)
/*char *s;*/
{
	unsigned int temp;

	temp = 0;
	while((*s) == ' ' || (*s) == '\t')
		s++;

	while(true)
		{
		if((*s) >= '0' && (*s) <= '9')
			temp = temp*16+((*s)-'0');
		else if((*s) >= 'A' && (*s) <= 'F')
			temp = temp*16+((*s)-'A'+10);
		else if((*s) >= 'a' && (*s) <= 'f') /* tek 17oct95 */
			temp = temp*16+((*s)-'a'+10);
		else if((*s) == ' ' || (*s) == '\t' || (*s) == '\n' || (*s) == '\0')
			return(temp);
		else
			return(0);
		s++;
		}
}
			



/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995, 1996. All rights reserved.
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
 *    File Name:	ldr_swit.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	DECtalk switch parser ... sets defaults for all settable
 * parameters then adds anyoverides from the command line.
 *
 * Switches are entered in upper or lower case preceded by a
 * "/" or "-" character, switches are order independent and whatever
 * is last, sticks ...
 *
 *   -V		... enables verbose mode on prints.
 *	 -S		... Select language for messages
 *
 ***********************************************************************
 *    Revision History:
 *
 * 16feb96  ...cjl	add Selected language option for messages.
 * 07may96  ...cjl		touched with latest 4-8 board fix.
 * 07AUG97	DR		Added britihs message text defines
 */


#include "ldr.h"
#include "ldrp.h"

#include "tsr.h"

void parse_switch(int argc,char *argv[])
/*int argc;*/
/*char *argv[];*/
{
	int	i,j;

	verbose = false;
	load_module = 0;
	wants_reset = false;

	if(argc < 2)
		usage();

   for (i = 1; i < argc; i++)
		{
   	if ((argv[i][0] == '-') || (argv[i][0] == '/'))
			{
			switch(toupper(argv[i][1]))
         	{
				case	'V'	:
					verbose = true;
					break;

				case	'M'	:

					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
						load_module = atoi(argv[i]);
						if(load_module < 0 ||  load_module > MAX_PC_BOARDS - 1)
							{
							printf("\nModule range is 0 to %d.",MAX_PC_BOARDS - 1);
							usage();
							}
						}
					break;

				case	'R'	:

					wants_reset = true;
					break;

            case	'S'	:		/* Select a Message Language */
					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
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
							printf("\nLDR-E-Bad set message language value; %c%c specified.",
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
}

usage()
{
	printf("\nDECtalk PC file loader.");
	printf("\n  Valid switches:");
	printf("\n    -V   ... enables verbose message printing.");
	printf("\n    -M d ... selects module to load.");
	printf("\n    -R   ... resets module before load.");
	printf("\n    -S aa  ... Selects language for messages; US default.");
	printf("\n               where aa is:");
	printf("\n                      US: American English.");
	printf("\n                      SP: Spanish.");
	printf("\n                      GR: German.");
	printf("\n                      FR: French.");
    printf("\n                      UK: British English.");
    printf("\n                      LA: Latin American.");
	exit(1);
}

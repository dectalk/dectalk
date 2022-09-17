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
 *    File Name:	cm_text.h
 *    Author:		Carl Leeber
 *    Creation Date:06-FEB-1996
 *
 *    Functionality:
 *    new rule based text preprocessing rules and chars...
 *
 ***********************************************************************
 *    Revision History:
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *	001	cjl		02/06/96	Move Span Abbrev[] and RULESET[] from cmd_def.h.
 *	002	MGS		15-May-1996	#ifdef'ed out Ed's parser rule set
 *
 */


#ifndef CMTEXTH
#define CMTEXTH 1
#include "c_us_te.h"	/* Catch for language-dependent code */

/* list of spanish abbreviatios*/
char abbrev[]="admon\n\
afma\n\
afmo\n\
afuera\n\
ago\n\
aptdo\n\
art\n\
avda\n\
Av\n\
aytmo\n\
Bco\n\
Cia\n\
cta\n\
ctra\n\
cte\n\
cts\n\
c\n\
D\n\
dic\n\
dpto\n\
drcha\n\
Dr\n\
Dra\n\
dto\n\
dupdo\n\
ej\n\
ene\n\
est s\n\
etc\n\
excmo\n\
Excma\n\
Excmo\n\
feb\n\
febr\n\
fem\n\
gral\n\
hacia\n\
h\n\
Ilma\n\
Ilmas\n\
Ilmo\n\
Ilmos\n\
izq\n\
izqda\n\
jul\n\
jun\n\
M\n\
MM\n\
ms\n\
MS\n\
mar\n\
mas\n\
masc\n\
Ma\n\
nov\n\
NO\n\
novbre\n\
n£m\n\
n£ms\n\
N\n\
oct\n\
O\n\
Pat\n\
plza\n\
pp\n\
PP\n\
Prof\n\
Profa\n\
pta\n\
ptas\n\
ptas\n\
pts\n\
p g\n\
p gs\n\
p\n\
P\n\
Rmo\n\
Rma\n\
Sdad\n\
sep\n\
sepbre\n\
sept\n\
SE\n\
sig\n\
sigs\n\
sing\n\
Sr\n\
Sra\n\
Srta\n\
Sras\n\
Srs\n\
ss\n\
Sta\n\
Sto\n\
s\n\
S\n\
SO\n\
SW\n\
tel\n\
telef\n\
tfno\n\
t¡t\n\
Ud\n\
Uds\n\
Ud\n\
vd\n\
Vda\n\
vds\n\
vid\n\
vol\n\
Xto\n\
'/0'";

#ifdef OLD_EAB_PARSER
/* note: '[' asks for exact char match, '{' looks for either upper or*/
/*		 lower match*/

/* 				Overview of text pre-processing command processing

			The text pre-processing system works as follows:
				1. Characters are read in until a clause boundary is found
				or the length forces either a graceful boundary or a
				panic boundary.
					a. If a period is found then the dictionary must be searched
					for an abbreviation as DECtalk assumes that an abreviation
					is not the end of clause.
				2. Text pre-processing rule are then re-iteratively run
					for each possible position until completion.
				
		The rule set is really an array of ints which will be able to be userloaded
		with a pointer to its head. No syntax error checking is done because this
		should be enforced at rule generation not at execute time.

		The text pre-proceesing syntax is broken down into commands and
		actions. The command syntax is as follows.
		 
						MATCH COMMANDS

		R(number) 	Present rule is rulenumber (number)

		n+-(number)(or space)	Match using an offset 
					from current pos of (number), a space
					means an offset of 0.
		[ (space or !) (TYPE)
					Indicates a match or not a match against
			a type(s) of a character
		( (space or !) (char)
			Indicates a match or not a match against
			a character

		#	Indicates and of matching section of rule

		C	count the number of occurrances of an item
			and remeber it in charseqcnt

		Dnumber  Delete charseqcnt-n charcters(for ...... type things)

		S(number)(ONE or ZERO)(number)(ONE or ZERO)...space
			Look for sucesss(failure) on previous rule this allows for
			rules without action and depency rules

						ACTION COMMANDS

		I(chars))xff		Insert the following characters, ending
								with a 0xff.

		n+-(number)(or space)	Match using an offset 
					from current pos of (number), a space
					means an offset of 0.

		O(number)(char...char)    	Overwrite command
												replace(overwrite) existing text
												with what with new string ending
												in 0xff. AT this point assumption
												is that you don't need 0xff.
		 D	 (number)	Delete character
							if (number==0) delete by charsequence amount
							note unlessed used charsequence will be == 0
							if (number <0 ) delete by charsequence minus
							number.
							if (number >0) delet that number of characters
			0xff			Siognifies end of rule
			K(number)   RUlenumber x dependents are complete set back to
							false.

		*/

int rulenum=0; /*number of the rule being run*/

int ruleset[]={/*'R',0,'N',' ','[','!',(TYPE_number | TYPE_digit | TYPE_space | TYPE_punct),']',' ',
'N','+',1,'[',' ',TYPE_digit,']','#','N','+',1,' ','I',' ',0xff,'$',

'R',1,'N','+',1,'[','!',(TYPE_number | TYPE_digit | TYPE_punct | TYPE_space),']',
' ','N',' ','[',' ',TYPE_digit,']','#','N','+',1,' ','I',' ',0xff,'$',

'R',4,'N',' ','(',' ','.',')',' ','N','-',1,'[',' ',(TYPE_vowel | TYPE_cons),']',' ',
'N','+',1,'[','!',TYPE_space,']','#','N','+',1,' ','O',' ',0xff,'$',
  */
/* the following rule is for US telephone numbers of the form  NNN(space or dash)NNNN
note to make it easier a sepereate rule should handle the case of the area
code in () also further rules will look for more numbers because even if its
not a telehone number then it's still a list and what we did is ok.*/

'R',6,'N','-',1,' ','[',' ',( TYPE_space),']',
'N',' ','[',' ',( TYPE_digit),']',
'N','+',1,' ','[',' ',( TYPE_digit),']',
'N','+',2,' ','[',' ',( TYPE_digit),']',
'N','+',3,' ','[',' ',( TYPE_space),']',
'N','+',4,' ','[',' ',( TYPE_digit),']',
'N','+',5,' ','[',' ',( TYPE_digit),']',
'N','+',6,' ','[',' ',( TYPE_digit),']',
'N','+',7,' ','[',' ',( TYPE_digit),']',
'N','+',8,' ','[',' ',(TYPE_space),']',
'#',
'N','+',2,' ','I',',',' ',0xff,
'N','+',7,' ','I',',',' ',0xff,'K',6,'$',

/*rule for european tel wih prefix*/
'R',7,'N','-',1,' ','[',' ',( TYPE_space),']',
'N',' ','[',' ',( TYPE_digit),']',
'N','+',1,' ','[',' ',( TYPE_digit),']',
'N','+',2,' ','[',' ',( TYPE_digit),']',
'N','+',3,' ','[',' ',( TYPE_digit),']',
'N','+',4,' ','[',' ',( TYPE_digit),']',
'N','+',5,' ','[',' ',( TYPE_space),']',
'N','+',6,' ','[',' ',( TYPE_digit),']',
'N','+',7,' ','[',' ',( TYPE_digit),']',
'N','+',8,' ','[',' ',( TYPE_digit),']',
'N','+',9,' ','[',' ',( TYPE_digit),']',
'N','+',10,' ','[',' ',( TYPE_digit),']',
'N','+',11,' ','[',' ',( TYPE_digit),']',
'N','+',12,' ','[',' ',( TYPE_digit),']',
'N','+',13,' ','[',' ',( TYPE_digit),']',
'N','+',14,' ','[',' ',(TYPE_space),']',
'#',
'N',' ','I',',',' ',0xff,
'N','+',2,' ','I',',',' ',0xff,
'N','+',4,' ','I',',',0xff,
'N','+',7,' ','I',',',' ',0xff,
'N','+',9,' ','I',',',' ',0xff,
'N','+',11,' ','I',',',' ',0xff,
'N','+',13,' ','I',',',0xff,'K',7,'$',

/*rule for european tel wihout prefix*/
'R',8,'N','-',1,' ','[',' ',( TYPE_space),']',
'N',' ','[',' ',( TYPE_digit),']',
'N','+',1,' ','[',' ',( TYPE_digit),']',
'N','+',2,' ','[',' ',( TYPE_digit),']',
'N','+',3,' ','[',' ',( TYPE_digit),']',
'N','+',4,' ','[',' ',( TYPE_digit),']',
'N','+',5,' ','[',' ',( TYPE_digit),']',
'N','+',6,' ','[',' ',( TYPE_digit),']',
'N','+',7,' ','[',' ',( TYPE_digit),']',
'N','+',8,' ','[',' ',(TYPE_space),']',
'#',
'N','+',1,' ','I',',',' ',0xff,
'N','+',3,' ','I',',',' ',0xff,
'N','+',5,' ','I',',',' ',0xff,
'N','+',7,' ','I',',',0xff,'K',7,'$',



/*The following rule is for European dates of the form
	dd/mm/yy for xx/xx/xx*/
'R',20,'N','-',1,' ','[',' ',(TYPE_space),']',
'N',' ','[',' ',(TYPE_digit),']',
'N','+',1,' ','[',' ',(TYPE_digit),']',
'N','+',2,' ','(',' ','/',')',
'N','+',3,' ','[',' ',( TYPE_digit),']',
'N','+',4,' ','[',' ',( TYPE_digit),']',
'N','+',5,' ','(',' ','/',')',
'N','+',6,' ','[',' ',( TYPE_digit),']',
'N','+',7,' ','[',' ',( TYPE_digit),']',
'N','+',8,' ','[',' ',(TYPE_space),']',
'#',0xff,'$',


		/*for x/xx/xx */
'R',20,'N','-',1,' ','[',' ',(TYPE_space),']',
'N',' ','[',' ',(TYPE_digit),']',
'N','+',1,' ','(',' ','/',')',
'N','+',2,' ','[',' ',( TYPE_digit),']',
'N','+',3,' ','[',' ',( TYPE_digit),']',
'N','+',4,' ','(',' ','/',')',
'N','+',5,' ','[',' ',( TYPE_digit),']',
'N','+',6,' ','[',' ',( TYPE_digit),']',
'N','+',7,' ','[',' ',(TYPE_space),']',
'#',0xff,'$',

	/*for x/x/xx*/
'R',20,'N','-',1,' ','[',' ',(TYPE_space),']',
'N',' ','[',' ',(TYPE_digit),']',
'N','+',1,' ','(',' ','/',')',
'N','+',2,' ','[',' ',( TYPE_digit),']',
'N','+',3,' ','(',' ','/',')',
'N','+',4,' ','[',' ',( TYPE_digit),']',
'N','+',5,' ','[',' ',( TYPE_digit),']',
'N','+',6,' ','[',' ',(TYPE_space),']',
'#',0xff,'$',	
	/*for xx/x/xx*/
'R',20,'N','-',1,' ','[',' ',(TYPE_space),']',
'N',' ','[',' ',(TYPE_digit),']',
'N','+',1,' ','[',' ',( TYPE_digit),']',
'N','+',2,' ','(',' ','/',')',
'N','+',3,' ','[',' ',( TYPE_digit),']',
'N','+',4,' ','(',' ','/',')',
'N','+',5,' ','[',' ',( TYPE_digit),']',
'N','+',6,' ','[',' ',( TYPE_digit),']',
'N','+',7,' ','[',' ',(TYPE_space),']',
'#',0xff,'$',	 


/*Find a date but no action yet this is language dependent and number
dependent */
/* find first / of date*/
'R',25,'S',20,1,' ','N',' ','(',' ','/',')','#','O','-',0xff,'K',20,0xff,'$',

/* now insert month notes rule numbers the same so later condition
equals any of these rules as equivalent*/
/* /01/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','1',')',
'#','N',' ','O','E','N',0xff,'N','+',1,'I','E',0xff,'$',
/*  1 */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','1',')','N','+',1,' ','(',' ','/',')',
'#','N',' ','O','E',0xff,'N',' ','I','N','E',0xff,'$',
/* /02/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,' ','(',' ','2',')',
'#','N',' ','O','F','E',0xff,'N','+',1,'I','B',0xff,'$',
/* /2/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','2',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','F',0xff,'N',' ','I','E','B',0xff,'$',
/* /03/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','3',')',
'#','N',' ','O','M','A',0xff,'N','+',1,'I','R',0xff,'$',
/* /3/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','3',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','M',0xff,'N',' ','I','A','R',0xff,'$',
/* /04/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','4',')',
'#','N',' ','O','A','P',0xff,'N','+',1,'I','R',0xff,'$',
/* /4/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','4',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','A',0xff,'N',' ','I','P','R',0xff,'$',
/* /05/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','5',')',
'#','N',' ','O','M','A',0xff,'N','+',1,'I','Y',0xff,'$',
/* /5/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','5',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','M',0xff,'N',' ','I','A','Y',0xff,'$',
/* /06/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','6',')',
'#','N',' ','O','J','U',0xff,'N','+',1,'I','N',0xff,'$',
/* /6/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','6',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','J',0xff,'N',' ','I','U','N',0xff,'$',
/* /07/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','7',')',
'#','N',' ','O','J','U',0xff,'N','+',1,'I','L',0xff,'$',
/* /7/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','7',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','J',0xff,'N',' ','I','U','L',0xff,'$',
/* /08/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','8',')',
'#','N',' ','O','A','U',0xff,'N','+',1,'I','G',0xff,'$',
/* /8/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','8',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','A',0xff,'N',' ','I','U','G',0xff,'$',
/* /09/ */
'R',27,'S',25,1,' ','N',' ','(',' ','0',')','N','+',1,'(',' ','9',')',
'#','N',' ','O','S','E',0xff,'N','+',1,'I','P',0xff,'$',
/* /9/  */
'R',27,'S',25,1,' ','N','-',1,'(',' ','-',')',
'N',' ','(',' ','9',')','N','+',1,'(',' ','/',')',
'#','N',' ','O','S',0xff,'N',' ','I','E','P',0xff,'$',
/* /010/ */
'R',27,'S',25,1,' ','N',' ','(',' ','1',')','N','+',1,'(',' ','0',')',
'#','N',' ','O','O','C',0xff,'N','+',1,'I','T',0xff,'$',
/* /011/ */
'R',27,'S',25,1,' ','N',' ','(',' ','1',')','N','+',1,'(',' ','1',')',
'#','N',' ','O','N','O',0xff,'N','+',1,'I','V',0xff,'$',
/* /012/ */
'R',27,'S',25,1,' ','N',' ','(',' ','1',')','N','+',1,'(',' ','2',')',
'#','N',' ','O','D','E',0xff,'N','+',1,'I','C',0xff,'$',



/*Now clean up final / */
'R',30,'S',27,1,' ','N',' ','(',' ','/',')','#','N',' ','O','-',0xff,
'K',27,0xff,'$','@'

};

#endif /* #ifdef OLD_EAB_PARSER */

#endif

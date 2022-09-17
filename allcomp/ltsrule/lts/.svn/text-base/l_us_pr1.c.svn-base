/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 *********************************************************************** 
 *    File Name:        l_us_pr1.c
 *    Author:		JDB
 *    Creation Date:06/24/96
 *
 *    Functionality:
 * 	  Heuristic output routines
 * 	  used by letter to sound to speak
 *    numbers, part numbers, and other more
 *    complex items.
 *
 ***********************************************************************
 *
 * Rev	Who		Date			Description
 * ---	-----	------------	---------------------------------------
 * 001	JDB		05/31/1996		first creation
 * 002	GL		08/28/1996		us ls_util_lookup to replace ls_dict_blook()
 * 003	GL		11/15/1996		merge ls_proc2.c with l_us_pr1.c
 * 004	GL		02/01/1997		don't spell if section of part number can be pronunced
 * 005	GL		02/07/1997		rollback 003 change
 * 006	GL		06/04/1997		for BATS#377 add FAA switch
 * 007	MGS		06/16/1997		BATS#387  fixed problem with uppercase compound words
 * 008	MGS		07/22/1997		BATS#412  fixed ½ and ¼ problem
 * 009	EAB		10/19/1997		set off numbers with a glotal stop
 *								while in NWSNOAA mode.
 * 010	EAB		11/21/1997		EAB BATS 266 remove "19xx" expansion 
 * 011	GL		10/21/1998		BATS#770 support eurpose date reading under mode_europe 
 * 012	MGS		11/23/1998		BATS #329 fixed 02-apr-2001 
 * 013	EAB		02/02/1999		Fixed BATS 863 which corrected the number before 
								a quatitiy (hudred thousand ect ) from stressed to unstressed
								Plus Made NWSNOAA->NWS_US
								change to support more than nwsnooa for english only
 * 014	MGS		04/13/2000		Changes for integrated phoneme set 
 * 015	NAL		05/24/2000		Fuction def change, warning removal
 * 016	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 017	CAB		10/16/2000		Added copyright info
 * 018	CAB		01/22/2001		Fixed copyright info
 * 014	MFG		10/30/2001		Fixed 1/4 & 1/2 and superscripts ^2 & ^3 BATS 986
 * 015	CAB		04/25/2002		Removed warnings by typecast
 */

#include "ls_def.h"

/* ******************************************************************
 *      Function Name: ls_proc_do_sign()
 *
 *  	Description: Speak a "sign" like character, followed
 * 		by a word boundry. The "-" is pronounced "minus"
 * 		without using the dictionary, just in case some future
 * 		edit decides that it should be "dash". All the others
 * 		are just handed to the dictionary code.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,
 *				   int sign
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_sign(LPTTS_HANDLE_T phTTS, int sign)
{
	LETTER	lbuf[2];

	if (sign == '-')
	{
		/* Special case.	*/
		ls_util_send_phone_list(phTTS,pminus);
		ls_util_send_phone(phTTS,WBOUND);
	}
	else	
	{
	 	if (sign == '+')
		{			/* Special case.	*/
			ls_util_send_phone_list(phTTS,pplus);
			ls_util_send_phone(phTTS,WBOUND);
		}
	 	else 
	 	{
	 		if (sign != 0)
			{		/* Dictionary case.	*/
				lbuf[0].l_ch = ' ';
//				lbuf[0].l_ip = NULL;
				lbuf[1].l_ch = sign;
//				lbuf[1].l_ip = NULL;

				if (ls_util_lookup(phTTS,&lbuf[0], &lbuf[2], FIRST) == MISS)
					ls_util_send_phone(phTTS,US_EY);

				ls_util_send_phone(phTTS,WBOUND);
			}
		}
	}
}

/* ************************************************
 * Speak a part number, and any
 * index markers that are imbedded in the
 * string of characters. The code works best if
 * the part number has DECtalk's standard part number
 * syntax, but it won't blow up if it doesn't.
 * I don't really like the way that the three case
 * arms all check if the inter-chunk WBOUND is
 * needed.
 *
 * The Kurzweil spelling rules are a little
 * bit different. The number processing rules never
 * wake up. The "-" and "/" characters are never
 * spoken. I could not decide if there should be a
 * pause on these characters, so I made it an
 * option, controlled by a new bit in the modeflag
 * option word.
 */
 
/* ******************************************************************
 *      Function Name: ls_proc_do_part_number()      
 *
 *  	Description: Speak a part number, and any
 * 					 index markers that are imbedded in the
 * 					 string of characters. The code works best if
 * 					 the part number has DECtalk's standard part number
 * 					 syntax, but it won't blow up if it doesn't.
 * 					 I don't really like the way that the three case
 * 					 arms all check if the inter-chunk WBOUND is
 * 					 needed.
 *
 * 					 The Kurzweil spelling rules are a little
 * 					 bit different. The number processing rules never
 * 					 wake up. The "-" and "/" characters are never
 * 					 spoken. I could not decide if there should be a
 * 					 pause on these characters, so I made it an
 * 					 option, controlled by a new bit in the modeflag
 * 					 option word. 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_part_number(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp)
{
	LETTER *blp;
	int	speed;

	int	nd;

	while (llp != rlp) 
	{
		blp = llp;
		++llp;
		if (blp->l_ch=='-' || blp->l_ch=='/') 
		{
/* GL 06/04/1997 BATS#377 add FAA switch */
#ifndef FAA
			ls_spel_spell(phTTS,blp, llp);
			if (llp != rlp)
				ls_util_send_phone(phTTS,WBOUND);
#endif
		} 
		else
		{ 
			if (blp->l_ch>='0' && blp->l_ch<='9') 
			{
				while (llp!=rlp && llp->l_ch>='0' && llp->l_ch<='9')
					++llp;
				if ((nd = llp-blp) == 2)
				{
					ls_proc_do_2_digits(phTTS,blp);
				}
				else
				{ 
					if (nd == 3)
					{
						ls_proc_do_3_digits(phTTS,blp);
					}
					else
					{ 
						if (nd == 4)
							ls_proc_do_4_digits(phTTS,blp);
						else				
							ls_spel_spell(phTTS,blp, llp);
					}
				}
				if (llp != rlp)
				{
					ls_util_send_phone(phTTS,WBOUND);
				}
			} 
			else 
			{
				while (llp!=rlp && ls_proc_is_a_part(llp->l_ch)!=FALSE)
					++llp;
				if (llp-blp<3 || ls_util_lookup(phTTS, blp, llp, FALSE)==MISS) 
				{
					/*
					   GL 02/01/1977  only spell non-alphabet word or alphabet word
					   without vowel
					   GL 02/07/1997 rollback this change for further study

					   GL 06/04/1997 BATS#377 add this change for FAA mode
					   this change will break part number like QA-255KAA-SB
				    */
#ifdef FAA
				    if (ls_util_is_aword(blp,llp))
					{	
						/* MGS 6/16/97 BATS #387 Added becasue rule engine needs lower case characters */
						ls_task_remove_case(blp,llp);
				    	ls_rule_do_lts(phTTS,blp, llp);
					}
				    else
				    {
						speed = ls_spel_spell_speed(blp, llp);
						ls_spel_spell(phTTS,blp, llp);
						if (speed == FAST)
							ls_util_send_phone(phTTS,WBOUND);
						else
							ls_util_send_phone(phTTS,COMMA);
					}
#else
					speed = ls_spel_spell_speed(blp, llp);
					ls_spel_spell(phTTS,blp, llp);
					if (speed == FAST)
						ls_util_send_phone(phTTS,WBOUND);
					else
						ls_util_send_phone(phTTS,COMMA);
#endif
				} 
				else 
					if (llp != rlp)
						ls_util_send_phone(phTTS,WBOUND);
			}
		}
	}
}

 
/* ******************************************************************
 *      Function Name: ls_proc_is_a_part()      
 *
 *  	Description: Return TRUE if the character
 * 					 "c" can be part of a part number alpha
 * 					 string. All characters but digits,
 * 					 the "-" and the "/" are this.
 *
 *      Arguments: int c
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int ls_proc_is_a_part(int c)
{
	if ( c == '-' || c == '/' || ( c >= '0' && c <= '9' ))
		return (FALSE);
	return (TRUE);
}

 
/* ******************************************************************
 *      Function Name:       
 *
 *  	Description: 0X	spell.
 * 					 1X	speak X (as a "teen", "10" is a "teen").
 * 					 X0	speak X (as tens).
 * 					 XY	speak X (as tens), speak Y (as units).
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS
 *					LETTER *lp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/ 
void ls_proc_do_2_digits(LPTTS_HANDLE_T phTTS,LETTER *lp)
{
	if (lp->l_ch == '0')
		ls_spel_spell(phTTS,lp, lp+2);
	else 
	{
		if (lp->l_ch == '1')
			ls_util_send_phone_list(phTTS,pteens[(lp+1)->l_ch-'0']);
		else 
		{
			ls_util_send_phone_list(phTTS,ptens[lp->l_ch-'0']);
			if ((lp+1)->l_ch != '0') 
			{
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone_list(phTTS,punits[(lp+1)->l_ch-'0']);
            }
		}
	}
}


/* ******************************************************************
 *      Function Name: ls_proc_do_3_digits()      
 *
 *  	Description: 0XX	spell.
 * 					 X00	speak X, "hundred".
 * 					 XYY	speak X, speak YY.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS
 *					LETTER *lp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_3_digits(LPTTS_HANDLE_T phTTS, LETTER *lp)
{
	if (lp->l_ch == '0')
		ls_spel_spell(phTTS,lp, lp+3);
	else 
	{
		//BATS 863 which corrected the number before 
		//a quatitiy (hudred thousand ect ) from stressed to unstressed
		ls_util_send_phone_list(phTTS,upunits[lp->l_ch-'0']);
		ls_util_send_phone(phTTS,WBOUND);
		if ((lp+1)->l_ch=='0' && (lp+2)->l_ch=='0') 
		{
			ls_util_send_phone_list(phTTS,phundred);
		} else
			ls_proc_do_2_digits(phTTS,lp+1);
	}
}
 
/* ******************************************************************
 *      Function Name: ls_proc_do_4_digits()      
 *
 *  	Description: 0XXX	spell.
 * 					 X000 speak X, "thousand".
 * 					 XX00 speak XX, "hundred".
 * 					 XXYY	speak XX, speak YY.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS
 *					LETTER *lp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/                   
void ls_proc_do_4_digits(LPTTS_HANDLE_T phTTS,LETTER *lp) // NAL warning removal
{
	if (lp->l_ch == '0')
		ls_spel_spell(phTTS,lp, lp+4);
	else 
	{
		if ((lp+2)->l_ch=='0' && (lp+3)->l_ch=='0') 
		{
			if ((lp+1)->l_ch == '0') 
			{
				//BATS 863 which corrected the number before 
				//a quatitiy (hudred thousand ect ) from stressed to unstressed
				ls_util_send_phone_list(phTTS,upunits[lp->l_ch-'0']);
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone_list(phTTS,pthousand);
			} 
			else 
			{
				ls_proc_do_2_digits(phTTS,lp);
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone_list(phTTS,phundred);
			}
		} 
		else 
		{
			ls_proc_do_2_digits(phTTS,lp+0);
			ls_util_send_phone(phTTS,WBOUND);
			ls_proc_do_2_digits(phTTS,lp+2); 
		}
	}
	return;
}

 
/* ******************************************************************
 *      Function Name: ls_proc_do_digit_group()
 *
 *  	Description: Speak a three digit group.
 * 		The number is in the supplied array of three
 * 		digits, with leading zeros. The caller must arrange
 * 		to put out the required index markers. This may be a
 * 		"bug", because the index marks will happen at the
 * 		end of the group, not as the digits get
 * 		spoken.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,
 *				   unsigned char buf[3], 
 *				   int oflag
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
/* MGS 07/22/97 BATS #412 changed buf to unsigned */
void ls_proc_do_digit_group(LPTTS_HANDLE_T phTTS, unsigned char buf[3], int oflag)
{
	if (buf[0] != '0') 
	{
		//BATS 863 which corrected the number before 
		//a quatitiy (hudred thousand ect ) from stressed to unstressed
		ls_util_send_phone_list(phTTS,upunits[buf[0]-'0']);
		ls_util_send_phone(phTTS,WBOUND);
		ls_util_send_phone_list(phTTS,phundred);
		if (buf[1]=='0' && buf[2]=='0') 
		{
			if (oflag != FALSE)
			{
				ls_util_send_phone(phTTS,US_TH);
			}
			return;
		}
		ls_util_send_phone_list(phTTS,pand);
	}
	if (buf[1] == '1') 
	{
		ls_util_send_phone_list(phTTS,pteens[buf[2]-'0']);

		if (oflag != FALSE)
		{
			ls_util_send_phone(phTTS,US_TH);
		}
		return;
	}
	if (buf[1] != '0') 
	{
		ls_util_send_phone_list(phTTS,ptens[buf[1]-'0']);
		if (buf[2] == '0') 
		{
			if (oflag != FALSE) 
			{
				ls_util_send_phone(phTTS,US_IX);
				ls_util_send_phone(phTTS,US_TH);
			}
			return;
		}
		ls_util_send_phone(phTTS,WBOUND);
	}

	if (oflag != FALSE)
		ls_util_send_phone_list(phTTS,pordin[buf[2]-'0']);
	else
		ls_util_send_phone_list(phTTS,punits[buf[2]-'0']);
}

/* ******************************************************************
 *      Function Name: ls_proc_do_number()
 *
 *  	Description: This is a general number speaking routine.
 * 					 It understands integers, fractional digits, and powers
 * 					 of 10. Long integers are spoken in groups. Shorter integers
 * 					 are spoken more cleverly. The "oflag" asks to have the number
 * 					 spoken as an ordinal (for dates, etc.); it only works right if
 * 					 the number is a small integer. Return TRUE if the number is
 * 					 plural, and FALSE if it is singular. This function calls
 * 					 itself recursively to speak the exponent of a floating
 * 					 point number; it cannot get stuck, because of the
 * 					 syntax of such numbers.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,
 *				   LETTER *llp, 
 *				   LETTER *rlp, 
 *				   int oflag
 *
 *      Return Value: int
 *
 *      Comments:
 *		001  EAB 10.9.97 It's best to set off numbers with a glotal stop.
 *
 * *****************************************************************/         
int ls_proc_do_number(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, int oflag)
{
	LETTER *tlp1;
	LETTER *tlp2;
	int	c;
	int	n;
	int	pflag;
	int	ndig;
	int	sflag;
	/* MGS 07/22/97 BATS #412 changed buf to unsigned */
	unsigned char		buf[18];
	PLTS_T pLts_t;
	pLts_t = phTTS->pLTSThreadData;

	tlp1  = llp;
	/* This handles integer parts like "1/4 & 1/2" and superscripts ^2 & ^3.*/
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD || tlp1->l_ch==0xB2 || tlp1->l_ch==0xB3)) 
	{
		ls_spel_spell(phTTS,tlp1, rlp);
		return (FALSE);
	}
	pflag = FALSE;				/* Not plural.			*/
	sflag = FALSE;				/* No user "," seen.	*/
	ndig  = 0;
#ifdef LS2DEBUG
	printf("In ls_proc_do_number\n");

#endif
	while (tlp1!=rlp && (IS_DIGIT(tlp1->l_ch) || tlp1->l_ch==pLts_t->schar) &&
		/* MGS 07/22/97 BATS #412 */
		(tlp1->l_ch != 0xBC &&  tlp1->l_ch !=0xBD &&  tlp1->l_ch !=0xB2 &&  tlp1->l_ch !=0xB3) ) 
	{
		if (tlp1->l_ch == pLts_t->schar)
			sflag = TRUE;
		else
			++ndig;
		++tlp1;
	}
	if (ndig>18 && sflag!=FALSE) 
	{
		/* Long, commas.	*/
		tlp2 = llp;
		while (tlp2 != tlp1) 
		{
			/* Pause where you are	*/
			c = tlp2->l_ch;		/* told to do so.	*/
			++tlp2;
			if (c == pLts_t->schar)
				ls_util_send_phone(phTTS,COMMA);
			else 
			{
				ls_util_send_phone_list(phTTS,punits[c-'0']);
				if (tlp2!=tlp1 && tlp2->l_ch!=pLts_t->schar)
					ls_util_send_phone(phTTS,WBOUND);
			}
		}
		pflag = TRUE;
	} 
	else
	{ 
		if (ndig>18 || (ndig>1 && llp->l_ch=='0')) 
		{
			tlp2 = llp;
			while (ndig >= 6) 
			{
				/* At least 1 group.	*/
				n = 0;
				while (n < 3) 
				{
					if ((c=tlp2->l_ch) != pLts_t->schar) 
					{
						if (n != 0)
							ls_util_send_phone(phTTS,WBOUND);
						++n;
						ls_util_send_phone_list(phTTS,punits[c-'0']);
					}
					++tlp2;
				}
				ls_util_send_phone(phTTS,COMMA);
				ndig -= 3;
			}
			n = 0;				/* Last group.		*/
			while (tlp2 != tlp1) 
			{
				if ((c=tlp2->l_ch) != pLts_t->schar) 
				{
					if (n != 0)
						ls_util_send_phone(phTTS,WBOUND);
					++n;
					ls_util_send_phone_list(phTTS,punits[c-'0']);
				}
				++tlp2;
			}
			pflag = TRUE;			/* Long => plural.	*/
		} 
		else 
		{
			if (ndig != 0) 
			{
				n = 18;				/* Right justify	*/

				tlp2 = tlp1;
				while (tlp2 != llp)
				{
					c = (--tlp2)->l_ch;
					if (c != pLts_t->schar)
						buf[--n] = c;
				}
				if (n!=17 || buf[17]!='1')	/* Watch for "1".	*/
					pflag = TRUE;
				while (n != 0)
					buf[--n] = '0';
				if (ls_proc_non_zero(&buf[0], 3) != FALSE) 
				{	/* Quadrillions		*/
					ls_proc_do_digit_group(phTTS,&buf[0], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,pquadrillion);
					if (ls_proc_non_zero(&buf[3], 15) == FALSE) 
					{

						if (oflag != FALSE)
						{
							ls_util_send_phone(phTTS,US_TH);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[4], 14) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					else if (ls_proc_non_zero(&buf[3], 1) == FALSE)
						ls_util_send_phone_list(phTTS,pand);
					else
						ls_util_send_phone(phTTS,COMMA);
				}
				if (ls_proc_non_zero(&buf[3], 3) != FALSE) 
				{	/* Trillions		*/
					ls_proc_do_digit_group(phTTS,&buf[3], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,ptrillion);
					if (ls_proc_non_zero(&buf[6], 12) == FALSE) 
					{

						if (oflag != FALSE)
						{
                                                    ls_util_send_phone(phTTS,US_TH);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[7], 11) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					else
						if (ls_proc_non_zero(&buf[6], 1) == FALSE)
							ls_util_send_phone_list(phTTS,pand);
						else
							ls_util_send_phone(phTTS,COMMA);
				}
				if (ls_proc_non_zero(&buf[6], 3) != FALSE) 
				{	/* Billions		*/
					ls_proc_do_digit_group(phTTS,&buf[6], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,pbillion);
					if (ls_proc_non_zero(&buf[9], 9) == FALSE) 
					{
						if (oflag != FALSE)
						{
							ls_util_send_phone(phTTS,US_TH);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[10], 8) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					else 
						if (ls_proc_non_zero(&buf[9], 1) == FALSE)
							ls_util_send_phone_list(phTTS,pand);
						else
							ls_util_send_phone(phTTS,COMMA);
				}
				if (ls_proc_non_zero(&buf[9], 3) != FALSE) 
				{	/* Millions		*/
					ls_proc_do_digit_group(phTTS,&buf[9], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,pmillion);
					if (ls_proc_non_zero(&buf[12], 6) == FALSE) 
					{
						if (oflag != FALSE)
						{
							ls_util_send_phone(phTTS,US_TH);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[13], 5) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					else 
						if (ls_proc_non_zero(&buf[12], 1) == FALSE)
							ls_util_send_phone_list(phTTS,pand);
						else
							ls_util_send_phone(phTTS,COMMA);
				}

				if (ls_proc_non_zero(&buf[12], 3) != FALSE) 
				{	/* Thousands		*/

					ls_proc_do_digit_group(phTTS,&buf[12], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,pthousand);
					if (ls_proc_non_zero(&buf[15], 3) == FALSE) 
					{
						if (oflag != FALSE)
						{
							ls_util_send_phone(phTTS,US_TH);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[16], 2) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					else if (ls_proc_non_zero(&buf[15], 1) == FALSE)
						ls_util_send_phone_list(phTTS,pand);
					else
						ls_util_send_phone(phTTS,COMMA);
				}
		
				ls_proc_do_digit_group(phTTS,&buf[15], oflag);	/* Units		*/

			out: ;
			}
		}
	}
	/* This code handles integer parts like "1/4 & 1/2" and superscripts ^2 & ^3.		*/
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD || tlp1->l_ch==0xB2 || tlp1->l_ch==0xB3)) 
	{
		ls_util_send_phone_list(phTTS,pand);
		ls_spel_spell(phTTS,tlp1, tlp1+1);
		++tlp1;
		pflag = TRUE;			/* Always plural.	*/
	}
	if (tlp1!=rlp && tlp1->l_ch==pLts_t->fchar) 
	{	/* Fraction digits.	*/
		if (llp != tlp1)
			ls_util_send_phone(phTTS,WBOUND);
		ls_util_send_phone_list(phTTS,ppoint);
		tlp2 = tlp1;
		++tlp1;
		while (tlp1!=rlp && tlp1->l_ch!='e') 
		{
			c = tlp1->l_ch;
			if (c != pLts_t->schar) 
			{
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone_list(phTTS,punits[c-'0']);
			}
			++tlp1;
		}
		pflag = TRUE;								/* 1.01 is plural.	*/
	}
	if (tlp1 != rlp) 
	{												/* Must be an "e".	*/
		ls_util_send_phone_list(phTTS,ptt2tp);		/* " " on end.		*/
		tlp2 = tlp1;
		++tlp1;										/* Skip "e"			*/
		if (tlp1 != rlp) 
		{											/* Handle signs.	*/
			c = tlp1->l_ch;
			if (c=='-' || c=='+') 
			{
				ls_proc_do_sign(phTTS,c);
				++tlp1;
			}
		}
		ls_proc_do_number(phTTS,tlp1, rlp, FALSE);	/* Cannot recur on "e".	*/
		pflag = TRUE;								/* 1E01 is plural.		*/
	}
	return (pflag);
}

/* ******************************************************************
 *      Function Name: ls_proc_non_zero()      
 *
 *  	Description: Check to see if the supplied
 * 					 array of characters, with length "n",
 * 					 is non zero. Return TRUE if it is.
 * 					 Return FALSE if all zero.
 *
 *      Arguments:	char *p
 *					int n
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int ls_proc_non_zero(char *p, int n)
{
	while (n--) 
	{
		if (*p != '0')
			return (TRUE);
		++p;
	}
	return (FALSE);
}

/* ******************************************************************
 *	Function Name:
 *		ls_proc_is_date	
 *
 *	Description:       
 *		this function checks weather the number is ir isn't a date
 *
 *	Arguments:
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer to the word
 *
 *	Return Value:
 *		TRUE	if the word is a date
 *		FALSE	otherwise
 *
 *	Comments:
 *
 * *****************************************************************/
int ls_proc_is_date(LETTER *llp, LETTER *rlp)
{	// CAB Changed to unsigned char
	unsigned char *cp;
	int i;
	short buf[3];

	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)	/* First digit. */
		return (FALSE);
	if (llp->l_ch != '-') 
	{												/* Optional digit. */
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '-')						/* Must be "-" now!	*/
			return (FALSE);
	}
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))	/* Three alphas. */
		return (FALSE);
	buf[0] = llp->l_ch;
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))
		return (FALSE);
	buf[1] = llp->l_ch;
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))
		return (FALSE);
	buf[2] = llp->l_ch;
	for (i=0; i<12; ++i) 
	{			/* Validate.		*/
		// CAB Removed warning by typecast
		cp = (unsigned char *)months[i];
		if (buf[0]==cp[0] && buf[1]==cp[1] && buf[2]==cp[2])
			break;
	}
	if (i == 12)				/* Loss!		*/
		return (FALSE);
	if (++llp == rlp)			/* 23-Aug		*/
		return (TRUE);
	if (llp->l_ch != '-')		/* Must be a year.	*/
		return (FALSE);
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))
		return (FALSE);
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))
		return (FALSE);
	if (++llp == rlp)			/* 23-Aug-84		*/
		return (TRUE);
	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)	/* Need 2 more digits.	*/
		return (FALSE);
	if (!IS_DIGIT(llp->l_ch) || ++llp!=rlp)
		return (FALSE);
	return (TRUE);				/* 23-Aug-1984		*/
}

/* ******************************************************************
 *	Function Name:
 *		ls_proc_do_date	
 *
 *	Description:
 *		this function sends the correct phonemes for a date
 *
 *	Arguments:
 *		LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer to the word
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 * *****************************************************************/
void ls_proc_do_date(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	LETTER *lp1;
	int i;
	// CAB Changed to unsigned char
	unsigned char *cp;

	PKSD_T  pKsd_t;
	pKsd_t = phTTS->pKernelShareData;

	lp1 = llp;	/* Find end of day.	*/
	while (lp1->l_ch != '-')
		++lp1;
	for (i=0; i<12; ++i) 
	{	/* Get month.		*/
		// CAB Removed warning by typecast
		cp = (unsigned char *)months[i];
		if ((lp1+1)->l_ch == cp[0]
		&&  (lp1+2)->l_ch == cp[1]
		&&  (lp1+3)->l_ch == cp[2])
			break;
	}

	/* GL 10/21/98, BATS#770 support europe date reading */
    if ((pKsd_t->modeflag&MODE_EUROPE) != 0)
	{
		ls_util_send_phone_list(phTTS,pthe);	/* 19XX					*/
		ls_util_send_phone(phTTS,WBOUND);
		if (lp1!=llp+1 && llp->l_ch=='0')					/* Get "01-Jan-84" ok.	*/
			ls_proc_do_number(phTTS,llp+1, lp1, TRUE);
		else
			ls_proc_do_number(phTTS,llp, lp1, TRUE);
		ls_util_send_phone(phTTS,WBOUND);
		ls_util_send_phone_list(phTTS,pof);
		ls_util_send_phone(phTTS,WBOUND);
		ls_util_send_phone_list(phTTS,pmonths[i]);			/* Speak the month		*/
	}
	else
	{
		ls_util_send_phone_list(phTTS,pmonths[i]);			/* Speak the month		*/
		ls_util_send_phone(phTTS,WBOUND);
		if (lp1!=llp+1 && llp->l_ch=='0')					/* Get "01-Jan-84" ok.	*/
			ls_proc_do_number(phTTS,llp+1, lp1, TRUE);
		else
			ls_proc_do_number(phTTS,llp, lp1, TRUE);
	}
	lp1 += 4;
	if (lp1 != rlp) {
		ls_util_send_phone(phTTS,COMMA);

		if (lp1+3 == rlp) 
		{
#ifdef LIKE_BUGS /* BATS 266 let not guess the year eab*/
			ls_util_send_phone_list(phTTS,pteens[9]);	/* 19XX					*/
			ls_util_send_phone(phTTS,WBOUND);
#endif
			ls_proc_do_2_digits(phTTS,lp1+1);
		} 
		else
		{
			/* 012 MGS 11/23/1998 BATS #329 fixed 02-apr-2001 */
			if ((lp1+1)->l_ch!='0' && (lp1+2)->l_ch=='0' && (lp1+3)->l_ch=='0' && (lp1+4)->l_ch!='0')
			{

				ls_proc_do_2_digits(phTTS,lp1+1);
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone_list(phTTS,pOH);
				ls_util_send_phone_list(phTTS,punits[(lp1+4)->l_ch-'0']);

				//ls_proc_do_4_digits(phTTS,lp1+1);			/* YYXX					*/		
				/* this is a 200X date */
			}
			else
			{
				ls_proc_do_4_digits(phTTS,lp1+1);			/* YYXX					*/		
			}
		}
	}
}

/* ******************************************************************
 *	Function Name:
 *		ls_proc_is_frac	
 *
 *	Description:
 *		this function determines if the word is a fraction
 *
 *	Arguments:
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer to the word
 *
 *	Return Value:
 *		TRUE	if the word is a fraction
 *		FALSE	otherwise
 *
 *	Comments:
 * *****************************************************************/
int ls_proc_is_frac(LETTER *llp, LETTER *rlp)
{
	int	n;

	if (!IS_DIGIT(llp->l_ch) || llp->l_ch=='0' || ++llp==rlp)
		return (FALSE);				/* Non digit or "0".	*/
	if (llp->l_ch != '/') 
	{								/* Optional digit.		*/
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '/')
			return (FALSE);
	}
	n = 0;							/* Count digits.		*/
	while (++llp!=rlp && IS_DIGIT(llp->l_ch)) 
	{
		if (n==0 && llp->l_ch=='0')	/* Leading "0" is bad.	*/
			return (FALSE);
		++n;
	}
	if (n==0 || n>3)				/* 1 to 3 digits.		*/
		return (FALSE);
	if (n == 3) 
	{								/* Limit is 100.		*/
		if ((llp-1)->l_ch != '0'
		||  (llp-2)->l_ch != '0'
		||  (llp-3)->l_ch != '1')
			return (FALSE);
	}
	if (llp != rlp) 
	{								/* Allow "%".			*/
		if (llp->l_ch!='%' || llp+1!=rlp)
			return (FALSE);
	}
	return (TRUE);
}

/* ******************************************************************
 *	Function Name:
 *		ls_proc_do_frac	
 *
 *	Description:
 *		this function sends the phonemes for a fraction
 *
 *	Arguments:
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp     The right bounding pointer to the word
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 * *****************************************************************/
void ls_proc_do_frac(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	 LETTER *tlp1;
	 LETTER *tlp2;
	 int	pflag;
	 int	ud;

	tlp1 = llp;											/* Scan to "/".			*/
	while (tlp1->l_ch != '/')
		++tlp1;
	pflag = ls_proc_do_number(phTTS,llp, tlp1, FALSE);	/* Numerator.			*/
	ls_util_send_phone(phTTS,WBOUND);					/* Gap.					*/
	++tlp1;												/* Skip "/".			*/
	tlp2 = tlp1;										/* Scan to end or "%".	*/
	while (tlp2!=rlp && tlp2->l_ch!='%')
		++tlp2;
	if (tlp1+1==tlp2 && tlp1->l_ch=='2') 
	{
		ls_util_send_phone_list(phTTS,pflag!=FALSE ? phalves : phalf);
	} 
	else 
	{
		ls_proc_do_number(phTTS,tlp1, tlp2, TRUE);		/* As an ordinal.		*/
		if (pflag != FALSE) 
		{												/* Make plural.			*/
			ud = (tlp2-1)->l_ch;
			if (tlp2>tlp1+1 && (tlp2-2)->l_ch=='1')
				ud = '0';
			ls_util_send_phone(phTTS,ud=='2'||ud=='3' ? US_Z : US_S);
		}
	}
	if (tlp2 != rlp) 
	{													/* Must be "%".			*/
		ls_util_send_phone_list(phTTS,ppercent);
	}          
}

/* ******************************************************************
 *	Function Name:
 *		ls_proc_is_time	
 *
 *	Description:
 *		checks to see if the surrent word is a time
 *
 *	Arguments:
 *		PLTS_T pLts_t
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer to the word
 *
 *	Return Value:
 *		TRUE 	if ti is a time
 *		FALSE	otherwise 
 *
 *	Comments:
 *
 * ******************************************************************/
int ls_proc_is_time(PLTS_T pLts_t, LETTER *llp, LETTER *rlp)
{
	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)	/* First digit.		*/
		return (FALSE);


	if (llp->l_ch != ':') 							/* Optional digit.	*/
	{
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != ':')						/* Must be ":" now!	*/
			return (FALSE);
	}
	
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))	/* Two digits.		*/
		return (FALSE);
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))
		return (FALSE);
	if (++llp == rlp)								/* 00:00			*/
	{
		return (TRUE);
	}

	if (llp->l_ch == ':')
	{												/* 00:00:00			*/
		if (++llp==rlp || !IS_DIGIT(llp->l_ch))
			return (FALSE);
		if (++llp==rlp || !IS_DIGIT(llp->l_ch))
			return (FALSE);
		++llp;
	}
	if (llp!=rlp && llp->l_ch==pLts_t->fchar)
	{	/* Fractional digits.	*/
		if (++llp==rlp || !IS_DIGIT(llp->l_ch))
			return (FALSE);
		while (++llp!=rlp && IS_DIGIT(llp->l_ch));
	}

	return (TRUE);				/* Looks good!		*/
}


/* ******************************************************************
 *	Function Name:
 *		ls_proc_is_am_pm	
 *
 *	Description:
 *		checks to see if this word is am or pm
 *
 *	Arguments:
 *		LETTER *llp	The left bounding pointer to the word
 *		LETTER *rlp The right bounding pointer to the word
 *
 *	Return Value:
 *		TRUE	if the word is am or pm
 *		FALSE	otherwise
 *
 *	Comments:
 *
 * *****************************************************************/
int ls_proc_is_am_pm(LETTER *llp, LETTER *rlp)
{
	if (llp->l_ch!='a' && llp->l_ch!='A'
	&&  llp->l_ch!='p' && llp->l_ch!='P')
		return (FALSE);
	++llp;
	if (llp->l_ch!='m' && llp->l_ch!='M')
		return (FALSE);
	++llp;
	if (llp != rlp)
		return (FALSE);
	return (TRUE);
}

/* ******************************************************************
 *	Function Name:
 *		ls_proc_do_time
 *
 *	Description:
 *		This function sends the phonemes for the time given in the word
 *
 *	Arguments:
 *		LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *		LETTER			*llp	The left bounding pointer to the word
 *		LETTER			*rlp	The right bounding pointer to the word
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 * ******************************************************************/
void ls_proc_do_time(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
/*  LETTER	*llp; */
/*  LETTER	*rlp; */
{
	//int flag= 0;
	
	if ((llp+1)->l_ch == ':')
	{		/* Initial 1 digit.	*/

		ls_util_send_phone_list(phTTS,punits[llp->l_ch-'0']);
		llp += 2;
	}
	else
	{				/* Initial 2 digit.	*/
		ls_proc_do_2_digits(phTTS,llp);
		llp += 3;
	}
	ls_util_send_phone(phTTS,VPSTART);			/* Middle.		*/
	if ( !( llp->l_ch == '0' && (llp+1)->l_ch == '0'))
		ls_proc_do_2_digits(phTTS,llp);
	llp += 2;

	if (llp!=rlp && llp->l_ch==':')
	{	/* End.			*/
		ls_util_send_phone(phTTS,VPSTART);
		ls_proc_do_2_digits(phTTS,llp+1);
		llp += 3;
	}
    
	if (llp != rlp)
	{			/* Final fractions.	*/
		if(llp->l_ch  == '.')
		{
			ls_util_send_phone(phTTS,WBOUND);
			ls_util_send_phone_list(phTTS,ppoint);
			while (++llp != rlp)
			{
				ls_util_send_phone(phTTS,WBOUND);
				ls_util_send_phone_list(phTTS,punits[llp->l_ch-'0']);
			}
		}
		else
		{
			ls_spel_spell(phTTS,llp,rlp);
		}
	}
}
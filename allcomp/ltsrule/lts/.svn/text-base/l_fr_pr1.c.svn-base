/*
 ***********************************************************************
 *                                                                       
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 *    File Name:        l_fr_pr1.c
 *    Author:                                    
 *    Creation Date:                                              
 *                                                                             
 *    Functionality:                                                           
 * 	  Heuristic output routines
 * 	  used by letter to sound to speak
 *    numbers, part numbers, and other more
 *    complex items.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who  	Date		    Description                    
 * ---	---		------------	---------------------------------------
 * 001	cab		09/19/2000		Remove strange characters  from file
 *								Fix copyright info. 
 * 002	MGS		09/21/2000		Fixed Whitespace before #ifdefs and friends
 * 003	CAB		01/15/2001		Merged Michel Divay changes to French
 * 004	CAB		02/14/2001		Michel modified for NO et for last two digits
 * 005  CAB		03/21/2001		Commented out section as per michel
 * 006	CAB		04/29/2002		Removed warnings by typecast
 * 007	CAB		05/21/2002		Moved variables to ls_cons.h
 */

#include "ls_def.h"

//extern unsigned char premier[];
#define dbgls1 0

/* ******************************************************************
 *      Function Name: ls_proc_do_sign()      
 *
 *  	Description: Speak a "sign" like character, followed
 * 		by a word boundry. The "-" is pronounced "minus"
 * 		without using the dictionary, just in case some future
 * 		edit decides that it should be "dash". All the others
 * 		are just handed to the dictionary code.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				   int sign
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_sign(LPTTS_HANDLE_T phTTS, int sign)
{
#ifdef NEVER_FRENCH
	LETTER	lbuf[2];
#endif	// NEVER_FRENCH

	if (sign == '-')
	{
		/* Special case.	*/
		ls_util_send_phone_list(phTTS,pminus);
		ls_util_send_phone(phTTS,WBOUND);
	}
#ifdef NEVER_FRENCH
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
				lbuf[0].l_ip = NULL;
				lbuf[1].l_ch = sign;
				lbuf[1].l_ip = NULL;

                if (ls_util_lookup(phTTS,&lbuf[0], &lbuf[2], FIRST) == MISS)
					ls_util_send_phone(phTTS,F_E);
				ls_util_send_phone(phTTS,WBOUND);
			}
		}
	}
#endif 	// NEVER_FRENCH

}

/*
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
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER *llp
 *					LETTER *rlp
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_part_number(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	LETTER *blp;
	int	speed;

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
#endif	// FAA
		} 
		else
		{ 
			if (blp->l_ch>='0' && blp->l_ch<='9') 
			{
				while (llp!=rlp && llp->l_ch>='0' && llp->l_ch<='9')
					++llp;
				ls_proc_do_number (phTTS, blp, llp, FALSE);
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
					speed = ls_spel_spell_speed(blp, llp);
					ls_spel_spell(phTTS,blp, llp);
					if (speed == FAST)
						ls_util_send_phone(phTTS,WBOUND);
					else
						ls_util_send_phone(phTTS,COMMA);
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
	if (c=='-' || c=='/' || (c>='0' && c<='9'))
		return (FALSE);
	return (TRUE);
}
 
/* *****************************************************************
 *      Function Name:       
 *
 *  	Description: 0X	spell.
 * 					 1X	speak X (as a "teen", "10" is a "teen").
 * 					 X0	speak X (as tens).
 * 					 XY	speak X (as tens), speak Y (as units).
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER *lp
 *					FLAG sp
 *					FLAG masc
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/ 
void ls_proc_do_2_digits(LPTTS_HANDLE_T phTTS, LETTER *lp, FLAG sp, FLAG masc)
{
#ifdef DEBG
    if (dbgls1) {
		printf ("ls2.c do2digits entrée %c %c\n",lp->l_ch,(lp+1)->l_ch);
    }
#endif	// DEBG
	
	if (lp->l_ch == '0' && sp==TRUE) {
		ls_spel_spell (phTTS, lp, lp+2);
		
	} else {
		if (lp->l_ch=='1') {
			ls_util_send_phone_list (phTTS, pteens[(lp+1)->l_ch-'0']); /* 12, 18 */
		} else {
			
			if (lp->l_ch == '7') { /* 71 */
				ls_util_send_phone_list (phTTS, p60);
				if ((lp+1)->l_ch=='1') {
					ls_util_send_phone_list (phTTS, pand); /* 71 : soixante_et_ */
				} else {
					ls_util_send_phone (phTTS, WBOUND);
				}
				ls_util_send_phone_list (phTTS, pteens[(lp+1)->l_ch-'0']);  /* onze */
				
			} else if (lp->l_ch == '9') {
				ls_util_send_phone_list  (phTTS, p80);
				ls_util_send_phone (phTTS, WBOUND);
				ls_util_send_phone_list  (phTTS, pteens[(lp+1)->l_ch-'0']); /* 94 */
				
			} else {
				if (lp->l_ch!='0') 
					ls_util_send_phone_list (phTTS, ptens[lp->l_ch-'0']); /* 22 57 pas 05 */
				if ( (lp+1)->l_ch=='1' && lp->l_ch>='2' && lp->l_ch<='6') {
					ls_util_send_phone_list (phTTS, pand); /* 21, 31, 41, 51, 61 not 81 */
				}
				if ((lp+1)->l_ch != '0') {
					ls_util_send_phone (phTTS, WBOUND);
					if ( (lp+1)->l_ch == '1' && !masc) {
						ls_util_send_phone_list (phTTS, une);
					} else {
						ls_util_send_phone_list (phTTS, punits[(lp+1)->l_ch-'0']);   /* 2 of 82 */
					}
				}
			}
		}
		
		//    sendindex (lp, lp+2);
	}
	
#ifdef DEBG
    if (dbgls1) printf ("ls2.c do2digits sortie\n");
#endif	// DEBG
}

/* ******************************************************************
 *      Function Name: ls_proc_do_3_digits()      
 *
 *  	Description: 0XX	spell.
 * 					 X00	speak X, "hundred".
 * 					 XYY	speak X, speak YY.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER *lp
 *					FLAG sp
 *					FLAG masc
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_3_digits(LPTTS_HANDLE_T phTTS, LETTER *lp,  FLAG sp, FLAG masc)
{
  if (lp->l_ch == '0' && sp==TRUE) 
  {  /* 067 */
    ls_spel_spell (phTTS, lp, lp+3);
  } 
  else 
  {
    if ( lp->l_ch!='0' && lp->l_ch!='1' ) 
	{      /* 3..  7..; not : 1.. */
      ls_util_send_phone_list(phTTS, punits [lp->l_ch-'0']);
      ls_util_send_phone (phTTS, WBOUND);
    }
    if (lp->l_ch!='0') 
	{ /* 1.. 3..; not 0.. */
      ls_util_send_phone_list (phTTS, phundred); 
	  ls_util_send_phone (phTTS, WBOUND);
    }
//    sendindex (lp,lp+1);
    if ( (lp+1)->l_ch=='0' && (lp+2)->l_ch=='0') 
	{ /* 100, 300 */
//      sendindex (lp+1, lp+3);
    } else {
      ls_proc_do_2_digits (phTTS, lp+1, FALSE, masc);
    }
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
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER *lp
 *					FLAG sp
 *					FLAG masc
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_4_digits(LPTTS_HANDLE_T phTTS, LETTER *lp, FLAG sp, FLAG masc)
{

  if (lp->l_ch=='0' && sp==TRUE) 
  { /* 0234 */
    ls_spel_spell (phTTS, lp, lp+4);
  } else 
  {
    if ( lp->l_ch!='0' && lp->l_ch!='1' ) {
      ls_util_send_phone_list  (phTTS, punits [lp->l_ch-'0']);
      ls_util_send_phone (phTTS, WBOUND);
    }
//    sendindex (lp, lp+1);
    if (lp->l_ch!='0') {
      ls_util_send_phone_list (phTTS, pthousand);
      ls_util_send_phone (phTTS, WBOUND);
    }
    ls_proc_do_3_digits (phTTS, lp+1, FALSE, masc);
  }
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
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   unsigned char buf[3] 
 *				   int oflag
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * ******************************************************************/
/* MGS 07/22/97 BATS #412 changed buf to unsigned */
void ls_proc_do_digit_group(LPTTS_HANDLE_T phTTS, unsigned char buf[3], int oflag)
{
  FLAG Fin=FALSE;

  if (buf[0] != '0') {
    if (buf[0]!='1') {	/* 200, 257; pas 020, 100 */
      ls_util_send_phone_list  (phTTS, punits [buf[0]-'0']);
      ls_util_send_phone (phTTS, WBOUND);
    }
    ls_util_send_phone_list (phTTS, phundred);

    if (buf[1]=='0' && buf[2]=='0') {	/* 200 */
      if (oflag) {
		ls_util_send_phone (phTTS, F_T); 
		ls_util_send_phone_list (phTTS, ieme); /* 200e2me */
      }
      Fin=TRUE;
    } else {
      ls_util_send_phone (phTTS, WBOUND);
    }
  } /* if */

  if (!Fin) {
    if (buf[1] == '1') {
      if (buf[2]=='0' && oflag) {
	ls_util_send_phone_list (phTTS, dizieme);    /* 10ème */
      } else {
	ls_util_send_phone_list (phTTS, pteens [buf[2]-'0']);   /* 10, 12, 15, 18ème */
	if (oflag) 
		ls_util_send_phone_list (phTTS, ieme);
      }
      Fin=TRUE;

    } else if (buf[1]=='2' && buf[2]=='0' && !oflag) { /* 20 */
      ls_util_send_phone_list (phTTS, p20);
      Fin=TRUE;
    } else if (buf[1] == '7') {
      ls_util_send_phone_list (phTTS, p60);
      if (buf[2]=='1') {
	ls_util_send_phone_list (phTTS, pand);
      } else {
	ls_util_send_phone (phTTS, WBOUND);
      }

      ls_util_send_phone_list (phTTS, pteens [buf[2]-'0']);
      if (oflag) ls_util_send_phone_list (phTTS, ieme);
      Fin=TRUE;
    } else if (buf[1] == '9') {
      ls_util_send_phone_list (phTTS, p80);
      ls_util_send_phone (phTTS, WBOUND);
      ls_util_send_phone_list (phTTS, pteens [buf[2]-'0']);
      if (oflag) ls_util_send_phone_list (phTTS, ieme);
      Fin=TRUE;
    } /* else if */
  } /* Fin */

  if (!Fin) {

    if (buf[1] != '0') {  /* 123; not 103 */
      ls_util_send_phone_list (phTTS, ptens [buf[1]-'0']);
      if (buf[2] == '0') {
	if (oflag) ls_util_send_phone_list (phTTS, ieme); /* 30ème */
	Fin=TRUE;
      } else if ( buf[1]>='2' && buf[1]<='6' && buf[2]=='1') {
	ls_util_send_phone_list (phTTS, pand); /* 31 */
      } else {
	ls_util_send_phone (phTTS, WBOUND);
      }
    }
  }

  if (!Fin) {
    if (oflag) {
      ls_util_send_phone_list (phTTS, pordin [buf[2]-'0']);
    } else {
      ls_util_send_phone_list (phTTS, punits [buf[2]-'0']);
    }
  }

}
 
/* *****************************************************************
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
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   LETTER *llp 
 *				   LETTER *rlp 
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
	/* This handles integer parts like "1/2".			*/
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD)) 
	{
		ls_spel_spell(phTTS,tlp1, rlp);
		return (FALSE);
	}
	pflag = FALSE;				/* Not plural.			*/
	sflag = FALSE;				/* No user "," seen.	*/
	ndig  = 0;
#ifdef LS2DEBUG
	printf("In ls_proc_do_number\n");

#endif// LS2DEBUG
	while (tlp1!=rlp && (IS_DIGIT(tlp1->l_ch) || tlp1->l_ch==pLts_t->schar) &&
		/* MGS 07/22/97 BATS #412 */
		(tlp1->l_ch != 0xBC &&  tlp1->l_ch !=0xBD) ) 
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
				if (n!=8 || buf[8]!='1')	/* Watch for "1".	*/
					pflag = TRUE;
				while (n != 0)
					buf[--n] = '0';
#ifdef FRENCH_ONLY_GOES_UP_TO_MILLIONS
				if (ls_proc_non_zero(&buf[0], 3) != FALSE) 
				{	/* Quadrillions		*/
					ls_proc_do_digit_group(phTTS,&buf[0], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,pquadrillion);
					if (ls_proc_non_zero(&buf[3], 15) == FALSE) 
					{

						if (oflag != FALSE)
						{
							ls_util_send_phone_list(phTTS, ieme);
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
							ls_util_send_phone_list(phTTS,ieme);
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
							ls_util_send_phone_list(phTTS,ieme);
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
#endif 	// FRENCH_ONLY_GOES_UP_TO_MILLIONS
				if (ls_proc_non_zero(&buf[9], 3) != FALSE) 
				{	/* Millions		*/
					ls_proc_do_digit_group(phTTS,&buf[9], FALSE);
					ls_util_send_phone(phTTS,WBOUND);
					ls_util_send_phone_list(phTTS,pmillion);
					if (ls_proc_non_zero(&buf[12], 6) == FALSE) 
					{

						if (oflag != FALSE)
						{
							ls_util_send_phone_list(phTTS,ieme);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[13], 5) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					else 
					//if (ls_proc_non_zero(&buf[12], 1) == FALSE) // Michel
					//	ls_util_send_phone_list(phTTS,pand);  // Michel
					//else
						//ls_util_send_phone(phTTS,COMMA); // Michel
						ls_util_send_phone(phTTS,WBOUND);
				}

				if (ls_proc_non_zero(&buf[12], 3) != FALSE) 
				{	/* Thousands		*/
					if ( ls_proc_non_zero(&buf[12],2) || buf[14]!='1' )
					{
						ls_proc_do_digit_group(phTTS,&buf[12], FALSE);
						ls_util_send_phone(phTTS,WBOUND);
					}
					ls_util_send_phone_list(phTTS,pthousand);
					if (ls_proc_non_zero(&buf[15], 3) == FALSE) 
					{
						if (oflag != FALSE)
						{
							ls_util_send_phone_list(phTTS,ieme);
						}
						goto out;
					}
					if (ls_proc_non_zero(&buf[16], 2) == FALSE)
						ls_util_send_phone(phTTS,VPSTART);
					//else if (ls_proc_non_zero(&buf[15], 1) == FALSE) //Michel
					//	ls_util_send_phone_list(phTTS,pand); //Michel
					else
						//ls_util_send_phone(phTTS,COMMA); //Michel
						ls_util_send_phone(phTTS, WBOUND);
				}
		
				ls_proc_do_digit_group(phTTS,&buf[15], oflag);	/* Units		*/

			out:	;
			}
		}
	}
	/* This code handles integer parts like "1 1/2".		*/
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD)) 
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
 *		ls_proc_is_date()
 *
 *	Description:       
 *		this function checks weather the number is ir isn't a date
 *
 *	Arguments:
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp     The right bounding pointer to the word
 *
 *	Return Value:
 *		TRUE	if the word is a date
 *		FALSE	otherwise
 *
 *	Comments:
 *
 * *****************************************************************/
int ls_proc_is_date(LETTER *llp, LETTER *rlp)
{	// CAB Removed warnings changing to unsigned
	unsigned char *cp;
	int	i;
	short buf[3];

	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)	/* First digit.		*/
		return (FALSE);
	if (llp->l_ch != '-') 
	{												/* Optional digit.	*/
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '-')						/* Must be "-" now!	*/
			return (FALSE);
	}
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))	/* Three alphas.	*/
		return (FALSE);
	buf[0] = llp->l_ch;
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))
		return (FALSE);
	buf[1] = llp->l_ch;
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))
		return (FALSE);
	buf[2] = llp->l_ch;
	for (i=0; i<12; ++i) 
	{	// CAB Removed warnings by typecast
		/* Validate */
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
 *		ls_proc_do_date()
 *
 *	Description:       
 *		this function sends the correct phonemes for a date
 *
 *	Arguments:                              
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp     The right bounding pointer to the word
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
void ls_proc_do_date(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp)
{
  LETTER *lp1;
  // CAB Removed warnings by changing to unsigned
  unsigned char   *cp;
  FLAG   Trouve;
  int    i;

  lp1 = llp;
  while (lp1->l_ch != '-') lp1++;

  i      = 0;
  Trouve = FALSE;
  while (i<12 && !Trouve)
  {
    // CAB Removed warnings by typecast
	cp = (unsigned char *)months[i];
    if ( (lp1+1)->l_ch == cp[0] && (lp1+2)->l_ch == cp[1]
      && (lp1+3)->l_ch == cp[2])
	{
      Trouve = TRUE;
    }
	else
	{
      i++;
    }
  }

  if ( lp1 != llp+1 && llp->l_ch=='0' && (llp+1)->l_ch=='1'
    || lp1==llp+1 && llp->l_ch=='1' )
  {
    ls_util_send_phone_list(phTTS, premier);
  }
  else if (lp1!=llp+1 && llp->l_ch=='0')
  {
    ls_proc_do_number(phTTS, llp+1, lp1, FALSE); /* 03- */
  }
  else
  {
    ls_proc_do_number(phTTS, llp, lp1, FALSE); /* 3-  ou   23- */
  }

  lp1 += 4;
  ls_util_send_phone(phTTS, WBOUND);
  ls_util_send_phone_list   (phTTS, pmonths[i]);  /* avril */
  ls_util_send_phone(phTTS, WBOUND);
//  sendindex  (llp, lp1);

  if (lp1 != rlp)
  {   /* 24-avr */
	ls_util_send_phone(phTTS, COMMA);
//    sendindex  (lp1, lp1+1);
    if  (lp1+3 == rlp)
	{ /* 87 */
#ifdef DONT_ASSUME_THE_CENTURY
	  ls_util_send_phone_list(phTTS, pteens[9]);
      ls_util_send_phone(phTTS, WBOUND);
      ls_util_send_phone_list(phTTS, phundred);
      ls_util_send_phone( phTTS, WBOUND);
#endif	// DONT_ASSUME_THE_CENTURY
      ls_proc_do_2_digits(phTTS, lp1+1, FALSE, TRUE);
    }
	else
	{
      ls_proc_do_4_digits(phTTS, lp1+1, FALSE, TRUE); /* 1987 */
    }
  }
}

/* *****************************************************************
 *	Function Name:
 *		ls_proc_is_frac()
 *
 *	Description:       
 *		this function determines if the word is a fraction
 *
 *	Arguments:
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp     The right bounding pointer to the word
 *
 *	Return Value:
 *		TRUE	if the word is a fraction
 *		FALSE	otherwise
 *
 *	Comments:
 *
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
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *		LETTER *llp				The left bounding pointer to the word
 *		LETTER *rlp				The right bounding pointer to the word
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
void ls_proc_do_frac(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
  LETTER *tlp1;
  LETTER *tlp2;

  tlp1 = llp;
  while (tlp1->l_ch != '/') tlp1++;
  ls_proc_do_number (phTTS, llp, tlp1, FALSE);  /* 20 in 20/3 */
  ls_util_send_phone (phTTS, WBOUND);
//  sendindex(tlp1, tlp1+1); /* for / */

  tlp1++;
  tlp2 = tlp1;
  while (tlp2!=rlp && tlp2->l_ch!='%') tlp2++;

  if (tlp1+1==tlp2 && tlp1->l_ch>='2' && tlp1->l_ch<='4') 
  {
    switch (tlp1->l_ch) 
	{
      case '2' : ls_util_send_phone_list (phTTS, phalf);  break;  /* 15/2 */
      case '3' : ls_util_send_phone_list (phTTS, ptiers); break;
      case '4' : ls_util_send_phone_list (phTTS, pquart); break;
    }
//    sendindex (tlp1, tlp2);
  } else 
  {
    ls_proc_do_number  (phTTS, tlp1, tlp2, TRUE); /* 15/45; TRUE for ordinal */
  }

  if (tlp2 != rlp) 
  {	/* Only "%" allowed in isfrac */
    ls_util_send_phone_list  (phTTS, ppercent);
//    sendindex (tlp2, rlp);
  }

} /* dofrac */

/* *****************************************************************
 *	Function Name:
 *		ls_proc_is_time()
 *
 *	Description:       
 *		checks to see if the surrent word is a time
 *
 *	Arguments:                                     
 *		PLTS_T pLts_t
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp     The right bounding pointer to the word
 *
 *	Return Value:                                             
 *		TRUE 	if ti is a time
 *		FALSE	otherwise 
 *
 *	Comments:
 *
 * *****************************************************************/
int ls_proc_is_time(PLTS_T pLts_t, LETTER *llp, LETTER *rlp)
{
	FLAG Fin  = FALSE;
	FLAG Resu = FALSE;
	
#ifdef DEBG
    if (dbgls1) {
		//printf ("ls2.c istime entr‚e : "); Ecrit (llp, rlp);
    }
#endif	// DEBG
	
	if (!IS_DIGIT(llp->l_ch) || llp+1==rlp) 
	{
		Fin=TRUE;
	} 
	else 
	{
		llp++;
		if (llp->l_ch != 'h') 
		{  /* 2 of 12h15 */
			if ( !IS_DIGIT(llp->l_ch) || llp+1==rlp) 
			{ /* 12 */
				Fin = TRUE;
			} 
			else 
			{
				llp++;
				if (llp->l_ch != 'h') 
					Fin=TRUE;
			}
		} /* if */
		
		if (!Fin) 
		{
			llp++;
			if (llp==rlp) 
			{  /* 12h */
				Fin=TRUE;
				Resu=TRUE;
			} 
			else if (!IS_DIGIT(llp->l_ch)) 
			{
				Fin=TRUE;
			} 
			else if (++llp==rlp || !IS_DIGIT(llp->l_ch) ) 
			{
				Fin=TRUE; /* 12h1 -> false */
			} 
			else if (++llp==rlp) 
			{ /* 12h15 */
				Fin=TRUE;
				Resu=TRUE;
			}
		} /* if */
		
	} /* if */
	
#ifdef DEBG
    if (dbgls1) {
		printf ("l_fr_pr1.c ls_proc_is_time sortie Resu=%d\n", Resu);
    }
#endif	// DEBG
	
	return (Resu);

} /* ls_proc_is_time */


/* ******************************************************************
 *	Function Name:
 *		ls_proc_is_am_pm()
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
 *		ls_proc_do_time()
 *
 *	Description:       
 *		this function sends the phonemes for the time given in the word
 *
 *	Arguments:
 *		LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *		LETTER *llp				The left bounding pointer to the word
 *		LETTER *rlp				The right bounding pointer to the word
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 * *****************************************************************/
void ls_proc_do_time(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
/*  LETTER	*llp; */
/*  LETTER	*rlp; */
{
  if ( (llp+1)->l_ch == 'h') {  /* 1h15   3h30, a digit before h */
    ls_util_send_phone_list(phTTS, punitsl [llp->l_ch-'0']);  /* punitl for linking */
//    sendindex (llp, llp+2);
    llp += 2;
  } else {  /* 12h30 */
    ls_proc_do_2_digits (phTTS, llp, FALSE, FALSE);  /* 22 in 22h15; pb linking not done */
//    sendindex (llp+2, llp+3);
    llp += 3;
  }

  ls_util_send_phone (phTTS, WBOUND);
  ls_util_send_phone_list  (phTTS, heure);
  ls_util_send_phone (phTTS, WBOUND);

  if (llp!=rlp)
  {
    if ( llp->l_ch=='0' && (llp+1)->l_ch=='1' )
	{
      ls_util_send_phone_list (phTTS, p0); 
	  ls_util_send_phone (phTTS, WBOUND); 
	  ls_util_send_phone_list (phTTS, une); /* 01 in 12h01 */
    } 
	else
	{
      ls_proc_do_2_digits (phTTS, llp, TRUE, FALSE); /* plural and feminine; 15 in 12h15 */
    }
  }
}
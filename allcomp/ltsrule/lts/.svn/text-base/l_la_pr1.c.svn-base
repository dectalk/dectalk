/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonic Corporation. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *    File Name:	l_la_pr1.c
 *    Author:       JDB
 *    Creation Date:06/03/96
 *
 *    Functionality:    
 * 	  Code taken from "sls2.c"
 * 	  Heuristic output routines
 * 	  used by letter to sound to speak
 * 	  numbers, part numbers, and other more
 *    complex items. Simple stuff tends to be
 * 	  in the "ls1.c" file.
 *
 ***********************************************************************
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 00 	??		??		 		see remarks in sls1.c of V4.2C
 * 001	GL		10/01/1996		restore the code to support dd/mmm/yy format.
 * 002	GL		10/02/1996		fix the xxx,000,000 problem.
 * 003	GL		11/04/1996		fix the fraction and decimal problem.
 * 004	GL		11/15/1996		add un_flag as the argument for do_group()
 *                              pass TRUE if want "1 --> uno"
 * 005	GL		02/15/1997		add pulse for 2-digit group, also use "un" in 2-digit
 *								for "1", use "un" while doing currency
 * 008	MGS		07/22/1997		BATS#412  fixed ½ and ¼ problem
 * 009	EAB		01/29/1997		Added notes for bats 266
 * 010  CJL		02/06/1998		Fixed broken ifdef, removed LIKE_BUG
 * 011	MFG		06/17/1998		Copied from l_sp_pr1.c
 * 012  EAB		09/29/1998		Rules were "american" modified with Juan's help
 * 013  EAB		10/06/1998		Turn off number debugging
 * 014  GL		11/03/1998		for BATS783 fix p21 problem.  Can't just say p21 for
 *                              all two digits number
 * 015	MGS		04/13/2000		Changes for integrated phoneme set 
 * 016	NAL		05/24/2000		Fuction def change, warning removal
 * 017 	CAB		10/18/2000		Changed copyright info
 * 018	MGS		01/08/2000		Removed l_ip from LETTER structure
 * 019	CAB		04/29/2002		Removed warnings by typecast
 */
#include "ls_def.h"
                    
#define CARDINAL        FALSE
#define ORDINAL         TRUE

#if     NBR_DEBUG
#define NRULE(why, llp, rlp)                                            \
	if (DEBUG(NBR_DEBUG))                                           \
	    dumpletters(why, llp, rlp);
#else
#define NRULE(why, llp, rlp)
#define dumpitem(why, what)
#endif

//#define NUMDEBUG 1 *//* Uncomment for number rule debug.*/



/* ******************************************************************
 *      Function Name:  ls_proc_do_sign()     
 *
 *  	Description: Speak a "sign" like character, followed
 * 		by a word boundry. The "-" is pronounced "minus"
 * 		without using the dictionary, just in case some future
 * 		edit decides that it should be "dash". All the others
 * 		are just handed to the dictionary code.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					int sign 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_sign(LPTTS_HANDLE_T phTTS, int sign)
{
	LETTER  lbuf[2];

	if (sign == '-') 
	{   
	    /* Special case.        */
		ls_util_send_phone_list(phTTS, pminus);
		ls_util_send_phone(phTTS, WBOUND);
	} 
	else if (sign != 0) 
	{
	     /* Dictionary case.     */
		lbuf[0].l_ch = ' ';
//		lbuf[0].l_ip = NULL;
		lbuf[1].l_ch = sign;
//		lbuf[1].l_ip = NULL;
		NRULE("sign lookup", &lbuf[0], &lbuf[2]);
		if (ls_dict_blook(phTTS, &lbuf[0], &lbuf[2], FIRST) == MISS)
		{
			ls_util_send_phone(phTTS, LA_A);         /* Eh?                  */
		}
		ls_util_send_phone(phTTS, WBOUND);
	}
}

/* ******************************************************************
 *      Function Name: ls_proc_do_part_number()      
 *
 *  	Description: Speak a part number, and any
 * 		index markers that are imbedded in the
 * 		string of characters. The code works best if
 * 		the part number has DECtalk's standard part number
 * 		syntax, but it won't blow up if it doesn't.
 * 		I don't really like the way that the three case
 * 		arms all check if the inter-chunk WBOUND is
 * 		needed.
 *
 *      Arguments: 	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER * llp
 *					LETTER *rlp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_part_number(LPTTS_HANDLE_T phTTS, LETTER * llp, LETTER *rlp)
{
	 LETTER *blp;
	 int    nd;
	 int    speed;
#ifdef NUMDEBUG
	printf("In dopartnumber() \n");
#endif

	while (llp != rlp) 
	{
		blp = llp;
		++llp;
		if (blp->l_ch=='-' || blp->l_ch=='/') 
		{
			ls_spel_spell(phTTS, blp, llp);
			if (llp != rlp)
				ls_util_send_phone(phTTS, WBOUND);
		} 
		else if (blp->l_ch>='0' && blp->l_ch<='9') 
		{
			while (llp!=rlp && llp->l_ch>='0' && llp->l_ch<='9')
				++llp;
			if ((nd = llp-blp) == 2)
				ls_proc_do_2_digits(phTTS, blp);
			else if (nd == 3)
				ls_proc_do_3_digits(phTTS, blp);
			else if (nd == 4)
				ls_proc_do_4_digits(phTTS, blp);
			else                            
				ls_spel_spell(phTTS, blp, llp);
			if (llp != rlp)
				ls_util_send_phone(phTTS, WBOUND);
		} 
		else 
		{
			while (llp!=rlp && ls_proc_is_a_part(llp->l_ch)!=FALSE)
				++llp;
			if (llp-blp<3 || ls_util_lookup(phTTS, blp, llp, FALSE) == MISS) 
			{
				speed = ls_spel_spell_speed(blp, llp);
				ls_spel_spell(phTTS, blp, llp);
				if (speed == FAST)
					ls_util_send_phone(phTTS, WBOUND);
				else
				{
					ls_util_send_phone(phTTS, COMMA);
				}

			} 
			else if (llp != rlp)
				ls_util_send_phone(phTTS, WBOUND);
		}
	} /* while (llp != rlp) */
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
 *      Return Value: void
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

/* ******************************************************************
 *      Function Name: ls_proc_do_2_digits()      
 *
 *  	Description: 0X   spell.
 * 					 1X   speak X (as a "teen", "10" is a "teen").
 * 					 X0   speak X (as tens).
 * 					 XY   speak X (as tens), speak Y (as units).
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, LETTER * lp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_2_digits(LPTTS_HANDLE_T phTTS, LETTER * lp)
{
//    PLTS_T pLts_t = phTTS->pLTSThreadData;
/*
ls_util_dump_llp_rlp(lp,lp+2,"2 digits is");
printf("oflag is %d\n",pLts_t->ord);
printf("pflag is %d\n",pLts_t->pflag);
*/
	switch(lp->l_ch)
	{
		case 0 :
#ifdef NUMDEBUG
	printf("In do2spell() \n");
#endif
			ls_spel_spell(phTTS, lp, lp+2);
			break;
		case '1':
#ifdef NUMDEBUG
	printf("In do2case 1() \n");
#endif
			ls_util_send_phone_list(phTTS, pteens[(lp+1)->l_ch-'0']);
			break;
		case '2' :
			if((lp+1)->l_ch == '0')
			{
				ls_util_send_phone_list(phTTS, p20only);
				break;
			}
			if ((lp+1)->l_ch == '1')
			{
				ls_util_send_phone_list(phTTS, p21);
				break;
			}
		default:
			
			ls_util_send_phone_list(phTTS, ptens[lp->l_ch-'0']);
			if ((lp+1)->l_ch != '0')
			{
				
				ls_util_send_phone(phTTS, LA_I);
				/* GL 02/15/1997  "1" say "uno" not "un" */
				/* GL 11/03/1998 BATS#783 use p1_uno[] for 1 here */
				if ((lp+1)->l_ch == '1')
					ls_util_send_phone_list(phTTS, p1_uno);
				else
					ls_util_send_phone_list(phTTS, punits[(lp+1)->l_ch-'0']);
			}
	} /* switch(lp->l_ch) */
	/* GL 02/15/1997  add pulse between 2 digits No EAB 9/4/98 */
	//_util_send_phone(phTTS, WBOUND);
}

/* ******************************************************************
 *      Function Name: ls_proc_do_3_digits()      
 *
 *  	Description: 0XX  spell.
 * 					 X00  speak X, "hundred". english comments
 * 					 XYY  speak X, speak YY.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				   LETTER * lp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_3_digits(LPTTS_HANDLE_T phTTS, LETTER * lp) // NAL warning removal
{                   
    PLTS_T pLts_t = phTTS->pLTSThreadData;
/*
ls_util_dump_llp_rlp(lp,lp+3,"3 digits is");
printf("oflag is %d\n",pLts_t->ord);
printf("pflag is %d\n",pLts_t->pflag);
*/
	if (lp->l_ch == '0')
	{
		ls_spel_spell(phTTS, lp, lp+3);
	}
	else
	{
		if(lp   ->l_ch == '7' || lp->l_ch ==  '9')
		{
			if(lp   ->l_ch == '7')
			{
				ls_util_send_phone_list(phTTS, ph7);
			}
			if(lp   ->l_ch == '9')
			{
					ls_util_send_phone_list(phTTS, ph9);
			}
			ls_util_send_phone_list(phTTS, phundred);
		}
				/* one hundred is a special case*/
		else if (lp->l_ch=='1')
		{
			if ((lp+1)->l_ch=='0' && (lp+2)->l_ch=='0')
			{
				if (pLts_t->ord == 1)
				{
					ls_util_send_phone_list(phTTS, pordonehundred);
					ls_util_send_phone(phTTS, LA_O);
					pLts_t->ord = 0;
				}
				else if (pLts_t->ord == 2)
				{
					ls_util_send_phone_list(phTTS, pordonehundred);
					ls_util_send_phone(phTTS, LA_A);
					pLts_t->ord = 0;
				}
				else
				{
					pLts_t->ord = 0;
					ls_util_send_phone_list(phTTS, ponehundred);
				}
			}
			else
			{
				pLts_t->ord = 0;
				ls_util_send_phone_list(phTTS, phundredp);
			}
		}
		else if ((lp)->l_ch == '5')
		{
			ls_util_send_phone_list(phTTS, pfivehun);
			if ((lp+1)->l_ch!='0' || (lp+2)->l_ch!='0')
				ls_proc_do_2_digits(phTTS, lp+1);
			return; //(1); // NAL warning removal
		}
		else 
		{
			ls_util_send_phone_list(phTTS, upunits[lp->l_ch-'0']);
			ls_util_send_phone(phTTS, WBOUND);
			ls_util_send_phone_list(phTTS, phundred);
		}
		if ((lp+1)->l_ch!='0' || (lp+2)->l_ch!='0')
		{
#ifdef NUMDEBUG
	printf("In do3case  0 !0 \n");
#endif

			ls_proc_do_2_digits(phTTS, lp+1);
		}
	}
}

/* ******************************************************************
 *      Function Name: ls_proc_do_4_digits()      
 *
 *  	Description: 0XXX spell.
 * 					 X000 speak X, "thousand".
 * 					 XX00 speak XX, "hundred".
 * 					 XXYY speak XX, speak YY.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER *lp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_4_digits(LPTTS_HANDLE_T phTTS, LETTER *lp) // NAL warning removal
{
//    PLTS_T pLts_t = phTTS->pLTSThreadData;
/*
ls_util_dump_llp_rlp(lp,lp+4,"4 digits is");
printf("oflag is %d\n",pLts_t->ord);
printf("pflag is %d\n",pLts_t->pflag);
*/
	if (lp->l_ch == '0')
	{
		ls_spel_spell(phTTS, lp, lp+4);
	}
	else
	{
		if ((lp+2)->l_ch=='0' && (lp+3)->l_ch=='0')
		{                                                               
			if ((lp+1)->l_ch == '0')
			{
				if (lp->l_ch != '1')
				{
					ls_util_send_phone_list(phTTS, upunits[lp->l_ch-'0']);
				}
			ls_util_send_phone(phTTS, WBOUND);
#ifdef NUMDEBUG
	printf("In docase oo & !'1' \n");
#endif
			   ls_util_send_phone_list(phTTS, pthousand);
			   return; // (1); NAL warning removal
			}
		}
		if (lp->l_ch != '1')
		{
			ls_util_send_phone_list(phTTS, upunits[lp->l_ch-'0']);
		}


		ls_util_send_phone(phTTS, WBOUND);
#ifdef NUMDEBUG
	printf("In do4case going to do3 \n");
#endif
		ls_util_send_phone_list(phTTS, pthousand);
		ls_proc_do_3_digits(phTTS, lp+1);
	}                                                                                         
}

/* ******************************************************************
 *      Function Name: ls_proc_do_number()       
 *
 *  	Description: This is a general number speaking routine.
 * 		It understands integers, fractional digits, and powers
 * 		of 10. Long integers are spoken in groups. Shorter integers
 * 		are spoken more cleverly. The "oflag" asks to have the number
 * 		spoken as an ordinal (for dates, etc.); it only works right if
 * 		the number is a small integer. Return TRUE if the number is
 * 		plural, and FALSE if it is singular. This function calls
 * 		itself recursively to speak the exponent of a floating
 * 		point number; it cannot get stuck, because of the
 * 		syntax of such numbers.
 *
 * 		Needs extension for Spanish to handle gender.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   LETTER *llp
 *				   LETTER *rlp
 *                 int oflag
 *
 *      Return Value: TRUE pural, FLASE singular 
 *
 *      Comments:
 *
 * *****************************************************************/
int ls_proc_do_number(LPTTS_HANDLE_T phTTS, LETTER *llp,LETTER * rlp,
                  	   int oflag)
{
 	LETTER *tlp1;
	LETTER *tlp2;
	int    c;
	int    n;
	int    pflag;
	int    ndig;
	int    sflag;
	/* MGS 07/22/97 BATS #412 changed buf to unsigned */
	unsigned char		buf[9];
	
	PLTS_T pLts_t = phTTS->pLTSThreadData;
/*
ls_util_dump_llp_rlp(llp,rlp,"A:NUMBER is");
printf("oflag is %d %d\n",oflag,pLts_t->ord);
printf("pflag is %d\n",pLts_t->pflag);
*/
	tlp1  = llp;
	/* This handles integer parts like "1/2".                       */
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD)) 
	{
		ls_spel_spell(phTTS, tlp1, rlp);
		return (FALSE);
	}
	pflag = FALSE;                          /* Not plural.          */
	sflag = FALSE;                          /* No user "," seen.    */
	ndig  = 0;
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
	if (ndig>9 && sflag!=FALSE) 
	{
	    /* Long, commas.        */
		tlp2 = llp;

		while (tlp2 != tlp1) 
		{
		    /* Pause where you are  */
			c = tlp2->l_ch;         		/* told to do so.       */
			++tlp2;
			if (c == pLts_t->schar)
				ls_util_send_phone(phTTS, COMMA);
			else 
			{

				ls_util_send_phone_list(phTTS, upunits[c-'0']);
				if (tlp2!=tlp1 && tlp2->l_ch!=pLts_t->schar)
					ls_util_send_phone(phTTS, WBOUND);
			}
		}
		pflag = TRUE;
	}
	else if (ndig>9 || (ndig>1 && llp->l_ch=='0')) 
	{
		tlp2 = llp;
		while (ndig >= 6) 
		{
		    /* At least 1 group.    */
			n = 0;

			while (n < 3) 
			{
				if ((c=tlp2->l_ch) != pLts_t->schar) 
				{
					if (n != 0)
						ls_util_send_phone(phTTS, WBOUND);
					++n;

					ls_util_send_phone_list(phTTS, upunits[c-'0']);
				}
				++tlp2;
			}
			ls_util_send_phone(phTTS, COMMA);
			ndig -= 3;
		}
		n = 0;                          /* Last group.          */
		while (tlp2 != tlp1) 
		{
			if ((c=tlp2->l_ch) != pLts_t->schar) 
			{
				if (n != 0)
				{
					ls_util_send_phone(phTTS, WBOUND);
				}
				++n;
				ls_util_send_phone_list(phTTS, punits[c-'0']);
			}
			++tlp2;
		}
		pflag = TRUE;                   /* Long => plural.      */
	} 
	else if (ndig != 0) 
	{
		n = 9;                          /* Right justify        */
		tlp2 = tlp1;
		while (tlp2 != llp) 
		{
			c = (--tlp2)->l_ch;
			if (c != pLts_t->schar)
				buf[--n] = c;
		}
		if (n!=8 || buf[8]!='1')        /* Watch for "1".       */
			pflag = TRUE;
		while (n != 0)
			buf[--n] = '0';

		if (ls_proc_non_zero(&buf[0], 3) != FALSE) /* Millions                */
		{
			
			if (buf[0] != '0' || buf[1] != '0' || buf[2] != '1')
			ls_proc_do_group(phTTS, &buf[0], FALSE, pflag, FALSE);
#ifdef NUMDEBUG
			printf("AT P1a  ");
#endif
			if (pLts_t->ord == 1 && oflag == 1)
			{
					ls_util_send_phone_list(phTTS, pordonemillion);
					ls_util_send_phone(phTTS, LA_O);
			}
			else if (pLts_t->ord == 2 && oflag == 1)
			{
				ls_util_send_phone_list(phTTS, pordonemillion);
				ls_util_send_phone(phTTS, LA_A);
			}
			else
 			{
				if(buf[2] == '1')
				{
					ls_util_send_phone_list(phTTS, p1_un);
					ls_util_send_phone_list(phTTS, pmillion);	
				}
				else
				{
					ls_util_send_phone_list(phTTS, pmilliones);
				}
			}


			if (ls_proc_non_zero(&buf[3], 6) == FALSE) 
			{
				pLts_t->ord = 0;
				goto out;
			}

		}


		if (ls_proc_non_zero(&buf[3], 3) != FALSE)    /* Thousands            */
		{

			if (buf[3] != '0' || buf[4] != '0' || buf[5] != '1')
			ls_proc_do_group(phTTS, &buf[3], FALSE, pflag, FALSE);

			if (pLts_t->ord == 1 && oflag == 1)
			{
					ls_util_send_phone_list(phTTS, pordthousand);
					ls_util_send_phone(phTTS, LA_O);
			}
			else if (pLts_t->ord == 2 && oflag == 1)
			{
					ls_util_send_phone_list(phTTS, pordthousand);
					ls_util_send_phone(phTTS, LA_A);
			}
			else
			{
					ls_util_send_phone_list(phTTS, pthousand);
			}

			 /*             }*/
			if (ls_proc_non_zero(&buf[6], 3) == FALSE)
			{        
				pLts_t->ord = 0;
				goto out;
			}

		}
			     
			     
#ifdef NUMDEBUG
				printf("AT P3 ");
#endif
		ls_proc_do_group(phTTS, &buf[6], oflag, pflag, TRUE);        /* Units                */
    /* Breaks out of else if (ndig != 0) */                                
	out:    ;

	} /* else if (ndig != 0) */

	
	/* This code handles integer parts like "1 1/2". */
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD)) 
	{
		ls_util_send_phone_list(phTTS, pand);
		ls_spel_spell(phTTS, tlp1, tlp1+1);
		++tlp1;
		pflag = TRUE;                   		/* Always plural.       */
	}
	if (tlp1!=rlp && tlp1->l_ch==pLts_t->fchar) 
	{
		/* Fraction digits.     */
		if (llp != tlp1)
			ls_util_send_phone(phTTS, WBOUND);
		/* GL 11/07/1996, use pcomma for Spanish.*/
		/* ls_util_send_phone_list(phTTS, ppoint); */
		ls_util_send_phone_list(phTTS, pcomma);
		tlp2 = tlp1;
		++tlp1;
		while (tlp1!=rlp && tlp1->l_ch!='e') 
		{
			c = tlp1->l_ch;
			if (c != pLts_t->schar) 
			{
				ls_util_send_phone(phTTS, WBOUND);
				ls_util_send_phone_list(phTTS, punits[c-'0']);
			}
			++tlp1;
		}

		pflag = TRUE;                   		/* 1.01 is plural.      */
	}
	if (tlp1 != rlp) 
	{ 
	    /* Must be an "e".      */
		ls_util_send_phone_list(phTTS, ptt2tp); /* " " on end.         */
		tlp2 = tlp1;
		++tlp1;                         		/* Skip "e"             */
		if (tlp1 != rlp) 
		{              							/* Handle signs.        */
			c = tlp1->l_ch;
			if (c=='-' || c=='+') 
			{
				ls_proc_do_sign(phTTS, c);
				++tlp1;
			}
		}

		ls_proc_do_number(phTTS, tlp1, rlp, FALSE); /* Cannot recur on "e". */
		pflag = TRUE;                   			/* 1E01 is plural.      */
	}
	return (pflag);
}

/* ******************************************************************
 *      Function Name: ls_proc_do_group()      
 *
 *  	Description: Speak a three digit group.
 * 					 The number is in the supplied array of three
 * 					 digits, with leading zeros. The caller must arrange
 * 					 to put out the required index markers. This may be a
 * 					 "bug", because the index marks will happen at the
 * 					 end of the group, not as the digits get
 * 					 spoken.
 *
 *      Arguments: 	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				   	char buf[3] 
 *					int oflag				ordianl number or not
 *                  int pflag				pural or not
 *                  int un_flag				TRUE for "1 -- uno", FALE for "1 -- un"
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
/* MGS 07/22/97 BATS #412 changed buf to unsigned */
void ls_proc_do_group(LPTTS_HANDLE_T phTTS, unsigned char buf[3], int oflag, int pflag, int un_flag)
{
//   int i; // NAL warning removal
   PLTS_T pLts_t = phTTS->pLTSThreadData;                                 
/*                                    
printf("B:NUMBER is -%c-%c-%c-",buf[0],buf[1],buf[2]);
printf("oflag is %d %d\n",oflag,pLts_t->ord);
printf("pflag is %d %d\n",pflag,pLts_t->pflag);
*/
	/* 1xx is a special case and must be handled first*/
#ifdef NUMDEBUG
	printf("In dogroup() buf0=%c buf1=%c buf2=%c buf3=%c ord=%d\n",buf[0],buf[1],buf[2],buf[3],oflag);
#endif                       
	if (buf[0] != '0' )
	{
		switch(buf[0])
		{
				
			case '1' :
#ifdef NUMDEBUG
	printf("In dogroup case 1xx \n");
	printf("case1 adn \n");         
#endif                  
				if (pLts_t->ord == 1 && oflag == 1)
				{
					ls_util_send_phone_list(phTTS, pordonehundred);
					ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
					ls_util_send_phone_list(phTTS, pordonehundred);
					ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*					printf("send phone for 100 \n");  */
				    if (pLts_t->ord != 0 && oflag == 0)
					   ls_util_send_phone_list(phTTS, phundredp);
					else
						if (buf[1] == '0' && buf[2] == '0')
					   		ls_util_send_phone_list(phTTS, ponehundred);
						else
					   		ls_util_send_phone_list(phTTS, phundredp);
				}

				break;
			case '2' :
#ifdef NUMDEBUG
	printf("In dogroup case 200 \n");
	printf("case2 adn \n");  
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o200);
						ls_util_send_phone_list(phTTS, pordonehundred);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o200);
						ls_util_send_phone_list(phTTS, pordonehundred);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 200 \n");  */
						ls_util_send_phone_list(phTTS, upunits[buf[0]-'0']);
						ls_util_send_phone_list(phTTS, phundred);
				}

				break;
			case '3' :
#ifdef NUMDEBUG
	printf("In dogroup case 300 \n");
	printf("case3 adn \n");  
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o300);
						ls_util_send_phone_list(phTTS, pordonehundred);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o300);
						ls_util_send_phone_list(phTTS, pordonehundred);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 300 \n");  */
						ls_util_send_phone_list(phTTS, upunits[buf[0]-'0']);
						ls_util_send_phone_list(phTTS, phundred);
				}

				break;
			case '4' :
#ifdef NUMDEBUG
	printf("In dogroup case 400 \n");
	printf("case4 adn \n");  
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o400);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o400);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 400 \n");  */
						ls_util_send_phone_list(phTTS, upunits[buf[0]-'0']);
						ls_util_send_phone_list(phTTS, phundred);
				}

				break;
			case '5' :
#ifdef NUMDEBUG
	printf("In dogroup case 500 \n");
	printf("case5 adn \n");  
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o500);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o500);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 100 \n");  */
						ls_util_send_phone_list(phTTS, pfivehun);
				}

				break;
				   
			case '6' :
#ifdef NUMDEBUG
	printf("In dogroup case 600 \n");
	printf("case6 adn \n");  
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o600);
						ls_util_send_phone_list(phTTS, pordonehundred);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o600);
						ls_util_send_phone_list(phTTS, pordonehundred);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 600 \n");  */
						ls_util_send_phone_list(phTTS, upunits[buf[0]-'0']);
						ls_util_send_phone_list(phTTS, phundred);
				}

				break;
			case '7' :
#ifdef NUMDEBUG
	printf("In dogroup case 7xx \n");
	printf("case7 adn \n");           
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o700);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o700);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 700 \n");  */
						ls_util_send_phone_list(phTTS, ph7);
						ls_util_send_phone_list(phTTS, phundred);
				}
				break;
			
			case '8' :
#ifdef NUMDEBUG
	printf("In dogroup case 800 \n");
	printf("case8 adn \n");  
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o800);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o800);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 800 \n");  */
						ls_util_send_phone_list(phTTS, upunits[buf[0]-'0']);
						ls_util_send_phone_list(phTTS, phundred);
				}

				break;
			case '9' :
#ifdef NUMDEBUG
	printf("In dogroup case 9xx \n");
	printf("case9 adn \n");
#endif
				if (pLts_t->ord == 1 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o900);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_O);
				}
				else if (pLts_t->ord == 2 && oflag == 1)
				{
						ls_util_send_phone_list(phTTS, o900);
						ls_util_send_phone_list(phTTS, pordonehundred_g);
						ls_util_send_phone(phTTS, LA_A);
				}
				else
				{
/*						printf("send phone for 900 \n");  */
						ls_util_send_phone_list(phTTS, ph9);
						ls_util_send_phone_list(phTTS, phundred);
				}
				break;

		}	/* switch(buf[0]) */
		ls_util_send_phone(phTTS, WBOUND);
		if (buf[1]=='0' && buf[2]=='0') 
		{
#ifdef NUMDEBUG
	printf("In dogroup x00 \n");
#endif
			if (oflag == 1) pLts_t->ord = 0;
	 		return;
		}
		
	}

	if (buf[1] == '1') 
	{
#ifdef NUMDEBUG
	printf("In dogroup x1x \n");
#endif
		if (pLts_t->ord == 1 && oflag == 1)
		{
			ls_util_send_phone_list(phTTS, pordteens[buf[2]-'0']);
			ls_util_send_phone(phTTS, LA_O);
			pLts_t->ord = 0;
		}
		else if (pLts_t->ord == 2 && oflag == 1)
		{
			ls_util_send_phone_list(phTTS, pordteens[buf[2]-'0']);
			ls_util_send_phone(phTTS, LA_A);
			pLts_t->ord = 0;
		}
		else
			ls_util_send_phone_list(phTTS, pteens[buf[2]-'0']);
		return;
	}
 	if (buf[1] == '2' && buf[2] =='0')
	{
#ifdef NUMDEBUG
	printf("In dogroup x20 \n");
#endif

		if (pLts_t->ord == 1 && oflag == 1)
		{
			ls_util_send_phone_list(phTTS, pordtens[buf[1]-'0']);
			ls_util_send_phone(phTTS, LA_O);
			pLts_t->ord = 0;
		}
		else if (pLts_t->ord == 2 && oflag == 1)
		{
			ls_util_send_phone_list(phTTS, pordtens[buf[1]-'0']);
			ls_util_send_phone(phTTS, LA_A);
			pLts_t->ord = 0;
		}
     	else
			ls_util_send_phone_list(phTTS, p20only);
		return;
	}
	if (buf[1] != '0') 
	{            
#ifdef NUMDEBUG
	printf("In dogroup xyx y!=0 \n");
#endif
		if ((pLts_t->ord == 2) && (ls_proc_non_zero(&buf[1], 3) == FALSE))
		{
			ls_util_send_phone_list(phTTS, pordtens[buf[1]-'0']);
			ls_util_send_phone(phTTS, LA_A);
			pLts_t->ord = 0;
		}
		else if (pLts_t->ord == 2 || pLts_t->ord == 1)
		{
			ls_util_send_phone_list(phTTS, pordtens[buf[1]-'0']);
			ls_util_send_phone(phTTS, LA_O);
		}
		else
		{
			/* Hi ginger can you figer out what and why I did????
			comments from hell..... eab 9/4/98*/
			/*		
			if (buf[2] == '1') 
			{
				ls_util_send_phone_list(phTTS, p21);
				return;
			}
			*/


			ls_util_send_phone_list(phTTS, ptens[buf[1]-'0']);
		}

		if (buf[2] == '0') 
		{
#ifdef NUMDEBUG
	printf("In dogroup xx0 \n");
#endif

			return;
		}
		if (oflag == FALSE)
		{
			ls_util_send_phone(phTTS, LA_I);
		}
 ls_util_send_phone(phTTS, SBOUND);
	}
	if (oflag != FALSE && pLts_t->ord != 0)
	{
		if (pLts_t->ord == 1) 
		{
			ls_util_send_phone_list(phTTS, pordunits[buf[2]-'0']);
			ls_util_send_phone(phTTS, LA_O);
			pLts_t->ord = 0;
		}
		if (pLts_t->ord == 2)
		{
			ls_util_send_phone_list(phTTS, pordunits[buf[2]-'0']);
			ls_util_send_phone(phTTS, LA_A);
			pLts_t->ord = 0;
		}
	}
	else
	{
		/* GL 02/15/1997  also check pLts_t->pflag, it should be set while processing currency */
		if (un_flag == TRUE && buf[2] == '1' && pLts_t->pflag != -1)
			ls_util_send_phone_list(phTTS, p1);
		else
			ls_util_send_phone_list(phTTS, punits[buf[2]-'0']);
	}
}

/* ******************************************************************
 *      Function Name: ls_proc_non_zero()       
 *
 *  	Description: Check to see if the supplied
 * 					 array of characters, with length "n",
 * 					 is non zero. Return TRUE if it is.
 * 					 Return FALSE if all zero.
 *
 *      Arguments: char *p, int n 
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
 *      Function Name: ls_proc_is_time()      
 *
 *  	Description: TRUE if a valid time-of-day string.
 *
 *      Arguments: PLTS_T pLts_t, 
 *				   LETTER *llp, 
 *				   LETTER *rlp
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int ls_proc_is_time(PLTS_T pLts_t, LETTER *llp, LETTER *rlp)
{   
	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)    /* First digit.         */
		return (FALSE);
	if (llp->l_ch != ':') 	                 		/* Optional digit.      */
	{
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != ':')           			/* Must be ":" now!     */
			return (FALSE);
	}
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))    /* Two digits.          */
		return (FALSE);
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))
		return (FALSE);
	if (++llp == rlp)                       		/* 00:00                */
		return (TRUE);
	if (llp->l_ch == ':')	                 		/* 00:00:00             */
	{
		if (++llp==rlp || !IS_DIGIT(llp->l_ch))
			return (FALSE);
		if (++llp==rlp || !IS_DIGIT(llp->l_ch))
			return (FALSE);
		++llp;
	}
	if (llp!=rlp && llp->l_ch== (pLts_t->fchar))     /* Fractional digits.   */
	{
		if (++llp==rlp || !IS_DIGIT(llp->l_ch))
			return (FALSE);
		while (++llp!=rlp && IS_DIGIT(llp->l_ch))
			;
	}
	if (llp != rlp)                         		/* Not all of it.       */
		return (FALSE);
	return (TRUE);                          		/* Looks good!          */
}

/* ******************************************************************
 *      Function Name: ls_proc_is_am_pm()      
 *
 *  	Description: TRUE if AM or PM (English-specific?)
 *
 *      Arguments: LETTER *llp, LETTER *rlp
 *
 *      Return Value: int
 *
 *      Comments:
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
 *      Function Name: ls_proc_do_time()
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   LETTER *llp, 
 *				   LETTER *rlp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_time(LPTTS_HANDLE_T phTTS, LETTER * llp, LETTER *rlp)
{
	if ((llp+1)->l_ch == ':') 	            /* Initial 1 digit.     */
	{
		ls_util_send_phone_list(phTTS, upunits[llp->l_ch-'0']);

		llp += 2;
	} 
	else	                                /* Initial 2 digit.     */
	{
		ls_proc_do_2_digits(phTTS, llp);
		llp += 3;
	}
	ls_util_send_phone(phTTS, VPSTART);     /* Middle.              */
	ls_proc_do_2_digits(phTTS, llp);
	llp += 2;
	if (llp!=rlp && llp->l_ch==':')         /* End.                 */
	{
		ls_util_send_phone(phTTS, VPSTART);
		ls_proc_do_2_digits(phTTS, llp+1);
		llp += 3;
	}
	if (llp != rlp) 
	{                 
    		                     	      /* Final fractions.     */
		ls_util_send_phone(phTTS, WBOUND);
		ls_util_send_phone_list(phTTS, ppoint);
		while (++llp != rlp) 
		{
			ls_util_send_phone(phTTS, WBOUND);
			ls_util_send_phone_list(phTTS, punits[llp->l_ch-'0']);

		}
	}
}

/* ******************************************************************
 *      Function Name: ls_proc_is_date()      
 *
 *  	Description: TRUE if a date (in Vax format)
 *
 *      Arguments:	LETTER *llp
 *					LETTER *rlp
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int ls_proc_is_date(LETTER *llp, LETTER *rlp)
{
	unsigned char *cp;
	unsigned char **mp;
	short            buf[3];

	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)    /* First digit.         */
		return (FALSE);
	if (llp->l_ch != '-')                   		/* Optional digit.      */
	{
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '-')           			/* Must be "-" now!     */
			return (FALSE);
	}
	if (++llp==rlp || !IS_ALPHA(llp->l_ch)) 	/* Three alphas.   		*/
		return (FALSE);
	buf[0] = llp->l_ch;
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))
		return (FALSE);
	buf[1] = llp->l_ch;
	if (++llp==rlp || !IS_ALPHA(llp->l_ch))
		return (FALSE);
	buf[2] = llp->l_ch;
	// CAB removed warnings by typecast
	for (mp = (unsigned char **)&months[0]; (cp = *mp++) != NULL;) /* Validate.    	*/
	{
		if (buf[0]==cp[0] && buf[1]==cp[1] && buf[2]==cp[2])
		break;
	}

	if (cp == NULL)                         /* Loss!                */
		return (FALSE);
	if (++llp == rlp)                       /* 23-Aug               */
		return (TRUE);
	if (llp->l_ch != '-')                   /* Must be a year.      */
		return (FALSE);
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))
		return (FALSE);
	if (++llp==rlp || !IS_DIGIT(llp->l_ch))
		return (FALSE);
	if (++llp == rlp)                       		/* 23-Aug-84            */
		return (TRUE);
	if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)    /* Need 2 more digits.  */
		return (FALSE);
	if (!IS_DIGIT(llp->l_ch) || ++llp!=rlp)
		return (FALSE);
	return (TRUE);                          		/* 23-Aug-1984          */
}

/* ******************************************************************
 *      Function Name: ls_proc_do_date()      
 *
 *  	Description: Output a Vax-format date.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				   LETTER *llp, 
 *				   LETTER *rlp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_date(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp)
{
	LETTER *lp1;
	int i;
	unsigned char _far  *cp;
	lp1 = llp;                              	/* Find end of day.     */
	while (lp1->l_ch != '-')
		++lp1;
	// CAB Removed warnings by typecast
	for (i=0; (cp = (unsigned char *)months[i]) != NULL; ++i) 	/* Get month.   		*/
	{
		if ( (lp1+1)->l_ch == cp[0]
		&&  (lp1+2)->l_ch == cp[1]
		&&  (lp1+3)->l_ch == cp[2] )
			break;
	}
	ls_util_send_phone_list(phTTS, pmonths[i]); /* Speak the month      */
	ls_util_send_phone(phTTS, WBOUND);
	if (lp1!=llp+1 && llp->l_ch=='0')       	/* Get "01-Jan-84" ok.  */
		ls_proc_do_number(phTTS, llp+1, lp1, TRUE);
	else
		ls_proc_do_number(phTTS, llp, lp1, TRUE);
	lp1 += 4;
	if (lp1 != rlp) 
	{
		ls_util_send_phone(phTTS, COMMA);

		/*		
		 * if (lp1+3 == rlp) {
		 *	ls_util_send_phone_list(phTTS, pteens[9]);     19XX                 
		 *	ls_util_send_phone(phTTS, WBOUND);
		 *	ls_proc_do_2_digits(phTTS, lp1+1);
		 * } else eab out in spanish they don't do 12, xx
		 * BATS 266 let not guess the year eab
		 */
		/* GL 10/1/1996 restore this to support dd/mmm/yy format */
		/* Don't restore it EAB bats266*/
		if (lp1+3 == rlp)
		{
		   ls_proc_do_2_digits(phTTS, lp1+1);     /* dd/mmm/yy   */
		}
		else
		  ls_proc_do_4_digits(phTTS, lp1+1);      /* dd/mmm/yyyy */
	}
}

/* ******************************************************************
 *      Function Name: ls_proc_is_frac()      
 *
 *  	Description: TRUE if a fraction.
 *
 *      Arguments: LETTER * llp, LETTER *rlp
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int ls_proc_is_frac(LETTER * llp, LETTER *rlp)
{
	 int    n;

	if (!IS_DIGIT(llp->l_ch) || llp->l_ch=='0' || ++llp==rlp)
		return (FALSE);                 	/* Non digit or "0".    */
	if (llp->l_ch != '/')                   /* Optional digit.      */
	{
		if (!IS_DIGIT(llp->l_ch) || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '/')
			return (FALSE);
	}
	n = 0;                                  /* Count digits.        */
	while (++llp!=rlp && IS_DIGIT(llp->l_ch)) 
	{
		if (n==0 && llp->l_ch=='0')     	/* Leading "0" is bad.  */
			return (FALSE);
		++n;
	}
	if (n==0 || n>3)                        /* 1 to 3 digits.       */
		return (FALSE);
	if (n == 3)                             /* Limit is 100.        */
	{
		if ((llp-1)->l_ch != '0'
		||  (llp-2)->l_ch != '0'
		||  (llp-3)->l_ch != '1')
			return (FALSE);
	}
	if (llp != rlp)                         /* Allow "%".           */
	{
		if (llp->l_ch!='%' || llp+1!=rlp)
			return (FALSE);
	}
	return (TRUE);
}

/* ******************************************************************
 *      Function Name: ls_proc_do_frac()      
 *
 *  	Description: Output a fraction.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					LETTER * llp
 *					LETTER * rlp
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 * *****************************************************************/
void ls_proc_do_frac(LPTTS_HANDLE_T phTTS, LETTER * llp, LETTER * rlp)
{
	 LETTER *tlp1;
	 LETTER *tlp2;
	 int    pflag;
     PLTS_T pLts_t = phTTS->pLTSThreadData;                                 

	tlp1 = llp;                             				/* Scan to "/".         */
	while (tlp1->l_ch != '/')
		++tlp1;
	/*
	   GL 11/05/1996, The following codes are used to handle the "1" in 1/2, 1/3...
	   "1" in 1/2 is "una"
	   other uses "un"
	   "1" will be "uno" if not in the fraction
	*/
	if (llp+1==tlp1 && llp->l_ch=='1')  
	{
		ls_util_send_phone(phTTS, LA_U);
		ls_util_send_phone(phTTS, LA_N);
	    if (tlp1+2==rlp && (tlp1+1)->l_ch=='2')   
		   ls_util_send_phone(phTTS, LA_A);
		pflag = FALSE;
	} 
	else 
		pflag = ls_proc_do_number(phTTS, llp, tlp1, FALSE);     /* Numerator.           */

		
	ls_util_send_phone(phTTS, WBOUND);                      /* Gap.                 */
	++tlp1;                                 				/* Skip "/".            */
	tlp2 = tlp1;                            				/* Scan to end or "%".  */
	while (tlp2!=rlp && tlp2->l_ch!='%')
		++tlp2;
	if (tlp1+1==tlp2 && tlp1->l_ch=='2')  
	{
		ls_util_send_phone_list(phTTS, pflag!=FALSE ? phalves : phalf);
	} 
	else 
	{
		/* GL 11/04/1996, also set ord to enforce ordinal number speaking */
		pLts_t->ord = 1;
		
		ls_proc_do_number(phTTS, tlp1, tlp2, TRUE);     	/* As an ordinal.       */

		/* GL 11/05/1996, use LA_S to mark plural. have no idea what "ud" do */
		/* also comment out the sending of "ppercent" */
		if (pflag != FALSE) ls_util_send_phone(phTTS, LA_S);
#if 0
		if (pflag != FALSE)             					/* Make plural.         */
		{
			ud = (tlp2-1)->l_ch;
			if (tlp2>tlp1+1 && (tlp2-2)->l_ch=='1')
				ud = '0';            
		}
#endif
	}
	 
#if 0
	if (tlp2 != rlp)                        				/* Must be "%".         */
	{
		ls_util_send_phone_list(phTTS, ppercent);
	}
#endif
}
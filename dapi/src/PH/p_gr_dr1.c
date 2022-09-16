/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    p_gr_dr1.c
 *    Author:       Matthew Schnee
 *    Creation Date:06/17/1996
 *
 *    Functionality:
 *		german specific files for ph_draw
 *
 ***********************************************************************
 *    Revision History:
 * 
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 *	001 EAB		1/23/97			Editing to reduce ifdef's and obsolete code KH_mod no longer used
 *								This file is now a NULL File. R_mod is in PHdraw as a common function. 
 */								
 
 
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* subroutine for parameter modulation of german uvular \R\        */
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
 
/*
 *      Function Name: kh_modulation()     
 *          
 *  	Description: Sets parameters for the German kh phoneme
 *      			 Same as r_modulation()
 *      Arguments:PDPH_T pDph_t,
 *				  short *formpointer, 
 *				  short percent, 
 *				  short bool 
 *
 *      Return Value: void
 *
 *      Comments: Not used anywhere!!!
 *
 */

#ifdef out
void kh_modulation (PDPH_T pDph_t,short *formpointer, short percent, short bool)
/* short   *formpointer;    pointer to parameter */
/* short   percent;   percentage of modulation */
/* short   bool;   increment modulcount if bool is TRUE */
{
	 short            arg1, arg2;		/* arguments for mlsh1 */

	arg1 = *formpointer;

#if DBGRMO
	fprintf (stderr,
			 "\n(phdraw)modulating /KR/, modulcount:%d, percent:%d, old:%d\n",
			 modulcount, percent, *formpointer);
#endif

	switch ((bool == TRUE) ? pDph_t->modulcount++ : pDph_t->modulcount)
	{
	case 0:
		arg2 = percent;
		break;
	case 1:
		arg2 = percent;
		break;
	case 2:
		arg2 = N100PRCNT;
		break;
	case 3:
		arg2 = N100PRCNT;
		break;
	case 4:
		arg2 = percent;
		break;
	default:
		arg2 = percent;
		if (bool == TRUE)
		{
			pDph_t->modulcount = 0;
		}
	}
	/* switch */
	*formpointer += mlsh1 (arg1,arg2);

#if DBGRMO
	fprintf (stderr, "\n new value: %d\n", *formpointer);
#endif
} /* kh_modulation */




/*
 *      Function Name: r_modulation()     
 *
 *  	Description: Sets parameters for the German r phoneme
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short *formpointer, 
 *				   short percent, 
 *				   short bool
 *
 *      Return Value: void
 *
 *      Comments: Seems to be about the same as k_modulation; is used in phdraw()
 *					but k_modulation is not (don't know why).
 *
 */

void r_modulation (PDPH_T pDph_t,short *formpointer, short percent, short bool)
/* short   *formpointer;   pointer to parameter */
/* short   percent;    percentage of modulation */
/* short   bool;   increment modulcount if bool is TRUE */
{
	short            arg1, arg2;		/* arguments for mlsh1 */

	arg1 = *formpointer;

#ifdef DBGRMO
	fprintf (stderr,
			 "\n(phdraw)modulating /RR/, modulcount:%d, percent:%d, old:%d\n",
			 modulcount, percent, *formpointer);
#endif

	switch ((bool == TRUE) ? pDph_t->modulcount++ : pDph_t->modulcount)
	{
	case 0:
		arg2 = percent >> 1;
		break;
	case 1:
		arg2 = percent;
		break;
	case 2:
		arg2 = percent >> 1;
		break;
	case 3:
		arg2 = -(percent >> 1);
		break;
	case 4:
		arg2 = -(percent >> 1);
		break;
	default:
		arg2 = -(percent >> 1);
		if (bool == TRUE)
		{
			pDph_t->modulcount = 0;
		}
	}
	/* switch */
	*formpointer += mlsh1 (arg1,arg2);

#ifdef DBGRMO
	fprintf (stderr, "\tnew value: %d\n", *formpointer);
#endif
}
/* r_modulation */

#endif
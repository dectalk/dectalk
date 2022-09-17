/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
 *                                                                      
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.    
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.                                
 *                                                                      
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.                                            
 *                                                                       
 *********************************************************************** 
 *    File Name:	ls_adju.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    Sylabification and
 *    stress analysis. The sylabification
 *    code runs first; the pointers into the
 *    phoneme chain get stored in the "SYL"
 *    array. The stress pass runs second, and
 *    uses information created by "stress"
 *    to make decisions.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 * 	001 DGC		02/21/1985		Added arguments to "stress" and "sylables"
 *								so you can do compounds.
 * 	002 DGC		02/22/1985		made everything that dealt with the [M]
 *								phoneme go away.
 * 	003 DGC		03/06/1985		Secondary stresses can now be put onto
 *								tress refusing prefixes. Checking for stress
 *								refusing prefixes broke more words than it
 *								fixed.
 * 	004 DGC		04/08/1985		Added the "#if TONY" stuff, reduction block.
 * 	005 DGC		04/16/1985		Changes to the table of stress refusing
 *								prefixes.
 * 	006 DGC		04/19/1985		Removed "out" and "per" from the table
 *								of prefixes.
 * 	007 DGC		04/25/1985		when [xn] is found as a sylable in word
 *								initial position, change it to [^n]. This makes
 *								negative things sound better.
 * 	008 DGC		05/15/1985		Additions to above. The [^n] isn't quite right.
 *								Make it primary stressed as well.
 * 	009 DGC		06/10/1985		Made all the "#if TONY" stuff the only choice.
 *								Added the "camera" rule (see notebook); the old
 *								"secondary" routine renamed "finalfixes",
 *								because this is what it was really doing.
 * 	010 DGC		08/29/1985		Try something. Conditionalized on the DGC flag.
 *								We used to kill off reduction blocks on words
 *								like "camera". Allow a trailing [z] too.
 * 	011 DGC		09/18/1985		Sytlistic changes suggested by "lint".
 *	REVISION HISTORY FROM LS6.c
 *	001 DGC		02/21/1985		Added arguments to "allo1" for compounds.
 *								The "allo2" pass is done full word because
 *								it does not need to be broken up.
 * 	002 DGC		02/22/1985		Made everything that deals with the [M]
 *								phoneme go away.
 * 	003 DGC		04/05/1985		Changed [|z] to [xz] in plurals (allo1).
 *								Changed [|d] to [xd] in plurals (allo1).
 * 	004 DGC		04/08/1985		Added code that blocks reduction if the
 *								PFBLOCK is set at the start of the sylable.
 *								Conditional code in "ls5.c" asks for this
 *								bit to be set.
 * 	005 DGC		05/10/1985 		Undid 03. from ls6.c
 * 	006 DGC		05/29/1985 		Kludge around a bug in the compiler.
 *								If you have a long block of "&&" operators in
 *								an "if", with imbedded assignments, then
 *								the expression gets reordered badly, and the
 *								"=" gets pulled ahead in the "if" to a
 *								wrong place. The fix is to rewrite the chain
 *								s many "if" statements.
 * 	007 DGC		09/18/1985		Stylistic changes suggested by "lint".
 * 	008 GL		07/13/1995		Remove the delete geminate pair code.
 *                      		do it now in ls4.c and ls4_acna.c
 *                      		search 7/13/95 for inline comment
 *	Combined revision history from here on
 *	012	MGS		02/07/1996		Moved ls5.c to ls_adju.c
 *  013 MGS 	02/07/1996 		Added revision history from ls6.c
 *	014	MGS		02/27/1996 		Added function headers and reformatted code 
 *	015	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *	016	MGS		03/18/1996		Put the ACNA code in an if block that checks
 *								he kernel flag pronname for to use the ACNA code
 *  017 GL		10/24/1996		remove the unused index mark handling code.    
 *  018 NCS     01/30/1997		fixed ls_adju_bestdefault() to handle correct stress
 *								for words ending in "ia".
 *								ie (australia cafeteria malaria algeria pneumonia)
 *  019	DR 		07/21/1997		UK BUILD: Changed ENGLISH_USs to ENGLISH
 *  020 GL      09/24/1997      BATS#470  Add LDS debug switch 
 *  021 GL      10/13/1997      For BATS#486 remove English only ACNA setting
 *  022	MGS		04/13/2000		Changes for integrated phoneme set 
 *  023 NAL		06/12/2000		Added function prototypes (Warning removal)
 *  024 CAB		10/18/2000		Changed copyright info
 *  025	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  026	CAB 	05/14/2001		Updated copyright
 *  027	MGS		02/25/2002		Removed unsued index code
 */                                                 

#include "ls_def.h"

#ifndef NO_INCLUDED_C_FILES
#include "ls_adju1.c"
#endif

#if defined (ENGLISH) || defined (GERMAN)
                 
int ls_adju_suffixscan(PLTS_T, PHONE *, PHONE *); // NAL warning removal
int ls_adju_prefixscan(LPTTS_HANDLE_T, PHONE *, PHONE *, int); // NAL warning removal
int ls_adju_unstressed(PLTS_T, int); // NAL warning removal

                 
/*
 *	Function Name:	
 *		ls_adju_sylables
 *
 *	Description:   
 *		this function marks the sylables of the phoneme string and
 *		moves the stress to the beginning of a sylable
 *
 *	Arguments:                                        
 *		PHONE *fpp The start of the phone string
 *		PHONE *lpp The end of the phone string
 *
 *	Return Value:                                  
 *		None
 *
 *	Comments:
 * 		Scan the PHONE chain from
 * 		right to left, marking the positions
 * 		of the sylables. Drag the stress from an
 * 		affix to the start of the sylable. No
 * 		errors are possible.
 *
 */
void ls_adju_sylables(PHONE *fpp, PHONE *lpp)
{
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*lsp;
	 int	type;
	 int	stype;

	lsp = NULL;				/* Last sylable pointer	*/
	pp1 = fpp;				/* Start of word.	*/
	while (pp1 != lpp) 
	{
		if ((pp1->p_flag&PFSYLAB) != 0) 
		{
			lsp = pp1;
			break;
		}
		pp1 = pp1->p_fp;
	}
	while (pp1 != fpp) 
	{						/* Until start of word.	*/
		stype = SNONE;		/* Not set.		*/
		do 
		{					/* Backup to vowel	*/
			pp2 = pp1->p_bp;
			if (ls_adju_is_cons(pp2) == FALSE)
				break;
			pp1 = pp2;
			if (pp1->p_stress != SNONE) 
			{
				stype = pp1->p_stress;
				pp1->p_stress = SNONE;
			}
		} while (pp1 != fpp);
		if (pp1 == fpp) 
		{					/* "gdansk", "gxx"	*/
			if (lsp != NULL) 
			{
				lsp->p_flag &= ~PFSYLAB;
				stype = lsp->p_stress;
				lsp->p_stress = SNONE;
			}
			pp1->p_flag |= PFSYLAB;
			pp1->p_stress = stype;
			break;
		} 
		pp1 = pp1->p_bp;			/* Point at vowel	*/
		pp1->p_flag |= PFLEFTC;		/* In left cluster.	*/
		if (pp1->p_stress != SNONE) 
		{
			stype = pp1->p_stress;
			pp1->p_stress = SNONE;
		}
		if ((pp1->p_flag&PFMORPH) != 0	/* Explicit morpheme	*/
		|| pp1 == fpp					/* or start of word	*/
		|| ls_adju_is_cons(pp2=pp1->p_bp) == FALSE)
		{
			goto out;
		}
		pp1 = pp2;					/* One consonant	*/

		pp1->p_flag |= PFLEFTC;		/* In left cluster.	*/
		if (pp1->p_stress != SNONE) 
		{
			stype = pp1->p_stress;
			pp1->p_stress = SNONE;
		}
		if ((pp1->p_flag&PFMORPH) != 0	/* Explicit morpheme	*/
		|| pp1 == fpp					/* or start of word.	*/
		|| ls_adju_is_cons(pp2=pp1->p_bp) == FALSE)
		{
			goto out;
		}
		type = ls_adju_cluster(pp2->p_sphone, pp1->p_sphone);
		if (type == ILLEGAL)			/* Not allowed		*/
		{
			goto out;
		}
		pp1 = pp2;					/* Two consonants	*/

		pp1->p_flag |= PFLEFTC;		/* In left cluster.	*/
		if (pp1->p_stress != SNONE) 
		{
			stype = pp1->p_stress;
			pp1->p_stress = SNONE;
		}
		if (type == TRYS				/* If "s" or "S" good	*/
		&& (pp1->p_flag&PFMORPH) == 0	/* check for it.	*/
		&& pp1 != fpp
#ifdef ENGLISH_US
		&& ((pp2=pp1->p_bp)->p_sphone==US_S || pp2->p_sphone==US_SH)) 
#endif
#ifdef ENGLISH_UK
		&& ((pp2=pp1->p_bp)->p_sphone==UK_S || pp2->p_sphone==UK_SH)) 
#endif
#ifdef GERMAN
		&& ((pp2=pp1->p_bp)->p_sphone==GR_S || pp2->p_sphone==GR_SH)) 
#endif

		{
			pp1 = pp2;					/* Include it.		*/
			pp1->p_flag |= PFLEFTC;
			if (pp1->p_stress != SNONE) 
			{
				stype = pp1->p_stress;
				pp1->p_stress = SNONE;
			}
		}
	out:

		pp1->p_flag |= PFSYLAB;		/* Mark sylable		*/
		pp1->p_stress = stype;		/* (may set stress)	*/
		lsp = pp1;					/* Remember last one	*/
	}
	return;
}
/*
 *	Function Name:
 *		ls_adju_is_cons	
 *
 *	Description:        
 *		this function decides if the phoneme is a consonant
 *
 *	Arguments:                                             
 *		PHONE *pp	a pointer to the phoneme to be checked
 *
 *	Return Value:                                         
 *		TRUE	it is a consonant
 *		FALSE	otherwise
 *
 *	Comments:
 *
 */   
int ls_adju_is_cons(PHONE *pp)
{       
	if ((pfeat[pp->p_sphone]&PCONS) != 0)
		return (TRUE);
	return (FALSE);
}                
/*
 *	Function Name:	     
 *		ls_adju_is_voc
 *
 *	Description:
 *		this function checks the phoneme to see if it is a VOC
 *
 *	Arguments:        
 *		PHONE *pp	a pointer to the phoneme to be checked
 *
 *	Return Value:                                         
 *		TRUE	it is a consonant
 *		FALSE	otherwise
 *
 *	Comments:
 *
 */   
int ls_adju_is_voc(PHONE *pp)
{       
	if ((pfeat[pp->p_sphone]&PVOC) != 0)
		return (TRUE);
	return (FALSE);
}                

/*
 *	Function Name:	
 *		ls_adju_stress
 *
 *	Description:
 *		this is the main stress analysis function
 *
 *	Arguments:        
 *		PHONE *fpp		The start of the phone string
 *		PHONE *lpp		The end of the phone string
 *		int pstype
 *		int sel_lang	
 *
 *	Return Value:
 *		none
 *
 *	Comments:
 *  This is the driving function of
 *  stress analysis. What it does is described in
 *  gory detail in the DECtalk III development notebooks.
 *  You probably should not even try to change anything until
 *  you have read that stuff, and you understand it all.
 *  This level is mostly just a lot of calls to the
 *  subfunctions that do the work.
 *
 */
void ls_adju_stress(LPTTS_HANDLE_T phTTS,PHONE *fpp, PHONE *lpp, int pstype,int sel_lang)
{
	 int	csyl;
	 int	type;
	 int	isreduced;
	 PLTS_T pLts_t;               
	 PKSD_T pKsd_t;
	 pLts_t=(PLTS_T)phTTS->pLTSThreadData;
	 pKsd_t=phTTS->pKernelShareData;

	if (ls_adju_suffixscan(pLts_t,fpp, lpp) == FALSE)
		return;
	if (ls_adju_prefixscan(phTTS,fpp, lpp,sel_lang) == FALSE)
		return;
#ifdef ACNA
	/*
	 * PRG	23-NOV-1988
	 * BEGINNING OF MODIFICATION - this code segment looks at the
	 * language tag associated with the word being analyzed and
	 * dispatches the word out to different analysis routines for
	 * languages other than English.  English words are processed
	 * as words always have been.
	 */

		if (sel_lang != NAME_ENGLISH && sel_lang != NAME_IRISH)
		{
	   	   /*
		    * Stress placed on the word by English rules (which are the
	    	* default rules) must be removed.
	    	*/


	   		for (csyl=0; csyl<pLts_t->nsyl; csyl++)
	      		pLts_t->sylp[csyl]->p_stress = SUN;

	   		/*
	    	 * Execute language specific analysis.
	    	 */

	   		switch (sel_lang)
	   		{
				case NAME_FRENCH :
		 			lsa_util_stress_fr (pLts_t,fpp, lpp, pstype);
		 			return;

	      		case NAME_GERMANIC :
			 		lsa_util_stress_gr (pLts_t,fpp, lpp, pstype);
		 			return;

	      		case NAME_ITALIAN :
		 			lsa_util_stress_it (pLts_t,fpp, lpp, pstype);
		 			return;

		      	case NAME_JAPANESE :
				 	lsa_util_stress_ja (pLts_t,fpp, lpp, pstype);
		 			return;

	      		case NAME_SPANISH :
					lsa_util_stress_sp (pLts_t,fpp, lpp, pstype);
			 		return;

	      		case NAME_SLAVIC :
					lsa_util_stress_sl (pLts_t,fpp, lpp, pstype);
			 		return;
	   		};
		}

	/*
	 * END OF MODIFICATION.
	 */

#endif /* #ifdef ACNA */

	/* Suffix is providing primary stress placement information.	*/
	/* Place it. Shift left if impossible. Let prefix flags and bad	*/
	/* vowels push it back toward the suffix.			*/

	if (pLts_t->psyl >= 0) 
	{
		type = pLts_t->sylp[pLts_t->psyl]->p_stress;
		if (type==S1LEFT || type==S2LEFT) 
		{
			if (pLts_t->psyl != 0) 
			{
				pLts_t->sylp[pLts_t->psyl]->p_stress = SUN;
				--pLts_t->psyl;
				if (type==S2LEFT && pLts_t->psyl!=0) 
				{
					pLts_t->sylp[pLts_t->psyl]->p_stress = SUN;
					--pLts_t->psyl;
				}
			}
		}
		while (pLts_t->psyl!=0 && ls_adju_unstressed(pLts_t,pLts_t->psyl)!=FALSE) 
		{
			--pLts_t->psyl;
		}
		while (pLts_t->psyl<pLts_t->nsyl-1 && (pLts_t->sylp[pLts_t->psyl]->p_flag&PFRFUSE)!=0) 
		{
			++pLts_t->psyl;
		}
		while (pLts_t->psyl<pLts_t->nsyl-1 && ls_adju_unstressed(pLts_t,pLts_t->psyl)!=FALSE) 
		{
			++pLts_t->psyl;
		}
		pLts_t->sylp[pLts_t->psyl]->p_stress = pstype;
		csyl = pLts_t->psyl+1;
		isreduced = TRUE;
		while (csyl < pLts_t->nsyl) 
		{
			if (isreduced == FALSE) 
			{
				if (pLts_t->sylp[csyl]->p_stress == SNONE)
					pLts_t->sylp[csyl]->p_flag |= PFBLOCK;
				isreduced = TRUE;
			} 
			else
			{
				isreduced = FALSE;
			}
			if (pLts_t->sylp[csyl]->p_stress == SNONE)
			{
				pLts_t->sylp[csyl]->p_stress = SUN;
			}
			++csyl;
		}
		ls_adju_final_fixes(pLts_t);
		return;
	}
	/* No suffix, but prefix is refusing the stress.		*/
	if ((pLts_t->sylp[0]->p_flag&PFRFUSE) != 0) 
	{
		pLts_t->psyl = 0;
#if defined (VMS) || defined (LDS_BUILD)
		if (rflag != FALSE)
			printf("Begin at sylable 1\n");
#endif
		while (pLts_t->psyl<pLts_t->nsyl-1 && (pLts_t->sylp[pLts_t->psyl]->p_flag&PFRFUSE)!=0) 
		{
			++pLts_t->psyl;
#if defined (VMS) || defined (LDS_BUILD)
			if (rflag != FALSE)
				printf("Prefix, shift right\n");
#endif
		}
		while (pLts_t->psyl<pLts_t->nsyl-1 && ls_adju_unstressed(pLts_t,pLts_t->psyl)!=FALSE) 
		{
			++pLts_t->psyl;
#if defined (VMS) || defined (LDS_BUILD)
			if (rflag != FALSE)
				printf("Impossible, shift right\n");
#endif
		}
#if defined (VMS) || defined (LDS_BUILD)
		if (rflag != FALSE)
			printf("Primary on sylable %d\n", pLts_t->psyl+1);
#endif
		pLts_t->sylp[pLts_t->psyl]->p_stress = pstype;
		csyl = pLts_t->psyl+1;
		isreduced = TRUE;
		while (csyl < pLts_t->nsyl) 
		{
			if (isreduced == FALSE) 
			{
				if (pLts_t->sylp[csyl]->p_stress == SNONE)
					pLts_t->sylp[csyl]->p_flag |= PFBLOCK;
				isreduced = TRUE;
			} 
			else
			{
				isreduced = FALSE;
			}
			if (pLts_t->sylp[csyl]->p_stress == SNONE)
				pLts_t->sylp[csyl]->p_stress = SUN;
			++csyl;
		}
		ls_adju_final_fixes(pLts_t);
		return;
	}
	/* Revert to default rules. No or all refusing suffix.		*/
	ls_adju_bestdefault(pLts_t);
#if defined (VMS) || defined (LDS_BUILD)
	if (rflag != FALSE)
		printf("Best default on sylable %d\n", pLts_t->psyl+1);
#endif
	pLts_t->sylp[pLts_t->psyl]->p_stress = pstype;
	csyl = pLts_t->psyl+1;
	isreduced = TRUE;
	while (csyl < pLts_t->nsyl) 
	{
		if (isreduced == FALSE) 
		{
			if (pLts_t->sylp[csyl]->p_stress == SNONE)
				pLts_t->sylp[csyl]->p_flag |= PFBLOCK;
			isreduced = TRUE;
		} 
		else
		{
			isreduced = FALSE;
		}
		if (pLts_t->sylp[csyl]->p_stress == SNONE)
		{
			pLts_t->sylp[csyl]->p_stress = SUN;
		}
		++csyl;
	}
	ls_adju_final_fixes(pLts_t);
}
/*
 *	Function Name:
 *		ls_adju_unstressed	
 *
 *	Description:
 *		this function checks the sylable to see if it cannot take stress
 *
 *	Arguments:            
 *		int n		the sylable n
 *
 *	Return Value:                
 *		TRUE	if n cannot take stress
 *		FALSE	otherwise
 *
 *	Comments:
 * Return TRUE if sylable "n"
 * cannot possibly take primary stress.
 * We only know about [L].
 *
 */
int ls_adju_unstressed(PLTS_T pLts_t,int n)
/* int	n; */
{
	 PHONE	*pp;
	 int	sphone;

	pp = pLts_t->sylp[n];
	while (ls_adju_is_cons(pp) != FALSE)
		pp = pp->p_fp;
	sphone = pp->p_sphone;
#ifdef ENGLISH_US
	if (sphone ==US_EL)
#endif
#ifdef ENGLISH_UK
	if (sphone ==UK_EL)
#endif
#ifdef GERMAN
        if (sphone ==GR_L)
#endif	
		return (TRUE);
	return (FALSE);
}
/*
 *	Function Name:
 *		ls_adju_suffixscan		
 *
 *	Description: 
 * 	Scan the word left to right.
 * 	Count the number of sylables ("pLts_t->nsyl") and store
 * 	pointers to the starts of the sylables in the "pLts_t->sylp"
 * 	array. Count the number of sylables in the root form
 * 	("pLts_t->rsyl") and note the sylable that forces the
 * 	primary stress ("pLts_t->psyl"). Return TRUE on success and
 * 	FALSE if there are too many sylables.
 *		
 *
 *	Arguments:
 *		PHONE *fpp		The start of the phone string
 *		PHONE *lpp		The end of the phone string
 *
 *	Return Value:
 *		TRUE
 *		FALSE
 *
 *	Comments:
 *
 */
int ls_adju_suffixscan(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp)
{
	 PHONE	*pp;

	pLts_t->nsyl =  0;
	pLts_t->rsyl = -1;
	pLts_t->psyl = -1;
	pp = fpp;
	while (pp != lpp) 
	{
		if ((pp->p_flag&PFSYLAB) != 0) 
		{
			if (pLts_t->nsyl >= NSYL)
				return (FALSE);
			if (pp->p_stress != SNONE) 
			{
				if (pLts_t->rsyl < 0)
					pLts_t->rsyl = pLts_t->nsyl;
				if (pLts_t->psyl<0 && pp->p_stress>=SPRI)
					pLts_t->psyl = pLts_t->nsyl;
			}
			pLts_t->sylp[pLts_t->nsyl++] = pp;
		}
		pp = pp->p_fp;
	}
	if (pLts_t->rsyl < 0)
		pLts_t->rsyl = pLts_t->nsyl;
	return (TRUE);
}
/*
 *	Function Name:
 *		ls_adju_prefixscan	
 *
 *	Description:
 * 	Scan the word left to right,
 * 	setting the "PFRFUSE" flags in sylables
 * 	that are stress refusing prefixes. Return TRUE
 * 	if all works out well; FALSE on errors. The
 * 	"P2SYL" flag in the table determines if 1 or
 * 	2 sylables are hacked.
 *
 *	Arguments:
 *		PHONE *fpp		The start of the phone string
 *		PHONE *lpp		The end of the phone string
 *
 *	Return Value:
 *		TRUE
 *		FALSE
 *
 *	Comments:
 *
 */
int ls_adju_prefixscan(LPTTS_HANDLE_T phTTS,PHONE *fpp, PHONE *lpp,int lang_tag)
{

	 PHONE	*pp1;
	 PHONE	*pp2;
	 int	i;
	 int	len;
	 int	csyl;
	char	*ptp;
	PLTS_T	pLts_t;
	PKSD_T  pKsd_t;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t=(PLTS_T)phTTS->pLTSThreadData;

	pp1  = fpp;					/* Start of the word.	*/
	csyl = 0;					/* Sylable count.		*/
loop:
	if (csyl >= pLts_t->nsyl-1)	/* No sylables.			*/
		return (TRUE);
	ptp = (char *)&preftab[0];
#ifdef ACNA      
	while ((len = ptp[1]&PLENGTH) != 0) 
#else
	while ((len = ptp[0]&PLENGTH) != 0) 
#endif
	{
#ifdef ACNA
		/*
		 * PRG	23-NOV-1988
		 * BEGINNING OF MODIFICATION - skip the prefix if it is
		 * marked IRISH and the scan is not being done for an
		 * IRISH word (i.e. the IRISH flag is not set).
		 *
		 * PRG	15-DEC-1988
		 * Modified the following to handle arbitrary names, not
		 * just IRISH ones.
		 */

		if ((unsigned char)ptp[0] != (unsigned char)0xff)
		{
			if (ptp[0] != lang_tag)
		   	{
		   		ptp += len+2;
		  		continue;
		   	}
		}
		ptp++;

		/*
		 * END OF MODIFICATION.
		 */

#endif /* #ifdef ACNA */
		pp2 = pp1;
		for (i=0; i<len; ++i) 
		{		/* Compare loop.	*/
			if (pp2==lpp || pp2->p_sphone!=ptp[i+1])
				break;
			pp2 = pp2->p_fp;
		}
		if (i != len) 
		{			/* Failed.		*/
			ptp += len+1;
			continue;
		}
#ifdef ENGLISH
		/* The "pp2" is pointing beyond the match. You cannot	*/
		/* bite off a prefix and create an illegal cluster at	*/
		/* the start of the sylable. An example of a word that	*/
		/* is blocked by this rule is "rectilinear".			*/
		if (pp2!=lpp && (pp2->p_flag&PFLEFTC)==0) 
		{
			ptp += len+1;
			continue;
		}
		if ((ptp[0]&PRCON)!=0 && (pp2==lpp || ls_adju_is_cons(pp2)==FALSE)) 
		{
			ptp += len+1;
			continue;
		}
		if ((ptp[0]&PRVOC)!=0 && (pp2==lpp ||  ls_adju_is_voc(pp2)==FALSE)) 
		{
			ptp += len+1;
			continue;
		}
#endif
		pLts_t->sylp[csyl]->p_flag |= PFRFUSE;	/* Mark refuse.		*/
		++csyl;
		if ((ptp[0]&P2SYL) != 0		/* If 2 syl. prefix and	*/
		&& csyl < pLts_t->nsyl-1) 
		{							/* some root remains.	*/
			pLts_t->sylp[csyl]->p_flag |= PFRFUSE;
			++csyl;
		}
		if ((ptp[0]&PCONT) == 0)	/* Stop the scan.	*/
			return (TRUE);
		pp1 = pp2;					/* Advance.			*/
		goto loop;		
	}
	if (csyl >= pLts_t->nsyl-1)		/* No sylables.		*/
		return (TRUE);
#ifdef ENGLISH		
	if (pp1 != lpp					/* V-C1-C2 case.	*/
	&& ls_adju_is_voc(pp1) != FALSE
	&& (pp1=pp1->p_fp) != lpp
	&& ls_adju_is_cons(pp1) != FALSE
	&& (pp2=pp1->p_fp) != lpp
	&& (pp2->p_flag&PFSYLAB) != 0
	&& pp1->p_sphone == pp2->p_sphone)
	{	
		pLts_t->sylp[csyl]->p_flag |= PFRFUSE;
	}        
#endif	
	return (TRUE);
}

/*
 *	Function Name:
 *		ls_adju_bestdefault	
 *
 *	Description:
 * 	Given the number of sylables in the root
 * 	form ("pLts_t->rsyl") set "pLts_t->psyl" to the sylable number for the
 * 	best default stress position. One sylable words are trivial.
 * 	Two sylable words are usually stressed on the first sylable,
 * 	but there are some exceptions. Three sylable words are
 * 	handled using the Nessly rule. Long words get penultimate
 * 	stress.
 *
 *	Arguments:             
 *		None
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */ 
void ls_adju_bestdefault(PLTS_T pLts_t)
{                       
#ifdef ENGLISH
	switch (pLts_t->rsyl) 
	{
		case 0:					/* Crap.		*/
		case 1:					/* 1 sylables.		*/
			pLts_t->psyl = 0;
			break;

		case 2:					/* 2 sylables.		*/
			ls_adju_best2syl(pLts_t);
			break;

		case 3:					/* 3 sylables.		*/
			pLts_t->psyl = 0;
			if (ls_adju_is_cons(pLts_t->sylp[2]->p_bp) != FALSE)
				pLts_t->psyl = 1;
			break;

		default:				/* 4 or more sylables.	*/
			/* NCS    01/30/1997
			 * This is a little patch to fix the problem of the misplacement of the stress
			 * marker.  Words ending in "ia" would have the stress on the end in stead of
			 * the proper location.
			 *
			 * You can see in the following if statement that the phoneme are checked for
			 * "ia".  And if this is true, the stress is placed BEFORE this spot.
			 * That is why this check is placed in the "4 or more sylables" section.
			 *
			 * But, the first check statement in the if check
			 * you should see that the pointers used p_bp which checks
			 * for the second to last phoneme.  This is the only way to properly find out if
			 * the word ends in "ia" (IYAX).
			 */
#ifdef ENGLISH_US
			if ((pLts_t->sylp[pLts_t->rsyl-1])->p_bp->p_sphone == US_IY &&
				pLts_t->sylp[pLts_t->rsyl-1]->p_sphone == US_AX)
#endif
#ifdef ENGLISH_UK
			if ((pLts_t->sylp[pLts_t->rsyl-1])->p_bp->p_sphone == UK_IY &&
				pLts_t->sylp[pLts_t->rsyl-1]->p_sphone == UK_AX)
#endif
				pLts_t->psyl = pLts_t->rsyl-3;
			else
				pLts_t->psyl = pLts_t->rsyl-2;
			break;
	}       
#endif
#ifdef GERMAN
        pLts_t->psyl = 0;
#endif	
	/* return (0); */	/* return value not used */
}
/*
 *	Function Name:
 *		ls_adju_best2syl
 *
 *	Description:
 * 	Place best default stress for two sylable
 * 	words. The pointers to the two sylables are always
 * 	in "pLts_t->sylp[0]" and "pLts_t->sylp[1]". The return value is returned
 * 	(origin 0) in "pLts_t->psyl".
 *
 *	Arguments:             
 *		None
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void ls_adju_best2syl(PLTS_T pLts_t)
{
	 PHONE	*pp;
	 int	ph;

	pp = pLts_t->sylp[0];
	ph = pp->p_sphone;
	/* Never stress [@] if initial sylable, like "abridge".		*/
#ifdef ENGLISH_US
	if (ph==US_AE && (pp->p_fp->p_flag&PFSYLAB)!=0) 
#endif
#ifdef ENGLISH_UK
	if (ph==UK_AE && (pp->p_fp->p_flag&PFSYLAB)!=0) 
#endif
#ifdef GERMAN
	if (ph==GR_AE && (pp->p_fp->p_flag&PFSYLAB)!=0) 
#endif
	{
		pLts_t->psyl = 1;
		return;
	}
	/* Never stress [@], [E], [I], [^] in initial VCC sylable.	*/
	if (ls_adju_is_voc(pp) != FALSE
	&& ls_adju_is_cons(pp->p_fp) != FALSE
	&& ls_adju_is_cons(pp->p_fp->p_fp) != FALSE) 
	{
#ifdef ENGLISH_US
		if (ph==US_AE || ph==US_EH || ph==US_IH || ph==US_AH) 
#endif
#ifdef ENGLISH_UK
		if (ph==UK_AE || ph==UK_EH || ph==UK_IH || ph==UK_AH) 
#endif
#ifdef GERMAN
		if (ph==GR_AE || ph==GR_EH || ph==GR_IH || ph==GR_AH) 
#endif
		{
			pLts_t->psyl = 1;
			return;
		}		
	}
	/* Best default is stress first sylable.			*/
	pLts_t->psyl = 0;
}

/*
 *	Function Name:
 *		ls_adju_final_fixes	
 *
 *	Description:
 * 	The primary stress has been placed. 
 * 	Now is the time to perform a number of final
 * 	fixups on the word. Reduction blocks are placed on
 * 	alternating sylables, starting at the primary stress point
 * 	and sweeping toward the start of the word. Next [xn] in
 * 	word initial position is zapped to [^n] and primary stressed.
 * 	Lastly, if a 3 sylable word ends in [ax], cancel any
 * 	reduction block on the sylable.
 *
 *	Arguments: PLTS_T pLts_t
 *
 *	Return Value: void
 *
 *	Comments:
 *
 */
void ls_adju_final_fixes(PLTS_T pLts_t)
{

#if defined ENGLISH_US || defined ENGLISH_UK // NAL warning removal
	PHONE	*pp;
#endif
	int	last;

	last = SPRI;
	while (pLts_t->psyl!=0 && pLts_t->sylp[pLts_t->psyl-1]->p_stress!=SNONE) 
	{
		--pLts_t->psyl;
		last = pLts_t->sylp[pLts_t->psyl]->p_stress;
	}
	while (pLts_t->psyl != 0) 
	{
		--pLts_t->psyl;
		if (last == SUN) 
		{		/* Block reduction.	*/
			if (pLts_t->sylp[pLts_t->psyl]->p_stress == SNONE)
				pLts_t->sylp[pLts_t->psyl]->p_flag |= PFBLOCK;
			last = SSEC;
		} 
		else
		{
			last = SUN;
		}
		if (pLts_t->sylp[pLts_t->psyl]->p_stress == SNONE)
			pLts_t->sylp[pLts_t->psyl]->p_stress = SUN;
	}
#ifdef ENGLISH_US
	pp = pLts_t->phead.p_fp;			/* [xn] => [^n].	*/
	if (pp->p_sphone ==US_AX
	&& (pp=pp->p_fp) != &pLts_t->phead
	&&  pp->p_sphone ==US_N
	&& (pp=pp->p_fp) != &pLts_t->phead
	&& (pp->p_flag&PFSYLAB) != 0) 
	{
		pp = pLts_t->phead.p_fp;
		pp->p_sphone = US_AH;
		pp->p_uphone = SIL;
		pp->p_stress = SPRI;
	}
	if (pLts_t->nsyl == 3) 
	{	/* "camera" rule.	*/
		pp = pLts_t->phead.p_bp;

#ifdef DGC
		if (pp->p_sphone ==US_Z)		/* "cameras".		*/
			pp = pp->p_bp;
		if (pp!=&pLts_t->phead && pp->p_sphone==US_AA && pp->p_uphone==US_AX)
			pLts_t->sylp[2]->p_flag &= ~PFBLOCK;
#else
		if (pp->p_sphone==US_AA && pp->p_uphone==US_AX)
			pLts_t->sylp[2]->p_flag &= ~PFBLOCK;
#endif
	}       
#endif //ENGLISH_US
#ifdef ENGLISH_UK
	pp = pLts_t->phead.p_fp;			/* [xn] => [^n].	*/
	if (pp->p_sphone ==UK_AX
	&& (pp=pp->p_fp) != &pLts_t->phead
	&&  pp->p_sphone ==UK_N
	&& (pp=pp->p_fp) != &pLts_t->phead
	&& (pp->p_flag&PFSYLAB) != 0) 
	{
		pp = pLts_t->phead.p_fp;
		pp->p_sphone = UK_AH;
		pp->p_uphone = SIL;
		pp->p_stress = SPRI;
	}
	if (pLts_t->nsyl == 3) 
	{	/* "camera" rule.	*/
		pp = pLts_t->phead.p_bp;

#ifdef DGC
		if (pp->p_sphone ==UK_Z)		/* "cameras".		*/
			pp = pp->p_bp;
		if (pp!=&pLts_t->phead && pp->p_sphone==UK_AA && pp->p_uphone==UK_AX)
			pLts_t->sylp[2]->p_flag &= ~PFBLOCK;
#else
		if (pp->p_sphone==UK_AA && pp->p_uphone==UK_AX)
			pLts_t->sylp[2]->p_flag &= ~PFBLOCK;
#endif
	}       
#endif   //ENGLISH_UK
}
/*
 *	Function Name:
 *		ls_adju_allo1	
 *
 *	Description:
 * 	This allophonic pass runs
 * 	before sylabification and stress. Its
 * 	most important job is to finish up the code
 * 	for plurals and the "-ed" suffix. This code
 * 	must run before the sylables are done as
 * 	it may add vowels.
 *
 *	Arguments:
 *		PHONE *fpp		The start of the phone string
 *		PHONE *lpp		The end of the phone string
 *
 *	Return Value: void  
 *
 *	Comments:
 *
 */
#ifdef ENGLISH_US
void ls_adju_allo1(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp)
{
	PHONE	*pp1;
	PHONE	*pp2;
	int	i;

	pp1 = fpp;				/* Left end.		*/
	while (pp1 != lpp) 
	{			/* Until right end.	*/
		/*
		 * [z] > [|][z] / [+Cons,+Sib] + - #
		 * [z] > [s]    / [+Cons,-Voice] + - #
		 */
		if (pp1->p_sphone == US_Z		/* Phoneme is "z"	*/
		&& (pp1->p_flag&PFMORPH) != 0	/* at left end of morph	*/
		&& pp1->p_fp == lpp		/* and right is "#"	*/
		&& pp1 != fpp) 
		{		/* and stuff on left.	*/
			pp2 = pp1->p_bp;
			i = pfeat[pp2->p_sphone];
			if ((i&(PCONS|PSIB)) == (PCONS|PSIB)) 
			{
				if (ls_adju_ins_phone(pLts_t,pp1, US_IX, SIL, SUN) == FALSE)
					return;
				pp1 = pp1->p_fp;
				continue;
			}
			if ((i&(PCONS|PVOICE)) == PCONS) 
			{
				pp1->p_sphone = US_S;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/*
		 * [d] > [|][d] / {[t],[d]} + - #
		 * [d] > [t]    / [+Cons,-Voice] + - #
		 */
		if (pp1->p_sphone == US_D			/* Phoneme is "d"	*/
		&& (pp1->p_flag&PFMORPH) != 0	/* at left end of morph	*/
		&& pp1->p_fp == lpp				/* and right is "#"	*/
		&& pp1 != fpp) 
		{		
			/* and stuff on left.	*/
			pp2 = pp1->p_bp;
			i = pp2->p_sphone;
			if (i==US_T || i==US_D) 
			{
				if (ls_adju_ins_phone(pLts_t,pp1, US_IX, SIL, SUN) == FALSE)
					return;
				pp1 = pp1->p_fp;
				continue;
			}
			if ((pfeat[i]&(PCONS|PVOICE)) == PCONS) 
			{
				pp1->p_sphone = US_T;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		pp1 = pp1->p_fp;
	}
}
#endif /* #ifdef ENGLISH_US */
#ifdef ENGLISH_UK
void ls_adju_allo1(PLTS_T pLts_t,PHONE *fpp, PHONE *lpp)
{
	PHONE	*pp1;
	PHONE	*pp2;
	int	i;

	pp1 = fpp;				/* Left end.		*/
	while (pp1 != lpp) 
	{			/* Until right end.	*/
		/*
		 * [z] > [|][z] / [+Cons,+Sib] + - #
		 * [z] > [s]    / [+Cons,-Voice] + - #
		 */
		if (pp1->p_sphone == UK_Z		/* Phoneme is "z"	*/
		&& (pp1->p_flag&PFMORPH) != 0	/* at left end of morph	*/
		&& pp1->p_fp == lpp		/* and right is "#"	*/
		&& pp1 != fpp) 
		{		/* and stuff on left.	*/
			pp2 = pp1->p_bp;
			i = pfeat[pp2->p_sphone];
			if ((i&(PCONS|PSIB)) == (PCONS|PSIB)) 
			{
				if (ls_adju_ins_phone(pLts_t,pp1, UK_IX, SIL, SUN) == FALSE)
					return;
				pp1 = pp1->p_fp;
				continue;
			}
			if ((i&(PCONS|PVOICE)) == PCONS) 
			{
				pp1->p_sphone = UK_S;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/*
		 * [d] > [|][d] / {[t],[d]} + - #
		 * [d] > [t]    / [+Cons,-Voice] + - #
		 */
		if (pp1->p_sphone == UK_D			/* Phoneme is "d"	*/
		&& (pp1->p_flag&PFMORPH) != 0	/* at left end of morph	*/
		&& pp1->p_fp == lpp				/* and right is "#"	*/
		&& pp1 != fpp) 
		{		
			/* and stuff on left.	*/
			pp2 = pp1->p_bp;
			i = pp2->p_sphone;
			if (i==UK_T || i==UK_D) 
			{
				if (ls_adju_ins_phone(pLts_t,pp1, UK_IX, SIL, SUN) == FALSE)
					return;
				pp1 = pp1->p_fp;
				continue;
			}
			if ((pfeat[i]&(PCONS|PVOICE)) == PCONS) 
			{
				pp1->p_sphone = UK_T;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		pp1 = pp1->p_fp;
	}
}
#endif /* #ifdef ENGLISH_UK */

/*
 *	Function Name:
 *		ls_adju_del_gemphone	
 *
 *	Description:
 * 	Do all of the dirty work for the
 * 	deletion of a geminate pair. The "pp" points
 * 	to the second element of the pair. The "ph" is
 * 	what the final phoneme will be. Handles all of the
 * 	details of flag and stress update, then it
 * 	deletes the first one.
 *
 *	Arguments:              
 *		PHONE 	*pp
 *		int 	ph
 *
 *	Return Value: void
 *
 *	Comments:
 *
 */
void ls_adju_delgemphone(PLTS_T pLts_t,PHONE *pp, int ph)
{
	PHONE *bp;

	bp = pp->p_bp;					/* Point at first.	*/
	pp->p_sphone = ph;				/* Zap phoneme.		*/
	pp->p_flag |= bp->p_flag;		/* Move flags forward.	*/
	if (bp->p_stress > pp->p_stress)/* Keep strongest.	*/
		pp->p_stress = bp->p_stress;
	ls_adju_del_phone(pLts_t,bp);	/* Delete first one.	*/ 
}
/*
 *	Function Name:	
 *		ls_adju_is_obs
 *
 *	Description:                               
 *		this function checks to see if thephonemes pointed to by
 *		pp is type OBS
 *
 *	Arguments:
 *		PHONE	*pp		the phoneme to be checked
 *
 *	Return Value:
 *		TRUE	If the phoneme is tyoe OBS
 *		FALSE	otherwise
 *
 *	Comments:
 *
 */
int ls_adju_is_obs(PHONE *pp)
{
	if ((pfeat[pp->p_sphone]&POBS) != 0)
	return (TRUE);
	return (FALSE);
}
/*
 *	Function Name:
 *		ls_adju_ins_phone
 *
 *	Description:            
 * 	Insert a new phoneme into the
 * 	PHONE chain, immediately before the PHONE
 * 	node pointed to by "fpp". The "sph" and "uph"
 * 	set the stressed and unstressed phoneme code fields
 * 	of the node. The flags are moved ahead. The stress
 * 	is set to "stress". The index chain is cleared.
 * 	Return TRUE if successful; FALSE if a new node is
 * 	unavailable.
 *
 *	Arguments:           
 *		PHONE	*fpp		
 *		int 	sph
 *		int		uph
 *		int 	stress
 *
 *	Return Value: int    
 *		TRUE 	if the phoneme was adde dto the list correctly
 *		FALSE	if there are no phonemes availableto allocate
 *
 *	Comments:
 *
 */
int ls_adju_ins_phone(PLTS_T pLts_t,PHONE *fpp, int sph, int uph, int stress)
{
	PHONE	*ipp;
	PHONE	*bpp;

	if ((ipp=ls_rule_phone_alloc(pLts_t)) == (PHONE *)NULL)		/* Get new node		*/
		return (FALSE);
	bpp = fpp->p_bp;			/* Get previous		*/
	bpp->p_fp = ipp;			/* Link in			*/
	ipp->p_fp = fpp;
	fpp->p_bp = ipp;
	ipp->p_bp = bpp;
//	ipp->p_ip = NULL;			/* No index chain	*/
	ipp->p_sphone = sph;		/* Phonemes			*/
	ipp->p_uphone = uph;
	ipp->p_flag = fpp->p_flag;	/* Move flags forward	*/
	fpp->p_flag = 0;
	ipp->p_stress = stress;		/* Set stress			*/
	fpp->p_stress = SNONE;
	return (TRUE);
}
/*
 *	Function Name:
 *		ls_adju_del_phone	
 *
 *	Description:         
 *		delete thephonemes pointed to by *dpp
 *
 *	Arguments:                               
 *		PHONE *dpp	The phoneme to delete
 *
 *	Return Value:                        
 *		None
 *
 *	Comments:
 * 		Any index
 * 		marks attached to the deleted phoneme are added
 * 		to the end of the index chain of the phoneme that
 * 		preceeds the deleted phoneme; this makes the
 * 		index marks come out in the right order.
 *		
 *
 */
void ls_adju_del_phone(PLTS_T pLts_t,PHONE *dpp)
{
	PHONE	*bpp;
	PHONE	*fpp;

	bpp = dpp->p_bp;				/* Get previous, next	*/
	fpp = dpp->p_fp;
	bpp->p_fp = fpp;				/* Break links			*/
	fpp->p_bp = bpp;

	ls_rule_phone_free(pLts_t,dpp);	/* Free the node		*/
}       
 
#endif /* #if (defined ENGLISH) || (defined GERMAN) */ 


/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	ls7.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Fancy dictionary search.
 * Needs to look in both the user and the
 * builtin dictionaries. Understands a limited bit of
 * affix stripping, so that simple plurals and things
 * work with dictionary entries.
 *
 ***********************************************************************
 *    Revision History:
 * 01 05-Apr-85	DGC	Changed some [|] to [x] as per DHK.
 * 02 08-Apr-85 DGC	Changed the third argument to the
 *			lookup routines to conditionally block
 *			the output of ")" and "(".
 * 03 16-Apr-85 DGC	Changes for Tony. Add "-able" (2 pass).
 *			Add "-ness", "-ize" (dumb).
 * 04 10-May-85 DGC	Undid 01, sounded bad.
 * 05 15-May-85 DGC	Fixed insertion of [|] in plurals.
 *			Didn't insert [|] in words like "references".
 * 06 17-May-85 DGC	"TT" is a pair more often than it is not.
 *			Removed it from the blocking list in the pair
 *			deletion routine.
 * 07 18-May-85 DGC	Added "-ings", which works just like "-ing"
 *			except for the added [z]. Added "-ers", which
 *			is just like "-er" except for the added [z].
 *			These are conditional, in case Tony and/or
 *			Dennis change their minds.
 * 08 24-May-85 DGC	Changed "lastlook" to the more general "lphone".
 *			Look in "ls1.c" for the reason.
 * 09 05-Jun-85 DGC	Change 05 was not done quite right; Dennis
 *			and I didn't understand one another.
 * 10 27-Jun-85 DGC	Made "-ers" work right.
 * 11 18-Jul-85 DGC	Added some conditional code to make the
 *			"ss-es" and "sh-es" work the way that Tony
 *			thinks it should work.
 * 12 12-Aug-85 DGC	"ment" used to be [m|nt], changed to [mxnt]
 *			to be the same as the dictionary.
 * 13 18-Sep-85 DGC	Stylistic changes, suggested by "lint".
 * ----------------	First 23 class release, voided out by Engineering.
 * 14 03-Dec-85 DGC	The two dictionary searches (blook, ulook)
 *			were in the wrong order. The user dictionary
 *			must be searched first. Thanks to WeatherBank.
 * ----------------	Released as C5005 V1.0 firmware.
 * 15 21-Oct-86 DGC	Changes for KRM.
 * 16 29-NOV-89 EAB	Changes for NKR-It's OK as is becuase NKR has a user dictionary.
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include	"lsdef.h"
#include	"lsconst.h"

#define	INGS	1			/* Use "-ings".			*/
#define	ERS	1			/* Use "-ers".			*/
#define	SSES	1			/* Use "ss-es" code.		*/

extern	short	lphone;			/* Last phoneme put out.	*/
extern	LETTER	*backpair();		/* Random forward reference.	*/
extern	LETTER	*backscan();		/* Random forward reference.	*/

/*
 * Look up a word. The word is stored
 * in an array of LETTER structures, bracketed by
 * the "llp" and "rlp" pointers. The "context" is drawn
 * from the set in "lsdef.h". Return a standard lookup
 * status code. Output index marks on success.
 */

lookup(llp, rlp, context)
 LETTER	*llp;
LETTER		*rlp;
int context;
{

	 int	flag;

	 	
	if((flag=blook(llp,rlp,context)) != MISS)
	  /*	sendindex(llp,rlp);*/
	return(flag);
}

/*
 * Put out the phonemes necessary to pluralize
 * the last word. Based on the last phoneme, it puts out
 * [s], [z], [|s], or [|z]. The last phoneme put out by
 * anyone is in the external "lphone". This is used here,
 * and also by the "60s" code in "ls1.c".
 */

pluralize()
{
	 int	feats;
   
	feats = 0;
	if (lphone < TOT_ALLOPHONES)
		feats = pfeat[lphone];
	if ((feats&(PCONS|PSIB)) == (PCONS|PSIB)) {
		sendphone(IX);
		sendphone(Z);
	} else if ((feats&(PCONS|PVOICE)) == PCONS)
		sendphone(S);
	else
		sendphone(Z);
		return (0);
}

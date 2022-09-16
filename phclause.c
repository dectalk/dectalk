/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *	Copyright 1984				Dennis H. Klatt
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
 *    File Name:	phclause.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	Synthesize a clause from phonemic ascii input
 *		Assumes all voice changing commands have been removed
 *		 and acted upon by higher-level code.
 *		Assumes optional user-specified durations in user_durs[]
 *		Assumes optional user-specified f0/notes in user_f0[]
 *	Vax debugging 'printsw' values (set by '-dnnn' argument to KL)
 *			    1 -> KLPARSE print output
 *			    2 -> PHSORT print output
 *			    4 -> PHONOL print allophone output
 *			    8 -> PHDUR which rules activated
 *			   16 -> PHDUR print output only
 *			   32 -> PHF0 print output
 *			   64 -> PHONET print parameter tracks
 *			  128 -> PHONET save parameter data in file
 *			  256 -> VAXWAVE Save waveform in file (DEFAULT)
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Sep-84 DK	Initial creation
 * 0002 27-Dec-84 DGC	Modified as required for 80186.
 * 0003 24-Jul-85 DK	Add one-frame delay to all pars except AV,T0,TL
 * 0004 08-Aug-85 DGC	Haltsw (FLAG) => halting (short), new sync.
 * 0005 15-FEB-96 CJL	Removed all KRM code.
 */

#include "phdefs.h"

/*    Input variables to PHCLAUSE()					     */
extern short symbols[]; /* Integer represent of input string         */
extern short *user_durs;/* Array of user-specified durs (optional)   */
extern short *user_f0;   /* Array of user-specified f0 (optional)     */
//extern short *user_offset;/* Array of user-specified f0 time offsets */
extern short nsymbtot;  /* Number of input symbols		     */
extern FLAG  loadspdef;   /* Convert curspdef[] to spdeftochip[], and    */
/*  send this speaker def array to chip if=1 */
extern short ph_init;   /* Initialize program (at startup time or    */
/*  after DT_STOP emergency halt) if = 0     */
extern short printsw;   /* Select print options, VAX only	     */
/*    Input variables used in subroutines called from here:		     */
/*	extern short curspdef[]	   Speaker definition			     */
/*	extern short sprate;	   Nominal speaking rate in words/minute     */
/*	extern short compause;	   Extra pause between clauses (DELETE?)     */
/*	extern short perpause;	   Extra pause between sentences (DELETE?)   */

/*    Output of PHCLAUSE() is set of commands to SENDC()		  */
extern short parstochip[]; /* Array of output pars for double frame      */
extern int docitation;
/*    Output of PHSORT()						  */
extern char *phonemes; /* Integer represent of real phonemes     */
extern short *sentstruc;/* Struct feats, (mod phone[],nphonetot)  */
extern short nphonetot; /* Number of input symbols		  */
/* Output also reordered user_durs[],user_f0[];		  */
/*    Output of PHALLOPH()						  */
extern char	 allophons[];  /* Integer rep of phonetic string	  */
extern short allofeats[];  /* Structural features		  */
extern short nallotot;      /* Number of phones in phonetic string */
/*    Output of PHTMING()						  */
extern short allodurs[];   /* Duration in frames for each phone   */
extern long longcumdur;   /* For waveform simulation printout only  */
/*    Output of PHINTON()						  */
extern short f0tar[];   /* F0 target commands, in Hz*10		  */
extern short f0tim[];   /* Times between commands, in frames	  */
extern short nf0tot;   /* Number of commands for cur clause	  */

/*    Used by PHDRAW(), initialized here				  */
extern short tcum;   /* Current time in frames re phone begin  */
extern short durfon;   /* Duration in frames of current phone    */
/*    Used here and by PHSETTTAR.C, PHSAVPAR.C			  */
extern char nphone;   /* Index to current phone in allophons[]  */
/*    Used by PHDRAWT0(), initialized here				  */
extern short nf0ev;   /* Index to current f0 command in f0tar[] */
/*    Used here */
extern char   lineartilt[];   /* Linearize tilt @ 2500 Hz	*/

extern int asperation;   /* lung stuff */

/* protype section for non-external funtions */
void send_pars(void);

#ifndef MINIMAL_SYNTH
static short n;
#endif
short initpardelay=0;
/*
 * moved from phclause to allow syllables to be broken up after
 * allophonics ...
 */

void phclause()
{


   /* Initialization (init variables, zero arrays */


	init_clause();

   /* 1. If speaker def changed, now it time to really change it.		*/
   /* The old (KL) code used to set "initsw". This gets done in the	*/
   /* "send_pars" routine now (it only mattered on halt).			*/
   if (loadspdef != FALSE)
   {
      loadspdef = FALSE;
      setspdef();
   }
   /* 2. Sort input symbols into real phonemes vs. structural features	     */
   if(phsort() == false)
      return;            /* INPUT ARRAY:   symbols[nsymbtot]    */
   /* (optional):   user_durs[nsymbtot]  */
   /* OUTPUT ARRAYS: phonemes[nphonetot]  */
   /* sentstruc[nphonetot] */

   /* 3. Phonological rules, select allophones				*/



   phalloph();      /* INPUT ARRAYS: phonemes[nphonetot]	*/
   /* sentstruc[nphonetot]	*/
   /* OUTPUT ARRAYS: allophons[nallotot]	*/
   /* allofeats[nallotot]	*/
   /* Docitation is a specail flag that needs to be cleared after visiting *
    *	PHALLOPH. It is set in LTS to indicate that this word should be sited *
    * if a single word. lTS can see the word but only ph sees the clause    */
   docitation=FALSE;
   /* 4. Duration rules							*/
   phtiming();      /* INPUT ARRAYS: allophons[nallotot]	*/
   /* allofeats[nallotot]	*/
   /* OUTPUT ARRAY: allodurs[nallotot]	*/

   /* 5. Fundamental frequency rules					*/

   phinton();      /* INPUT ARRAYS: allophons[nallotot]	*/
   /* allofeats[nallotot]	*/
   /* allodurs[nallotot]	*/
   /* OUTPUT ARRAYS: f0tim[nf0tot]		*/
   /* f0tar[nf0tot]		*/

   /* 6. Phonetic Component (draw parameter values every 6.4 ms)		*/

   init_pars();      /* Initialize, routine included below	*/

   /* For each 6.4 msec frame of current clause */
   while (TRUE)
   {
      /* If time exceeds duration of current phone, Move to next one */
      if (++tcum >= durfon)
      {
#ifndef MINIMAL_SYNTH
         /* Handle index and index reply commands.			*/
#ifndef NO_INDEXES
		  if (nphone != -1)
            check_index(nphone);
#endif
#endif
         nphone++;

         /* Graceful exit if phonemes used up */
         if (exit_if_done())
         {
            return;
         }
         /* Reset tcum to time re begin curr phone */

         tcum -= durfon;
         durfon = allodurs[nphone];

         /* Call subroutine to reset targets and trans specs (PHSETTAR.C) */

         phsettar();
      }
      /* Determine next value of f0 contour, period and TILT (PHDRAWT0.C)  */

      pht0draw();

      /* Call draw routine to set next value for 15 control pars (PHDRAW.C) */

      phdraw();

      /* Send pars to synthesizer (or print/save them) */
      send_pars();

		
   }
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

init_clause()
{

int i;

	for (i = 0;i<(NPHON_MAX+SAFETY+2); i++)
	{
	allophons[i] = 0;   /* Allophones, in integer	*/
	allofeats[i] = 0;   /* Feats of allophones		*/
	allodurs[i]  = 0;   /* Dur in frames of each phone	*/
	}


#ifdef   vax
   /* First symbol must be a COMMA, if not push clause down and insert one */
   if ((symbols[0] != COMMA) && (symbols[0] != PERIOD))
   {
      printf("ERROR in PHCLAUSE.C:");
      printf(" Illegal input clause -- doesn't begin with COMMA\n");
   }
#endif

   /* Initialization */
   if (ph_init == 0)
   {
      ph_init = 1;
      loadspdef = TRUE;      /* Force re-init of synthesizer */
   }
   if (loadspdef == TRUE)
   {
      nf0ev = -2;         /* Make f0 jump to initial value */
   }
   else
   {
      nf0ev = -1;         /* Weak initialization  phdrawt0.c */
   }
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*   THIS ROUTINE MUST BE CALLED BEFORE CALLING KLPARSE THE FIRST TIME	   */
/*	The logic of array sharing is as follows.  (1) Input phonemes are
 *   converted to allophones in PHALLOPH.C.  Once converted to allophones,
 *   phonemes are not used again and can be zapped.  The conversion process tends
 *   to delete symbols, only occationally generating a new symbol.  Therefore,
 *   if one puts phonemes at the back end of the allophone array, no conflicts
 *   should occur.  The exact same argument holds for sentstruc[], user_durs[],
 *   and user_reply[].  (2) The arrays f0tar[] and f0tim[] are used in
 *   PHINTON to hold f0 commands.  If user-specified f0 commands for SINGING,
 *   USER_SPECIFIED_F0_TARS, or USER_SPECIFIED_HATS are input, they can be
 *   placed at the ends of these arrays.  In the case of singing and F0_TARS,
 *   the commands are synched with the phonemes, and the same argument as (1)
 *   holds.  In the case of HATS, there is one command per ['] or ["] symbol
 *   in the input, and each such command results in the creation of 2 output
 *   commands during execution of PHINTON.  For this case, HATS commands
 *   can be put in the back of the f0tar[],f0tim[] arrays in every other
 *   position.
 */

init_phclause()
{
   /* Share array since fewer phonemes */
   /* Note SAFETY offset to allow a few inserts to allophons[] output string */

   phonemes = &allophons[SAFETY];
   sentstruc = &allofeats[SAFETY];
#ifndef MINIMAL_SYNTH
   user_durs = &allodurs[SAFETY];
   user_f0 = &f0tar[SAFETY];
//   user_offset = &f0tim[SAFETY];
#endif
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

init_pars()
{
   tcum = -1;   /* Time in frames relative to begin current phoneme */
   nphone = -1;   /* Pointer to current phoneme */
   durfon = 0;   /* Duration of current phoneme in frames */


}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

exit_if_done()
{
static int i,n;
   if (nphone >= nallotot)
   {   /* See if done */
#ifndef MINIMAL_SYNTH
      /* Zero arrays whose contents must be zero upon re-entry to phclause() */
      for (n=0; n<=nsymbtot; n++)
      {

         user_durs[n] = 0;
         user_f0[n] = 0;
//         user_offset[n] = 0;

      }
#endif
	  i++;
      return(TRUE);
   }
   i++;
   return(FALSE);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

short far *delaypars;

void send_pars(void)
{
   int   asp_bump;

   asp_bump = 0;

   /* Special buffer to delay all pars except AV, TILT, & T0 by one frame */
   /* 1. Move non-delayed pars to output buffer.	*/
   /* 2. Send output buffer.					*/
   /* 3. Move delayed pars to output buffer.			*/

   if (initpardelay == 0)
   {
      initpardelay++;
      delaypars = spcget(SPC_type_voice);
   }
   else
   {
      if(delaypars[OUT_AV] = parstochip[OUT_AV])
         asp_bump=true;
      /*
       * Linearize the actual tilt to be more like the requested tilt
       */
      delaypars[OUT_TLT] = lineartilt[parstochip[OUT_TLT]];
      delaypars[OUT_T0] = parstochip[OUT_T0];

      /*
       *	  Panic halt. Kill off this clause. The SPC handler notes that
       *	  the "halting" is non 0, and discards packets.
       */
      if (KS.halting)
      {
         tcum = durfon;         /* Clobber the clause.	*/
         nphone = nallotot;
         ph_init = 0;         /* May be heavy-handed.	*/
         return;
      }
      /* Send frame of output parameters to synthesizer chip (in PHSENDC.C) */
	   spcwrite(delaypars);
      delaypars=spcget(SPC_type_voice);
   }
   delaypars[OUT_F1] = parstochip[OUT_F1];
   delaypars[OUT_B1] = parstochip[OUT_B1];
   delaypars[OUT_F2] = parstochip[OUT_F2];
   delaypars[OUT_B2] = parstochip[OUT_B2];
   delaypars[OUT_F3] = parstochip[OUT_F3];
   delaypars[OUT_B3] = parstochip[OUT_B3];
   delaypars[OUT_FZ] = parstochip[OUT_FZ];
   if(delaypars[OUT_A2] = parstochip[OUT_A2])
      asp_bump = true;
   if(delaypars[OUT_A3] = parstochip[OUT_A3])
      asp_bump = true;
   if(delaypars[OUT_A4] = parstochip[OUT_A4])
      asp_bump = true;
   if(delaypars[OUT_A5] = parstochip[OUT_A5])
      asp_bump = true;
   if(delaypars[OUT_A6] = parstochip[OUT_A6])
      asp_bump = true;
   if(delaypars[OUT_AB] = parstochip[OUT_AB])
      asp_bump = true;
   delaypars[OUT_AP] = parstochip[OUT_AP];

   /*
    *  add to asperation if there is sound ...
    */

   asperation += asp_bump;
}




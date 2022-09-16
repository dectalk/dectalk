/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *	Copyright 1984				 by Dennis H. Klatt
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
 *    File Name:	phvset.c
 *    Author:		Dennis Klatt
 *    Creation Date:01-JAN-1985
 *
 *    Functionality:
 * This file contains functions
 * to select new speakers, to change individual
 * fields of a speaker definition, and to
 * convert the values from the format used by
 * the voice commands to the format used by
 * the signal processor. Based on the one for
 * the new synthesizer.
 *
 ***********************************************************************
 *    Revision History:
 * 0001 01-Jan-85 DK	Initial creation
 * 0002 02-Jan-85 DGC	The speaker def. code called "SP_AS" "2".
 *			Not a bug, just a tidy up.
 * 0003 19-Jan-85 DGC	The LIMIT structure def. is now in phdefs.h
 * 0004 19-Feb-85 DK	Send to chip only pars that are used
 * 0005 13-Jun-85 DK	Add Vax-only code to print spdefs for manual
 * 0006 18-Jun-85 DGC	"g5" => "lo".
 * 0007 18-Jul-85 DK	Rescale "SP_FT".
 * 0008 25-Jul-85 DK	Rescale spdeftltoff.
 * 0009 4-apr-96 EAB SP_BR has had a bug since day one it wanted to be
 *						sp_br**2 >>1 not <<1 so that 100(max) is close to
 *						4096(1 in frac arith) + sp_br**2 >>1 aprox max
 *						value of 8192.
 * 0010 23-apr-96 tek	remove spurious printf from 0009 (v26)
 */

#ifdef   vax
#include   <stdio.h>
FILE *fopen(), *odev;
#endif

#include        "phdefs.h"

/* #define DEBUGVSET 1 */
extern short   malfem;      /* Speaker def param indicating sex */

extern   short   errors;         /* Error masks.			*/
extern   short   curspdef[];      /* Holds current speaker def.	*/
#ifndef MINIMAL_SYNTH
extern   short   var_val[];      /* Current ":nv" values.	*/
#endif

extern   FLAG   loadspdef;      /* Flag: need to load TMS320.	*/
extern   const short   *voidef_8[];      /* Speaker definition directory	*/
extern   short   f0_dep_tilt;      /* How much f0 changes tilt.	*/
extern   short   malfem;         /* MALE or FEMALE.		*/
extern   short   assertiveness;      /* How much f0 falls at end.	*/
extern   short   f0_lp_filter;      /* Cuttoff, f0 lowpass filter.	*/
extern   short   size_hat_rise;      /* F0 hat rise, HZ times 10.	*/
extern   short   scale_str_rise;      /* F0 scale factor, stress imp.	*/
extern   short   f0basefall;
extern   short   spdeflaxprcnt;
extern   short   spdeftltoff;
extern   short   spdefb1off;
extern   short   f0minimum;
extern   short   f0scalefac;
extern   short   last_voice;         /* reload voice */

extern   short   *p_locus;      /* Locus table.			*/
extern   short   *p_diph;      /* Dipthong table.		*/
extern   short   *p_tar;         /* Targets.			*/
extern   short   *p_amp;         /* Amplitudes.			*/

extern   short   arg1;         /* For "mulsh" et al.		*/
extern   short   arg2;
extern   short   arg3;

extern   const short   maleloc[];      /* Male tables.			*/
extern   const short   maldip[];
extern   const short   maltar[];
extern   const short   malamp[];
#ifndef NO_FEMALE 
extern   short   femloc[];      /* Female tables.		*/
extern   short   femdip[];
extern   short   femtar[];
extern   short   femamp[];
#endif
#ifdef   vax
extern   short   printsw;      /* Debug options.		*/
#endif

/*
 * This function is called by
 * "kl1" to zap a parameter in the current
 * speaker definition. The "which" is the "SP_"
 * symbol; the value is the value. Wild "which"
 * values are ignored. Wild values are pulled
 * into range, but log an error too.
 */

void setparam(which, value)
int which;
int value;
{
   register LIMIT   *lp;
   extern LIMIT limitTable[];

   if (which<SP_SEX || which>SP_SR)
      {   /* Check for junk.	*/
      return;
      }
   lp = &limitTable[which];
   if (value < lp->l_min)
      {      /* Lower limit check.	*/
      value = lp->l_min;
      }
   else if (value > lp->l_max)
      {      /* Upper limit check.	*/
      value = lp->l_max;
      }
   curspdef[which] = value;      /* Zap the value and	*/
   loadspdef = TRUE;               /* ask for reload.	*/
}
/*
 * Select a new voice. The
 * "voice" is a voice number, like
 * "PERFECT_PAUL". No need to range check
 * the number, because there is no ":vo",
 * only ":n?", and you cannot get a bad
 * voice, unless there is a bad bug.
 */
usevoice(voice)
int voice;
{
   register short   *newspdef;
   register int   i;

   newspdef = (short *)voidef_8[voice];      /* Copy into place.	*/
   for (i=0; i<SPDEF; ++i)
   curspdef[i] = newspdef[i];
   loadspdef = TRUE;         /* Ask for reload.	*/
   last_voice = voice;
}

#ifdef vax
/* Print all pars for all voices */

static short voice_order[] = {
      PERFECT_PAUL,
      HUGE_HARRY,
      FRAIL_FRANK,
      DOCTOR_DENNIS,
      BEAUTIFUL_BETTY,
      UPPITY_URSULA,
      WHISPERY_WILLY,      /* Actually Wendy */
      ROUGH_RITA,
      KIT_THE_KID
      };

static short param_order[] = {
      SP_SEX,
      SP_HS,
      SP_F4,
      SP_F5,
      SP_B4,
      SP_B5,
      SP_BR,
      SP_LX,
      SP_SM,
      SP_RI,
      SP_NF,
      SP_LA,
      SP_BF,
      SP_HR,
      SP_SR,
      SP_AS,
      SP_QU,
      SP_AP,
      SP_PR,
      SP_LO,
      SP_GV,
      SP_GH,
      SP_GF,
      SP_G1,
      SP_G2,
      SP_G3,
      SP_G4
      };

static short *param_name[] = {
      "SX", "HS", "F4", "F5", "B4", "B5",
      "BR", "LX", "SM", "RI", "NF", "LA",
      "BF", "HR", "SR", "AS", "QU", "AP", "PR",
      "LO", "GV", "GH", "GF", "G1", "G2", "G3", "G4"
      };

printvoice()
{
   register short   *newspdef;
   LIMIT *lp;
   extern LIMIT limitTable[];
   register int   i,j;
   short voice,temp;
   odev = fopen("manual.table", "w");
   fprintf(odev, "\nTable 5-3. Limits for spdef pars.\n\n");
   fprintf(odev,
   "   SYM   MIN   MAX\n");
   for (i=0; i<27; ++i)
      {      /* Limit should be SPDEF */
      fprintf(odev, "\n    %s", param_name[i]);
      lp = &limitTable[param_order[i]];
      fprintf(odev, "%6d%6d", lp->l_min, lp->l_max);
      if ((i == 5) || (i == 11) || (i == 18))
         {
         fprintf(odev, "\n");
         }
      }
   fprintf(odev, "\n\n\nTable 4-4. Speaker defs for all voices.\n");
   fprintf(odev,
   "\n    Paul Harry Frank Denis Betty Ursul Wendy  Rita   Kit\n");
   for (i=0; i<27; ++i)
      {      /* Limit should be SPDEF */
      fprintf(odev, "\n%s", param_name[i]);
      for (j=0; j<9; j++)
         {
         voice = voice_order[j];
         newspdef = voidef_8[voice];
         temp = newspdef[param_order[i]];
         fprintf(odev, "%6d", temp);
         }
      if ((i == 5) || (i == 11) || (i == 18))
         {
         fprintf(odev, "\n");
         }
      }
   printf("\n\nSave table of sp defs for manual in file 'manual.table'\n");
   exit(1);
}
#endif
#ifndef MINIMAL_SYNTH
/*
 * Make "var_val" the same as
 * the current speaker. Called from the
 * main loop in "phmain" on a SAVE.
 */
saveval()
{
   register int   i;

   for (i=0; i<SPDEF; ++i)
   var_val[i] = curspdef[i];
}
#endif
/*
 * This routine is called by
 * "phclause" to recompute and reload a speaker
 * definition. The magic numbers are pulled from the
 * "curspdef" array (where they are stored in a form that
 * is similar to the user format), converted to the bits
 * needed by the signal processor, and blasted over
 * to the TMS32010. This routine does not appear to do
 * all the stuff that "fcheck" and "convchip" did.
 * Is this intentional?
 */

setspdef()
{
   //register long   nlong;
   long   nlong;
   SP_CHIP    far *spdef;
#ifndef MINIMAL_SYNTH
   int   i;
#endif

   spdef = (SP_CHIP far *)spcget(SPC_type_speaker);
   malfem = (*curspdef+SP_SEX);      /* Determine SEX	*/

#ifndef NO_FEMALE
   if (malfem == MALE)
      {
      p_locus = (short *)maleloc;         /* Use MALE tables	 */
    p_diph = (short *)maldip;
      p_tar = (short *)maltar;
      p_amp = (short *)malamp;
      }
   else
      {
      p_locus = femloc;        /* Use FEMALE tables	 */
      p_diph = femdip;
      p_tar = femtar;
      p_amp = femamp;
      }
#else
	 p_locus = (short *)maleloc;         /* Use MALE tables	 */
// p_diph = (short *)maldip;
      p_tar = (short *)maltar;
      p_amp = (short *)malamp;
#endif
   /* The following are not sent to chip, just used by higher level routines */

   f0_dep_tilt = curspdef[SP_FT];                  /* FT -> FT		*/
   assertiveness = curspdef[SP_AS] * 41;            /* AS in % -> AS	*/
   f0_lp_filter = (1500 + 15 * curspdef[SP_QU]);   /* QU in % -> lp cuttoff */
   size_hat_rise = curspdef[SP_HR] * 10;            /* HR in Hz -> Hz*10	*/
   scale_str_rise = curspdef[SP_SR];               /* SR in Hz -> mult. sc. fac */
   f0minimum = curspdef[SP_AP] * 10;               /* AP -> f0min		*/
   f0scalefac = curspdef[SP_PR] * 41;                /* PR -> f0scale	*/
   f0basefall = curspdef[SP_BF] * 10;                /* baseline fall	*/
   spdeflaxprcnt = curspdef[SP_LX] * 41;           /* degree of lax breathiness */
   spdeftltoff = (curspdef[SP_SM] * 25) / 100;      /* SM (%) -> dB tilt	*/
	/*printf("WA?br  %d \n",curspdef[SP_BR]);*/
   spdefb1off = (curspdef[SP_BR] * curspdef[SP_BR]) >> 1;
   spdefb1off += 4096;                              /* BR -> B1-offset	*/

   /* BR=55 -> scale B1 by 2.5 factor	*/
   /* BR= 0 -> scale B1 by 1.0 factor	*/

   /*
    * The following are all sent to the synthesizer chip
    */

   (*spdef).fnscale = (200 - curspdef[SP_HS]) * 41;   /* HS -> FNscale	*/
   if (curspdef[SP_F4] == ZAPF)
      {
      (*spdef).r4cb = ZAPF;
      }
   else
      {
      nlong = curspdef[SP_F4];
      nlong = nlong * (*spdef).fnscale;
      (*spdef).r4cb = nlong >> 12;   /* F4 -> F4*FNscale	*/
      }
   (*spdef).r4cc = curspdef[SP_B4];   /* B4 -> B4		*/
   if ((*spdef).r4cb > 4950)
      {
      (*spdef).r4cb = ZAPF;      /* F4 too big, zap it	*/
      (*spdef).r4cc = ZAPB;      /* and bw	*/
      }
   if (curspdef[SP_F5] == ZAPF)
      {
      (*spdef).r5cb = ZAPF;
      }
   else
      {
      nlong = curspdef[SP_F5];
      nlong = nlong * (*spdef).fnscale;
      (*spdef).r5cb = nlong >> 12;   /* F5 -> F5*FNscale	*/
      }
   /*
    *  B5 -> B5
    */

   (*spdef).r5cc = curspdef[SP_B5];
   if ((*spdef).r5cb > 4950)
      {
      (*spdef).r5cb = ZAPF;                              /* F5 too big, zap it	*/
      (*spdef).r5cc = ZAPB;                              /* and bw	*/
      }
   (*spdef).r4pb = curspdef[SP_P4];				   /* F7 -> F4p 	  */
   (*spdef).r5pb = curspdef[SP_P5];				   /* F8 -> F5p 	  */
   (*spdef).t0jit = curspdef[SP_LA] * 8;			  /* LA -> LA/4096 of T0  */
   (*spdef).r5ca = curspdef[SP_G1];				   /* G1 -> G1 in dB	  */
   (*spdef).r4ca = curspdef[SP_G2];				   /* G2 -> G2 in dB	  */
   (*spdef).r3ca = curspdef[SP_G3];				   /* G3 -> G3 in dB	  */
   (*spdef).r2ca = curspdef[SP_G4];				   /* G4 -> G4 in dB	  */
   (*spdef).r1ca = curspdef[SP_LO];				   /* LO -> LO in dB	  */
   (*spdef).nopen1 = 4000 + (160 * (100 - curspdef[SP_RI]));	  /* RI -> K1		  */
   (*spdef).nopen2 = curspdef[SP_NF] * 4;			   /* NF -> K2	  */
   (*spdef).aturb = curspdef[SP_BR] + 9;			  /* BR -> BR	  */
   (*spdef).afgain = curspdef[SP_GF];			  /* GF -> GF		  */
   (*spdef).rnpgain = curspdef[SP_GN];			   /* GN -> GN		  */
   (*spdef).azgain = curspdef[SP_GV];			  /* GV -> GV		  */
   (*spdef).apgain = curspdef[SP_GH];			  /* GH -> GH		  */
/*   for(i=0;i<=31;i++)
      {
      printf("spdef[%d]=%d \n",i,curspdef[i]);
      }
*/ 
#ifdef PRINT_OUTPUT
   printf("r4cb is %d \n", (*spdef).r4cb);
   printf("r4cc is %d \n", (*spdef).r4cc);
   printf("r5cb is %d \n", (*spdef).r5cb);
   printf("r5cc is %d \n", (*spdef).r5cc);
   printf("r4pb  is %d \n", (*spdef).r4pb);
   printf("r5pb  is %d \n", (*spdef).r5pb);
//   printf("t0jit is %d \n", (*spdef).t0jit);
   printf("r5ca  is %d \n", (*spdef).r5ca);
   printf("r4ca  is %d \n", (*spdef).r4ca);
   printf("r3ca  is %d \n", (*spdef).r3ca);
   printf("r2ca  is %d \n", (*spdef).r2ca);
   printf("r1ca  is %d \n", (*spdef).r1ca);
   printf("nopen1 is %d \n", (*spdef).nopen1);
   printf("nopen2 is %d \n", (*spdef).nopen2);
   printf("aturb is %d \n", (*spdef).aturb);
   printf("fnscale is %d \n", (*spdef).fnscale);
   printf("afgain is %d \n", (*spdef).afgain);
   printf("rnpgain is %d \n", (*spdef).rnpgain);
   printf("azgain is %d \n", (*spdef).azgain);
   printf("apgain is %d \n", (*spdef).apgain);
   printf("notused is %d \n", 0);	/*hardwire */
#endif
   spcwrite((unsigned short _far *)spdef);
}

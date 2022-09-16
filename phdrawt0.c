/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright	1984				by Dennis H. Klatt
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
 *    File Name:	phdrawt0.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Extend f0 contour to obtain next value for period T0
 *      (low-pass filter a set of step and impulse commands)
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Dec-84 DK	Initial creation
 * 0002 27-Dec-84 DGC	Modify for 80186
 * 0003  3-Jan-85 DK	Fix handling of user f0 input commands
 * 0004 16-Jan-85 DK	Investigate desirability of adding rand var to target
 * 0005 29-Jan-85 DK	Cause AV to go down during glottal stop gesture
 * 0006 11-Feb-85 DK	Reduce random waver in f0
 * 0007  1-Mar-85 DK	Move scale_str_rise to PHINTON.C where it belongs
 * 0008 19-Mar-85 DK	Make segmental f0 gestures fast
 * 0009 17-Apr-85 DK	Segmental effects: only voiceless C fast, -stress less,
 *			 effect larger at beginning of V than at end.
 * 0010 13-May-85 DK	Make getcosine() into a table, cos[0] = 1.0 = 164
 * 0011 17-May-85 DK	Reduce frequencies of cosine pseudojitter
 * 0012  8-Aug-85 DK	Fix linear_interp() bug, overshoot of singing targets
 *
 */


#include	"dectalk.h"

#include   "phdefs.h"
/*#define DEBUGF0	 */
#define TWOPI   4096         /* For getcosine() function below */
#define PI   2048
#define PIOVER2   1024
#define ONE   (PIOVER2*PIOVER2)

/*    Input variables */
extern   short   *user_durs;               /* Where user durations go.	*/
extern   short   *user_f0;               /* Where user f0 commands go.	*/

extern short   f0tim[];
extern short   f0tar[];
extern short   nf0ev;      /* Hard reset if enter with = -2    */
/* Soft reset if enter with = -1    */
extern short   nf0tot;
extern short   f0mode;      /* NORMAL or USER_SPECIFIED	    */
#ifdef newpargrnotused
extern FLAG   newparagsw;   /* Set to 1 if new paragraph	    */
#endif
extern char   allophons[];   /* For calc of segmental influences */
extern short   allodurs[];
extern short   allofeats[];
extern short   nallotot;
extern short   malfem;      /* Speaker def param indicating sex */
extern short   f0_lp_filter;   /* Cuttoff freq of f0 low-pass filter */
extern short   f0minimum,f0scalefac,f0basefall;

/*    Output parameters: */
extern short parstochip[];   /* we modify T0 of output array	    */
extern short   f0;      /* Unscaled fund frequency times 10 */
extern short   f0prime;   /* Scaled output f0 (actual out is T0) */

#define HIGHEST_F0     5121   /* Maximum F0 in Hz*10			*/
#define LOWEST_F0      500   /* Minimum F0 in Hz*10			*/

#define F0SHFT           3   /* Shift to avoid roundoff errors in	*/
/*   filtering f0 commands		*/

/*    External constants from PHROM.C */
extern short f0glstp[];      /* F0 dip for a glottal stop */
extern short f0segtars[];   /* Array of segmental influences */
extern short featb[],place[];   /* Feature values for phonemes */
extern short vibdel[];      /* Trapezoidal vibratto spec */
extern short notetab[];      /* f0 target for notes C2-C5 (1-37) */
extern short getcosine[];   /* Cos tab for jitter and/or vibratto */
/*    Arguments for mlsh1, muldv() */
extern short arg1, arg2, arg3;
extern short randnum();
extern short avglstop;      /* Used to reduce AV during glstop */

/*    Incremental time counters */
short keepdur,keepallo,lastallo;
static short nfram, nframb, nframs, nframg;
static short extrad, tglstp, tglstn, segdur, segdrg;
#ifndef MINIMAL_SYNTH
static short initcosine;
#endif

/*    Fundamental frequency variables */
static short f0las1=0, f0las2=0, tarhat=0, tarimp=0, f0a2=0, f0b=0, f0a1=0;
static short dtimf0, phonex, f0seg, tarseg, tarseg1, beginfall, f0in;
static short /*firsttime,*/lastone,np, npg, nimp, tarbas, endfall, phocur, f0command;
static short timecos6,timecos10,timecos15,timecosvib;
static short f0beginfall,f0endfall;
/*    For user-specified targets/singing notes */
static short vibsw,newnote,delnote,delcum,f0start;

pht0draw()
{
   /* Automatic variables */
   short dtglst;
   int pseudojitter;

   /* Initialize */
   if (nf0ev <= -2)
   {         /* Hard initialization */
      /* Set Beginning and final frequency of baseline fall */
      f0beginfall = 1070 + (f0basefall>>1);   /* 107 Hz plus */
      f0endfall = 1070 - (f0basefall>>1);
      /* Time since last reset of baseline fall, in frames */
      nframb = 0;
      /* If within 32 ms (5 frames) of nframg, glottal stop gesture */
      /* is in progress */
      tglstp = -200;
      /* Set filter memory to init baseline fall (f0 in hz*10) */
      f0las1 = f0beginfall << F0SHFT;
      f0las2 = f0beginfall << F0SHFT;
      f0 = f0beginfall;
      tarhat = 0;
		/*firsttime = 1;*/
      tarimp = 0;
      /* Set smoothing constants for critical-damped 2nd-order sys */
      f0a2 = f0_lp_filter;
      f0b = FRAC_ONE - f0_lp_filter;
      f0a1 = f0a2 << F0SHFT;
      /* Variables relevent only if f0mode=SINGING */
      newnote = f0beginfall;
      delnote = 0;
      delcum = 0;
      f0start = f0;
      vibsw = 0;
      /* Initialize pointer to f0 command string */
      nf0ev = -1;
   }
   /* Reinit pointer and time of first f0 command if new clause */
   if (nf0ev == -1)
   {         /* Soft initialization */
      /* Set Beginning and final frequency of baseline fall */
      beginfall = f0beginfall;
      endfall = f0endfall;
#ifdef DEBUGF0
		printf("beginfall = %d endfall = %d\n",beginfall,endfall);
#endif
      nframb = 0;
#ifdef newpargrnotused
      /* Raise baseline for first sentence of a paragraph */
      if (newparagsw != FALSE)
      {
         beginfall += 120;
         endfall += 70;
#ifdef DEBUGF0
printf("At newpar sw %d %d	beginfall and endfall\n",beginfall,endfall);
#endif
#ifdef newpargrnotused
         newparagsw = FALSE;
#endif
      }
#endif
      /* Time between next and last f0 command, in frames */
      dtimf0 = f0tim[0];
      /* Pointer into dur and phone arrays */
      np = -1;
      npg = -1;
      nf0ev = 0;
      /* Time since beginning of cur phonetic segment, in frames */
      nframs = 12 - (f0_lp_filter>>8);
      /* Offset (in frames) to internal cum dur  */
      /* to compensate for low-pass filter time */
      /* constant (so that segmental influences */
      /* occur at right times.		   */
      /* Time since last f0 command, in frames */
      if (f0mode < SINGING)
      {
         nfram = nframs >> 1;   /* Start note slightly early */
      }
      else
      {
         nfram = 0;
      }
      nframg = 0;
      /* Extra time, in frames, used to delay f0 gesture assoc. */
      /* with a particular segment, e.g. at delayed vot */
      extrad = 0;
      /* Duration of current segment, in frames */
      segdur = 0;
      segdrg = 0;
		lastallo =0;
		keepallo=0;
		lastone = -1;
		keepdur=0;
      /* Must be at bottom of hat */
      tarhat = 0;       /* should be anyway, except for emergency halt */
   }
   /* End of initialization */

   /* See if new f0 commands issued					*/
   /* To get f0 commands to occur at right times, need to take		*/
   /* into account delay introduced by low-pass filter. Response to	*/
   /* a step command begins xx frames earlier than f0time[] request	*/
   /* so f0 gets half-way to target at nominal step onset time		*/

   while ((nfram >= dtimf0) && (nf0ev < nf0tot))
   {
      f0command = f0tar[nf0ev];   /* New target f0 */
      nfram -= dtimf0;
      dtimf0 = f0tim[++nf0ev];   /* Reset counter to begin of command */
      if (f0command == 0)
      {   /* Reset baseline */
         nframb = 0;      /* Time from last reset in frames */
         tarhat = 0;      /* And go to bottom of hat pattern */
      }
#ifndef MINIMAL_SYNTH
      else if (f0command >= 2000)
      {
         set_user_target();     /* Must be f0mode < SINGING */
      }
#endif
      else if ((f0command & 01) == 0)
      {   /* If f0command is even */
         tarhat += f0command;   /* Command is a step, reset tarhat */
         if (f0command < 0)
         {   /* Cancel previous impulse if step */
           tarimp = 0;
         }
      }
      else
      {            /* Odd, command is impulse  */
         /* Impulse realized as 16-frame step of doubled amp */
         tarimp = f0command + f0command;
         nimp = 16 - ((f0_lp_filter-1300)>>8);
      }
      /* Loop back to look for more f0 commands */
   }
   /* Make baseline fall slowly (0.1 Hz / 6.4 ms) until it reaches endfall */

   tarbas = beginfall - nframb;
   if (tarbas > endfall)    nframb++;

   /* Impulse duration fixed at 16 frames, count down to zero */
   /* (actually, duration is function of speaker def par "quickness" */
   if (--nimp < 0)    tarimp = 0;

   /* Segmental effect on f0, reset tarseg if time exceeds cum dur */
   if ((nframs >= (segdur + extrad)) && (np < (nallotot-1)))
   {
      nframs -= segdur;
      segdur = allodurs[++np];
      extrad = 0;
      phocur = allophons[np];
      if (np < nallotot)    phonex = allophons[np+1];
      /* Set next f0 segmental incremental target */
      f0seg = f0segtars[phocur];
      /* Effect is less in unstressed segments */
      if ((allofeats[np] & FSTRESS) IS_MINUS)
      {
         f0seg = f0seg >> 1;
      }
      /* Delay start of f0 rise for voiceless segment until bound */
      if ((featb[phonex] & FVOICD) IS_MINUS)
      {
         extrad = 4;     /* Was 4 when f0_lp_filter was 1536 */
      }
      /* Delay f0 fall from voiceless plosive until vot */
      if ((featb[phocur] & FVOICD) IS_MINUS)
      {
         tarseg1 = f0seg;  /* Gesture fast, go to only 1 lpfilter */
         tarseg = 0;
         extrad = 0;
         if ((featb[phocur] & FPLOSV) IS_PLUS)
         {
            extrad = 5;     /* Was 11 when f0_lp_filter was 1536 */
         }
      }
      else
      {
         tarseg = f0seg;     /* Gesture slow, go to both lp filters */
         tarseg1 = 0;
      }
   }
   /* Glottal stop gesture, test at beginning of each phoneme */

   set_tglst();      /* Set times of f0 fall tglstp,tglstn */
   //if (f0mode < SINGING)
   if(1) //it better not have other inpouts
   {
      /* Filter f0 step and impulse commands to produce next value f0 */

      f0in = (tarbas + tarhat + tarimp + tarseg);
	  

#ifdef DEBUGF0
		printf("tarbas %d tarhat %d	tarimp %d tarseg %d \n",tarbas,tarhat,tarimp,tarseg);
#endif

      /* Reduce segmental effect toward end of segment (98% per frame)  */

      arg1 = tarseg;    arg2 = 16064;    tarseg = mlsh1();
      filter_commands();
   }

  
  //     f0prime =1110;
   /* Glottalization gesture */
   /* F0 dip by 60 Hz linear ramp in 8 frames each direction about tglstp */
   dtglst = nframg - tglstp;
   if (dtglst < 0)
      dtglst = (-dtglst);
   if (dtglst <= 7)
      f0prime += ((dtglst * 70) - 550);
   /* And reduce AV somewhat (ugly code, but F0 computed before AV) */
   if (dtglst <= 5)
   {
      avglstop = (6 - dtglst);   /* Global variable, used in PHDRAW.C */
   }
   else avglstop = 0;

   /* Introduce variability to period at startup from a voiceless interval */

   /* See if f0 exceeds legal bounds, truncate  */
   if (f0prime > HIGHEST_F0)
   {
      f0prime = HIGHEST_F0;
   }
   else if (f0prime < LOWEST_F0)
   {
      f0prime = LOWEST_F0;
   }
   /* Scale f0 according to current speaker definition, the number 120 is
    *    the nominal average pitch of Paul's voice (AP in spdef)  */
   if (f0mode < SINGING)
   {
      f0prime = f0minimum
      + frac4mul((f0prime - 1200), f0scalefac);

      /* Add pseudo-jitter (approx 6,10,15-Hz sine waves, each +/-0.5 Hz) */
      timecos15 += 43;      /* Prime number to reduce coincidence */
      /* WAS	    timecos15 += 419; */
      if (timecos15 > TWOPI)    timecos15 -= TWOPI;
      timecos10 += 97;
      /* WAS	    timecos10 += 277; */
      if (timecos10 > TWOPI)    timecos10 -= TWOPI;
      timecos6 += 157;
      if (timecos6 > TWOPI)    timecos6 -= TWOPI;
      pseudojitter = getcosine[timecos15>>6]
      + getcosine[timecos10>>6];
      /* OUT			 + getcosine[timecos6>>6];		 END OUT */
      f0prime += (pseudojitter >> 5);

      /* See if f0 exceeds legal bounds, truncate */
      if (f0prime > HIGHEST_F0)
      {
         f0prime = HIGHEST_F0;
      }
      
      else if (f0prime < LOWEST_F0)
      {
         f0prime = LOWEST_F0;
      }
   }
   /* Change from Middle C = 256 Hz (A = 430.4) to A = 440 Hz */
   else if (f0mode == SINGING)
   {
      f0prime = frac4mul(f0prime,4190);
   }
   /* Save value of period t0 in parameter array  */
   /* (ONLY ESSENTIAL DIVIDE INSTRUCTION IN ALL OF DECTALK) */
   arg1 = 400;
   arg2 = 1000;
   arg3 = f0prime;
   parstochip[OUT_T0] = muldv();
/*	printf("%d %d\n",f0prime,parstochip[OUT_T0]);*/
	

	if(KS.logflag&LOG_OUTPHON)
		{
/*		 if (np == 0 && allophons[np] == SIL)
			{
			lastone=np;
			}  		  
		 	*/
		 if(np != lastone)
			{
			if (np >= 0)
				{
/*				dologphoneme(keepallo,keepdur,(f0prime/10));*/
#ifdef PRINT_OUTPUT
				dologphoneme(allophons[np],((allodurs[np]*NSAMP_FRAME/10)),(f0prime/10));
				printf("\n");
#endif
				}
			keepdur = (allodurs[np]*NSAMP_FRAME/10);/*eab need to keep orig value of dur*/
			keepallo = allophons[np];
			lastone = np;
			}
		}

   /* Increment time counters */
   nfram++;
   nframs++;
   nframg++;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			S E T - U S E R - T A R G E T							 					 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#ifndef MINIMAL_SYNTH 
set_user_target()
{
   short trandur;

   f0command -= 2000;

#ifdef DEBUG_USER_PROSODICS
   printf("\tFound user f0command[%s] = %d in PHDRAWT0, f0mode = %d\n",
   phprint(phocur), f0command, f0mode);
#endif

   if (f0command <= 37)
   {   /* Pointer to C5, highest possible sung note */

      newnote = notetab[f0command-1];
      vibsw = 1;
      /* Set delnote*4 so transition happens over 16 frames (100 ms) */
      delnote = ((newnote - f0) >> 2);
   }
   else
   {                  /* Straight-lines */
      f0command *= 10;
      if (f0command < LOWEST_F0)
      {
         f0command = LOWEST_F0;
      }
      else if (f0command > HIGHEST_F0)
      {
         f0command = HIGHEST_F0;
      }
      newnote = f0command;
      vibsw = 0;
      /* Compute incremental change to f0*10 every frame */
      delnote = (newnote - f0) << 2;   /* f0 change times 40 */
      trandur = allodurs[npg+1];   /* Change to occur over next phone */
      if (delnote > 0)
      {
         delnote += (trandur - 1);   /* Round upward */
      }
      if (delnote < 0)
      {
         delnote -= (trandur - 1);   /* Round downward */
      }
      if (trandur != 0)
      {
         delnote /= trandur;
      }
      else
      {
         delnote = delnote >> 3;   /* 8-frame (50 ms) transition */
      }
   }
   delcum = 0;
   f0start = f0;
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			S E T - T G L S T				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

set_tglst()
{
   if (nframg >= segdrg)
   {
      nframg -= segdrg;
      segdrg = allodurs[++npg];
      /* Cancel glottal stop gesture that occurred at last phone onset */
      if (tglstp == 0)    tglstp = -200;
      /* Start second half of glottal stop gesture */
      if (tglstp > 0)    tglstp = 0;

      /* Insert glottal stop after cur seg */
      /* if next segment a vowel? */
      /* and is next segment in first syllable? */
      /* and is current segment in word-final rime? */
      /* and is next segment not the diphthong /YU/? */
      tglstn = -200;
      if (((featb[allophons[npg+1]] & FVOWEL) IS_PLUS)
         && ((allofeats[npg+1] & (FMEDIALSYL & FFINALSYL)) IS_MINUS)
         && ((allofeats[npg] & FBOUNDARY) >= FWBNEXT)
         && (allophons[npg+1] != YU))
      {
         /* If cur seg is vowel, don't do it unless vowel ident, or pbound */
         if ((featb[allophons[npg]] & FSYLL) IS_PLUS)
         {
            if (((allophons[npg] == allophons[npg+1])
               && ((allofeats[npg+1] & FSTRESS_1) IS_PLUS) )
               || ((allofeats[npg] & FBOUNDARY) >= FVPNEXT))
            {
               tglstn = segdrg;
            }
         }
         /* If  next segment primary stressed, */
         /* and if curr seg a consonant other than a plosive, do it */
         else if ( ((featb[allophons[npg]] & FPLOSV) IS_MINUS)
            && (allophons[npg] != DX)
            && ((allofeats[npg+1] & FSTRESS_1) IS_PLUS) )
         {
            tglstn = segdrg;
         }
      }
      /* And at beginning and end of glottalized segs TQ and Q */
      if ((place[allophons[npg+1]] & FGLOTAL) IS_PLUS)
      {
         tglstn = segdrg;
      }
      if ((place[allophons[npg]] & FGLOTAL) IS_PLUS)
      {
         tglstn = segdrg;
      }
   }
   /* Wait until current gl stop gesture over before setting time of next one */
   else if ((nframg == 8) || (nframg == (segdrg - 1)))
   {
      tglstp = tglstn;
   }
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			F I L T E R - C O M M A N D S			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

filter_commands()
{      /* Convert 'f0in' command to smoothed 'f0' */

	extern short f0outa;	
	extern short f0outb;
	extern short f0outc;
	extern short f0outd;
	extern short f0out1;
	extern short f0out2;

   /* First pole (separate into 2 poles to min truncation errors) */
   arg1 = f0a1;
   arg2 = f0in;
   f0outa = mlsh1();
   arg1 = f0b;
   arg2 = f0las1;
   f0outb = mlsh1();
   f0out1 = f0outa + f0outb;
   f0las1 = f0out1;
   /* Second pole */
   arg1 = f0a2;
   arg2 = f0out1 + (tarseg1 << F0SHFT);   /* Use only one pole */
   f0outc = mlsh1();
   arg1 = f0b;
   arg2 = f0las2;
   f0outd = mlsh1();
   f0out2 = f0outc + f0outd;
   f0las2 = f0out2;
   f0 = f0out2 >> F0SHFT;   /* Unscaled fundamental frequency	   */
   f0prime = f0;      /* This is going to be scaled output value */

   
   /*#define NOTHING*/
#ifdef NOTHING
   printf(
   "[%s] tarbas=%4d tarhat=%3d tarseg=%3d tarseg1=%3d tarimp=%3d tarsum=%4d\n",
   phprint(allophons[npg]), tarbas, tarhat, tarseg, tarseg1,
   tarimp, f0in);
#endif

   /* (Check for overloads if change filter tc or size of impulses) */

#if '\0'
   printf("f0in=%6d   a=%6d b=%6d 1=%6d c=%6d d=%6d 2=%6d\n",
   f0in, f0outa, f0outb, f0out1, f0outc, f0outd, f0out2);
#endif
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*		S I N G - O R - L I N E A R - I N T E R P		 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

linear_interp()
{
   delcum += delnote;
   f0 = f0start + (delcum >> 2);

   if (delnote >= 0)
   {         /* Do not overshoot newnote */
      if (f0 > newnote)
      {
         f0 = newnote;
         f0start = newnote;
         delcum = 0;
         delnote = 0;
      }
   }
   else
   {
      if (f0 < newnote)
      {
         f0 = newnote;
         f0start = newnote;
         delcum = 0;
         delnote = 0;
      }
   }
   f0prime = f0;            /* To be scaled by spdef */

   if (vibsw == 1)
   {         /* Singing */
      /* Add vibratto of 6.2 Hz (25 frames/cycle), +/- 2.05 Hz ampl. */
      timecosvib += 165;
      if (timecosvib > TWOPI)    timecosvib -= TWOPI;
      f0prime += getcosine[timecosvib>>6] >> 3;
   }
}

#if 0      /* OUT because using table generated by this routine */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*                                                                     */
/*                   S U B R O U T I N E   G E T C O S I N E           */
/*                                                                     */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Get next value of cosine, update time */

/* TEMPORARY Compute values for getcosine[] table in PHROM.C */
if (initcosine == 0)
{
   for (initcosine=0; initcosine<64; initcosine++)
   {
      printf("cos[%2d] = %5d\n",
      initcosine, getcosine(initcosine*64)>>6);
   }
   exit(1);
}
getcosine(time) short time;
{
   short temptime;
   int cosine;
   /* See if argument to sine function should be pi reversed		*/
   if (time > PI)    time = TWOPI - time;
   /* See if answer will be plus or minus				*/
   temptime = time;
   if (temptime > PIOVER2)    temptime = PI - temptime;
   /* Approximate sine by one minus t squared				*/
   cosine = (temptime * temptime) - ONE;
   if (time != temptime)    return(cosine);
   else    return(-cosine);
}
#endif


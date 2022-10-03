/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1996 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  voice.c - synthesize one voice sample
 *
 *  coded by Eric P. Carlson
 *
 *  Modification History:
 *
 *    27 Aug 1996  reb:  include flavor.h
 *    08 Aug 1996  reb:  made floating-point constants single-precision;
 *                       archived as version 2.2.
 *    29 Aug 1993  version 2.0 (library version)
 *    23 Feb 1993  made lf tables same as unix version, v1.1
 *    10 Mar 1992  return spectral_tilt(0) when F0 = 0
 *    21 Nov 1991  made spectral_tilt, formant_1s pitch-synchronous
 *     7 Nov 1991  removed from sample.c
 */

#include "flavor.h"
#include <math.h>		/* needed for power function */
#include "llsyn.h"

/* Spectral Tilt Bandwidth table */
static int tilt[42] =
  { 5000, 4350, 3790, 3330, 2930, 2700, 2580, 2468, 2364, 2260,
    2157, 2045, 1925, 1806, 1687, 1568, 1449, 1350, 1272, 1199,
    1133, 1071, 1009,  947,  885,  833,  781,  729,  677,  625,
     599,  573,  547,  521,  495,  469,  442,  416,  390,  364,
     338,  312 };

/* LF Voicing Model tables */
static Float bw_lf[41] =
  {   0.0f,  -0.6f,  -2.0f,  -4.0f,  -6.0f,  -8.0f, -10.4f, -12.7f, -15.3f, -17.8f, 
    -20.1f, -22.4f, -24.7f, -27.0f, -29.2f, -31.4f, -33.6f, -35.8f, -37.9f, -40.0f, 
    -42.1f, -44.1f, -46.2f, -48.3f, -50.4f, -52.4f, -54.5f, -56.6f, -57.8f, -60.8f, 
    -62.7f, -64.5f, -66.3f, -68.1f, -69.9f, -71.6f, -73.3f, -75.0f, -76.6f, -78.2f, 
    -79.6f };

static Float e0_lf[41] =
  { 27.4f, 26.3f, 25.3f, 24.3f, 23.2f, 22.1f, 21.0f, 20.0f, 18.8f, 17.6f, 
    16.1f, 14.9f, 13.8f, 12.8f, 11.7f, 10.6f, 9.81f, 9.00f, 8.12f, 7.36f, 
    6.60f, 6.05f, 5.46f, 4.92f, 4.41f, 3.94f, 3.58f, 3.14f, 2.83f, 2.49f,
    2.24f, 2.03f, 1.83f, 1.63f, 1.48f, 1.32f, 1.19f, 1.08f, .982f, .902f, 
    .832f };


/* ---------------------------------------------------------------------- */

Float next_voice_sample(LLSynth * synth, LLFrame * frame)
{
  register Float output = 0.0f;
  register Float freq, bw, temp, time, open, seconds;
  register int pulse;
  

  synth->state.global_time++;	/* flutter time runs continuously */
  
  /* check for F0 = zero */
  if (!frame->F0) {
    synth->state.period_ctr = 0;  /* make sure we open glottis when F0 != 0 */
    synth->state.glottis_open = 0;
    synth->state.voicing_state = 0;
    return AdvanceResonator(&synth->spectral_tilt, 0.f);
  }

  /* glottal opening/closing transition */
  if ((--synth->state.period_ctr) <= 0) {   /* check for glottal transition */
    if (!synth->state.glottis_open) {	    /* glottis opening */
      synth->state.glottis_open = 1;
      synth->state.pulse = 1;
      synth->state.voicing_time = 0;
      synth->state.F0 = frame->F0;
      synth->state.FL = frame->FL;
      synth->state.OQ = frame->OQ;
      synth->state.SQ = frame->SQ;
      synth->state.DI = frame->DI;
      synth->state.AV = frame->AV;
      synth->state.TL = frame->TL;
      synth->state.voicing_amp = synth->state.AV ?
				 dB2amp(synth->spkr.GV+synth->state.AV+A_AV) :
				 0;
      if (synth->state.FL) {
        seconds = (float) synth->state.global_time / synth->spkr.SR;
        freq = synth->state.F0 / 10.f +
	       (synth->state.FL / 50.f * synth->state.F0 / 600.f *
			(Float)(cos(TWO_PI * 12.7f * seconds) +
					cos(TWO_PI * 7.1f * seconds) +
					cos(TWO_PI * 4.7f * seconds)));
      }
      else
	freq = synth->state.F0 / 10.f;
      synth->state.pulse_freq = round(synth->spkr.SR / freq);
      synth->state.period_ctr = round(synth->state.pulse_freq *
				      synth->state.OQ / 100.);
      synth->state.close_time = synth->state.pulse_freq -
				synth->state.period_ctr;
      if (synth->state.DI)
	if (!synth->state.close_shortened) {
          synth->state.close_shortened = 1;
          synth->state.close_time -= round(synth->state.close_time *
					   synth->state.DI / 100.);
          synth->state.voicing_amp *= 1.f - synth->state.DI / 100.f;
	  /*** the following is not quite right ***/
          synth->state.TL += round(synth->state.DI / 4.25);
        }
        else {  /* previous close shortened */
          synth->state.close_shortened = 0;
	  synth->state.close_time += round(synth->state.close_time *
					   synth->state.DI / 100.);
        }
      else  /* no diplophonia */
	synth->state.close_shortened = 0;

      /* setup spectral tilt */
      if (synth->spkr.SS == 3)	/* LF source corner rounding */
	  synth->state.TL += 2;
      SetPolePair(&synth->spectral_tilt, round(0.375 * tilt[synth->state.TL]),
    	  tilt[synth->state.TL], synth->spkr.SR);
      if (synth->state.TL > 10)
        synth->spectral_tilt.Coef.A *= 1.0f +
				(synth->state.TL-10) *
				(synth->state.TL-10) / 1000.f;

      /* setup pitch-synchronous formant_1_cascade and formant_1_special */
      InterPolePair(&synth->formant_1_cascade, frame->F1 + frame->DF1,
	  frame->B1 + frame->DB1, synth->spkr.SR);
      InterPolePair(&synth->formant_1_special, frame->F1 + frame->DF1,
	  frame->B1 + frame->DB1, synth->spkr.SR);

      switch (synth->spkr.SS) {
        case 1:  /* impulsive source */
	       synth->state.voicing_state = 0;
               temp = (Float)synth->state.pulse_freq * synth->state.OQ / 100.f;
               SetPolePair(&synth->glottal_pulse, 0, round(10000. / temp),
		       synth->spkr.SR);
               synth->glottal_pulse.Coef.A *= 0.002675f *
					        temp * temp; /* -51.3 dB */
 	       break;

        case 2:  /* natural source */
               /** nothing to do **/
	       break;

        case 3:  /* LF source */
	       freq = synth->state.F0 / (22.f * synth->state.OQ / 100.f) *
		      (synth->state.SQ + 100.f) / synth->state.SQ;
               temp = (bw_lf[synth->state.SQ / 10 - 9] -
		       bw_lf[synth->state.SQ / 10 - 10]) / 10.f;
               bw = (bw_lf[synth->state.SQ / 10 - 10] +
		     (synth->state.SQ % 10) * temp) *
		    200.f / (synth->state.pulse_freq * synth->state.OQ / 100.f);
               SetPolePair(&synth->glottal_pulse, round(freq), round(bw),
		       synth->spkr.SR);
               temp = (e0_lf[synth->state.SQ / 10 - 9] -
		       e0_lf[synth->state.SQ / 10 - 10]) / 10.f;
               synth->glottal_pulse.Coef.A *= (e0_lf[synth->state.SQ /
						     10 - 10] +
		                        (synth->state.SQ % 10) * temp) *
				       (synth->state.pulse_freq *
					synth->state.OQ / 100.f) / 200.f;
	       break;
      }
    }
    else {		/* glottis closing */
      synth->state.glottis_open = 0;
      synth->state.voicing_time++;
      synth->state.pulse = 0;
      synth->state.period_ctr = synth->state.close_time;
      InterPolePair(&synth->formant_1_cascade, frame->F1, frame->B1,
	      synth->spkr.SR);
      InterPolePair(&synth->formant_1_special, frame->F1, frame->B1,
	      synth->spkr.SR);
    }
  }
  else {  /* during open or closed phase */
    synth->state.voicing_time++;
    synth->state.pulse = 0;
  }


  /* ---------------------------------------------------------------------- */
  /* voicing source */

  switch (synth->spkr.SS) {
    case 1:	/* impulse source */
      pulse = synth->state.pulse - synth->state.voicing_state;
      synth->state.voicing_state = synth->state.pulse;
      output = AdvanceResonator(&synth->spectral_tilt,
	                   AdvanceResonator(&synth->glottal_pulse,
				   pulse * synth->state.voicing_amp));
      break;

    case 2:	/* natural KLGLOT88 source */
	    /*****
		    The code was crashing before the break for no apparent
		    reason.  I recompiled in DOS then came to Windows and
		    rebuilt again and it worked????
	    *****/
      if (synth->state.glottis_open) {
        time = (Float) synth->state.voicing_time;
        open = (Float) synth->state.pulse_freq * synth->state.OQ / 100.f;
        temp = synth->state.voicing_amp * .00055f *
		(synth->state.pulse_freq ?
		  100.f / synth->state.pulse_freq : 0) *
		(50.f / synth->state.OQ) *
		(2 * time - 3 * time * time / open);
        output = AdvanceResonator(&synth->spectral_tilt, temp);
      }
      else
	output = AdvanceResonator(&synth->spectral_tilt, 0.f);
      break;

    case 3:	/* LF model source */
      if (synth->state.glottis_open)
        output = AdvanceResonator(&synth->spectral_tilt,
	                   AdvanceResonator(&synth->glottal_pulse,
				   synth->state.pulse ?
				     (synth->state.voicing_amp * 0.0795f)
				     : 0.f));
      else
        ClearResonator(&synth->glottal_pulse);
	output = AdvanceResonator(&synth->spectral_tilt, 0.f);
      break;
  }

  return output;
}

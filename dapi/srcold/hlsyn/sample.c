/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1996 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  sample.c - synthesize one sample
 *
 *  coded by Eric P. Carlson
 *
 *  Modification History:
 *
 *    27 Aug 1996 reb:  include flavor.h
 *    08 Aug 1996 reb:  made floating point constants single-precision;
 *                      archived as version 2.2.
 *    21 Sep 1995	use synthesizer out array rather than reallocating
 *    29 Aug 1993	version 2.0 (library version)
 *    14 Jan 1993       sign-extend modulo in noise calculation
 *     8 Jan 1993	corrected modulo arithmetic in noise calculation
 *    10 Mar 1992	removed aspiration modulation when F0 = 0
 *     7 Nov 1991	moved voicing source to voice.c
 *     5 Nov 1991	removed from spyn.c
 */

#include "flavor.h"
#include <math.h>		/* needed for power function */
#include "llsyn.h"

//Float next_voice_sample(LLSynth * synth, LLFrame * frame);

/* ---------------------------------------------------------------------- */

Float next_sample(LLSynth * synth, LLFrame * frame)
{
  Float * out;
  Float noise, first_diff, output, special;
  register Float casc;

  
  out = synth->out;

  out[O_VOICING] = next_voice_sample(synth, frame);


/* ---------------------------------------------------------------------- */
/* aspiration/frication noise source */
  noise = (short)(synth->state.random = ((synth->state.random * 20077L 
	  + 12345L) % 65536L)) / 65536.f;
  if (frame->F0 && !synth->state.glottis_open && synth->state.AV)
    noise /= 2;
  out[O_ASPIRATION] = synth->coefs.asp_amp * noise - synth->state.asp_state;
  synth->state.asp_state = synth->coefs.asp_amp * noise;
  out[O_GLOTTAL] = 12.f * out[O_VOICING] + 5.f * out[O_ASPIRATION];
  out[O_FRICATION] = -(synth->coefs.fric_amp * noise);


/* ---------------------------------------------------------------------- */
/* cascade synthesis */

  if (!synth->state.parallel_only_flag) {
    casc = out[O_NASAL_POLE_CASC] = AdvanceResonator(&synth->nasal_pole_cascade,
      out[O_NASAL_ZERO_CASC] = AdvanceAntiResonator(&synth->nasal_zero_cascade,
        out[O_TRACHEAL_CASC] = AdvanceResonator(&synth->trach_pole_cascade,
			         AdvanceAntiResonator(&synth->trach_zero_cascade,
				   out[O_GLOTTAL] / 4.f))));
    switch (synth->spkr.NF) {
      case 8:    casc = AdvanceResonator(&synth->formant_8_cascade, casc);
      case 7:    casc = AdvanceResonator(&synth->formant_7_cascade, casc);
      case 6:    casc = AdvanceResonator(&synth->formant_6_cascade, casc);
      case 5:    casc = out[O_FORMANT_5_CASC] =
		   AdvanceResonator(&synth->formant_5_cascade, casc);
      case 4:    casc = out[O_FORMANT_4_CASC] =
		   AdvanceResonator(&synth->formant_4_cascade, casc);
      case 3:    casc = out[O_FORMANT_3_CASC] =
		   AdvanceResonator(&synth->formant_3_cascade, casc);
      case 2:    casc = out[O_FORMANT_2_CASC] =
		   AdvanceResonator(&synth->formant_2_cascade, casc);
      case 1:
      default:   out[O_FORMANT_1_CASC] =
		   AdvanceResonator(&synth->formant_1_cascade, casc);
    }

    /* if using cascade, clear state of special parallel branch */
    synth->state.glottal_state = first_diff = special = 0.f;
  }


/* ---------------------------------------------------------------------- */
/* special parallel branch */

  else {

    first_diff = out[O_GLOTTAL] - synth->state.glottal_state;
    synth->state.glottal_state = out[O_GLOTTAL];

    special = (out[O_NASAL_PARA] = AdvanceResonator(&synth->nasal_pole_special,
				    out[O_GLOTTAL] * synth->coefs.npv_amp))
            + (out[O_FORMANT_1_PARA] = AdvanceResonator(&synth->formant_1_special,
				    out[O_GLOTTAL] * synth->coefs.f1v_amp))
	    - AdvanceResonator(&synth->formant_2_special,
		    first_diff * synth->coefs.f2v_amp)
	    + AdvanceResonator(&synth->formant_3_special,
		    first_diff * synth->coefs.f3v_amp)
	    - AdvanceResonator(&synth->formant_4_special,
		    first_diff * synth->coefs.f4v_amp)
	    + AdvanceResonator(&synth->trach_pole_special,
		    first_diff * synth->coefs.tpv_amp);
  }


/* ---------------------------------------------------------------------- */
/* parallel synthesis */

  out[O_FORMANT_2_PARA] = AdvanceResonator(&synth->formant_2_parallel,
	                     out[O_FRICATION] * synth->coefs.f2p_amp);
  out[O_FORMANT_3_PARA] = AdvanceResonator(&synth->formant_3_parallel,
	                     out[O_FRICATION] * synth->coefs.f3p_amp);
  out[O_FORMANT_4_PARA] = AdvanceResonator(&synth->formant_4_parallel,
	                     out[O_FRICATION] * synth->coefs.f4p_amp);
  out[O_FORMANT_5_PARA] = AdvanceResonator(&synth->formant_5_parallel,
			     out[O_FRICATION] * synth->coefs.f5p_amp);
  out[O_FORMANT_6_PARA] = AdvanceResonator(&synth->formant_6_parallel,
			     out[O_FRICATION] * synth->coefs.f6p_amp);
  out[O_BYPASS_PARA] = out[O_FRICATION] * synth->coefs.bypass_amp;


/* ---------------------------------------------------------------------- */
/* normal output */

  out[O_NORMAL] = out[O_FORMANT_1_CASC] +
		  out[O_FORMANT_2_PARA] - out[O_FORMANT_3_PARA] +
		  out[O_FORMANT_4_PARA] - out[O_FORMANT_5_PARA] +
		  out[O_FORMANT_6_PARA] - out[O_BYPASS_PARA] + special;

  switch (synth->spkr.OS) {
	case 1:  
	case 2:
	case 3:	 output = out[synth->spkr.OS] +
			  0.99f * synth->state.integrator;
		 synth->state.integrator = output;
		 break;

	default:  output = out[synth->spkr.OS];
	          break;
  }
  return output;
}

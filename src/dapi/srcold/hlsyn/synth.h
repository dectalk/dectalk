/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1996 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*  synth.h - synthesizer support
 *
 *  coded by Eric P. Carlson
 *
 *  Modification History:
 *    08 Aug 1996   reb:  made floating-point constants single-precision;
 *                        do arithmetic in call to pow in dB2amp in 
 *                        precision determined by Float (not auto-
 *                        matically in double-precision);
 *                        archived as version 2.2.
 *    29 Aug 1993	version 2.0 (library version)
 *    23 Feb 1993	changed INT16 to short, same as unix, v1.1
 */

#ifndef SYNTH_H
#define SYNTH_H

#define dB2amp(x) (Float) pow(10.0f, (Float) (x) / 20.0f)
#define round(x) (int) ((x) + 0.5f)
#ifndef INT16
#define	INT16 short
#endif
#define TWO_PI 6.2831852f

/* amplitude adjustment constants */
#define A_AV -20.5f
#define A_AH -64.3f
#define A_AF -43.7f
#define A_AP -28
#define A_A1 -58
#define A_A2F -70
#define A_A3F -77
#define A_A4F -82.6f
#define A_A5F -86.7f
#define A_A6F -87.7f
#define A_AB -73.5f
#define A_ANV -68.7f
#define A_A1V -69.1f
#define A_A2V -77.5f
#define A_A3V -84.9f
#define A_A4V -88.5f
#define A_ATV -81.5f

/* speaker definition array offsets */
#define S_DU 0
#define S_UI 1
#define S_SR 2
#define S_NF 3
#define S_SS 4
#define S_RS 5
#define S_SB 6
#define S_CP 7
#define S_OS 8
#define S_GV 9
#define S_GH 10
#define S_GF 11

/* parameter array offsets */
#define P_F0 0
#define P_AV 1
#define P_OQ 2
#define P_SQ 3
#define P_TL 4
#define P_FL 5
#define P_DI 6
#define P_AH 7
#define P_AF 8
#define P_F1 9
#define P_B1 10
#define P_DF1 11
#define P_DB1 12
#define P_F2 13
#define P_B2 14
#define P_F3 15
#define P_B3 16
#define P_F4 17
#define P_B4 18
#define P_F5 19
#define P_B5 20
#define P_F6 21
#define P_B6 22
#define P_FNP 23
#define P_BNP 24
#define P_FNZ 25
#define P_BNZ 26
#define P_FTP 27
#define P_BTP 28
#define P_FTZ 29
#define P_BTZ 30
#define P_A2F 31
#define P_A3F 32
#define P_A4F 33
#define P_A5F 34
#define P_A6F 35
#define P_AB 36
#define P_B2F 37
#define P_B3F 38
#define P_B4F 39
#define P_B5F 40
#define P_B6F 41
#define P_ANV 42
#define P_A1V 43
#define P_A2V 44
#define P_A3V 45
#define P_A4V 46
#define P_ATV 47
#define P_F0NEXT 48

/* output array offsets */
#define NUM_OUTPUTS 21
#define O_NORMAL 0
#define O_VOICING 1
#define O_ASPIRATION 2
#define O_FRICATION 3
#define O_GLOTTAL 4
#define O_TRACHEAL_CASC 5
#define O_NASAL_ZERO_CASC 6
#define O_NASAL_POLE_CASC 7
#define O_FORMANT_5_CASC 8
#define O_FORMANT_4_CASC 9
#define O_FORMANT_3_CASC 10
#define O_FORMANT_2_CASC 11
#define O_FORMANT_1_CASC 12
#define O_FORMANT_6_PARA 13
#define O_FORMANT_5_PARA 14
#define O_FORMANT_4_PARA 15
#define O_FORMANT_3_PARA 16
#define O_FORMANT_2_PARA 17
#define O_FORMANT_1_PARA 18
#define O_NASAL_PARA 19
#define O_BYPASS_PARA 20

/* Synthesizer structure */
typedef struct {
  /* static data */
  int parallel_only_flag;
  int num_casc_formants;
  int num_samples;
  int output_select;

  /* dynamic state data */
  int pulse_freq;
  int glottis_open;
  int period_ctr;
  int voicing_state;
  int pulse;
  int random;
  int voicing_time;
  long global_time;
  Float voicing_amp;
  Float glottal_state;
  Float asp_state;
  Float integrator;

  /* voicing state */
  int F0;
  int FL;
  int OQ;
  int SQ;
  int DI;
  int AV;
  int TL;
  int close_shortened;
  int close_time;
} Synthesizer;

/* Coefficients structure */
typedef struct {
  Float asp_amp;
  Float fric_amp;
  Float f1p_amp;
  Float f2p_amp;
  Float f3p_amp;
  Float f4p_amp;
  Float f5p_amp;
  Float f6p_amp;
  Float npv_amp;
  Float f1v_amp;
  Float f2v_amp;
  Float f3v_amp;
  Float f4v_amp;
  Float tpv_amp;
  Float bypass_amp;
} Coefficients;

#endif

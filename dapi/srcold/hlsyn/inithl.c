
/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1997 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  inithl.c - Initialize speaker dependent data
 *
 *  coded by J. Erik Moore, 1/94
 *      
 *  Modification History:
 *  
 *  13 Apr 2001  reb:  Made female values different from male for Lg, B4m, B5m, TLm, 
 *                     OQm, Psm.
 *   6 Oct 1997  reb/rsm:  modified Atf3Setf2Range to take f2, f3 as shorts rather 
 *                     than floats; made local functions static, changed LabialAB, 
 *                     PalVelarA2F, PalVelarA5F, and some alveolar noise filter values.
 *  30 Apr 1997  reb:  added Lhp to HL speaker; used HLSYNAPI rather than FLAV_STDCALL.
 *  22 Nov 1996  reb:  moved ps from HLSpeaker to HLFrame; initialized new 
 *                     speaker constants KCw, KCg, Kdf0dc, Kpd, Kf1, f1_neutral, 
 *                     KdPTdc, f0_vowelshift_f1_break, Psm, Cwm, Cgm, Lt, At, Lvg, 
 *                     Lv, Av; initialized dc and ap in oldframe; moved Cw and Cg 
 *                     from HLSpeaker to HLState.
 *  21 Aug 1996  reb:  initialized agm, agAVModalOffsetMax, agAVModalOffsetOnOff 
 *                     differently for females; added AVPressureThreshold, KdAV0, 
 *                     KdAV1; initialized fp_f2BreakPoint = 1100 Hz for females;
 *                     initialized agHiKLSourceCutoff; included flavor.h, 
 *                     checked FLAV_STDCALL in def'n of InitializeHLSynthesizer.
 *  08 Aug 1996  reb:  archived as version 2.2 (no changes).
 *  12 Mar 1996  fixed scientific syntax of floating-point constants
 *  14 Nov 1995  changed default kdAV from 1:1.2 to 100:120 (epc)
 *  30 Oct 1995  revised [tr] alveolar initializations (epc)
 *  17 Oct 1995  revised alveolar initializations (epc)
 *  16 Oct 1995  revised alveolar initializations for clusters (drw)
 *  21 Sep 1995  added Atf3Setf2Range calls for ALV_RESOLUTION == 50 (epc)
 *  27 Mar 1995  Win32 MSVC version (epc)
 *	10 Oct 2002	 ifdef out Process.h not supported under WinCE
 *
 */

#include "flavor.h"

#if (defined(DEBUG) && !defined(UNDER_CE)) || (defined(WARNINGS) && !defined(UNDER_CE)) 

#include <stdlib.h>	/* for exit on error */
#include <process.h>	/* for exit on error */
#endif

#include "hlsyn.h"

#define FEMALE_SCALE 1.11f	/* For alveolar male->female */
#define NA	-1.f		/* Not Applicable Flag */

/*****
	Function declarations
*****/
#if 0
static void SetAlveolar(HLSpeaker *speaker,short IsMale);
static void Atf3Setf2Range(HLSpeaker *speaker,short f3,short f2Min,short f2Max,
	float A2F,float A3F,float A4F,float A5F,float AB,float Scale);
#endif
void HLSYNAPI
InitializeHLSynthesizer(HLFrame *oldframe, HLSpeaker *speaker,
						   HLState *oldstate, short IsMale)

{
  /*****
    Initialize the speaker constants.
  *****/

  speaker->Val = IsMale ? 60.f : 45.f;		/* cu. cm */
  speaker->Lc_al=0.5f;				/* cm */
  speaker->HelmholtzZeroAreaFrequency = 180.f;	/* Hz */

  speaker->Vab = IsMale ? 60.f : 45.f;		/* cu. cm */
  speaker->Lc_ab = 1.f;				/* cm */ /* 2.0f ??? */
			//DINAE IS LOW
  speaker->f1Min = IsMale ? 300.f : 300.f;		/* Hz */
  speaker->f1Max = IsMale ? 500.f : 650.f;		/* Hz */
  speaker->f2RetroflexMax = IsMale ? 1400.f : 1600.f;	/* Hz */
  speaker->f3RetroflexMax = IsMale ? 1800.f : 2200.f;	/* Hz */
  speaker->f2LateralMax = IsMale ? 1300.f : 1400.f;	/* Hz */
  //helpme reduced f3 test slighlty
  speaker->f3LateralMin = IsMale ? 2600.f : 2800.f;	/* Hz */
  speaker->Kacl=25.f;
  speaker->aclFreq = IsMale ? 400.f : 450.f;		/* Hz */

  speaker->Vacd = IsMale ? 50.f : 40.f;		/* cu. cm */
  speaker->Lc_acd = IsMale ? 4.f : 3.5f;		/* cm */
  speaker->acdMax = 100.f;			/* sq. mm (50?) */
  speaker->acd_f1Break = IsMale ? 540.f : 650.f;	/* Hz */
  speaker->KHi = IsMale ? 12.5f : 8.8f;
  //eab chnage for frido at the moment
  speaker->f1HiShift = IsMale ? 1180.f : 1280.f;	/* Hz */

  speaker->fno = IsMale ? 500.f : 550.f;		/* Hz */

  /*****
    The an,fn table
  *****/

#ifndef EPSON_ARM7
  anfnTable_fno = 500.f;		/* Hz */
  anfnTable[0].ANFN_AN = 0.f;	/* sq mm */
  anfnTable[1].ANFN_AN = 10.f;	/* sq mm */
  anfnTable[2].ANFN_AN = 20.f;	/* sq mm */
  anfnTable[3].ANFN_AN = 30.f;	/* sq mm */
  anfnTable[4].ANFN_AN = 40.f;	/* sq mm */
  anfnTable[5].ANFN_AN = 50.f;	/* sq mm */
  anfnTable[6].ANFN_AN = 60.f;	/* sq mm */
  anfnTable[7].ANFN_AN = 70.f;	/* sq mm */
  anfnTable[8].ANFN_AN = 80.f;	/* sq mm */

  anfnTable[0].ANFN_FN = 500.f;	/* Hz */
  anfnTable[1].ANFN_FN = 580.f;	/* Hz */
  anfnTable[2].ANFN_FN = 660.f;	/* Hz */
  anfnTable[3].ANFN_FN = 730.f;	/* Hz */
  anfnTable[4].ANFN_FN = 780.f;	/* Hz */
  anfnTable[5].ANFN_FN = 810.f;	/* Hz */
  anfnTable[6].ANFN_FN = 840.f;	/* Hz */
  anfnTable[7].ANFN_FN = 870.f;	/* Hz */
  anfnTable[8].ANFN_FN = 900.f;	/* Hz */
#endif
  /*****
    The f1,LOverA table
  *****/

  speaker->fm_f1BreakPoint = 250.f;	/* Hz */
  speaker->BNZ_f1BreakPoint = 700.f;	/* Hz */
#ifndef FAKE_HLSYN
#ifndef EPSON_ARM7
  f1LOverATable[0].F1LOVERA_F1 = 180.f;	/* Hz */
  f1LOverATable[1].F1LOVERA_F1 = 200.f;	/* Hz */
  f1LOverATable[2].F1LOVERA_F1 = 250.f;	/* Hz */
  f1LOverATable[3].F1LOVERA_F1 = 300.f;	/* Hz */
  f1LOverATable[4].F1LOVERA_F1 = 350.f;	/* Hz */
  f1LOverATable[5].F1LOVERA_F1 = 400.f;	/* Hz */
  f1LOverATable[6].F1LOVERA_F1 = 450.f;	/* Hz */
  f1LOverATable[7].F1LOVERA_F1 = 500.f;	/* Hz */
  f1LOverATable[8].F1LOVERA_F1 = 600.f;	/* Hz */
  f1LOverATable[9].F1LOVERA_F1 = 700.f;	/* Hz */
  f1LOverATable[10].F1LOVERA_F1 = 800.f;	/* Hz */

  f1LOverATable[0].F1LOVERA_LOVERA = 1000.f;	/* 1/cm */
  f1LOverATable[1].F1LOVERA_LOVERA = 25.f;		/* 1/cm */
  f1LOverATable[2].F1LOVERA_LOVERA = 20.f;		/* 1/cm */
  f1LOverATable[3].F1LOVERA_LOVERA = 10.f;		/* 1/cm */
  f1LOverATable[4].F1LOVERA_LOVERA = 7.f;		/* 1/cm */
  f1LOverATable[5].F1LOVERA_LOVERA = 5.f;		/* 1/cm */
  f1LOverATable[6].F1LOVERA_LOVERA = 4.f;		/* 1/cm */
  f1LOverATable[7].F1LOVERA_LOVERA = 3.f;		/* 1/cm */
  f1LOverATable[8].F1LOVERA_LOVERA = 2.5f;	/* 1/cm */
  f1LOverATable[9].F1LOVERA_LOVERA = 2.f;		/* 1/cm */
  f1LOverATable[10].F1LOVERA_LOVERA = 1.8f;	/* 1/cm */
#endif
#endif //fakehlsyn
//  NasalBandwidth = 200.f;	/* Hz */
  speaker->BNP_B1_anLow = 10.f;	/* mm^2 */
  speaker->BNP_B1_anHigh = 20.f;	/* mm^2 */

  /*****
    The an,a table
  *****/

  speaker->anaTable[0].ANA_AN = 10.f;	/* sq. mm */
  speaker->anaTable[1].ANA_AN = 15.f;	/* sq. mm */
  speaker->anaTable[2].ANA_AN = 20.f;	/* sq. mm */
  speaker->anaTable[3].ANA_AN = 30.f;	/* sq. mm */
  speaker->anaTable[4].ANA_AN = 50.f;	/* sq. mm */
  speaker->anaTable[5].ANA_AN = 80.f;	/* sq. mm */

  speaker->anaTable[0].ANA_A = 0.00200f;	/* cm^5/dyne */
  speaker->anaTable[1].ANA_A = 0.00045f;	/* cm^5/dyne */
  speaker->anaTable[2].ANA_A = 0.00032f;	/* cm^5/dyne */
  speaker->anaTable[3].ANA_A = 0.00025f;	/* cm^5/dyne */
  speaker->anaTable[4].ANA_A = 0.00020f;	/* cm^5/dyne */
  speaker->anaTable[5].ANA_A = 0.00014f;	/* cm^5/dyne */

  /*****
    The an,b table
  *****/

  speaker->anbTable[0].ANB_AN = 10.f;	/* sq. mm */
  speaker->anbTable[1].ANB_AN = 15.f;	/* sq. mm */
  speaker->anbTable[2].ANB_AN = 20.f;	/* sq. mm */
  speaker->anbTable[3].ANB_AN = 30.f;	/* sq. mm */
  speaker->anbTable[4].ANB_AN = 50.f;	/* sq. mm */
  speaker->anbTable[5].ANB_AN = 80.f;	/* sq. mm */

  speaker->anbTable[0].ANB_B = 0.00006f;	/* cm^5/dyne */
  speaker->anbTable[1].ANB_B = 0.00008f;	/* cm^5/dyne */
  speaker->anbTable[2].ANB_B = 0.00010f;	/* cm^5/dyne */
  speaker->anbTable[3].ANB_B = 0.00015f;	/* cm^5/dyne */
  speaker->anbTable[4].ANB_B = 0.00020f;	/* cm^5/dyne */
  speaker->anbTable[5].ANB_B = 0.00014f;	/* cm^5/dyne */

  /*****
    The f1,c table
  *****/

  speaker->f1cTable[0].F1C_F1 = 180.f;	/* Hz */
  speaker->f1cTable[1].F1C_F1 = 200.f;	/* Hz */
  speaker->f1cTable[2].F1C_F1 = 300.f;	/* Hz */
  speaker->f1cTable[3].F1C_F1 = 400.f;	/* Hz */
  speaker->f1cTable[4].F1C_F1 = 500.f;	/* Hz */
  speaker->f1cTable[5].F1C_F1 = 600.f;	/* Hz */
  speaker->f1cTable[6].F1C_F1 = 700.f;	/* Hz */

  speaker->f1cTable[0].F1C_C = 0.00040f;	/* cm^5/dyne */
  speaker->f1cTable[1].F1C_C = 0.00032f;	/* cm^5/dyne */
  speaker->f1cTable[2].F1C_C = 0.00026f;	/* cm^5/dyne */
  speaker->f1cTable[3].F1C_C = 0.00024f;	/* cm^5/dyne */
  speaker->f1cTable[4].F1C_C = 0.00022f;	/* cm^5/dyne */
  speaker->f1cTable[5].F1C_C = 0.00021f;	/* cm^5/dyne */
  speaker->f1cTable[6].F1C_C = 0.00021f;	/* cm^5/dyne */

  speaker->fp_f2BreakPoint = IsMale ?  1000.f : 1100.f;	/* Hz */

  /*****
    The an,K2 table
  *****/

  speaker->anK2Table[0].ANK2_AN = 0.f;	/* sq. mm */
  speaker->anK2Table[1].ANK2_AN = 5.f;	/* sq. mm */
  speaker->anK2Table[2].ANK2_AN = 10.f;	/* sq. mm */
  speaker->anK2Table[3].ANK2_AN = 15.f;	/* sq. mm */
  speaker->anK2Table[4].ANK2_AN = 20.f;	/* sq. mm */
  speaker->anK2Table[5].ANK2_AN = 25.f;	/* sq. mm */
  speaker->anK2Table[6].ANK2_AN = 30.f;	/* sq. mm */
  speaker->anK2Table[7].ANK2_AN = 35.f;	/* sq. mm */
  speaker->anK2Table[8].ANK2_AN = 40.f;	/* sq. mm */
  speaker->anK2Table[9].ANK2_AN = 45.f;	/* sq. mm */
  speaker->anK2Table[10].ANK2_AN = 50.f;	/* sq. mm */
  speaker->anK2Table[11].ANK2_AN = 55.f;	/* sq. mm */
  speaker->anK2Table[12].ANK2_AN = 60.f;	/* sq. mm */
  speaker->anK2Table[13].ANK2_AN = 65.f;	/* sq. mm */
  speaker->anK2Table[14].ANK2_AN = 70.f;	/* sq. mm */
  speaker->anK2Table[15].ANK2_AN = 75.f;	/* sq. mm */
  speaker->anK2Table[16].ANK2_AN = 80.f;	/* sq. mm */

  speaker->anK2Table[0].ANK2_K2 = 0.f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[1].ANK2_K2 = 1.8f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[2].ANK2_K2 = 3.5f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[3].ANK2_K2 = 4.8f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[4].ANK2_K2 = 6.f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[5].ANK2_K2 = 7.3f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[6].ANK2_K2 = 8.5f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[7].ANK2_K2 = 9.7f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[8].ANK2_K2 = 10.8f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[9].ANK2_K2 = 11.7f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[10].ANK2_K2 = 12.5f;/* cm^5 s^-2/dyne */
  speaker->anK2Table[11].ANK2_K2 = 13.8f;/* cm^5 s^-2/dyne */
  speaker->anK2Table[12].ANK2_K2 = 14.f;	/* cm^5 s^-2/dyne */
  speaker->anK2Table[13].ANK2_K2 = 14.6f;/* cm^5 s^-2/dyne */
  speaker->anK2Table[14].ANK2_K2 = 15.1f;/* cm^5 s^-2/dyne */
  speaker->anK2Table[15].ANK2_K2 = 15.6f;/* cm^5 s^-2/dyne */
  speaker->anK2Table[16].ANK2_K2 = 16.1f;/* cm^5 s^-2/dyne */

  speaker->PharangealArea = 3.0f;	/* sq. cm */

  speaker->Cwm = 0.001f;	/* cm^5/dyne */
  speaker->Rw = 10.0f;	/* dyne-sec-cm^-5 */
  speaker->Psm = IsMale ?  8.0f : 6.5f; /* cm H20 */
  speaker->Cgm = 8.0e-6f;	/* cm^3/dyne was .8e -7f in Williams (8.0 e -6f) */
  speaker->Lg = IsMale ?  1.0f : 0.7f;	/* cm */
  speaker->KCw = 1.0f; /* dimensionless */
  speaker->KCg = 0.34f; /* dimensionless */

  speaker->NewtonInterpTimeStep = 100.0e-6f;	/* sec 5ms / 50 */

/*****
    I am not pleased with this yet but the llspeaker UI is set in the
    reading of the data then the hlspeaker one is set when the read
    returns.
*****/
  
  speaker->UpdateInterval = 5.0e-3f; /* sec */
  speaker->LabialAB =55.f;			 /* dB */
  speaker->PalVelarA2F = 50.f;		 /* dB (or 55) */
  speaker->PalVelarA5F = 45.f;		 /* dB */
  //eab helpme changed to soften it for now talkken
  speaker->PalVelarA3F = 50.f;		 /* dB (or 65) */
  speaker->PalVelar_f2Offset = IsMale ? 1950.f : 2200.f;	/* Hz */
  speaker->PalVelar_f2Overf3_Slope = 0.f; /* Hz/Hz */
  speaker->LateralA3F = 45.f;		 /* dB, male */
  speaker->RetroflexA3F = 50;		 /* dB, male */

#if 0
  SetAlveolar(speaker,IsMale);
#endif

  /*****
    Set the parallel fricative filter gains to the typical
    values given in the Klatt chapter.
  *****/

  speaker->B2F = 250.f;	/* Hz */
  speaker->B3F = 320.f;	/* Hz */
  speaker->B4F = 350.f;	/* Hz */
  speaker->B5F = 500.f;	/* Hz */

  speaker->agm = IsMale ?  4.f : 3.f;				/* sq. mm */
  speaker->agAVModalOffsetMax = IsMale ? 11.f : 9.f;	/* sq. mm */
  speaker->agAVModalOffsetOnOff = IsMale ? 7.f : 6.f;	/* sq. mm */
  speaker->agMin = 1.f;			/* sq. mm */
  speaker->agHiKLSourceCutoff = AGHIKLSOURCECUTOFF_VAL; /* sq. mm */
  speaker->AVPressureThreshold = 3.5f;          /*cm H20 */
  speaker->KdPTdc = 0.03f;  /* cm H20 */
  speaker->Kv = 33.f;				/* dB */
  speaker->KdAV0 = IsMale ?  200.f : 220.f;    /* dB / sq. cm */
  speaker->KdAV  = IsMale ?  100.f : 120.f;    /* dB / sq. cm */
  speaker->KdAV1 = IsMale ?  400.f : 420.f;    /* dB / sq. cm */
  speaker->Ka = 42.f;				/* dB */
  speaker->Kf = 40.f;				/* dB */
  speaker->AFInterpTimeStep = 0.001f;		/* sec */
  speaker->AFThreshold = 35.f;			/* dB from Williams */

  speaker->OQm = IsMale ?  50.f : 65.f;	/* Percent */	
  speaker->KOQ = IsMale ? 3.3f : 3.96f;
  speaker->OQMax = 99.f;	/* Percent from Williams */
  speaker->OQMin = 0.f;	/* Percent */

  speaker->TLBreakArea = 20.f;	/* sq. mm */
  speaker->KTL = IsMale ? 1.5f : 1.8f;
  speaker->TLm = IsMale ?  5.f : 10.f;	/* dB */
  speaker->SFromf4 = 0.29f;
  speaker->SDefault = IsMale ? 1000.f : 1150.f;	/* Hz */
  speaker->PctSfordBTL = 0.10f;		/* Percent (fractonal)*/
  speaker->dBTLforPctS = 4.f;	/* dB */
  speaker->TLMax = 41.f;	/* dB from Williams */
  speaker->TLMin = 0.f;		/* dB */

  speaker->KDI = 15.f;	/* From Williams */
  speaker->agDIMin = 1.f;	/* mm^2 */

  speaker->KdF = 20.f;	/* mm^2/s */
  speaker->F1T = 600.f;	/* Hz */
  
  /*****
    The B1 modal bandwidth is different from the Williams code but is
    consistant with the chapter.
  *****/
  
  speaker->B1m = 80.f;	/* Hz was 60 in Dave Williams */
  speaker->B2m = 90.f;	/* Hz */
  speaker->B3m = 150.f;	/* Hz */
  speaker->B4m = IsMale ?  350.f : 400.f;	/* Hz */
  speaker->B5m = IsMale ?  500.f : 600.f;	/* Hz */
/*speaker->KB1 = 15.f;
  speaker->KB2 = 8.f;*/
  speaker->KB3 = 4.f;
  speaker->KB4 = 2.f;
  speaker->KB5 = 2.f;

  speaker->F5 = IsMale ? 4500.f : 5200.f;	/* Hz */

  /*****
    The formant 6 filter is not used in the HLSYN code.
    NOTE: Setting A6F = 0 dB does not really remove it.  
    That is why I set the bandwidth and resonant
    frequency to the default values from Klatt.
  *****/

  speaker->A6f = 0.f;	/* dB, Remove filter (sort of) */
  speaker->F6 = 4990.f;	/* Hz */
  speaker->B6F = 1500.f;	/* Hz */
  speaker->Kdf0dc = 3.0f;  /* dHz */
  speaker->Kpd = 30.0f;  /* dHz / cm H20 */
  speaker->Kf1 = IsMale ?  5.0e-4f : 4.6e-4f; /* 1 / Hz */
  speaker->f1_neutral = IsMale ?  500.0f : 590.0f; /* Hz */
  speaker->f0_vowelshift_f1_break = 250.0f; /* Hz */
  speaker->Lt = IsMale ?  12.0f : 11.0f; /* cm */
  speaker->At = IsMale ?  2.5f : 2.0f; /* cm^2 */
  speaker->Lvg = IsMale ?  .4f : 0.3f; /* cm */
  speaker->Lv = IsMale ?  17.0f : 15.0f; /* cm */
  speaker->Av = IsMale ?  3.5f : 3.0f; /* cm^2 */
  speaker->Lhp = IsMale ?  0.3f : 0.2f; /* cm */

  /*****
    Initialize the previous state to known values.  They are
    set to zero now but there may be better values.
  *****/

  oldstate->acl = 0.f;
  oldstate->acd = 0.f;
  oldstate->loc = 0;
  oldstate->acx = 0.f;  /* SpeechCircuit,InterpolateAF */
  oldstate->agx = 0.f;

  oldstate->Pm = 0.f;   /* SpeechCircuit,InterpolateAF */

  oldstate->Pcw = 0.f;  /* SpeechCircuit */
  oldstate->Ug = 0.f;   
  oldstate->Uacx = 0.f; 
  oldstate->Un = 0.f;   
  oldstate->Uw = 0.f;
  oldstate->f1c = 0.f;
  oldstate->f1x = 0.f;
  oldstate->b1x = 0.f;
  oldstate->Cw = speaker->Cwm;
  oldstate->Cg = speaker->Cgm;
  oldstate->agf = 0.f;

  /*****
    Initialize the previous frame to known values.  Again there
    may be more reasonable choices than 0.
  *****/

  oldframe->ag = 0.f;		/* Used in SpeechCircuit */
  oldframe->al = 0.f;
  oldframe->ab = 0.f;
  oldframe->an = 0.f;		/* Used in SpeechCircuit */
  oldframe->ue = 0.f;		/* Used in SpeechCircuit */
  oldframe->f0 = 0.f;
  oldframe->f1 = 0.f;
  oldframe->f2 = 0.f;
  oldframe->f3 = 0.f;
  oldframe->f4 = 0.f;
  oldframe->ps = 0.f;
  oldframe->dc = 0.f;
  oldframe->ap = 0.f;
}
#if 0 
static void 
SetAlveolar(HLSpeaker *speaker,short IsMale)

{
  short f2,f3;
  float Scale;

  /*****
    Clear the alveolar to zero
      *****/		

  for(f2=ALV_F2_MIN;f2<=ALV_F2_MAX;f2+=ALV_RESOLUTION){
    for(f3=ALV_F3_MIN;f3<=ALV_F3_MAX;f3+=ALV_RESOLUTION){
      ALVEOLAR(f2,f3).A2F=0.f;
      ALVEOLAR(f2,f3).A3F=0.f;
      ALVEOLAR(f2,f3).A4F=0.f;
      ALVEOLAR(f2,f3).A5F=0.f;
      ALVEOLAR(f2,f3).AB=0.f;
    }
  }

  if(IsMale)
    Scale=1.f;
  else
    Scale=FEMALE_SCALE;


  /*****
    The dental region
  ******
			 f3,  f2mn,f2mx,2F,3F,4F,5F,AB
  *****/

#if (ALV_RESOLUTION == 50)
  Atf3Setf2Range(speaker,2000,1200,1200,NA,55.f,NA,NA,NA,Scale);    /* [thr] */
  Atf3Setf2Range(speaker,2050,1200,1250,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2100,1200,1250,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2150,1200,1300,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2200,1200,1350,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2250,1200,1350,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2300,1200,1400,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2350,1200,1450,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2400,1250,1450,NA,NA,NA,NA,55.f,Scale);    /* [th] */
  Atf3Setf2Range(speaker,2450,1200,1450,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2500,1150,1450,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2550,1150,1450,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2600,1100,1450,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2650,1100,1450,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2700,1100,1450,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2750,1150,1350,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2800,1150,1250,NA,NA,NA,NA,55.f,Scale);
#else /* ALV_RESOLUTION == 25 */
  Atf3Setf2Range(speaker,2000,1200,1250,NA,55.f,NA,NA,NA,Scale);    /* [thr] */
  Atf3Setf2Range(speaker,2050,1200,1275,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2100,1225,1300,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2150,1225,1325,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2200,1225,1375,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2250,1225,1400,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2300,1225,1425,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2350,1225,1475,NA,55.f,NA,NA,NA,Scale);
  Atf3Setf2Range(speaker,2400,1250,1475,NA,NA,NA,NA,55.f,Scale);    /* [th] */
  Atf3Setf2Range(speaker,2450,1225,1475,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2500,1175,1500,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2550,1175,1500,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2600,1125,1500,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2650,1125,1500,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2700,1125,1475,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2750,1150,1375,NA,NA,NA,NA,55.f,Scale);
  Atf3Setf2Range(speaker,2800,1175,1275,NA,NA,NA,NA,55.f,Scale);
#endif

  /*****
    The palato-alveolar region
  ******
			 f3  ,f2mn,f2mx,2F,3F,4F,5F,AB
  *****/

#if (ALV_RESOLUTION == 50)
  Atf3Setf2Range(speaker,2300,1750,1800,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2350,1700,1900,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2400,1700,1950,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2450,1750,2050,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2500,1800,2000,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2500,2050,2100,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,1850,2000,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,2050,2200,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2600,1900,2000,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2600,2050,2250,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2650,2050,2250,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2700,2100,2200,NA,60.f,55.f,NA,NA,Scale);
#else /* ALV_RESOLUTION == 25 */
  Atf3Setf2Range(speaker,2300,1750,1850,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2350,1725,1950,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2400,1725,2000,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2450,1750,2075,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2500,1800,2050,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2500,2075,2150,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,1850,2025,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,2050,2250,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2600,1925,2025,NA,65.f,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2600,2050,2300,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2650,2075,2300,NA,60.f,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2700,2100,2250,NA,60.f,55.f,NA,NA,Scale);
#endif

  /*****
    The alveolar (plus round) region
      ******
	f3,  f2mn,f2mx,2F,3F,4F,5F,AB
	  *****/

#if (ALV_RESOLUTION == 50)
  Atf3Setf2Range(speaker,1850,1200,1250,NA,NA,55.f,NA,NA,Scale);    /* [tr] */
  Atf3Setf2Range(speaker,1850,1300,1400,NA,NA,55.f,NA,NA,Scale);    /* [tw] */
  Atf3Setf2Range(speaker,1900,1200,1300,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,1900,1350,1450,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,1950,1250,1300,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,1950,1350,1500,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2000,1250,1350,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2000,1400,1500,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2050,1300,1350,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2050,1400,1550,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2100,1300,1400,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2100,1450,1550,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2150,1350,1400,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2150,1450,1600,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2200,1400,1450,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2200,1500,1600,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2250,1400,1450,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2250,1500,1650,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2300,1450,1450,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2300,1500,1650,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2350,1500,1650,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2400,1500,1650,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2450,1500,1700,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2500,1500,1750,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,1500,1700,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,1750,1800,NA,NA,NA,60.f,NA,Scale);    /* [t] */
  Atf3Setf2Range(speaker,2600,1500,1650,NA,NA,60.f,NA,NA,Scale);    /* [tu] */
  Atf3Setf2Range(speaker,2600,1700,1850,NA,NA,NA,60.f,NA,Scale);    /* [t] */
  Atf3Setf2Range(speaker,2650,1500,2000,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2700,1500,2050,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2750,1550,2200,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2800,1600,2200,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2850,1850,2250,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2900,1900,2250,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2950,1950,2150,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,3000,2000,2150,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3050,2000,2100,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3100,2000,2100,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3150,2000,2100,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3200,2000,2100,NA,NA,NA,65.f,NA,Scale);
#else /* ALV_RESOLUTION == 25 */
  Atf3Setf2Range(speaker,1850,1200,1300,NA,NA,55.f,NA,NA,Scale);    /* [tr] */
  Atf3Setf2Range(speaker,1850,1325,1425,NA,NA,55.f,NA,NA,Scale);    /* [tw] */
  Atf3Setf2Range(speaker,1900,1225,1325,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,1900,1350,1475,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,1950,1250,1350,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,1950,1375,1525,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2000,1275,1375,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2000,1400,1550,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2050,1300,1400,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2050,1425,1575,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2100,1325,1425,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2100,1450,1600,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2150,1350,1450,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2150,1475,1625,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2200,1400,1475,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2200,1500,1650,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2250,1425,1475,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2250,1500,1675,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2300,1450,1475,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2300,1500,1700,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2350,1500,1700,NA,NA,55.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2400,1500,1700,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2450,1500,1725,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2500,1525,1775,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,1525,1750,NA,NA,60.f,NA,NA,Scale);
  Atf3Setf2Range(speaker,2550,1775,1825,NA,NA,NA,60.f,NA,Scale);    /* [t] */
  Atf3Setf2Range(speaker,2600,1525,1700,NA,NA,60.f,NA,NA,Scale);    /* [tu] */
  Atf3Setf2Range(speaker,2600,1725,1900,NA,NA,NA,60.f,NA,Scale);    /* [t] */
  Atf3Setf2Range(speaker,2650,1525,2050,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2700,1525,2075,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2750,1550,2225,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2800,1600,2225,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2850,1850,2275,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2900,1900,2275,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,2950,1950,2200,NA,NA,NA,60.f,NA,Scale);
  Atf3Setf2Range(speaker,3000,2000,2175,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3050,2025,2150,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3100,2025,2125,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3150,2025,2125,NA,NA,NA,65.f,NA,Scale);
  Atf3Setf2Range(speaker,3200,2025,2125,NA,NA,NA,65.f,NA,Scale);
#endif
}
#endif
#if 0
static void 
Atf3Setf2Range(HLSpeaker *speaker,short f3,short f2Min,short f2Max,
    float A2F,float A3F,float A4F,float A5F,float AB,float Scale)

{
  short f2, f2MinScaled, f2MaxScaled, f3Scaled;

  /*****
    This routine sets those regions it is told to and
    leaves the rest alone.
  *****/

  f2MinScaled = (short)(f2Min * Scale );
  f2MaxScaled = (short)(f2Max * Scale );
  f3Scaled = (short)(f3 * Scale );

  for(f2=f2MinScaled;f2<=f2MaxScaled;f2+=ALV_RESOLUTION){
    if(f2 >= ALV_F2_MIN && f2 <= ALV_F2_MAX
      && f3Scaled >= ALV_F3_MIN && f3Scaled <= ALV_F3_MAX){
      if(A2F>0)
        ALVEOLAR(f2,f3Scaled).A2F=A2F;
      if(A3F>0)
        ALVEOLAR(f2,f3Scaled).A3F=A3F;
      if(A4F>0)
        ALVEOLAR(f2,f3Scaled).A4F=A4F;
      if(A5F>0)
        ALVEOLAR(f2,f3Scaled).A5F=A5F;
      if(AB>0)
        ALVEOLAR(f2,f3Scaled).AB=AB;
    }
#ifdef DEBUG		
      else{
        printf("Try to write out of alveolar range.");
        exit(1);
      }
#endif
  }
}
#endif
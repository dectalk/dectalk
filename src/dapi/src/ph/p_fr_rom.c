/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:  f_fr_rom.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *   Arrays used by the phonetic component
 *
 ***********************************************************************
 *    Revision History:
 * 001  ..-..-86  Michel  INITIAL CODING
 * 002  14-05-92  Michel  Clean up, add comments
 * 003  ..-07-94  Michel  I AV=60 (64), F3 reduce otherwise click due to F4 for Dennis
 *                        Y AV=56 (64), idem
 * 004  22-05-95  Michel  Delete many arrays no longer used with the new phsettar 
 * 005  04-08-95  Michel  Translate comments in English
 * 006  04-12-95  EAB     Add FE/MALE voice tables.
 * 007  07-20-00  CHJ     Renamed to p_fr_rom.c
 * 008  07-28-00  CHJ     Changed fr_featb to shorts and commented out some feature bits
 * 009  09-21-00  CAB     Fixed copyright info and formatted comment section.
 * 010  01-17-01  CAB     Merged Michel Divay changes for the French
 * 011  02-09-01  CAB     Added additional changes by Michel
 * 012  03-01-01  Eab     Corected some values that I believe I put in and reset 
                          to thoerctical values based on Ken's Stevens work 
                          and eliminated femamp as a redundant error source.
 * 013  08-31-01  CAB     Added ifdef NEW_PHONES
 * 014  05-15-02  Michel  replaced features TVoyelle, etc by their English equivalent;
                          deleted SegX and SegSil;
                          added comments and made some cosmetic changes.
*/

#ifdef NEW_PHONES
#include "l_all_ph.h"
#else
#include "l_fr_ph.h"
#endif


// Phonemes features for French
const short fr_featb [PHO_SYM_TOT] = {
  /* SI   */ 0,
  // NON-NASAL VOWELS
  /* F_A  */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_A3 */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_E2 */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_AU */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_E  */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_E1 */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_EU */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_I  */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_O  */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_O6 */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_OU */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,
  /* F_U  */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1,

  // NASALS VOWELS
  /* F_AN */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1 +FNASAL,
  /* F_IN */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1 +FNASAL,
  /* F_ON */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1 +FNASAL,
  /* F_UN */ FVOWEL  +FVOICD +FSONOR +FSYLL   +FSON1 +FNASAL,

  // SPECIAL VOWEL : schwa
#ifdef HLSYN
//don't know how this is really used. In much of the code he reefers to it as a aspirative
	//schwaa 
  /* F_AP */ FVOWEL +FSONOR +FCONSON,
#else

  /* F_AP */ FVOWEL  +FVOICD +FSONOR          +FSON1 +FCONSON,
#endif
  // LIQUIDS AND SEMIVOWELS
  /* F_L  */ FCONSON +FVOICD +FSONOR +TLiqGli +FSON1,
//  /* F_R  */ FCONSON +FVOICD +FSONOR +TLiqGli +FSON1,
	FCONSON  +FSONOR +TLiqGli+FOBST,
  /* F_W  */ FCONSON +FVOICD +FSONOR +TLiqGli +FSON1,
  /* F_WU */ FCONSON +FVOICD +FSONOR +TLiqGli +FSON1,
  /* F_Y  */ FCONSON +FVOICD +FSONOR +TLiqGli +FSON1,

  // FRICATIVE CONSONANTS
  /* F_CH */ FCONSON         +FOBST  +TFricative,
  /* F_F  */ FCONSON         +FOBST  +TFricative,
  /* F_J  */ FCONSON +FVOICD +FOBST  +TFricative,
  /* F_RX */ FCONSON         +FOBST  +TFricative,
  /* F_S  */ FCONSON         +FOBST  +TFricative,
  /* F_V  */ FCONSON +FVOICD +FOBST  +TFricative,
  /* F_Z  */ FCONSON +FVOICD +FOBST  +TFricative,

  // PLOSIVES CONSONANTS
  /* F_B  */ FCONSON +FVOICD +FOBST  +FPLOSV +FBURST +FSTOP,
  /* F_D  */ FCONSON +FVOICD +FOBST  +FPLOSV +FBURST +FSTOP,
  /* F_G  */ FCONSON +FVOICD +FOBST  +FPLOSV +FBURST +FSTOP,
  /* F_K  */ FCONSON         +FOBST  +FPLOSV +FBURST +FSTOP,
  /* F_P  */ FCONSON         +FOBST  +FPLOSV +FBURST +FSTOP,
  /* F_T  */ FCONSON         +FOBST  +FPLOSV +FBURST +FSTOP,

  // NASAL CONSONANT
  /* F_GN */ FCONSON +FVOICD +FOBST  +FSONOR +FNASAL+FSTOP,
  /* F_M  */ FCONSON +FVOICD +FSONOR +FNASAL+FSON1+FSTOP,
  /* F_N  */ FCONSON +FVOICD +FSONOR +FNASAL+FSON1+FSTOP,
  /* F_NG */ FCONSON +FVOICD +FOBST  +FSONOR +FNASAL+FSON1+FSTOP
};


// Inherent durations (in msec) for phones  phtiming.c, phsettar.c
//    Voy. ouverte : A, A3, O, O6, An, On
//    Voy. fermée  : I, Ou, U, W, Y, Wu
//    Autre        : E1, Au, E, E2, Eu, In, Un
const short fr_inhdr [] = {
//   SI     A    A3    E2    Au     E    E1    Eu     I     O
    305,  120,  120,  120,  120,  110,  110,  120,  100,  120,

//   O6    Ou     U    An    In    On    Un    AP     L     R
    120,  110,  110,  130,  130,  110,  130,   50,   60,   70,

//    W    Wu     Y    Ch     F     J    Rx     S     V     Z
     70,   80,   60,  130,  130,  100,   70,  130,   75,   75,

//    B     D     G     K     P     T    Gn     M     N    Ng
     80,   80,   90,  100,  110,  110,  120,   90,   80,   80

};


// Minimum durations (in msec) for phones  phtiming.c
// not used for French; keep it for later
const short fr_mindur [] = {
//   SI     A    A3    E2    Au     E    E1    Eu     I     O
    200,   80,   80,   80,   80,   60,   70,   80,   60,   90,

//   O6    Ou     U    An    In    On    Un    AP     L     R
     90,   90,   60,   90,   90,   90,   90,   25,   40,   40,

//    W    Wu     Y    Ch     F     J    Rx     S     V     Z
     30,   30,   20,   60,   60,   70,   40,   65,   55,   60,

//    B     D     G     K     P     T    Gn     M     N    Ng
     60,   60,   60,   75,   70,   50,   80,   60,   40,   80
};


// burst durations in ms : ph_setar.c
const short fr_burdr [] = {
//   SI     A    A3    E2    Au     E    E1    Eu     I     O
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//   O6    Ou     U    An    In    On    Un    AP     L     R
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//    W    Wu     Y    Ch     F     J    Rx     S     V     Z
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//    B     D     G     K     P     T    Gn     M     N    Ng
      7,   13,   20,   20,   10,   13,    0,    0,    0,    0
};


// 1:front; 2:back unrounded; 3:back rounded; 4:null; used in ph_setar.c
// Michel June 2001 : U and SegAXP are type 1 now
const short fr_begtyp [] = {
//   SI     A    A3    E2    Au     E    E1    Eu     I     O
      4,    2,    2,    1,    3,    1,    1,    3,    1,    3,

//   O6    Ou     U    An    In    On    Un    AP     L     R
      3,    3,    1,    2,    1,    3,    3,    1,    5,    5,

//    W    Wu     Y    Ch     F     J    Rx     S     V     Z
      5,    5,    5,    4,    4,    4,    4,    4,    4,    4,

//    B     D     G     K     P     T    Gn     M     N    Ng
      4,    4,    4,    4,    4,    4,    4,    4,    4,    4
 };


// idem begtyp, except if diphtongs, used in ph_setar.c
// June 2001 : U and SegAXP are type 1 now
const short fr_endtyp [] = {
//   SI     A    A3    E2    Au     E    E1    Eu     I     O
      4,    2,    2,    1,    3,    1,    1,    3,    1,    3,

//   O6    Ou     U    An    In    On    Un    AP     L     R
      3,    3,    1,    2,    1,    3,    3,    1,    5,    5,

//    W    Wu     Y    Ch     F     J    Rx     S     V     Z
      5,    5,    5,    4,    4,    4,    4,    4,    4,    4,

//    B     D     G     K     P     T    Gn     M     N    Ng
      4,    4,    4,    4,    4,    4,    4,    4,    4,    4
};



// value for each phoneme for male voices: ph_setar.c
const short Cibles_MALE [42] [N_PARAM] = {
//       A2 A3 A4 A5 A6 AB AH AV TLT  F1   F2   F3 FNZ  B1  B2  B3
/*Si*/ {  0, 0, 0, 0, 0, 0, 0, 0, 0,  -1,  -1,  -1,290, -1, -1, -1 },//Si
/*A */ {  0, 0, 0, 0, 0, 0, 0,64, 0, 650,1360,2590,290,180, 110,200 },//A 
/*A3*/ {  0, 0, 0, 0, 0, 0, 0,64, 0, 780,1200,2500,290,130, 70,160 },//A3
/*E2*/ {  0, 0, 0, 0, 0, 0, 0,64, 0, 480,1890,2600,290, 70,100,200 },//E2
/*Au*/ {  0, 0, 0, 0, 0, 0, 0,64, 0, 400, 800,2570,290,100, 80,120 },//Au
/*E */ {  0, 0, 0, 0, 0, 0, 0,64, 0, 410,1520,2390,290, 80, 80,140 },//E 
/*E1*/ {  0, 0, 0, 0, 0, 0, 0,64, 0, 380,2100,2600,290, 60,100,280 },//E1
/*Eu*/ {  0, 0, 0, 0, 0, 0, 0,64, 0, 410,1475,2225,290,100, 80,200 },//Eu
/*I */ {  0, 0, 0, 0, 0, 0, 0,63, 0, 330,2200,2900,290,150,130,200 },//I 
/*O */ {  0, 0, 0, 0, 0, 0, 0,64, 0, 560,1100,2390,290, 90, 80,120 },//O 
/*O6*/ {  0, 0, 0, 0, 0, 0, 0,64, 0, 520,1420,2280,290, 60,120,250 },//O6
/*Ou*/ {  0, 0, 0, 0, 0, 0, 0,62, 0, 340, 770,2550,290, 60, 90,150 },//Ou
/*U */ {  0, 0, 0, 0, 0, 0, 0,62, 0, 310,1850,2410,290, 80, 90,180 },//U 
#ifdef HLSYN
/*An*/ {  0, 0, 0, 0, 0, 0,50,64, 6, 600, 825,2290,90,120,180,250 },//An
/*In*/ {  0, 0, 0, 0, 0, 0,45,64, 6, 730,1500,2580,350,300,100,250 },//In
/*On*/ {  0, 0, 0, 0, 0, 0,40,65, 6, 433, 950,2902,150,200,100,200 },//On
/*Un*/ {  0, 0, 0, 0, 0, 0,55,64, 6, 650,1440,2970,350,160,100,200 },//Un
#else
/*An*/ {  0, 0, 0, 0, 0, 0,50,64, 6, 622, 825,2470,390,100,180,250 },//An
/*In*/ {  0, 0, 0, 0, 0, 0,45,64, 6, 730,1500,2580,350,300,100,250 },//In
/*On*/ {  0, 0, 0, 0, 0, 0,40,65, 6, 430, 900,2400,350,300,100,200 },//On
/*Un*/ {  0, 0, 0, 0, 0, 0,55,64, 6, 650,1440,2970,350,160,100,200 },//Un

#endif
/*Ap*/ {  0, 0, 0, 0, 0, 0, 0,55,20, 430,1500,2500,290,120, 60,120 },//Ap
//       A2 A3 A4 A5 A6 AB AH AV TLT  F1   F2   F3 FNZ  B1  B2  B3
		//michel I chnage f2 of lo from 1800 where there can e a pole but based on very limited
		//data Iam not confident of this
/*L */ {  0, 0, 0, 0, 0, 0, 0,60, 0, 350,1330,2600,290, 55, 80,220 },//L 
/*R */ { 40,30,35,30, 0, 0, 0, 0, 0, 450, 1100,2400,290,140,200,250 },//R 
/*W */ {  0, 0, 0, 0, 0, 0, 0,60, 0, 350, 600,2800,290, 60, 60,350 },//W 
/*Wu*/ {  0, 0, 0, 0, 0, 0, 0,62, 0, 330,1850,2400,290, 50, 60, 60 },//Wu
/*Y */ {  0, 0, 0, 0, 0, 0, 0,56, 0, 230,2370,2570,290, 50,200,300 },//Y 
/*Ch*/ {  0, 0, 0, 0, 0, 0, 0, 0, 7, 350,1550,2500,290,200,280,250 },//Ch
/*F */ {  0, 0, 0, 0, 0, 0, 0, 0, 7, 340,1800,2600,290,200,300,150 },//F 
/*J */ {  0, 0, 0, 0, 0, 0, 0, 0,40, 300,1800,2400,290,320,140,250 },//J 
/*Rx*/ {  0, 0, 0, 0, 0, 0, 0, 0, 0, 240,1200,2500,290,250,220,250 },//Rx
/*S */ {  0, 0, 0, 0, 0, 0, 0, 0, 7, 320,1420,2550,290,200,180,300 },//S 
/*V */ {  0, 0, 0, 0, 0, 0, 0,53, 7, 360,1400,2480,290,100,120,120 },//V 
/*Z */ {  0, 0, 0, 0, 0, 0, 0,53, 7, 280,1620,2600,290,100,140,300 },//Z 
/*B */ {  0, 0, 0, 0, 0, 0, 0,40,40, 250,1100,2150,290, 90, 80,130 },//B 
/*D */ {  0, 0, 0, 0, 0, 0, 0,40,40, 250,1600,2600,290, 90,100,240 },//D 
/*G */ {  0, 0, 0, 0, 0, 0, 0,40,40, 180,1790,2520,290, 90,120,180 },//G 
/*K */ {  0, 0, 0, 0, 0, 0, 0, 0, 7, 180,1790,2250,290,200,160,280 },//K 
/*P */ {  0, 0, 0, 0, 0, 0, 0, 0, 7, 250,1370,2050,290,200,180,250 },//P 
/*T */ {  0, 0, 0, 0, 0, 0, 0, 0, 7, 350,1700,2700,290,200,150,250 },//T 
/*Gn*/ {  0, 0, 0, 0, 0, 0, 0,52, 6, 330,2150,2650,400,100,200,380 },//Gn
#ifdef HLSYN
/*M */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 300,1100,2000,150,130,300,130 },//M 
/*N */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 300,1400,2600,150,200,200,200 },//N 
#else
/*M */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 300,1100,2000,400,130,300,130 },//M 
/*N */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 300,1600,2600,400,200,200,200 },//N 

#endif
/*Ng*/ {  0, 0, 0, 0, 0, 0, 0,60, 6, 380,1440,2350,400,160,150,100 } //Ng
//       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3
};


// value for each phoneme for female voices: ph_setar.c
// Michel : I have not yet tried to improve the female voice
const short Cibles_FEMALE [42] [N_PARAM] = {
/*        A2 A3 A4 A5 A6 AB AH AV TLT  F1   F2   F3 FNZ  B1  B2  B3       */
/*  */  {  0, 0, 0, 0, 0, 0, 0, 0, 0,   0,   0,   0,  0,  0,  0,  0 },/*  */
/*fA */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 895,1319,2980,290,180,210,200 },/*A */
/*fA3*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 780,1200,2500,290,130, 70,160 },/*A3*/
/*fE2*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 520,1950,2690,290, 70,100,200 },/*E2*/
/*fAu*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 520, 926,2680,290,120, 80,110 },/*Au*/
/*fE */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 550,1710,2670,290, 90, 80,140 },/*E */
/*fE1*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 350,2050,2600,290,100,100,280 },/*E1*/
/*fEu*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 430,1555,2675,290,100, 80,200 },/*Eu*/
/*fI */ {  0, 0, 0, 0, 0, 0, 0,61, 0, 300,2450,3100,290,80,130+30,200 },/*I*/
/*fO */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 550,1000,2330,290,90,80,120 },/*O */
/*fO6*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 550,1475,2315,290, 80,120,250 },/*O6*/
/*fOu*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 300, 770,2100,290, 80, 90,150 },/*Ou*/
/*fU */ {  0, 0, 0, 0, 0, 0, 0,65, 4, 260,1810,2210,290, 80, 90,180 },/*U */

#ifdef HLSYN
/*fAn*/ {  0, 0, 0, 0, 0, 0, 0,67,10, 480,900,2845,340,100,180,250 },/*An*/
/*fIn*/ {  0, 0, 0, 0, 0, 0, 0,67,10, 550,1500,2750,340,300,100,250 },/*In*/
/*fOn*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 380,850,2900,340,300,150,200 },/*On*/
/*fUn*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 698,1668,2768,340,200,150,200 },/*Un*/

#else
/*fAn*/ {  0, 0, 0, 0, 0, 0, 0,67,10, 700,1000,2845,340,100,180,250 },/*An*/
/*fIn*/ {  0, 0, 0, 0, 0, 0, 0,67,10, 740,1500,2750,340,300,100,250 },/*In*/
/*fOn*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 570,980,2400,340,300,150,200 },/*On*/
/*fUn*/ {  0, 0, 0, 0, 0, 0, 0,58,  0, 898,1868,3068,340,200,150,200 },/*Un*/

#endif
/*fAp*/ {  0, 0, 0, 0, 0, 0, 0,35, 10, 430,1500,2500,290,120, 120,120 },/*Ap*/
/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
/*fL */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 379,1684,2981,290, 55, 80,220 },/*L */
/*fR */ { 40-8,30-8,35-8,30-8, 0, 0, 0,45,16, 522,1038,2660,290,140,200,250 },/*R */ 
/*fW */ {  0, 0, 0, 0, 0, 0, 0,62, 6, 280, 700,2800,290, 60, 60,350 },/*W */
/*fWu*/ {  0, 0, 0, 0, 0, 0, 0,63, 6, 330,1550,2150,290, 50, 60, 60 },/*Wu*/
/*fY */ {  0, 0, 0, 0, 0, 0, 0,56, 6, 250,2370,2570,290, 50,200,300 },/*Y */
/*fCh*/ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1950,2700,290,200,280,250 },/*Ch*/
/*fF */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 340,1300,2080,290,200,120,150 },/*F */
/*fJ */ {  0, 0, 0, 0, 0, 0, 0, 0,40, 300,1950,2400,290,320,140,250 },/*J */
/*fRx*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6, 800,1200,2500,290,250,220,250 },/*Rx*/
/*fS */ {  0, 0, 0, 0, 0, 0, 0, 0,10, 320,1420,2550,290,200,180,300 },/*S */
/*fV */ {  0, 0, 0, 0, 0, 0, 0,53,12, 280,1100,2980,290,100,120,120 },/*V */
/*fZ */ {  0, 0, 0, 0, 0, 0, 0,53,10, 287,1820,2930,290,100,140,300 },/*Z */
/*fB */ {  0, 0, 0, 0, 0, 0, 0, 0,20, 250,1100,2150,290, 90, 80,130 },/*B */
/*fD */ {  0, 0, 0, 0, 0, 0, 0,45,20, 250,1733,2880,290, 90,100,240 },/*D */
/*fG */ {  0, 0, 0, 0, 0, 0, 0, 0,20, 250,1790,2520,290, 90,120,180 },/*G */
/*fK */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1790,2250,290,200,160,280 },/*K */
/*fP */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 250,1370,2050,290,200,180,250 },/*P */
/*fT */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1700,2900,290,200,150,250 },/*T */
/*fGn*/ {  0, 0, 0, 0, 0, 0, 0,52,18, 330,2350,3050,400,100,200,380 },/*Gn*/
#ifdef HLSYN
/*fM */ {  0, 0, 0, 0, 0, 0, 0,61,12, 350,1200,2220,150,130,280,360 },/*M */
/*fN */ {  0, 0, 0, 0, 0, 0, 0,60,12, 430,1640,2500,150,130,200,460 },/*N */
/*fNg*/ {  0, 0, 0, 0, 0, 0, 0,60, 6, 380,1440,2350,150,160,150,100 } /*Ng*/
#else
/*fM */ {  0, 0, 0, 0, 0, 0, 0,61,12, 250,1600,2620,400,130,280,360 },/*M */
/*fN */ {  0, 0, 0, 0, 0, 0, 0,60,12, 430,1340,2500,400,130,300,460 },/*N */
/*fNg*/ {  0, 0, 0, 0, 0, 0, 0,60, 6, 280,1440,2350,400,160,150,100 } /*Ng*/

#endif
/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
};



// Consonant-vowel formant transition specifications for male voices :
//   F1 locus, F1 percent, F1 transdur, 
//   F2 locus, F2 percent, F2 transdur, 
//   F3 locus, F3 percent, F3 transdur 
// front   : I, E1, E2, E, U, In, Ap
// back    : A, A3, An
// rounded : Au, O, O6, Ou, On, Un
// boundary value is : locus + percent (Fr. phocur - locus)

const short fr_maleloc[] = {
  0,
  //  F1           F2          F3 : frequency, %, transition duration

  300,63,30,      1,92,35,   2080, 45,30,  //   1 : F front
  320,60,30,   1200,30,35,   2100, 65,40,  //  10 : F back et rounded FAFA, FAU

  300,50,30,      1,92,35,   2080, 35,40,  //  19 : V front
  300,50,30,   1200,30,35,   2100, 65,40,  //  28 : V back et rounded

  280,40,45,   2150,50,90,    2700, 50,70,  //  37 : Gn front
  280,40,45,   2150,20,60,   3000, 50,60,  //  46 : Gn not used
  280,40,45,   2150,20,60,   3000, 50,60,  //  55 : Gn not used
  280,40,45,   2150,20,60,   3000, 50,60,  //  64 : Gn not used

  310,40,40,   1640,50,60,   2550, 50,70,  //  73 : S front
  310,40,40,   1640,40,80,   2630,  0,70,  //  82 : S back-unrounded
  310,40,40,   1520,15,80,   2460,  0,65,  //  91 : S rounded

  310,40,40,   1540,35,50,   2550,  0,70,  // 100 : Z front
  310,40,40,   1240,35,60,   2630,  0,70,  // 109 : Z back-unrounded
  310,40,40,   1320,15,60,   2460,  0,65,  // 118 : Z rounded

  350,55,20,    950,70,30,   2200, 25,45,  // 127 : P front
  350,45,25,    920,40,30,   2250, 40,50,  // 136 : P back et rounded

  330,55,20,   1350,70,30,   2500, 50,45,  // 145 : B front
  180,25,25,    920,60,30,   2250, 40,50,  // 154 : B back et rounded BAuBAu

  320,43,35,   1800,66,35,   3000, 30,45,  // 163 : T front
  320,43,50,   1700,40,75,   2600,  0,60,  // 172 : T back-unrounded
  320,43,40,   1700,10,95,   2600,  0,95,  // 181 : T rounded

  250,43,35,   1800,66,35,   2650, 30,45,  // 190 : D front
  200,10,50,   1800,10,75,   2800,  0,50,  // 199 : D back-unrounded
  250,43,40,   1700,40,95,   2300,  0,95,  // 208 : D rounded

  180,33,45,   1990,50,50,   3000,100,50,  // 217 : K front KIKI
  320,33,30,   2000,16,60,   2500,  0,90,  // 226 : K back-unrounded KAKA
  320,33,40,   1600,66,50,   2250, 30,80,  // 235 : K rounded

  250,33,45,   1990,50,50,   3000,113,50,  // 244 : G front
  300,33,50,   2000,16,60,   2150, 50,90,  // 253 : G back-unrounded
  290,45,40,   1600,50,65,   1920, 15,80,  // 262 : G rounded

  320,54,55,   1750,25,60,   2750, 19,70,  // 271 : Ch front
  320,54,55,   1550,10,40,   2000, 10,70,  // 280 : Ch back-unrounded
  320,54,55,   1550,10,70,   2350, 10,100, // 289 : Ch rounded

  240,32,55,   1750,55,60,   2750, 19,70,  // 298 : J front
  245,32,55,   1580,20,50,   2450, 10,70,  // 307 : J back-unrounded
  245,32,55,   1680,10,60,   2350, 10,100, // 316 : J rounded
#ifdef HLSYN

  370,30,30,   1200,25,35,   2000, 30,40,  // 325 : M front
  350,20,30,   1000,20,40,   1550, 80,25,  // 334 : M back et rounded

  350,20,35,   1500,30,50,   2800, 25,65,  // 343 : N front
  350,20,30,   1500,20,45,   2600,  0,60,  // 352 : N back-unrounded
  350,20,30,   1500,15,95,   2820,  0,95,  // 361 : N rounded

  340,25,40,   2200,15,60,   3000,105,60,  // 370 : Ng front
  340,25,40,   1800,20,50,   2150, 20,70,  // 379 : Ng back-unrounded
  340,25,40,   1700,42,70,   1920, 25,70   // 388 : Ng rounded
#else

  470,30,30,   1200,25,35,   2000, 30,40,  // 325 : M front
  450,20,30,   1000,20,40,   1550, 80,25,  // 334 : M back et rounded

  450,20,35,   1600,30,50,   2800, 25,65,  // 343 : N front
  450,20,30,   1600,20,75,   2600,  0,60,  // 352 : N back-unrounded
  450,20,30,   1600,15,95,   2820,  0,95,  // 361 : N rounded

  440,25,40,   2200,15,60,   3000,105,60,  // 370 : Ng front
  440,25,40,   1800,20,70,   2150, 20,70,  // 379 : Ng back-unrounded
  440,25,40,   1700,42,70,   1920, 25,70   // 388 : Ng rounded


#endif
};


// Consonant-vowel formant transition specifications for female voices :
//   F1 locus, F1 percent, F1 transdur, 
//   F2 locus, F2 percent, F2 transdur, 
//   F3 locus, F3 percent, F3 transdur 
// Michel : I have not yet tried to improve the female voice
const short fr_femloc[] = {
  0,
  // F1            F2             F3 : frequency, %, transition duration

  300,63,30,       1,92,35,    2080,35,30, /* F front 1 */
  320,60,30,       1,91,35,    2100,65,40, /* F back  10 */

  300,50,30,       1,92,35,    2080,35,40, /* V front 19 */
  300,50,30,       1,91,40,    2100,65,40, /* V back  28 */

  280,40,45,    2150,50,90,    2900,50,60, /* Gn 37 */
  280,40,45,    2150,20,60,    3000,50,60, /* ?  46 */
  280,40,45,    2150,20,60,    3000,50,60, /* ?  55 */
  280,40,45,    2150,20,60,    3000,50,60, /* ?  64 */

  310,40,40,    1640,80,80,    2550, 0,70,  /* S front */
  310,40,40,    1640,40,80,    2630, 0,70,  /* S back-unrounded */
  310,40,40,    1520,15,80,    2460, 0,65,  /* S rounded */

  310,40,40,    1540,35,50,    2850, 0,70,  /* Z front */
  310,40,40,    1240,35,60,    2830, 0,70,  /* Z back-unrounded */
  310,40,40,    1320,15,60,    2880, 0,65,  /* Z rounded */

  350,55,20,     950,56,30,    2200,25,45,  /* P front */
  350,45,25,     920,46,30,    2250,40,50,  /* P back et rounded  */

  230,55,20,     900,86,30,    2200,45,45,  /* B front */
  230,45,25,     1200,86,30,    2250,45,50,  /* B back */

  320,43,35,     1800,66,35,   2650,30,45,  /* T front */
  320,43,50,     1700,40,75,   2600, 0,60,  /* T back-unrounded */
  320,43,40,     1700,40,95,   2300, 0,95,  /* T rounded */

  380,43,35,     1900,66,35,   2850,30,45,  /* D front */
  380,43,50,     1900,40,75,   2800,40,50,  /* D back-unrounded */
  480,43,40,     1900,40,95,   2800,40,95,  /* D rounded */

  320,33,45,     1990,50,50,   3000,100,50, /* K front */
  320,33,50,     1800,16,60,   2150, 0,90,  /* K back-unrounded */
  320,33,40,     1600,42,65,   2050,15,80,  /* K rounded */

  250,33,45,     1990,20,50,   3000,113,50, /* G front */
  300,33,50,     1780,16,60,   2150,0,90,   /* G back-unrounded */
  290,45,40,     1600,42,65,   1920,15,80,  /* G rounded */

  320,54,55,     1950,25,60,   2750,19,70,  /* Ch front */
  320,54,55,     1680,10,40,   2450,10,70,  /* Ch back-unrounded */
  320,54,55,     1680,10,70,   2350,10,100, /* Ch rounded */

  240,32,55,     1750,25,60,   2750,19,70,  /* J front */
  245,32,55,     1680,10,60,   2450,10,70,  /* J back-unrounded */
  245,32,55,     1680,10,60,   2350,10,100, /* J rounded */
#ifdef HLSYN
 

  470,30,30,     1280,25,35,   2800,30,40,  /* M front */
  450,20,30,       1100,20,40,   1750,80,25,  /* M back */

  450,20,35,     1550,75,35,   3100,40,45,  /* N front */
  450,20,30,     1520,25,75,   3000, 10,60, /* N back-unrounded */
  450,20,30,     1550,25,95,   2320, 10,95, /* N rounded */

  440,25,40,     2200,15,60,   3000,105,60, /* Ng front */
  440,25,40,     1800,20,70,   2150,20,70,  /* Ng back-unrounded */
  440,25,40,     1700,42,70,   1920,25,70   /* Ng rounded */
#else
 470,30,30,     1480,10,35,   2400,30,40,  /* M front */
  450,20,30,        1,88,40,   1850,80,25,  /* M back */

  450,20,35,     1550,75,35,   3100,40,45,  /* N front */
  450,20,30,     1520,25,75,   3000, 10,60, /* N back-unrounded */
  450,20,30,     1550,25,95,   2320, 10,95, /* N rounded */

  440,25,40,     2200,15,60,   3000,105,60, /* Ng front */
  440,25,40,     1800,20,70,   2150,20,70,  /* Ng back-unrounded */
  440,25,40,     1700,42,70,   1920,25,70   /* Ng rounded */



#endif
};



// Pointers to parallel formant amplitudes for obstruents : ph_setar.c
// index in fr_malamp[] or fr_femamp[] for a phoneme.
const short fr_ptram[] = {
//      SI     A    A3    E2    Au     E    E1    Eu     I     O
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//      O6    Ou     U    An    In    On    Un    AP     L     R
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//       W    Wu     Y    Ch     F     J    Rx     S     V     Z
         0,    0,    0,  241,    1,  265,    0,   49,   25,   73,

//       B     D     G     K     P     T    Gn     M     N     Ng
       121,  169,  217,  193,   97,  145,    0,    0,    0,    0
};


//  Pointers to locus, percent, and duration for formant
//  transitions for 42 phones before three types of vowels
//      SI     A    A3    E2    Au     E    E1    Eu     I     O
//      O6    Ou     U    An    In    On    Un    AP     L     R
//       W    Wu     Y    Ch     F     J    Rx     S     V     Z
//       B     D     G     K     P     T    Gn     M     N     Ng
const short fr_plocu[] = {  //  used in ph_setar.c
  // FRONT
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  271,    1,  298,    0,   73,   19,  100,
       145,  190,  244,  217,  127,  163,   37,  325,  343,  370,
         
  // BACK
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  280,   10,  307,    0,   82,   28,  109,
       154,  199,  253,  226,  136,  172,   37,  334,  352,  379,
         
  // ROUND
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  289,   10,  316,    0,   91,   28,  118,
       154,  208,  262,  235,  136,  181,   37,  334,  361,  388
};


/* Phonetic feature values allowed in fr_place[] for French
  used in p_fr_st1.c, ph_setar.c
  FLABIAL    0000001     P, B, F, V, M
  FDENTAL    0000002
  FPALATL    0000004     Ch, J, Gn
  FALVEL     0000010     T, D, S, Z, N
  FVELAR     0000020     K, G, Ng
  FGLOTAL    0000040
  F2BACKI    0000100     Y
  F2BACKF    0000200     Y
*/
const short fr_place [] = {
  /* SI */  0,
  /* A  */  0,
  /* A3 */  0,
  /* E2 */  0,
  /* Au */  0,
  /* E  */  0,
  /* E1 */  0,
  /* Eu */  0,
  /* I  */  0,
  /* O  */  0,
  /* O6 */  0,
  /* Ou */  0,
  /* U  */  0,
  /* An */  0,
  /* In */  0,
  /* On */  0,
  /* Un */  0,
  /* AP */  0,
  /* L  */  0,
  /* R  */  0,
  /* W  */  0,
  /* Wu */  0,
  /* Y  */  F2BACKI+F2BACKF,
  /* Ch */  FPALATL,
  /* F  */  FLABIAL,
  /* J  */  FPALATL,
  /* Rx */  0,
  /* S  */  FALVEL,
  /* V  */  FLABIAL,
  /* Z  */  FALVEL,
  /* B  */  FLABIAL,
  /* D  */  FALVEL,
  /* G  */  FVELAR,
  /* K  */  FVELAR,
  /* P  */  FLABIAL,
  /* T  */  FALVEL,
  /* Gn */  FPALATL,
  /* M  */  FLABIAL,
  /* N  */  FALVEL,
  /* Ng */  FVELAR
 };


#if 0
// used in ph_setar.c
const char* parname [] = {
  "F1",  "F2",  "F3",  "FZ",  "B1",  "B2",  "B3",  "AV",
  "AH",  "A2",  "A3",  "A4",  "A5",  "A6",  "AB",  "TL"
};
#endif



// NOT USED
// ========

#if 0
// Incremental changes to F0 due to segmental influences phdrawto.c
const short fr_f0segtars [] = {
//   SI     A    A3    E2    Au     E    E1    Eu     I     O
     50,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//   O6    Ou     U    An    In    On    Un    AP     L     R
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

//    W    Wu     Y    Ch     F     J    Rx     S     V     Z
      0,    0,    0,  150,  150,  -70,   40,  150,  -70,  -70,

//    B     D     G     K     P     T    Gn     M     N    Ng
    -70,  -70,   -70,   0,    0,    0,  -70,  -70,  -70,  -70
};
#endif // 0
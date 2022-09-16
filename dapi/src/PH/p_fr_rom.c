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
 *    File Name:	f_fr_rom.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *   Arrays used by the phonetic component
 *
 ***********************************************************************
 *    Revision History:
 * 001	..-..-86	Michel	INITIAL CODING
 * 002	14-05-92 	Michel 	Clean up, add comments
 * 003	..-07-94 	Michel 	I AV=60 (64), F3 reduce otherwise click due to F4 for Dennis
 *                				Y AV=56 (64), idem
 * 004	22-05-95 	Michel 	Delete many arrays no longer used with the new phsettar 
 * 005	04-08-95 	Michel 	Translate comments in English
 * 006	04-12-95 	EAB    	Add FE/MALE voice tables.
 * 007	07-20-00	CHJ	   	Renamed to p_fr_rom.c
 * 008	07-28-00	CHJ	   	Changed fr_featb to shorts and commented out some feature bits
 * 009	09-21-00	CAB		Fixed copyright info and formatted commemnt section.
 * 010  01-17-01	CAB		Merged Michel Divay changes for the French
 * 011	02-09-01	CAB		Added additional changes by Michel
 * 012 3/1/01 Eab corected some values that I believe I put in and reset to thoerctical values based
	on Ken's Stevens work and eliminated femamp as a redundant error source.
*/


#include "l_fr_ph.h"

/* Phonemes features */
short fr_featb [PHO_SYM_TOT] = {
  /* NON-NASAL VOWELS */
  /*        */ 0,
  /* F_A  */ TVoyelle+TVoisee+TSonore+TSyllabique/*+TFrontale*/+TOuverte,
  /* F_A3 */ TVoyelle+TVoisee+TSonore+TSyllabique+TOuverte,
  /* F_E2 */ TVoyelle+TVoisee+TSonore+TSyllabique/*+TRelachee+TFrontale*/,
  /* F_AU */ TVoyelle+TVoisee+TSonore+TSyllabique+TArrondie,
  /* F_E  */ TVoyelle+TVoisee+TSonore+TSyllabique,//+TSchwa,
  /* F_E1 */ TVoyelle+TVoisee+TSonore+TSyllabique/*+TFrontale*/,
  /* F_EU */ TVoyelle+TVoisee+TSonore+TSyllabique+TArrondie/*+TFrontale*/,
  /* F_I  */ TVoyelle+TVoisee+TSonore+TSyllabique/*+TFrontale+TF2Arriere*/+TFermee,
  /* F_O  */ TVoyelle+TVoisee+TSonore+TSyllabique+TArrondie/*+TRelachee*/+TOuverte,
  /* F_O6 */ TVoyelle+TVoisee+TSonore+TSyllabique+TArrondie/*+TRelachee*/+/*TFrontale+*/TOuverte,
  /* F_OU */ TVoyelle+TVoisee+TSonore+TSyllabique+TArrondie+TFermee,
  /* F_U  */ TVoyelle+TVoisee+TSonore+TSyllabique+TArrondie/*+TFrontale*/+TFermee,

  /* NASALS VOWELS */
  /* F_AN */ TVoyelle+TVoisee+TSonore+TSyllabique+TNasale+TOuverte,
  /* F_IN */ TVoyelle+TVoisee+TSonore+TSyllabique+TNasale/*+TFrontale*/,
  /* F_ON */ TVoyelle+TVoisee+TSonore+TSyllabique+TNasale+TArrondie+/*TRelachee+*/TOuverte,
  /* F_UN */ TVoyelle+TVoisee+TSonore+TSyllabique+TNasale+TArrondie/*+TRelachee+TFrontale*/,

  /* SPECIAL VOWEL : schwa */
  /* F_AP */ TVoyelle+TVoisee+TSonore/*+TRelachee+TSchwa*/,

  /* LIQUIDS AND SEMIVOWELS */
  /* F_L  */ TLiqGli+TVoisee+TSonore+TLaterale,
  /* F_R  */ TLiqGli+TVoisee+TSonore,
  /* F_W  */ TGlide+TLiqGli+TVoisee+TSonore/*+TLabiale*/+TArrondie+TFermee,
  /* F_WU */ TGlide+TLiqGli+TVoisee+TSonore/*+TLabiale*/+TArrondie/*+TFrontale*/+TFermee,
  /* F_Y  */ TGlide+TLiqGli+TVoisee+TSonore/*+TPalatale+TF2Arriere*/+TFermee,

  /* FRICATIVE CONSONANTS */
  /* F_CH */ TFricative,//+TPalatale,
  /* F_F  */ TFricative,//+TLabiale,
  /* F_J  */ TFricative/*+TPalatale*/+TVoisee,
  /* F_RX */ TFricative,//+TVelaire,
  /* F_S  */ TFricative,//+TAlveolaire,
  /* F_V  */ TFricative/*+TLabiale*/+TVoisee,
  /* F_Z  */ TFricative/*+TAlveolaire*/+TVoisee,

  /* PLOSIVES CONSONANTS */
  /* F_B  */ TOcclusive+TPlosive+FBURST/*+TLabiale*/+TVoisee,
  /* F_D  */ TOcclusive+TPlosive+FBURST/*+TAlveolaire*/+TVoisee,
  /* F_G  */ TOcclusive+TPlosive+FBURST/*+TVelaire*/+TVoisee,
  /* F_K  */ TOcclusive+TPlosive+FBURST,//+TVelaire,
  /* F_P  */ TOcclusive+TPlosive+FBURST,//+TLabiale,
  /* F_T  */ TOcclusive+TPlosive+FBURST,//+TAlveolaire,

  /* NASAL CONSONANT */
  /* F_GN */ TOcclusive/*+TPalatoAlveolaire*/+TVoisee+TSonore+TNasale,
  /* F_M  */ TOcclusive+/*TLabiale+*/TVoisee+TSonore+TNasale,
  /* F_N  */ TOcclusive/*+TAlveolaire*/+TVoisee+TSonore+TNasale,
  /* F_NG */ TOcclusive+/*TVelaire+*/TVoisee+TSonore+TNasale,

  /* SPECIAL SEGMENTS */
  /* SegX   */ TSonore,//+TAspiration,
  /* SegSil */ 0
};

/* Inherent durations (in msec) for phones  phtiming.c, phsettar.c
    Voy. ouverte : A, A3, O, O6, An, On
    Voy. fermée  : I, Ou, U, W, Y, Wu
    Autre        : E1, Au, E, E2, Eu, In, Un 
*/
short fr_inhdr [] = {
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O  */
    305,  120,  120,  120,  130,  110,  120,  120,  100,  120,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
    120,  110,  110,  130,  130,  110,  130,   50,   60,   70,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
     70,   80,   60,  130,  130,  100,   70,  130,   75,   75,

  /*  B     D     G     K     P     T    Gn     M     N    Ng  */
     80,   80,   90,  100,  110,  110,  120,   90,   80,   80,

  /* SegX  SegSil */
     30,  305

};

/* Minimum durations (in msec) for phones  phtiming.c */
short fr_mindur [] = { /* not used; keep it for later */
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O  */
    200,   80,   80,   80,   80,   60,   70,   80,   60,   90,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
     90,   90,   60,   90,   90,   90,   90,   25,   40,   40,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
     30,   30,   20,   60,   60,   70,   40,   65,   55,   60,

  /*  B     D     G     K     P     T    Gn     M     N    Ng  */
     60,   60,   60,   75,   70,   50,   80,   60,   40,   80,

  /* SegX  SegSil */
     30,  200
};

#if LOOKSLIKEENGLISH
/* eab 12/95 reducing this stuff I think again it's stolen from the english
   and isn't valid. ????? : Michel : 11/2000 */
/* Incremental changes to F0 due to segmental influences phdrawto.c */
short f0segtars [] = {
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O   */
     50,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
      0,    0,    0,  300,  300, -200,   40,  300, -200, -200,

  /*  B     D     G     K     P     T    Gn     M     N    Ng  */
   -200, -200, -200,  300,  300,  300,-200,  -200, -200, -200,

  /* SegX  SegSil */
      0,   0
};
#endif	// LOOKSLIKEENGLISH

#if 0
/* Incremental changes to F0 due to segmental influences phdrawto.c */
short fr_f0segtars [] = {
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O   */
     50,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
      0,    0,    0,  150,  150, -70,   40,  150, -70, -70,

  /*  B     D     G     K     P     T    Gn     M     N    Ng  */
	  -70, -70,   -70,  000,  00,    0,  -70,  -70, -70, -70,

  /* SegX  SegSil */
      0,   0
};
#endif // 0

/* burst durations : phsettar.c */
short fr_burdr [] = {
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O  */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

  /*  B     D     G     K     P     T    Gn     M     N    Ng  */
      7,   13,   20,   20,    10,   13,    0,    0,    0,    0,

  /* SegX  SegSil */
      0,   0
};
/* 1:front; 2:back unrounded; 3:back rounded; 4:null  phsettar.c */
short fr_begtyp [] = {
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O  */
      4,    2,    2,    1,    3,    1,    1,    3,    1,    3,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
      3,    3,    3,    2,    1,    3,    3,    4,    5,    5,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
      5,    5,    5,    4,    4,    4,    4,    4,    4,    4,

  /*  B     D     G     K     P     T    Gn     M     N    Ng */
      4,    4,    4,    4,    4,    4,    4,    4,    4,    4,

  /* SegX  SegSil */
      4,   4
 };

/* idem begtyp, except if diphtongs  phsettar.c */
short fr_endtyp [] = {
  /* SI     A    A3    E2    Au     E    E1    Eu     I     O  */
      4,    2,    2,    1,    3,    1,    1,    3,    1,    3,

  /* O6    Ou     U    An    In    On    Un  SegAXP   L     R  */
      3,    3,    3,    2,    1,    3,    3,    4,    5,    5,

  /*  W    Wu     Y    Ch     F     J    Rx     S     V     Z  */
      5,    5,    5,    4,    4,    4,    4,    4,    4,    4,

  /*  B     D     G     K     P     T    Gn     M     N    Ng  */
      4,    4,    4,    4,    4,    4,    4,    4,    4,    4,

  /* SegX  SegSil */
      4,   4
 };

short Cibles_MALE [42] [N_PARAM] = {
/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
/*Si*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6,  -1,  -1,  -1,290, -1, -1, -1 },/*Si*/
/*A */ {  0, 0, 0, 0, 0, 0, 0,64, 2, 650,1360,2590,290,180, 90,200 },/*A */
/*A3*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 780,1200,2500,290,130, 70,160 },/*A3*/
/*E2*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 480,1890,2600,290, 70,100,200 },/*E2*/
/*Au*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 400, 890,2570,290,100, 80,120 },/*Au*/
/*E */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 410,1520,2390,290, 80, 80,140 },/*E */
/*E1*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 380,2100,2600,290,100,100,280 },/*E1*/
/*Eu*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 410,1475,2225,290,100, 80,200 },/*Eu*/
/*I */ {  0, 0, 0, 0, 0, 0, 0,63, 2, 330,2280,2770,290,150,130,200 },/*I */
/*O */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 560,1100,2390,290, 90, 80,120 },/*O */
/*O6*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 520,1420,2280,290, 60,120,250 },/*O6*/
/*Ou*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 340, 770,2550,290, 60, 90,150 },/*Ou*/
/*U */ {  0, 0, 0, 0, 0, 0, 0,65, 6, 310,1850,2310,290, 80, 90,180 },/*U */
/*An*/ {  0, 0, 0, 0, 0, 0, 0,64,10, 730, 950,2590,390,100,180,250 },/*An*/
/*In*/ {  0, 0, 0, 0, 0, 0, 0,64,10, 730,1500,2580,350,300,100,250 },/*In*/
/*On*/ {  0, 0, 0, 0, 0, 0, 0,65,10, 470,1000,2200,350,300,100,200 },/*On*/
/*Un*/ {  0, 0, 0, 0, 0, 0, 0,64,10, 640,1440,2370,350,160,100,200 },/*Un*/
/*Axp*/{  0, 0, 0, 0, 0, 0, 0,45,15, 430,1500,2500,290,120, 60,120 },/*Ap*/

/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
/*L */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 350,1550,2600,290, 55, 80,220 },/*L */
/*R */ { 40,30,35,30, 0, 0, 0,40, 6, 600, 800,2400,290,140,200,250 },/*R */ 
/*W */ {  0, 0, 0, 0, 0, 0, 0,62, 6, 250, 550,2300,290, 60, 60,350 },/*W */
/*Wu*/ {  0, 0, 0, 0, 0, 0, 0,63, 6, 330,1550,2150,290, 50, 60, 60 },/*Wu*/
/*Y */ {  0, 0, 0, 0, 0, 0, 0,56, 6, 230,2370,2570,290, 50,200,300 },/*Y */
/*Ch*/ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1950,2700,290,200,280,250 },/*Ch*/
/*F */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 340,1300,2080,290,200,300,150 },/*F */
/*J */ {  0, 0, 0, 0, 0, 0, 0, 0,40, 300,1950,2400,290,320,140,250 },/*J */
/*Rx*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6, 800,1200,2500,290,250,220,250 },/*Rx*/
/*S */ {  0, 0, 0, 0, 0, 0, 0, 0,10, 320,1420,2550,290,200,180,300 },/*S */
/*V */ {  0, 0, 0, 0, 0, 0, 0,53,10, 280,1400,2480,290,100,120,120 },/*V */
/*Z */ {  0, 0, 0, 0, 0, 0, 0,53,10, 280,1620,2600,290,100,140,300 },/*Z */
/*B */ {  0, 0, 0, 0, 0, 0, 0,40,40, 210,1100,2150,290, 90, 80,130 },/*B */
/*D */ {  0, 0, 0, 0, 0, 0, 0,40,40, 210,1600,2600,290, 90,100,240 },/*D */
/*G */ {  0, 0, 0, 0, 0, 0, 0,40,40, 210,1790,2520,290, 90,120,180 },/*G */
/*K */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1790,2250,290,200,160,280 },/*K */
/*P */ {  0, 0, 0, 0, 0, 0, 0, 0, 9, 200,1370,2050,290,200,180,250 },/*P */
/*T */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1700,2700,290,200,150,250 },/*T */
/*Gn*/ {  0, 0, 0, 0, 0, 0, 0,52,18, 330,2350,3050,400,100,200,380 },/*Gn*/
/*M */ {  0, 0, 0, 0, 0, 0, 0,60,12, 260,1260,2310,400,130,300,130 },/*M */
/*N */ {  0, 0, 0, 0, 0, 0, 0,60,12, 200,1840,2700,400,200,200,200 },/*N */
/*Ng*/ {  0, 0, 0, 0, 0, 0, 0,60, 6, 280,1440,2350,400,160,150,100 },/*Ng*/   
/*Xx*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6,   0,   0,   0,  0,  0,  0,  0 },/*Xx*/
/*Si*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6,  -1,  -1,  -1,290, -1, -1, -1 } /*Si*/
/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */

#if 0 // Modified values since 1995 (by Ed)
/*  */ {  0, 0, 0, 0, 0, 0, 0, 0, 0,   0,   0,   0,  0,  0,  0,  0 },/*  */
/*I */ {  0, 0, 0, 0, 0, 0, 0,60, 0, 300,2450,3000,290,50,130+30,200 },/*I*/
/*U */ {  0, 0, 0, 0, 0, 0, 0,64, 4, 260,1810,2210,290, 80, 90,180 },/*U */
/*An*/ {  0, 0, 0, 0, 0, 0, 0,67-5  ,10, 625,1000,2845-200,500-200,100,180,250 },/*An*/
/*In*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 740,1500,2750,340,300,100,250 },/*In*/
/*On*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 470,1000,2200,340,300,100,200 },/*On*/
/*Un*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 680,1660,2705,340,160,100,200 },/*Un*/
/*Axp*/{  0, 0, 0, 0, 0, 0, 0,45-10, 10, 430,1500,2500,290,120, 120,120 },/*Ap*/

/*R */ { 40-8,30-8,35-8,30-8, 0, 0, 0,45,16, 600-150,1400-200,2600,290,140,200,250 },/*R */ 
/*W */ {  0, 0, 0, 0, 0, 0, 0,62, 6, 250, 550,2300+200,290, 60, 60,350 },/*W */
/*V */ {  0, 0, 0, 0, 0, 0, 0,53,12, 280,1100,2980,290,100,120,120 },/*V */
/*B */ {  0, 0, 0, 0, 0, 0, 0, 0,40, 210,1100,2150,290, 90, 80,130 },/*B */
/*D */ {  0, 0, 0, 0, 0, 0, 0, 50,40, 210,1600-100,2600-100,290, 90,100,240 },/*D */
#endif

};

/* value for each phoneme : phsettar.c */
short Cibles_FEMALE [42] [N_PARAM] = {
/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
/*  */ {  0, 0, 0, 0, 0, 0, 0, 0, 0,   0,   0,   0,  0,  0,  0,  0 },/*  */
/*fA */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 895,1319,2980,290,180,210,200 },/*A */
/*A3*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 780,1200,2500,290,130, 70,160 },/*A3*/
/*fE2*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 520,1950,2690,290, 70,100,200 },/*E2*/
/*fAu*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 520, 926,2680,290,120, 80,110 },/*Au*/
/*fE */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 550,1710,2670,290, 90, 80,140 },/*E */
/*E1*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 350,2050,2600,290,100,100,280 },/*E1*/
/*fEu*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 430,1555,2675,290,100, 80,200 },/*Eu*/
/*fI */ {  0, 0, 0, 0, 0, 0, 0,61, 0, 300,2450,3100,290,80,130+30,200 },/*I*/
/*O */ {  0, 0, 0, 0, 0, 0, 0,64, 6, 550,1000,2330,290,90,80,120 },/*O */
/*O6*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 550,1475,2315,290, 80,120,250 },/*O6*/
/*Ou*/ {  0, 0, 0, 0, 0, 0, 0,64, 6, 300, 800,2100,290, 80, 90,150 },/*Ou*/
/*U */ {  0, 0, 0, 0, 0, 0, 0,65, 4, 260,1810,2210,290, 80, 90,180 },/*U */
/*An*/ {  0, 0, 0, 0, 0, 0, 0,67,10, 700,1000,2845,340,100,180,250 },/*An*/
/*In*/ {  0, 0, 0, 0, 0, 0, 0,67,10, 740,1500,2750,340,300,100,250 },/*In*/
/*fOn*/ {  0, 0, 0, 0, 0, 0, 0,58,10, 570,980,2400,340,300,150,200 },/*On*/
/*fUn*/ { 0, 0, 0, 0, 0, 0, 0,58,  0,  898,1868,3068,340,200,150,200 },/*Un*/
/*Axp*/{  0, 0, 0, 0, 0, 0, 0,45-10, 10, 430,1500,2500,290,120, 120,120 },/*Ap*/

/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
/*fL */ {  0, 0, 0, 0, 0, 0, 0,60, 6, 379,1684,2981,290, 55, 80,220 },/*L */
/*fR */ { 40-8,30-8,35-8,30-8, 0, 0, 0,45,16, 522,1038,2660,290,140,200,250 },/*R */ 
/*fW */ {  0, 0, 0, 0, 0, 0, 0,62, 6, 280, 700,2800,290, 60, 60,350 },/*W */
/*Wu*/ {  0, 0, 0, 0, 0, 0, 0,63, 6, 330,1550,2150,290, 50, 60, 60 },/*Wu*/
/*Y */ {  0, 0, 0, 0, 0, 0, 0,56, 6, 230,2370,2570,290, 50,200,300 },/*Y */
/*Ch*/ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1950,2700,290,200,280,250 },/*Ch*/
/*F */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 340,1300,2080,290,200,120,150 },/*F */
/*J */ {  0, 0, 0, 0, 0, 0, 0, 0,40, 300,1950,2400,290,320,140,250 },/*J */
/*Rx*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6, 800,1200,2500,290,250,220,250 },/*Rx*/
/*S */ {  0, 0, 0, 0, 0, 0, 0, 0,10, 320,1420,2550,290,200,180,300 },/*S */
/*V */ {  0, 0, 0, 0, 0, 0, 0,53,12, 280,1100,2980,290,100,120,120 },/*V */
/*fZ */ {  0, 0, 0, 0, 0, 0, 0,53,10, 287,1820,2930,290,100,140,300 },/*Z */
/*B */ {  0, 0, 0, 0, 0, 0, 0, 0,20, 210,1100,2150,290, 90, 80,130 },/*B */
/*D */ {  0, 0, 0, 0, 0, 0, 0, 45,20, 210,1733,2880,290, 90,100,240 },/*D */
/*G */ {  0, 0, 0, 0, 0, 0, 0, 0,20, 210,1790,2520,290, 90,120,180 },/*G */
/*K */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1790,2250,290,200,160,280 },/*K */
/*P */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 200,1370,2050,290,200,180,250 },/*P */
/*fT */ {  0, 0, 0, 0, 0, 0, 0, 0,13, 350,1700-900,2900,290,200,150,250 },/*T */
/*Gn*/ {  0, 0, 0, 0, 0, 0, 0,52,18, 330,2350,3050,400,100,200,380 },/*Gn*/
/*fM */ {  0, 0, 0, 0, 0, 0, 0,61,12, 250,1600,2620,400,130,280,360 },/*M */
/*N */ {  0, 0, 0, 0, 0, 0, 0,60,12, 430,1340,2500,400,130,300,460 },/*N */
/*Ng*/ {  0, 0, 0, 0, 0, 0, 0,60, 6, 280,1440,2350,400,160,150,100 },/*Ng*/   
/*Xx*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6,   0,   0,   0,  0,  0,  0,  0 },/*Xx*/
/*Si*/ {  0, 0, 0, 0, 0, 0, 0, 0, 6,  -1,  -1,  -1,290, -1, -1, -1 } /*Si*/
/*       A2 A3 A4 A5 A6 AB AH AVTLT   F1   F2   F3 FNZ  B1  B2  B3       */
};

#ifdef PHEDIT_2
  /* Stress-related rise/fall amount in Hz*10 for first, second, ... accent
     in a phrase : phinton.c */
short f0_phrase_position [] = { 0, 100,  90, 60, 40, 0 };
/*EAB 10/95 WARNING WARNING WARNING numbers in f0_phrase plus
f0_stress must add up to an odd number or the code will send
a step function instead of an impulse function, this knowledge 
is inbedded in the phdrawt0 code*/
/*
  F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis
  phinton.c
*/
short f0_stress_level [] = { 01, 71, 51, 281 };
#endif // PHEDIT_2

/* Consonant-vowel formant transition specifications
   F1 locus, F1 percent, F1 trandur, F2 locus, ... F3 trandur : phvset */
short fr_maleloc[] = {
  0,
  /* F1            F2             F3 : frequency, %, transition duration */

  300,63,30,       1,92,35,    2080,35,30, /* F front 1 */
  320,60,30,       1,91,35,    2100,65,40, /* F back  10 */

  300,50,30,       1,92,35,    2080,35,40, /* V front 19 */
  300,50,30,       1,91,40,    2100,65,40, /* V back  28 */

  280,40,45,    2350,20,60,    3000,50,60, /* Gn 37 */
  280,40,45,    2350,20,60,    3000,50,60, /* ?  46 */
  280,40,45,    2350,20,60,    3000,50,60, /* ?  55 */
  280,40,45,    2350,20,60,    3000,50,60, /* ?  64 */

  310,40,40,    1640,80,80,    2550, 0,70,  /* S front */
  310,40,40,    1640,40,80,    2630, 0,70,  /* S back-unrounded */
  310,40,40,    1520,15,80,    2460, 0,65,  /* S rounded */

  310,40,40,    1540,35,50,    2550, 0,70,  /* Z front */
  310,40,40,    1240,35,60,    2630, 0,70,  /* Z back-unrounded */
  310,40,40,    1320,15,60,    2460, 0,65,  /* Z rounded */

  285,32,55,    1830,30,70,    2640,51,70,  /* ? */
  285,32,55,    1700,27,70,    2270, 0,85,  /* ? */
  340,32,55,    1630,27,90,    2100,20,110, /* ? */

  285,32,55,    1830,30,70,    2640,51,70,  /* ? */
  285,32,55,    1700,27,70,    2270, 0,85,  /* ? */
  340,32,55,    1630,27,90,    2100,20,110, /* ? */

  350,55,20,     950,56,30,    2200,25,45,  /* P front */
  350,45,25,     920,46,30,    2250,40,50,  /* P back  */

  230,55,20,     900,86,30,    2200,45,45,  /* B front */
  230,45,25,     1200,86,30,    2250,45,50,  /* B back */

  320,43,35,     1800,66,35,   2650,30,45,  /* T front */
  320,43,50,     1700,40,75,   2600, 0,60,  /* T back-unrounded */
  320,43,40,     1700,40,95,   2600, 0,95,  /* T rounded */

  250,43,35,     1800,66,35,   2650,30,45,  /* D front */
  250,43,50,     1700,40,75,   2800, 0,50,  /* D back-unrounded */
  250,43,40,     1700,40,95,   2300, 0,95,  /* D rounded */

  320,33,45,     1990,50,50,   3000,100,50, /* K front */
  320,33,50,     1800,16,60,   2150, 0,90,  /* K back-unrounded */
  320,33,40,     1600,42,65,   2050,15,80,  /* K rounded */

  250,33,45,     1990,20,50,   3000,113,50, /* G front */
  300,33,50,     1780,16,60,   2150,0,90,   /* G back-unrounded */
  290,45,40,     1600,42,65,   1920,15,80,  /* G rounded */

  320,54,55,     1950,25,70,   2750,19,70,  /* Ch front */
  320,54,55,     1680,10,70,   2450,10,70,  /* Ch back-unrounded */
  320,54,55,     1680,10,90,   2350,10,100, /* Ch rounded */

  240,32,55,     1750,25,70,   2750,19,70,  /* J front */
  245,32,55,     1680,10,70,   2450,10,70,  /* J back-unrounded */
  245,32,55,     1680,10,90,   2350,10,100, /* J rounded */

  470,30,30,     1380,10,35,   2400,30,40,  /* M front */
  450,20,30,        1,88,40,   1550,80,25,  /* M back */

  450,20,35,     1350,75,35,   2600,40,45,  /* N front */
  450,20,30,     1420,25,75,   2600, 0,60,  /* N back-unrounded */
  450,20,30,     1550,25,95,   2320, 0,95,  /* N rounded */

  440,25,40,     2200,15,60,   3000,105,60, /* Ng front */
  440,25,40,     1800,20,70,   2150,20,70,  /* Ng back-unrounded */
  440,25,40,     1700,42,70,   1920,25,70   /* Ng rounded */
};

/* Consonant-vowel formant transition specifications
   F1 locus, F1 percent, F1 trandur, F2 locus, ... F3 trandur : phvset 
*/
short fr_femloc[] = {
  0,
  /* F1            F2             F3 : frequency, %, transition duration */

  300,63,30,       1,92,35,    2080,35,30, /* F front 1 */
  320,60,30,       1,91,35,    2100,65,40, /* F back  10 */

  300,50,30,       1,92,35,    2080,35,40, /* V front 19 */
  300,50,30,       1,91,40,    2100,65,40, /* V back  28 */

  280,40,45,    2350,20,60,    3000,50,60, /* Gn 37 */
  280,40,45,    2350,20,60,    3000,50,60, /* ?  46 */
  280,40,45,    2350,20,60,    3000,50,60, /* ?  55 */
  280,40,45,    2350,20,60,    3000,50,60, /* ?  64 */

  310,40,40,    1640,80,80,    2550, 0,70,  /* S front */
  310,40,40,    1640,40,80,    2630, 0,70,  /* S back-unrounded */
  310,40,40,    1520,15,80,    2460, 0,65,  /* S rounded */

  310,40,40,    1540,35,50,    2850, 0,70,  /* Z front */
  310,40,40,    1240,35,60,    2830, 0,70,  /* Z back-unrounded */
  310,40,40,    1320,15,60,    2880, 0,65,  /* Z rounded */

  285,32,55,    1830,30,70,    2640,51,70,  /* ? */
  285,32,55,    1700,27,70,    2270, 0,85,  /* ? */
  340,32,55,    1630,27,90,    2100,20,110, /* ? */

  285,32,55,    1830,30,70,    2640,51,70,  /* ? */
  285,32,55,    1700,27,70,    2270, 0,85,  /* ? */
  340,32,55,    1630,27,90,    2100,20,110, /* ? */

  350,55,20,     950,56,30,    2200,25,45,  /* P front */
  350,45,25,     920,46,30,    2250,40,50,  /* P back  */

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

  320,54,55,     1950,25,70,   2750,19,70,  /* Ch front */
  320,54,55,     1680,10,70,   2450,10,70,  /* Ch back-unrounded */
  320,54,55,     1680,10,90,   2350,10,100, /* Ch rounded */

  240,32,55,     1750,25,70,   2750,19,70,  /* J front */
  245,32,55,     1680,10,70,   2450,10,70,  /* J back-unrounded */
  245,32,55,     1680,10,90,   2350,10,100, /* J rounded */

  470,30,30,     1480,10,35,   2400,30,40,  /* M front */
  450,20,30,        1,88,40,   1850,80,25,  /* M back */

  450,20,35,     1550,75,35,   3100,40,45,  /* N front */
  450,20,30,     1520,25,75,   3000, 10,60,  /* N back-unrounded */
  450,20,30,     1550,25,95,   2320, 10,95,  /* N rounded */

  440,25,40,     2200,15,60,   3000,105,60, /* Ng front */
  440,25,40,     1800,20,70,   2150,20,70,  /* Ng back-unrounded */
  440,25,40,     1700,42,70,   1920,25,70   /* Ng rounded */
};

/* Parallel amps for obst before front, back, round, and nonsonor : phvset.c
   A2   A3   A4   A5   A6   AB 
*/
short fr_malamp[] = {
  0,
  /*    [F] */
  0,    30,   30,  0,   0,  51, 
  0,    30,   30,  0,   0,  51, 
  0,    30,   30,  0,   0,  49, 
  0,    30,   30,  0,   0,  49, 
  /*    [V] */
  0,    0,   0,  0,   0,  45,
  0,    0,   0,  0,   0,  45,
  0,    0,   0,  0,   0,  43,
  0,    0,   0,  0,   0,  43,
  /*    [?] not used */
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  /*    [?] not used */
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  /*    [S] */
 
  0,    0,   0,  0,  50,   0, 
  0,    0,   0,  0,  50,   0,
  0,    0,   0,  0,  50,   0, 
  0,    0,   0,  0,  50,   0,
  /*    [Z] */

  0,    0,   30,  40,  42,   0,  
  0,    0,   30,  40,  42,   0,
  0,    0,   30,  40,  42,   0,
  0,    0,   30,  40,  42,   0, 
  /*    [?] not used */
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  /*   [?]  not used */
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  0,    0,   0,  0,   0,  0,
  /*   [P] */
  0,    0,   0,  0,  44,  61, /* burst is flat for [P] and [B] */
  0,    0,   0,  0,  44,  61,  
  0,    0,   0,  0,  44,  61,  
  0,    0,   0,  0,  44,  61,
  /*    [B] */
  0,    0,   0,  0,  40,  56,  
  0,    0,   0,  0,  40,  56,  
  0,    0,   0,  0,  40,  56,  
  0,    0,   0,  0,  40,  56,
  /*    [T]  */
  0,    0,  40,  0,  45,   0,
  0,    0,  40,  0,  45,   0,
  0,  0,  40,  0,  45,   0, //TAu
  0,  0,  40,  0,  45,   0,
/*      [D] */
  0,    0,  44,  0,  52,   0,
  0,    0,  46,  0,  51,   0,
  0,    0,  57,  0,   0,   0,
  0,    0,  55,  0,   0,   0,
 

  /*    [K] */
  38,   	 0,  0,  20,   30,   0,
  43-5,   0,   0, 20,   30,   0,
  43-5,   0,  0, 20,   30,   0,
  43-5,   0,  0, 20,   30,   0,
  /*    [G] */
  0,   38,   0, 33,   0,   0,
  39,   0,   0, 42,   0,   0,
  38,   0,  23, 33,   0,   0,
  38,   0,  23, 33,   0,   0,
  /*    [Ch] */
  0,   41,  44,  0,  30,   0,
  0,   41,  44,  0,  30,   0,
  0,   41,  44,  0,  30,   0,
  0,   41,  44,  0,  30,   0,
 
  /*    [J] */
  0,   35,  45,  40,  40,   0,
  0,   35,  45,  40,  40,   0,
  0,   35,  40,  40,  38,   0,
  0,   35,  40,  40,  38,   0,
};


/*
  Parallel amps for obst before front, back, round, and nonsonor : phvset.c
  A2   A3   A4   A5   A6   AB
*/
#ifdef should_not_be_used_anymore
short fr_femamp[] = {
  0,
  /*    [F] */
  0,    0,   0,  0,   0,  51-10,
  0,    0,   0,  0,   0,  51-10,
  0,    0,   0,  0,   0,  49-7,
  0,    0,   0,  0,   0,  49-7,
  /*    [V] */
  0,    0,   0,  0,   0,  45-4,
  0,    0,   0,  0,   0,  45-4,
  0,    0,   0,  0,   0,  43-2,
  0,    0,   0,  0,   0,  43-2,
  /*    [?] */
  0,    0,   0,  0,   0,  47,
  0,    0,   0,  0,   0,  47,
  0,    0,   0,  0,   0,  45,
  0,    0,   0,  0,   0,  45,
  /*    [?] */
  0,    0,   0,  0,   0,  41,
  0,    0,   0,  0,   0,  41,
  0,    0,   0,  0,   0,  39,
  0,    0,   0,  0,   0,  39,
  /*    [S] */
  0,    0,   0,  30,  55,   0,  
  0,    0,   0,  30,  55,   0,
  0,    0,   0,  30,  56,   0,  
  0,    0,   0,  30,  56,   0,
  /*    [Z] */
  0,    0,   0,  0,  51,   0,
  0,    0,   0,  0,  51,   0,
  0,    0,   0,  0,  52,   0,
  0,    0,   0,  0,  52,   0,
  /*    [?] */
  0,   49,  65,  0,  48,   0,
  0,   49,  65,  0,  48,   0,
  0,   49,  60,  0,  42,   0,
  0,   49,  60,  0,  42,   0,
  /*   [?] */
  0,   43,  59,  0,  42,   0,
  0,   43,  59,  0,  42,   0,
  0,   43,  54,  0,  36,   0,
  0,   43,  54,  0,  36,   0,
  /*   [P] */
  0,    0,   0,  0,  44-14,  61-11,  /* Use A6 = 44 to subtract  */
  0,    0,   0,  0,  44-14,  61-11,  /* a little energy at 5 kHz */
  0,    0,   0,  0,  44-14,  61-11,  /* from typical AB spectrum */
  0,    0,   0,  0,  44-14,  61-11,
  /*    [B] */
  0,    0,   0,  0,  40-10,  56-16,  /* Use A6 = 40-40 to subtract  */
  0,    0,   0,  0,  40-10,  56-16,  /* a little energy at 5 kHz */
  0,    0,   0,  0,  40-10,  56-16,  /* from typical AB spectrum */
  0,    0,   0,  0,  40-10,  56-16,
  /*    [T]  */
  0,    0,  46,  0,  50,   0,
  0,    0,  46,  0,  50,   0,
  33,  37,  46,  0,  50,   0,
  33,  37,  46,  0,  50,   0,
/*eab in chantal I see no 
burst at all in some contexts 11/95*/


      [D] 
  0,    0,  44,  0,  52,   0,
  0,    0,  46,  0,  51,   0,
  0,    0,  57,  0,   0,   0,
  0,    0,  55,  0,   0,   0,

 

  /*    [K] */
  38,   	 0,  0,  20,   30,   0,
  43-5,   0,   0, 20,   30,   0,
  43-5,   0,  0, 20,   30,   0,
  43-5,   0,  0, 20,   30,   0,
  /*    [G] */
  0,   38,   0, 33,   0,   0,
  39,   0,   0, 42,   0,   0,
  38,   0,  23, 33,   0,   0,
  38,   0,  23, 33,   0,   0,
  /*    [Ch] */
  0,   49-18,  65-30,  0,  48-10,   0,
  0,   49-18,  65-30,  0,  48-10,   0,
  0,   49-18,  60-30,  0,  42-10,   0,
  0,   49-18,  60-30,  0,  42-10,   0,
  /*    [J] */
  0,   40-5,  45,  0,  40,   0,
  0,   40-5,  45,  0,  40,   0,
  0,   40-5,  40,  0,  38,   0,
  0,   40-5,  40,  0,  38,   0,
};
#endif

/*
  Arrays that apply to both male and fem voice
  Names for all (phonemic) input symbols:
        SI     A    A3     Š    Au     E     ‚    Eu     I     O
        O6    Ou     U    An    In    On    Un    AP     L     R
         W    Wu     Y    Ch     F     J    Rx     S     V     Z
         B     D     G     K     P     T    Gn     M     N     Ng
        XX    Si
*/

/* Pointers to parallel formant amplitudes for obstruents : phsettar */
short fr_ptram[] = {

         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  337,    1,  361,    0,   97,   25,  121,
       217,  265,  313,  289,  193,  241,    0,    0,    0,    0,
         0,    0
};

/*
  Pointers to locus, percent, and duration for formant
  transitions for 42 phones before three types of vowels
        SI     A    A3     Š    Au     E     ‚    Eu     I     O
        O6    Ou     U    An    In    On    Un    AP     L     R
         W    Wu     Y    Ch     F     J    Rx     S     V     Z
         B     D     G     K     P     T    Gn     M     N     Ng
        XX    Si
  used in phsettar.c
*/
short fr_plocu[] = {
  /*    FRONT: */
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  325,    1,  352,    0,   73,   19,  100,
       199,  244,  298,  271,  181,  217,   37,  379,  397,  424,
         0,
  /*    BACK: */
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  334,   10,  361,    0,   82,   28,  109,
       208,  253,  307,  280,  190,  226,   37,  388,  406,  433,
         0,
  /*    ROUND */
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
         0,    0,    0,  343,   10,  370,    0,   91,   28,  118,
       208,  262,  316,  289,  190,  235,   37,  388,  415,  442,
         0
};

/* Phonetic feature values allowed in place[]
  FLABIAL       0000001        p, b, m, f, v
  FDENTAL       0000002        th, dh, d$
  FPALATL       0000004        sh, zh, ch, jh
  FALVEL        0000010        t, d, n, en, s, z, tx (not l, r, dx)
  FVELAR        0000020        k, g, nx
  FGLOTAL       0000040        q, tq (signals glottal stop)
  F2BACKI       0000100        y, yu
  F2BACKF       0000200        iy, y, ey (not ay,oy)
  used in phdrawt0, phsettar.c
*/
short fr_place [] = {
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
  /* SegAXP */ 0,
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
  /* Gn */  FPALATL, /* palatoalvéolaire */
  /* M  */  FLABIAL,
  /* N  */  FALVEL,
  /* Ng */  FVELAR,
  /* SegX */   0,
  /* SegSil */ 0
 };

#ifdef DEBG
/* used in phsettar.c */
char *parname [] = {
  "F1",  "F2",  "F3",  "FZ",  "B1",  "B2",  "B3",  "AV",
  "AH",  "A2",  "A3",  "A4",  "A5",  "A6",  "AB",  "TL"
};
#endif

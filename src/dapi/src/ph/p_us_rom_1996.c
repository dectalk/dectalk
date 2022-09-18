/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright    1984                            by Dennis H. Klatt
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
 *    File Name:	phrom.c
 *    Author:		Dennis Klatt
 *    Creation Date:01-SEP-1984
 *
 *    Functionality:
 *	Main program of PH.EXE
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Sep-84 DK    Initial creation
 * 0002 27-Dec-84 DGC   Added some "readonly" things for the 80186, as
 *                      these tables must go into the ROM.
 * 0003 11-Feb-85 DK    Backed off amplitudes of nasals a bit, voice [bdg]
 *                       replaced [EM] by [D$] (dentalized d)
 * 0004  1-Mar-85 DK    Improve place[] array, free up two featb[] feature bits
 * 0005 12-Apr-85 DK    Improve bursts for telephone intelligibility
 * 0006 13-May-85 DK    Add getcosine[] table
 * 0007 17-Jul-85 DK    AV target for nasal -2 db, voiced fric -3, dx - 6
 * 0008 25-Jul-85 DK    Add lineartilt[] array
 * 0009 29-Jul-85 DK    Add feature FSTOP
 * 0010 26-Aug-85 DK    Tweeked vowels incrementally
 * 0011 20-NOV-89 EAB   REMOVE TROJAN HORSE (DBMESS)
 * 0012 3/24/94   EAB   modified iy w and nasal so different that it needs more
							   analysis this is a test.
 * 0013 3/18/95   EAB	Intervocalic d i.e. dx was not good with front vowels
								Found hardcoded pointer error
								as well as the need for acoustic tuning.
 * 0014 3/19/96   EAB	Found that female was off too, got an insite to treat
								flap differently and remove it from the maleloc tables
								so it gets treated more like a short weakly voiced vowel.
								Did this by zeroing out plocu pointers.
 *  0015	4/5/96	EAB	Found a conceptual error that  B2 B3 for silence was
 *								set to values it's much better to have it set in context
 *								it was causing overloads dir to a too rapid change in bandwidth
 *
 */

/*               Arrays used by the phonetic component                  */

/*    Inherent durations (in msec) for NFONEM phone types */

short us_inhdr[] = {

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      205,  170,  160,  200,  160,  230,  240,  250,  250,  160,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      240,  220,  220,  170,  210,  180,  230,  120,  120,  230,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
	      250,  250,  250,  230,   60,   75,   65,   75,   70,  120,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      100,   70,   65,   80,  160,   60,  170,  100,   70,  100,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      60,  115,   75,  115,   70,   85,   80,   85,   80,   90,

      /* G    DX    TQ     Q    CH    JH  DF                         */
      90,   30,   70,    5,  160,  100,	30,
      100,   // TZ
      120,   // CZ
      4,     // LY
      4,     // RE
      4,     // X1
      4,     // X2
      4,     // X3
      4,     // X4
      4,     // X5
      4,     // X6
      4,     // X7
      4,     // X8
      4,     // X9
      4      //Z1
      };

/*  Minimum durations (in msec) */

short us_mindur[] = {

      /* SI   * IY   * IH    *EY    *EH   * AE    AA    AY    AW    AH   */
         7,   80,   80,  110,   80,   80,   90,  100,  110,   70,

      /* AO    OW    OY   * UH   * UW    RR    YU    AX    IX    IR   */
	      100,   90,  110,   80,    80,   90,  100,   50,   50,  120,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      	120,  120,  120,  120,   15,   30,   30,   40,   35,   70,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      70,   60,   35,   50,  110,   35,  100,   60,   55,   40,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      35,   65,   60,   60,   50,   70,   60,   50,   40,   75,

      /* G    DX    TQ     Q    CH    JH  DF                         */
      65,   20,   50,    5,  100,   70,  20,
      60,    // TZ
      60,    // CZ
      3,     // LY
      3,     // RE
      3,     // X1
      3,     // X2
      3,     // X3
      3,     // X4
      3,     // X5
      3,     // X6
      3,     // X7
      3,     // X8
      3,     // X9
      3      //Z1
      };

/*      Target values:  -1 indicates no inherent target, other negative
 *      numbers are pointers in diphthong array PHODP[] */

short us_maltar[] = {

      /* F1 target values */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      -1,   -2,  -14,  -26,  -44,  -62,  -86, -104, -132, -156,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      -174, -192, -210, -240, -258, -276, -420, -294, -312, -330,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      -348, -366, -384, -402,  295-30,  260,  340,  340,   -1,  470,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      	480,  430,  430,  430,  450,  210,  430,  340,  280,  320,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      290,  320,  280,  300,  280,  350,  210,  350,  210,  350,

      /* G    DX    TQ     Q    CH    JH	DF                           */
      210,  350,  210,   -1,  350,  260,	350,
      -1,    // TZ
      300,   // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* F2 targets */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      -1,   -6,  -18,  -32,  -50,  -68,  -92, -112, -138, -162,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      -180, -198, -218, -246, -264, -282, -426, -300, -318, -336,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      -354, -372, -390, -408,  610, 2070, 1030,  800,   -1, 1270,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      	850, 	1270-150, 1340+200, 1600,  800, 1400, 1340, 1100, 1100, 1300,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      1300, 1420, 1420, 1650, 1650, 1100, 1100, 1600, 1600, 1790,

      /* G    DX    TQ     Q    CH    JH	DF                           */
      1790, 1313+600, 1600,   -1, 1750, 1730,	1313+600,
      -1,    // TZ
      1400,  // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* F3 targets */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      -1,  -10,  -22,  -38,  -56,  -74,  -98, -118, -144, -168,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      -186, -204, -226, -252, -270, -288, -432, -306, -324, -342,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      -360, -378, -396, -414, 2250-100, 2570, 1380, 2950,   -1, 1540,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      2990, 2130+200, 2500, 2000, 2850, 2600, 2500, 2080, 2080, 2520,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      2560, 2550, 2600, 2550, 2550, 2150, 2150, 2600, 2600, 2250,

      /* G    DX    TQ     Q    CH    JH	DF                           */
      2520, 2005+300, 2600,   -1, 2700, 2700,	2005+300,
      -1,    // TZ
      2400,  // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* B1 targets */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
	      -1,   60,   60,   70,   60,   90+70+40,  140-20, -126, -150,   90,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      110,   90,   200,   80,   75,   90,   70,   90,   60,   80,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      80,  140,  100,   90,   60,   50,   70,   70,  300,   80,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      90,  130,  130,  130,   90,   90,  130,  200,  100,  200,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      100,  200,  100,  200,  100,  200,   90,  200,   90,  200,

      /* G    DX    TQ     Q    CH    JH	DF                           */
      90,   90,  110,   -1,  200,   70,	90,
      -1,    // TZ
      90,    // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* B2 targets */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      -1,  100,  100,  100,  105,  -80,   90+50,  100,   75,   70,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      	90,   70, -234,   83,   70,   110, -438,   80,  100,  120,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      	110,   90,   80,   90,   60,  200,   80,   65,  200,   80,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      90,  280,  300+100,  250+300,   90,  110,  300,  120,  120,   90,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      120,  180,  140,  240,  160,  180,   80,  150,  100,  160,

      /* G    DX    TQ     Q    CH    JH  DF                         */
      120,  100,  100,   -1,  280,  170,	100,
      -1,    // TZ
      120,   // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1


      /* B3 targets */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      -1,  180+80,  190,  200,  220,  250+40,  200+50,  230,  150,  180,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      	120,  180,  170,  160,  140,   200, -444,  180,  200,  200,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      200,  150,  140,  180,   80,  300,   200,  120,  220,  130,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      160,  	360,  460+300,  400,  200,  200,  460,  150,  120,  150,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      170,  300,  300,  300,  300,  180,  130,  250,  240,  280,

      /* G    DX    TQ     Q    CH    JH   DF                        */
      180,  170,  170,   -1,  250,  250,	 170,
      -1,    // TZ
      150,   // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* AV targets */

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      0,   64,   65,   65,   65,   63,   64,   64,   64,   64,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      64,   65,   64,   65,   65,   65,   65,   62,   63,   65,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      65,   64,   65,   65,   64,   64,   64,   64,    0,   64,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      63,   60,   60,   60,   63,   50,   60,    0,   53,    0,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      53,    0,   53,    0,   53,    0,    0,    0,    0,    0,

      /* G    DX    TQ     Q    CH    JH 	DF    Voicebar for [bdgj] set by */
      0,   30,    0,   54,    0,    0 ,	44,	/* special_rules() in PHSETTAR.C */
      0,     // TZ
      0,     // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0      // Z1
      };

/*    Burst durations (in msec) */
short us_burdr[] = {

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      0,    0,    0,    0,    0,   13,    0,    0,    0,    0,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      0,    0,    0,    0,    0,    7,    7,   13,   13,   20-6,

      /* G    DX    TQ     Q    CH    JH    DF                       */
      20,    0,    0,    0,   71,   39,	0,
      0,     //TZ
      0,     //CZ
      2,     //LY
      2,     //RE
      2,     //X1
      2,     //X2
      2,     //X3
      2,     //X4
      2,     //X5
      2,     //X6
      2,     //X7
      2,     //X8
      2,     //X9
      2 };   //Z1

/*    Incremental changes to F0 caused by segmental influences */

short us_f0segtars[] = {

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      50,  100,  60,    40,   20,    0,    0,    0,   0,    20,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      0,   30,   50,   60,  100,   50,  100,   30,   60,  100,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      60,    0,   30,   80,   60,   60,    0,    0,  200,    0,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      0,  -50,  -50,  -50,    0,  -50,  -50,  300,  -50,  300,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      -50,  300,  -50,  300,  -50,  300,  -50,  300,  -50,  300,

      /* G    DX    TQ     Q    CH    JH  DF                         */
      -50,  -10,    0,    0,  300,  -50,	-10,
      30,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
      };

/*    begfro=1, begbac=2, begrou=3, null=4, begrow/attenuated=5 */

short us_begtyp[] = {

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      	4,    1,    1,    1,    1,    1,    2,    2,    2,    2,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      	3,    3,    3,    3,    3,    3,    1,    2,    1,    1,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      	1,    2,    3,    3,    5,    1,    5,    5,    4,    3,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      	5,    4,    4,    4,    5,    4,    4,    4,    4,    4,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      	4,    4,    4,    4,    4,    4,    4,    4,    4,    4,

      /* G    DX    TQ     Q    CH    JH   DF                        */
	4,    4,    4,    4,    4,    4,		4,
	1,     // TZ
	4,     // CZ
	1,     // LY
	1,     // RE
	1,     // X1
	1,     // X2
	1,     // X3
	1,     // X4
	1,     // X5
	1,     // X6
	1,     // X7
	1,     // X8
	1,     // X9
	1 };   // Z1
short us_endtyp[] = {

      /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
      	4,    1,    1,    1,    1,    1,    2,    1,    5,    2,

      /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
      	3,    5,    1,    3,    5,    3,    3,    2,    1,    3,

      /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
      3,    3,    3,    3,    5,    1,    5,    5,    4,    3,

      /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
      5,    4,    4,    4,    5,    4,    4,    4,    4,    4,

      /* DH     S     Z    SH    ZH     P     B     T     D     K   */
      4,    4,    4,    4,    4,    4,    4,    4,    4,    4,

      /* G    DX    TQ     Q    CH    JH   DF                        */
      4,    4,    4,    4,    4,    4,		4,
      1,     // TZ
      4,     // CZ
      1,     // LY
      1,     // RE
      1,     // X1
      1,     // X2
      1,     // X3
      1,     // X4
      1,     // X5
      1,     // X6
      1,     // X7
      1,     // X8
      1,     // X9
      1 };   // Z1

/*    Diphthongization specifications for all vowels.
 *      first number is initial steady state
 *      second number is duration in ms of initial steady state
 *      (assuming total duration of vowel is equal to inherent dur)
 *      third number is value at end of time given by fourth number
 *      next-to-last number is value at end of diphthong
 *      last value is minus 1 to signal end of diphthong
 */

short us_maldip[] = {
      0, 0,
      /* [IY]   2  f1,f2,f3 
      345, 10,    330, -1,
      2100, 10,   2140, -1,
      2880, 10,   2920, -1,*/
	      /* [IY]   2  f1,f2,f3 weab 3/24/94
			wow why do I see so differrent? also iy be knee higher
			f3 than see */
      345, 40,    330, -1,
      2100, 40,   2100, -1,
      2500, 40,   2779, -1,


      /* [IH]  14 f1,f2,f3 */
      460, 60,    550, -1,
      1810, 60,   1570, -1,
      2520, 60,   2520, -1,

      /* [EY]  26  f1,f2,f3 */
      600, 10,    440, 160,    440, -1,
      1720, 10,   2000, 160,   2000, -1,
      2520, 10,   2520, 160,   2520, -1,

      /* [EH]  44  f1,f2,f3 */
      600,  60,    680, 110,    670, -1,
      1720,  80,   1480, 140,   1480, -1,
      2500,  90,   2530, 140,   2530, -1,

      /* [AE]  62  f1,f2,f3,b2 
      710, 130,    770, 210,    770, -1,
      1630,  40,   1730, 120,   1480, -1,
      2430, 130,   2470, 210,   2470, -1,
      130, 130,    120, 210,    120, -1,*/

		      /* [AE]  62  f1,f2,f3,b2 */

		/*11/1/93-EAB MAKING SIGNIFICANT CHANGES*/

      677, 130,    677, 210,    677, -1,
      1533,  40,   1698, 120,   1698, -1,
      2479, 130,   2479, 210,   2479, -1,
      130-20, 130,    120-20, 210,    120-20, -1,	


      /* [AA]  86  f1,f2,f3 */

      780,  40,    780, 200,    780, -1,
      1200,  40,   1200, 200,   1200, -1,
      2670,  40,   2670, 200,   2670, -1,

      /* [AY] 104  f1,f2,f3,b1 */
      730,  70,    770, 130,    530, 210,    530, -1,
      1200,  90,   1850, 210,   1850, -1,
      2680, 120,   2350, 170,   2450, 210,   2450, -1,
      130,  90,     65, 220,     65, -1,

      /* [AW] 132  f1,f2,f3,b1 */
      710, 110,    550, 230,    550, -1,
      1200, 110,    820, 225,    820, -1,
      2650, 120,   2550, 230,   2550, -1,
      120,  130,    100, 240,    100, -1,

      /* [AH] 156  f1, f2, f3 */
      620,  40,    620, 100,    620, -1,
      1170,  40,   1170, 100,   1170, -1,
      2550,  40,   2550, 100,   2550, -1,

      /* [AO] 174  f1, f2, f3 */
      640, 120,    700, 220,    700, -1,
      929, 120,   1100, 220,   1209, -1,
      2495,  40,  2425, 100,   2100, -1,	

      /* [OW] 192  f1, f2, F3 */
      540,  40,    490, 170,    490, -1,
      1050,  50,   950, 170,    850, -1,
      2495,  40,   2392, 170,   2320, -1,

      /* [OY] 210  f1, f2, f3, b2 
      480,  10,    480,  90,    480, 220,    470, -1,
      900,  50,    1400,  90,   1860, 220,   1860, -1,
      2500, 140,   2150, 200,   2400, 250,   2400, -1,
      100, 100,    160, 230,    160, -1,	*/

      /* [OY] 210  f1, f2, f3, b2 */
      530,  95,    516,  160,   470,210,    470, -1,
      890,  60,    920,  90,   1814, 210,   1814, -1,
      2500, 30,    2100, 120,   2400,160,   2480, -1,
      110, 100,    100, 210,    220, -1,					 

      /* [UH] 240  f1, f2, f3 */
      480,  70,    530, 130,    530, -1,
      1100,  70,   1200, 130,   1200, -1,
      2420,  70,   2500, 130,   2500, -1,

      /* [UW] 258  f1, f2, f3 */
      370,  40,    340, 180,    340, -1,
      1150,  40,    840, 180,    840, -1,
      2300,  40,   2300, 180,   2300, -1,

      /* [RR] 276  f1, f2, f3 */
      496,  30,    496, 170,    496, -1,
      1313,  30,   1313, 170,   1313, -1,
      1607,  30,   1607, 170,   1607, -1,

      /* [AX] 294  f1, f2, f3 */
      550,  30,    550,  90,    550, -1,
      1260,  30,   1260,  90,   1260, -1,
      2600,  30,   2600,  90,   2600, -1,

      /* [IX] 312  f1, f2, f3 */
      460,  30,    460,  90,    460, -1,
      1680,  30,   1680,  90,   1680, -1,
      2520,  30,   2520,  90,   2520, -1,

      /* [IR] 330  f1, f2, f3 */
      350, 100,    420, 170,    420, -1,
      1850, 100,   1540, 170,   1510, -1,
      2800,  70,   1830, 160,   1800, -1,

      /* [ER] 348  f1, f2, f3 */
      490,  40,    490, 230,    490, -1,
      1650, 110,   1500, 190,   1500, -1,
      2500, 100,   1790, 190,   1750, -1,

      /* [AR] 366  f1, f2, f3 */
      660, 100,    570, 180,    570, -1,
      1210, 100,   1280, 180,   1280, -1,
      2450,  90,   1720, 180,   1680, -1,

      /* [OR] 384  f1, f2, f3 */
      510,  90,    490, 180,    490, -1,
      870, 100,   1200, 190,   1200, -1,
      2300,  90,   1530, 180,   1500, -1,

      /* [UR] 402  f1, f2, f3 */
      420,  80,    440, 170,    440, -1,
      860,  80,   1170, 170,   1200, -1,
      2100,  80,   1600, 180,   1560, -1,

      /* [YU] 420  f1, f2, f3, b2, b3 */
      270,  45,    360, 150,    360, -1,
      2000,  45,   1050, 150,   1000, -1,
      2600,  45,   2250,  95,   2200, -1,
      150,  45,     70, 150,     70, -1,
      250,  45,    130, 100,    130, -1
      };

/*  Consonant-vowel formant transition specifications                   */
/*    F1 locus, F1 percent, F1 trandur, F2 locus, ... F3 trandur        */


/* MALLINE is defined in PH and is the number of parameters *
 *in a line of malleloc */

short us_maleloc[] =       {
      0,
      /* [F] front,back */
      300,63,30,   1,92,35,2080,35,30,
      320,60,30,   1,91,35,2100,65,40,
      /* [V] front,back */
      300,50,30,   1,92,35,2080,35,40,
      300,50,30,   1,91,40,2100,65,40,
      /* [TH] front,back */
      340,10,45,1350,20,50,2700, 0,50,
      350,10,50,1300,12,55,2720,11,55,
      /* [DH] front,back */
      340,10,45,1350,20,50,2700, 0,50,
      350,10,50,1300,12,55,2720,11,55,
      /* [S] front,back-unrounded,rounded */
      310,40,40,1240,40,50,2550, 0,70,
      310,40,40,1240,40,50,2630, 0,70,
      310,40,40,1320,15,60,2460, 0,65,
      /* [Z] front,back-unrounded,rounded */
      310,40,40,1240,35,50,2550, 0,70,
      310,40,40,1240,35,60,2630, 0,70,
      310,40,40,1320,15,60,2460, 0,65,
      /* [SH] front,back-unrounded,rounded */
      285,32,55,1830,30,70,2640,51,70,
      285,32,55,1700,27,70,2270, 0,85,
      340,32,55,1630,27,90,2100,20,110,
      /* [ZH] front,back-unrounded,rounded */
      285,32,55,1830,30,70,2640,51,70,
      285,32,55,1700,27,70,2270, 0,85,
      340,32,55,1630,27,90,2100,20,110,
      /* [P] front,back */
      350,55,20, 950,56,30,2200,25,45,
      350,45,25, 920,46,30,2250,40,50,

      /* [B] front,back */
      330,35,20,1450,56,30,2241,25,45,
      330,45,25, 920,46,30,2250,40,50,

      /* [T] front,back-unrounded,rounded */
      320,43,35,1800,66,35,2650,30,45,
      320,43,50,1700,40,75,2600, 0,50,
      320,43,40,1700,40,95,2300, 0,95,
      /* [D] front,back-unrounded,rounded */
      250,43,35,1800,66,35,2650,60,45,
      250,43,50,1700,40,75,2600,30,10,
      250,43,40,1700,40,95,2601,30,85,
      /* [K] front,back-unrounded,rounded */
      320,33,45,1990,20,50,3000,117,50,
      320,33,50,1800,16,60,2150, 0,90,
      320,33,40,1600,42,65,2050,15,80,


      /* [G] front,back-unrounded,rounded 
      250,33,45,1990,20,50,3000,113,50,
      300,33,50,1780,16,60,2150,0,90,
      290,45,40,1600,42,65,1920,15,80,*/

		/* [G] front,back-unrounded,rounded */
		/*11/1/93 BAG SOUNDS LIKE BAD OR BAB MY
		ANALYSIS SO DIFFERENT THAT I COPIED TABLE OVER*/

      250,33,45,2101,10,80,3000,20,20,
      300,33,50,1782,16,60,2152,0,90,
      290,45,40,1603,42,65,1923,15,80,

      /* [CH] front,back-unrounded,rounded */
      320,54,55,1750,25,70,2750,19,70,
      320,54,55,1680,10,70,2450,10,70,
      320,54,55,1680,10,90,2350,10,100,
      /* [JH] front,back-unrounded,rounded */
      240,32,55,1750,25,70,2750,19,70,
      245,32,55,1680,10,70,2450,10,70,
      245,32,55,1680,10,90,2350-380,10,100,
      /* [M] front,back 				  */
      470,30,30,1200,10,35,2100,30,40,
      450,20,30,   1,88,40,1550,80,25,

      /* [M] front,back new nasal see [n] for details
      500,90,30,1200,10,15,2700,30,40,
      500,90,30,812,90,70,2800,30,25, */

       /* [N] front,back-unrounded,rounded */
      450,20,35,1350,75,35,2600,40,45,
      450,20,30,1420,25,75,2600,30,60,
      450,20,30,1550,25,95,2320,30,95,
      /* [N] front,back-unrounded,rounded
		4/94 eab&an try new info on n where it appears
		that formants locus targets are way different from formant
		locations after lip closure
      240,20,55,1403,85,95,2570,40,35,
      350,20,50,1420,15,75,2700,10,40,
      230,20,50,1730,85,95,2153,85,95,*/


      /* [NG] front,back-unrounded,rounded */
      440,25,40,2200,15,60,3000,105,60,
      440,25,40,1800,20,70,2150,20,70,
      440,25,40,1700,42,70,1920,25,70,
      /* [DX] anf [FX] front,back-unrounded,rounded */
      250,43,35,1340+400,66+30,35,2090+300,60,45,
      250,43,50,1340,40,35,2090,61,50,
      250,43,40,1340,40,35+40,2090,62-20,100,

      };

/* Parallel amps for obst before front, back, round, and nonsonor       */
/*                A2   A3   A4   A5   A6   AB                           */

short us_malamp[] = {
      0,
      /* [F] */
      0,   0,   0,   0,   0,  51,
      0,   0,   0,   0,   0,  51,
      0,   0,   0,   0,   0,  49,
      0,   0,   0,   0,   0,  49,
      /* [V] */
      0,   0,   0,   0,   0,  45,
      0,   0,   0,   0,   0,  45,
      0,   0,   0,   0,   0,  43,
      0,   0,   0,   0,   0,  43,
      /* [TH] */
      0,   0,   0,   0,   0,  47,
      0,   0,   0,   0,   0,  47,
      0,   0,   0,   0,   0,  45,
      0,   0,   0,   0,   0,  45,
      /* [DH] */
      0,   0,   0,   0,   0,  41,
      0,   0,   0,   0,   0,  41,
      0,   0,   0,   0,   0,  39,
      0,   0,   0,   0,   0,  39,
      /* [S] */
      0,   0,   0,   0,  57-DEC_SZ,   0,
      0,   0,   0,   0,  57-DEC_SZ,   0,
      0,   0,   0,   0,  58-DEC_SZ,   0,
      0,   0,   0,   0,  58-DEC_SZ,   0,
      /* [Z] */
      0,   0,   0,   0,  51-DEC_SZ,   0,
      0,   0,   0,   0,  51-DEC_SZ,   0,
      0,   0,   0,   0,  52-DEC_SZ,   0,
      0,   0,   0,   0,  52-DEC_SZ,   0,
      /* [SH] */
      0,  49-6,  65-10,   0,  48-6,   0,
      0,  49-6,  65-10,   0,  48-6,   0,
      0,  49-6,  60-10,   0,  42-6,   0,
      0,  49-6,  60-10,   0,  42-6,   0,
      /* [ZH] */
      0,  43,  59-10,   0,  42,   0,
      0,  43,  59-10,   0,  42,   0,
      0,  43,  54-10,   0,  36,   0,
      0,  43,  54-10,   0,  36,   0,
      /* [P] */
      0,   0,   0,   0,  44,  61,  /* Use A6 = 44 to subtract  */
      0,   0,   0,   0,  44,  61,  /* a little energy at 5 kHz */
      0,   0,   0,   0,  44,  61,  /* from typical AB spectrum */
      0,   0,   0,   0,  44,  61,
      /* [B] */
      0,   0,   0,   0,  40,  56,  /* Use A6 = 40 to subtract  */
      0,   0,   0,   0,  40,  56,  /* a little energy at 5 kHz */
      0,   0,   0,   0,  40,  56,  /* from typical AB spectrum */
      0,   0,   0,   0,  40,  56,
      /* [T] */
      0,   0,  48,   0,  55,   0,
      0,   0,  52,   0,  54,   0,
      33,  37,  60,   0,  50,   0,
      33,  37,  60,   0,  50,   0,
      /* [D] */
      0,   0,  44,   0,  52,   0,
      0,   0,  46,   0,  51,   0,
      0,   0,  57,   0,   0,   0,
      0,   0,  55,   0,   0,   0,

      /* [K] */

      0,   42,  51,  44,  33,   0,
      43,   0,   0,  46,   0,   0,
      43,   0,  28,  38,   0,   0,
      43,   0,  28,  38,   0,   0,

      /* [G] */
      0,    38,  0,  33-3,   0,   0,
      39,   0,   0,  42,   0,   0,
      38,   0,  23,  33,   0,   0,
      38,   0,  23,  33,   0,   0,
      /* [CH] */
		/* sb complianed ch too strong-i anaylsised and agreed*/
      0,  49-6,  65-10,   0,  48-6,   0,
      0,  49-6,  65-10,   0,  48-6,   0,
      0,  49-6,  60-10,   0,  42-6,   0,
      0,  49-6,  60-10,   0,  42-6,   0,
      /* [JH] */
      0,  45,  61-10,   0,  44,   0,
      0,  45,  61-10,   0,  44,   0,
      0,  45,  56-10,   0,  38,   0,
      0,  45,  56-10,   0,  38,   0,
      };

/* Arrays that apply to both male and fem voice */
/*         Names for all (phonemic) input symbols:
 SI    IY    IH    EY    EH    AE    AA    AY    AW    AH
 AO    OW    OY    UH    UW    RR    YU    AX    IX    IR
 ER    AR    OR    UR     W     Y     R     L    HX    RX
 LX     M     N    NG    EL    D$    EN     F     V    TH
 DH     S     Z    SH    ZH     P     B     T     D     K
 G    DX    TX     Q,   CH    JH		  DF
 */

/* Pointers to parallel formant amplitudes for obstruents */

short us_ptram[] = {
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,  193,    0,    1,   25,   49,
      73,   97,  121,  145,  169,  193,  217,  241,  265,  289,
      313,    0,  265,    0,  337,  361, 0,
      541,   // TZ
      571,   // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0 };   // Z1

/* Pointers to locus, percent, and duration for formant         */
/* transitions for 56 phones before three types of vowels       */

short us_plocu[] = {
      /* FRONT: */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,  379,  397,  424,    0,   55,  397,    1,   19,   37,
      55,   73,  100,  127,  154,  181,  199,  217,  244,  271,
      298,  451-451,  217,    0,  325,  352,451-451,
      217,   // TZ
      226,   // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0,     // Z1

      /* BACK: */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,  388,  406,  433,    0,   64,  406,   10,   28,   46,
      64,   82,  109,  136,  163,  190,  208,  226,  253,  280,
      307,  460-460,  226,    0,  334,  361, 460-460,
      451,   // TZ
      460,   // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0,     // Z1
      /* ROUND */
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
      0,  388,  415,  442,    0,   64,  415,   10,   28,   46,
      64,   91,  118,  145,  172,  190,  208,  235,  262,  289,
      316,  469-469,  235,    0,  343,  370, 469-469,
      685,   // TZ
      694,   // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0,     // Z1
      // ==== Low ====
      0,     // _
      0,     // IY
      0,     // IH
      0,     // EY
      0,     // EH
      0,     // AE
      0,     // AA
      0,     // AY
      0,     // AW
      0,     // AH
      0,     // AO
      0,     // OW
      0,     // OY
      0,     // UH
      0,     // UW
      0,     // RR
      0,     // YU
      0,     // AX
      0,     // IX
      0,     // IR
      0,     // ER
      0,     // AR
      0,     // OR
      0,     // UR
      0,     // W
      0,     // YX
      0,     // R
      0,     // L
      0,     // HX
      0,     // RX
      0,     // LX
      703,   // M
      712,   // N
      721,   // NX
      0,     // EL
      730,   // DZ
      739,   // EN
      748,   // F
      757,   // V
      766,   // TH
      775,   // DH
      784,   // S
      793,   // Z
      802,   // SH
      811,   // ZH
      820,   // P
      829,   // B
      838,   // T
      847,   // D
      856,   // K
      865,   // G
      0,     // DX
      874,   // TX
      0,     // Q
      883,   // CH
      892,   // JH
      0,     // DF
      0,     // TZ
      901,   // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0 };   // Z1

#if 0
/* Glottalization gesture */

const short f0glstp[6] = {
      -600, -450, -320, -210, -120, -50
      };

/* Initial values for parameters */

const short parini[] = {
      /* F1   F2   F3   FZ   B1   B2   B3   AV              */
      600,1600,2600, 300,  50, 150, 250,   0,
      /* AP   A2   A3   A4   A5   A6   AB   TILT            */
      0,   0,   0,   0,   0,   0,   0,   0
      };

/* Switch to set target to const, taram[ptram], or flocu[plocu] */

char partyp[] = {
      /* F1   F2   F3   FZ   B1   B2   B3   AV              */
      3,   3,   3,   1,   4,   4,   4,   0,
      /* AP   A2   A3   A4   A5   A6   AB   TILT            */
      0,   2,   2,   2,   2,   2,   2,   2
      };

/* Table to permit use of mulsh() for division by 1 to 20 */

const short divtab[] = {
      16384, 16384,  8192,  5461,  4096,
      3276,  2730,  2340,  2048,  1820,
      1638,  1489,  1365,  1260,  1170,
      1092,  1024,   964,   910,   862,
      819,   780,   745,   712,   682,
      655,   630,   607,   585,   565,
      546,   528,   512,   496,   482,
      468,   455,   443,   431,   420,
      409,   399,   390,   381,   372,
      364,   356,   349,   341,   334
      };
#endif

/* Stress-related rise/fall amount in Hz*10 for first, second, ... accent
 *  in a phrase */

short us_f0_phrase_position[] = { 210,  90, 60, 40, 0 };
/* Was: 210,  90, 40, 20 */

/* F0 rise as f(stress-level); Order is unstr, primary, secondary, emphasis */

/* WARNING eab f0_stress_level + f0_phrase_pos must add up to an odd number or
you will be creating a step function instead of the desired impulse function*/

short us_f0_stress_level[] = {1, 71, 31, 281};

/* Realize quasi-sinusoidal vibratto by trapezoidal approximation       */
/*  (if |vibdel| is 4, vibratto is plus-or-minus 1.2 percent)           */

const short vibdel[] = { -6, 0, 6, 0 };

/* Notes in F0*10 from C2 to C5 */
//#ifndef EPSONC33
#if 0
const short notetab[] = {
      640,  /* 1 = C2              */
      678,  /* 2 = C#              */
      718,  /* 3 = D               */
      761,  /* 4 = D#              */
      806,  /* 5 = E    B                  (HARRY)         */
      854,  /* 6 = F    A          */
      905,  /* 7 = F#   S          */
      959,  /* 8 = G    S B                (PAUL)          */
      1016,  /* 9 = G#   | A        */
      1076,  /* 10 = A    | R        */
      1140,  /* 11 = A#   | A        */
      1208,  /* 12 = B    | T        */
      1280,  /* 13 = C3   | O T              (FRANK)         */
      1356,  /* 14 = C#   | N E      */
      1437,  /* 15 = D    | E N      */
      1522,  /* 16 = D#   | | O      */
      1613,  /* 17 = E    | | R      */
      1709,  /* 18 = F    | | | A            (BETTY)         */
      1810,  /* 19 = F#   | | | L    */
      1918,  /* 20 = G    | | | T    */
      2032,  /* 21 = G#   | | | O    */
      2152,  /* 22 = A    | | | |    */
      2280,  /* 23 = A#   | | | |    */
      2416,  /* 24 = B    | | | | S          (URSULA or KIT) */
      2560,  /* 25 = C4   | B | | O  */
      2712,  /* 26 = C#   B A | | P  */
      2874,  /* 27 = D    A R | | R  */
      3044,  /* 28 = D#   A A | | A  */
      3226,  /* 29 = E    S T | | N  */
      3418,  /* 30 = F      O | | O  */
      3620,  /* 31 = F#     N | | |  */
      3836,  /* 32 = G      E T | |  */
      4064,  /* 33 = G#       E | |  */
      4304,  /* 34 = A        N | |  */
      4560,  /* 35 = A#       O | |  */
      4832,  /* 36 = B        R | |  */
      5120   /* 37 = C5         | |  */
      };
#endif

short us_femtar[] = {

      /* F1 female target values */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      -1,  -2, -14, -26, -44, -62, -86,-104,-132,-156,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      -174,-192,-210,-240,-258,-276,-420,-294,-312,-330,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
      -348,-366,-384,-402, 350, 320, 350, 360,  -2, 490,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      	480, 450, 450-200, 450, 480, 220, 450, 360, 300, 340,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      320, 340, 300, 320, 300, 370, 220, 370, 220, 370,

      /* G   DX   TQ    Q   CH   JH  DF */
      220, 370, 220,  -1, 370, 280,	370,
      410,   // TZ
      370,   // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* F2 female targets */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      -1,  -6, -18, -32, -50, -68, -92,-112,-138,-162,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      -180,-198,-218,-246,-264,-282,-426,-300,-318,-336,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
      -354,	-372,-390,-408, 800,2490,1033,1000,  -1,1600,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      930,  1340, 1500+470,2600, 990,1860,1530,1150,1150,1530,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      1500,1640,1640,1980,1980,1150,1150,1860,1860,2190,

      /* G   DX   TQ    Q   CH   JH  DF*/
      2190,1860,1860,  -1,2100,2100, 1860,
      1650,  // TZ
      1600,  // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* F3 female targets */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      -1, -10, -22, -38, -56, -74, -98,-118,-144,-168,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      -186,-204,-226,-252,-270,-288,-432,-306,-324,-342,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
      -360,-378,- 396,-414, 2630,3400,1700,3430,  -1,1950,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      3320,2490,2900+650,3100,3320,3020,2920,2460,2460,2940,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      2940,2930,3000,2930,2940,2470,2470,3020,3020,2710,

      /* G   DX   TQ    Q   CH   JH  DF */
      2710,3000,3000,  -1,3150,3150, 3000,
      2700,  // TZ
      2400,  // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* B1 female targets */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      -1,  75,  75,  75,  80, -80, 180,-126,-150, 110,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      	360, 100, 100,  90,  90,  90,  80, 140,  80,  80,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
        120, 130,  90,  80,  80, 170,  90,  90, 500,  90,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      90, 120, 120, 120,  90, 120, 110, 200, 140, 200,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      120, 200, 140, 200, 120, 200, 100, 200, 110, 200,

      /* G   DX   TQ    Q   CH   JH  DF */
      100, 100,  90, 100, 200, 120,	 100,
      90,    // TZ
      90,    // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* B2 female targets */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      	-1, 220, 190, 190, 160, 240, 200, 190, 150, 150,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      	360, 110,-234, 100, 100, 250,-438, 140, 180, 220,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
        190, 200, 170, 130,  80, 180, 150, 110,  -1, 200,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      	110, 340, 200, 600, 120,  90, 200, 140, 120, 220,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      	210, 200, 170, 240, 160, 180, 110, 150, 140, 160,

      /* G   DX   TQ    Q   CH   JH   DF*/
      	100, 100, 100,  -1, 230, 170,	  100,
	120,   // TZ
	120,   // CZ
	-1,    // LY
	-1,    // RE
	-1,    // X1
	-1,    // X2
	-1,    // X3
	-1,    // X4
	-1,    // X5
	-1,    // X6
	-1,    // X7
	-1,    // X8
	-1,    // X9
	-1,    // Z1

      /* B3 female targets */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      	-1, 270, 220, 300, 270, 300, 180, 270, 280, 210,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      150, 180, 180, 170, 180, 120,-444, 200, 240, 200,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
      150, 160, 130, 140, 110, 200, 130, 120,  -1, 150,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      130, 250, 350, 550, 200, 120, 160, 150, 120, 300,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      270, 200, 200, 300, 300, 180, 150, 250, 170, 280,

      /* G   DX   TQ    Q   CH   JH  DF */
      150, 130, 130,  -1, 350, 350,	 130,
      150,   // TZ
      150,   // CZ
      -1,    // LY
      -1,    // RE
      -1,    // X1
      -1,    // X2
      -1,    // X3
      -1,    // X4
      -1,    // X5
      -1,    // X6
      -1,    // X7
      -1,    // X8
      -1,    // X9
      -1,    // Z1

      /* AV female targets */
      /* SI   IY   IH   EY   EH   AE   AA   AY   AW   AH */
      0,  66,  66,  66,  66,  65,  64,  64,  64,  64,

      /* AO   OW   OY   UH   UW   RR   YU   AX   IX   IR */
      64,  65,  65,  66,  66,  66,  66,  62,  63,  66,

      /* ER   AR   OR   UR    W    Y    R    L    H   RX */
      66,  64,  64,  66,  64,  64,  64,  64,   0,  64,

      /* LX    M    N   NG   EL   D$   EN    F    V   TH */
      	64,  60,  60,  60,  64,  50,  60,   0,  53,   0,

      /* DH    S    Z   SH   ZH    P    B    T    D    K */
      53,   0,  53,   0,  53,   0,   0,   0,   0,   0,

      /* G   DX   TQ    Q   CH   JH  DF */
      0,  34,   0,  50,   0,   0,	34,
      0,     // TZ
      0,     // CZ
      0,     // LY
      0,     // RE
      0,     // X1
      0,     // X2
      0,     // X3
      0,     // X4
      0,     // X5
      0,     // X6
      0,     // X7
      0,     // X8
      0,     // X9
      0 };   // Z1

short us_femdip[] = {
      0, 0,
      /* [IY]   2 f1,f2,f3 */
      350, 10,  340,-1,
      2750, 10, 2850,-1,
      3320, 10, 3375,-1,
      /* [IH]  14 f1,f2,f3 */
      560, 60,  670,-1,
      2350, 60, 2200,-1,
      3180, 60, 3150,-1,
      /* [EY]  26 f1,f2,f3 */
      590, 30,  470,170,  460,-1,
      2350, 30, 2600,170, 2600,-1,
      3200, 20, 3330,170, 3350,-1,
      /* [EH]  44 f1,f2,f3 */
      740, 90,  770,140,  770,-1,
      2350, 80, 2150,140, 2150,-1,
      3290, 90, 3330,140, 3330,-1,
      /* [AE]  62 f1,f2,f3,b1 */
       830, 50, 1020,190, 1020,-1,
       2130,110, 1900,190, 1900,-1,
       3100,110, 3150,190, 3150,-1,
       100, 50,  150,140,  150,-1, 

      /* [AA]  86 f1,f2,f3 */
      910, 40,  910,200,  910,-1,
      1450, 40, 1450,200, 1450,-1,
      2990, 40, 2990,200, 2990,-1,
      /* [AY] 104 f1,f2,f3,b1 */
      920, 40,  940,120,  730,220,  720,-1,
      1530, 90, 2400,200, 2400, -1,
      3100,150, 2980,200, 3300,240, 3300,-1,
      180,120,  100,220,  100, -1,
      /* [AW] 132 f1,f2,f3,b1 */ 
      850, 20, 1000,100,  680,-1,
      1750, 60, 1240,170, 1240,-1,
      3050, 70, 2900,200, 2900,-1,
      130, 30,  150,130,  100,-1,

      /* [AH] 156 f1,f2,f3 */
      830, 40,  830,100,  830,-1,
      1570, 40, 1650,100, 1650,-1,
      3060, 40, 3060,100, 3060,-1,
      /* [AO] 174 f1,f2,f3 */
      762,120,  742,220,  742,-1,
      1250,120, 1230,220, 1270,-1,
      2830, 40, 2715,200, 2754,-1,
      /* [OW] 192 f1,f2,f3 */
      720, 40,  530,170,  510,-1,
      1350, 40,  970,140,  960,-1,
      2960, 40, 2960,200, 2960,-1,
      /* [OY] 210 f1,f2,f3,b2 */
      590, 50,  740,145,  540,220,  520,-1,
      1090, 40, 1090,110, 2220,220, 2270,-1,
      3030,140, 2800,200, 2970,270, 2970,-1,
      100,100,  180,220,  180, -1,
      /* [UH] 240 f1,f2,f3 */
      600,50,  700,130,  700,-1,
      1350,50, 1350,130, 1350,-1,
      3050,50, 3050,130, 3050,-1,
      /* [UW] 258 f1,f2,f3 */
      430,40,  400,180,  400,-1,
      1370,40, 1160,180, 1120,-1,
      2800,40, 2700,180, 2700,-1,
      /* [RR] 276 f1,f2,f3 */
      570,30,  560,170,  560,-1,
      1580,30, 1600,170, 1600,-1,
      2120,30, 2080,170, 2080,-1,
      /* [AX] 294 f1,f2,f3 */
      720, 30, 750, 90, 750,-1,
      1780, 30,1780, 90,1780,-1,
      3060, 30,3060, 90,3060,-1,
      /* [IX] 312 f1,f2,f3 */
      530, 30, 530, 90, 530,-1,
      2470, 30,2440, 90,2440,-1,
      3200, 30,3200, 90,3200,-1,
      /* [IR] 330 f1,f2,f3 */
      360,100,  540,170,  540,-1,
      2700,100, 1800,170, 1740,-1,
      3200, 70, 2310,170, 2310,-1,
      /* [ER] 348 f2,f3 */
      700, 40,  630,230,  630,-1,
      2450,110, 1720,190, 1700,-1,
      3020,100, 2250,190, 2250,-1,
      /* [AR] 366 f1,f2,f3 */
      960,100,  700,180,  700,-1,
      1470,100, 1650,180, 1650,-1,
      2900, 90, 2200,180, 2200,-1,
      /* [OR] 384 f1,f2,f3 */
      640, 90,  600,180,  600,-1,
      1250,100, 1600,190, 1600,-1,
      2720, 90, 2150,190, 2150,-1,
      /* [UR] 402 f1,f2,f3 */
      420, 80,  520,170,  520,-1,
      1350, 80, 1550,170, 1550,-1,
      2660, 70, 2100,180, 2100,-1,
      /* [YU] 420 f1,f2,f3,b2,b3     */
      350, 70,  410,155,  410,-1,
      2550, 80, 1520,155, 1400,-1,
      3100, 75, 2800,130, 2800,-1,
      150, 80,  100,150,  100,-1,
      290, 70,  150,130,  130,-1
      };

	/* MALLINE is defined in PH and is the number of parameters *
 in a line of malleloc */
short us_femloc[] = {
      0,
      /* [F] front,back */
      350,65,30, 1, 87,40,2600,35,30,
      350,75,30, 1, 85,30,2000,65,40,
      /* [V] front,back */
      330,65,30, 1, 85,40,2600,35,40,
      330,75,30, 1, 84,30,2000,65,40,
      /* [TH] front,back */
      360,30,45,1300,40,70,3180,35,70,
      440,30,50,1800,42,70,3060,11,70,
      /* [DH] front,back */
      340,30,45,1300,35,60,3180,35,60,
      400,30,50,1800,42,70,3060,11,70,
      /* [S] front,back-unrounded,rounded */
      330,40,40,2000,30,50,2980, 0,70,
      390,40,40,1800,40,50,3070, 0,70,
      390,40,40,1900,15,60,2880, 0,65,
      /* [Z] front,back-unrounded,rounded */
      320,40,40,2000,30,50,2980, 0,70,
      320,35,40,1800,40,50,3070, 0,70,
      320,40,40,1900,15,60,2880, 0,65,
      /* [SH] front,back-unrounded,rounded */
      360,32,55,2000,30,70,2940,51,70,
      360,32,55,1850, 7,70,2700, 0,85,
      400,32,55,1840, 7,90,2700,20,110,
      /* [ZH] front,back-unrounded,rounded */
      320,26,55,2000,30,70,2940,51,70,
      320,26,55,1850, 7,70,2700, 0,85,
      320,30,55,1840, 7,90,2700,20,110,
      /* [P] front,back */
      440,55,20,1650,20,90,2690,55,35,
      440,45,25,1130,50,30,2530,48,40,

      /* [B] front,back */
      360,40,20,1350,60,25,2690,55,35,
      360,50,20,1130,50,30,2530,48,40,
      /* [T] front,back-unrounded,rounded */
      470,33,35,2150,60,35,3150,30,45,
      470,33,45,2050, 0,80,2990, 0,50,
      470,33,40,1900, 0,70,2900,20,70,
      /* [D] front,back-unrounded,rounded */
      370,33,35,2150,60,35,3150,30,45,
      370,33,45,2050, 0,80,2990, 0,50,
      370,33,40,1900, 0,80,2900,20,80,
      /* [K] front,back-unrounded,rounded */
      440,33,40,2750,60,50,3350,110,50,
      440,33,45,1900, 0,60,2500, 0,90,
      440,33,35,1800,62,65,2520,15,80,
      /* [G] front,back-unrounded,rounded */
      320,33,45,2750,60,50,3350,110,50,
      340,43,50,1900, 0,60,2500,0,90,
      370,45,40,1800,62,65,2520,15,80,
      /* [CH] front,back-unrounded,rounded */
      400,34,55,2100,25,70,3300,19,70,
      420,40,55,1900,10,70,3200,10,70,
      420,34,55,2050,10,90,3100,10,100,
      /* [JH] front,back-unrounded,rounded */
      370,32,55,2000,25,70,3300,19,70,
      380,40,55,1900,10,70,3200,10,70,
      380,32,55,2050,10,90,3100,10,100,
      /* [M] front,back */
      470,30,30,1380,10,35,2400,30,40,
      450,20,30,   1,88,40,1750,80,30,
      /* [N] front,back-unrounded,rounded 
      450,24,35,1500,75,35,3000,35,45,
      450,22,30,1900,25,75,3040, 0,60,
      450,24,30,1900,25,80,2890, 0,80,		*/

		/* [N] front,back-unrounded,rounded */
      250,24,35,3100,75,35,3300,35,45,
      250,22,30,2200,25,75,3240, 0,60,
      250,24,30,1160,25,80,2990, 0,80,

      /* [NG] front,back-unrounded,rounded */
      460,20,40,2860,40,60,3200,65,60,
      500,20,40,1970,20,70,2620,20,70,
      480,20,40,1650,42,70,2500,25,70,
      /* [DX] [FX] front,back-unrounded,rounded 
      370,33,35,1650,60,35,2350,50,45,
      370,33,45,1650, 30,80,2390,50,50,
      370,33,40,1600, 30,80,2300,50,100,			*/
      /* [DX] [FX] front,back-unrounded,rounded
		4/13/95 eab chnaged drastically it was way off*/
      370+50,33,35,2650,60,35,3050,50,45,
      370,33,45,1650+60, 40,35,2390,50,50,
      370,33,40,1600, 30,80,2700,50,100,			


      };

/*      250,43,35,1340+400,66+30,35,2090+300,60,45,
      250,43,50,1340,40,35,2090,61,50,
      250,43,40,1340,40,35+40,2090,62-20,100,*/

/*                A2   A3   A4   A5   A6   AB */
short us_femamp[] = {
      0,
      /* [F] */
      0,   0,   0,   0,  35,  52,  /* Use A6 = 35 to subtract  */
      0,   0,   0,   0,  35,  52,  /* a little energy at 5 kHz */
      0,   0,   0,   0,  33,  50,  /* from typical AB spectrum */
      0,   0,   0,   0,  33,  50,
      /* [V] */
      0,   0,   0,   0,  29,  46,  /* Use A6 = 35 to subtract  */
      0,   0,   0,   0,  29,  46,  /* a little energy at 5 kHz */
      0,   0,   0,   0,  27,  44,  /* from typical AB spectrum */
      0,   0,   0,   0,  27,  44,
      /* [TH] */
      0,   0,   0,   0,   0,  46,
      0,   0,   0,   0,   0,  46,
      0,   0,   0,   0,   0,  44,
      0,   0,   0,   0,   0,  44,
      /* [DH] */
      0,   0,   0,   0,   0,  40,
      0,   0,   0,   0,   0,  40,
      0,   0,   0,   0,   0,  38,
      0,   0,   0,   0,   0,  38,
      /* [S] */
      0,   0,   0,   0,  58-DEC_SZ,   0,
      0,   0,   0,   0,  58-DEC_SZ,   0,
      0,   0,   0,   0,  61-DEC_SZ,   0,
      0,   0,   0,   0,  61-DEC_SZ,   0,
      /* [Z] */
      0,   0,   0,   0,  52-DEC_SZ,   0,
      0,   0,   0,   0,  52-DEC_SZ,   0,
      0,   0,   0,   0,  55-DEC_SZ,   0,
      0,   0,   0,   0,  55-DEC_SZ,   0,
      /* [SH] */
      0,  46,  53,   0,  37,   0,
      0,  46,  53,   0,  37,   0,
      0,  46,  53,   0,  37,   0,
      0,  46,  53,   0,  37,   0,
      /* [ZH] */
      0,  40,  47,   0,  31,   0,
      0,  40,  47,   0,  31,   0,
      0,  40,  47,   0,  31,   0,
      0,  40,  47,   0,  31,   0,
      /* [P] */
      40,   0,   0,   0,  43,  60,  /* Use A6 = 43 to subtract  */
      0,   0,   0,   0,  43,  60,  /* a little energy at 5 kHz */
      0,   0,   0,   0,  43,  60,  /* from typical AB spectrum */
      0,   0,   0,   0,  43,  60,
      /* [B] */
      34,   0,   0,   0,  37,  54,  /* Use A6 = 37 to subtract  */
      0,   0,   0,   0,  37,  54,  /* a little energy at 5 kHz */
      0,   0,   0,   0,  37,  54,  /* from typical AB spectrum */
      0,   0,   0,   0,  37,  54,
      /* [T] */
      0,   0,   0,   0,  54,  60,  /* was 0, 68 */
      0,   0,   0,   0,  54,  60,
      0,   0,   0,   0,  54,  60,
      0,   0,   0,   0,  54,  60,
      /* OUT            39,  47,  54,   0,   0,   0,
       36,  44,  51,   0,   0,   0,  END OUT */
      /* [D] */
      0,   0,   0,   0,  49,  55,  /* was 0, 63 */
      0,   0,   0,   0,  49,  55,
      0,   0,   0,   0,  49,  55,
      0,   0,   0,   0,  49,  55,
      /* OUT            35,  43,  50,   0,   0,   0,
       32,  40,  47,   0,   0,   0,  END OUT */
      /* [K] */
      0,  44,  51,   0,  35,   0,
      45,   0,   0,   0,   0,   0,
      48,   0,  30,   0,   0,   0,
      48,   0,  30,   0,   0,   0,
      /* [G] */
      0,  40,   0,   0,   0,   0,
      41,   0,   0,   0,   0,   0,
      43,   0,  25,   0,   0,   0,
      43,   0,  25,   0,   0,   0,
      /* [CH] */
      0,  46,  53,   0,  37,   0,
      0,  46,  53,   0,  37,   0,
      0,  46,  49,   0,  34,   0,
      0,  46,  49,   0,  34,   0,
      /* [JH] */
      0,  42,  49,   0,  33,   0,
      0,  42,  49,   0,  33,   0,
      0,  42,  45,   0,  30,   0,
      0,  42,  45,   0,  30,   0,
      };
//#endif
/*    Phonetic features */

/*       Phonetic feature values allowed in place[]                     */

/* FLABIAL      0000001          p, b, m, f, v                          */
/* FDENTAL      0000002          th, dh, d$                             */
/* FPALATL      0000004          sh, zh, ch, jh                         */
/* FALVEL       0000010          t, d, n, en, s, z, tx (not l,r,dx)     */
/* FVELAR       0000020          k, g, nx                               */
/* FGLOTAL      0000040          q, tq (signals glottal stop)           */
/* F2BACKI      0000100          y, yu                                  */
/* F2BACKF      0000200          iy, y, ey (not ay,oy)                  */

short us_place[] = {
      0,              /* si */
      F2BACKF,        /* iy */
      0,              /* ih */
      F2BACKF,        /* ey */
      0,              /* eh */
      0,              /* ae */
      0,              /* aa */
      0,              /* ay */
      0,              /* aw */
      0,              /* ah */
      0,              /* ao */
      0,              /* ow */
      0,              /* oy */
      0,              /* uh */
      0,              /* uw */
      0,              /* rr */
      F2BACKI,        /* yu */
      0,              /* ax */
      0,              /* ix */
      0,              /* ir */
      0,              /* er */
      0,              /* ar */
      0,              /* or */
      0,              /* ur */
      0,              /* w  */
      F2BACKI+F2BACKF,/* y  */
      0,              /* r  */
      0,              /* l  */
      0,              /* hx */
      0,              /* rx */
      0,              /* lx */
      FLABIAL,        /* m  */
      FALVEL,         /* n  */
      FVELAR,         /* nx */
      0,              /* el */
      FDENTAL,        /* d$ */
      FALVEL,         /* en */
      FLABIAL,        /* f  */
      FLABIAL,        /* v  */
      FDENTAL,        /* th */
      FDENTAL,        /* dh */
      FALVEL,         /* s  */
      FALVEL,         /* z  */
      FPALATL,        /* sh */
      FPALATL,        /* zh */
      FLABIAL,        /* p  */
      FLABIAL,        /* b  */
      FALVEL,         /* t  */
      FALVEL,         /* d  */
      FVELAR,         /* k  */
      FVELAR,         /* g  */
      0,              /* dx */
      FALVEL+FGLOTTAL, /* tq */
      FGLOTTAL,        /* q  */
      FPALATL,        /* ch */
      FPALATL,        /* jh */
      0,        /* df */
      0x0004,        // TZ
      0x0020,        // CZ
      0x0000,        // LY
      0x0000,        // RE
      0x0000,        // X1
      0x0000,        // X2
      0x0000,        // X3
      0x0000,        // X4
      0x0000,        // X5
      0x0000,        // X6
      0x0000,        // X7
      0x0000,        // X8
      0x0000,        // X9
      0x0000 };      // Z1

/* The following features are officially defined in PHDEFS.H            */
/*      FSYLL   0000001  Syllabic: vowels + /el/, /em/, /en/            */
/*      FVOICD  0000002  Regular, except /tq/   is [+voicd]             */
/*      FVOWEL  0000004  Vowels                                         */
/*      FSON1   0000010  [+sonor], except not   /si/ and /h/            */
/*      FSONOR  0000020  [-obst], except /q/ is [-sonor, -obst]         */
/*      FOBST   0000040  Regular, except /q/ is [-obst]                 */
/*      FPLOSV  0000100  Plosives, excluding affricates                 */
/*      FNASAL  0000200  Nasals                                         */
/*      FCONSON 0000400  [-syll], except for /si/ and /q/               */
/*      FSONCON 0001000  Voiced liq. and glides: w, y, r, l, rx, lx     */
/*      FSON2   0002000  /w, y, r, l, yu/,  /m, n, ng, em, en/          */
/*      FBURST  0004000  Plosives and affricates                        */
/*      FSTMARK 0010000  Stress marks                                   */
/*      FSTOP   0020000  Plosives, affricates and nasals (abrupt onset) */

short us_featb[PHO_SYM_TOT] = {
      /* [SI] */      FSONOR,
      /* [IY] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [IH] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [EY] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [EH] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AE] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AA] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AY] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AW] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AH] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AO] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [OW] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [OY] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [UH] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [UW] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [RR] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [YU] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR+FSON2,
      /* [AX] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [IX] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [IR] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [ER] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [AR] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [OR] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [UR] */      FSYLL+FVOICD+FVOWEL+FSON1+FSONOR,
      /* [W ] */      FVOICD+FSON1+FSONOR+FCONSON+FSONCON+FSON2,
      /* [Y ] */      FVOICD+FSON1+FSONOR+FCONSON+FSONCON+FSON2,
      /* [R ] */      FVOICD+FSON1+FSONOR+FCONSON+FSONCON+FSON2,
      /* [L ] */      FVOICD+FSON1+FSONOR+FCONSON+FSONCON+FSON2,
      /* [H ] */      FSONOR+FCONSON,
      /* [RX] */      FVOICD+FSON1+FSONOR+FCONSON+FSONCON,
      /* [LX] */      FVOICD+FSON1+FSONOR+FCONSON+FSONCON,
      /* [M ] */      FSONOR+FSON1+FSON2+FCONSON+FNASAL+FVOICD+FSTOP,
      /* [N ] */      FSONOR+FSON1+FSON2+FCONSON+FNASAL+FVOICD+FSTOP,
      /* [NG] */      FSONOR+FSON1+FSON2+FCONSON+FNASAL+FVOICD+FSTOP,
      /* [EL] */      FVOICD+FSON1+FSONOR+FSYLL,
      /* [D$] */      FVOICD+FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [EN] */      FSONOR+FSON1+FSON2+FSYLL+FNASAL+FVOICD+FSTOP,
      /* [F ] */      FOBST+FCONSON,
      /* [V ] */      FVOICD+FOBST+FCONSON,
      /* [TH] */      FOBST+FCONSON,
      /* [DH] */      FVOICD+FOBST+FCONSON,
      /* [S ] */      FOBST+FCONSON,
      /* [Z ] */      FVOICD+FOBST+FCONSON,
      /* [SH] */      FOBST+FCONSON,
      /* [ZH] */      FVOICD+FOBST+FCONSON,
      /* [P ] */      FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [B ] */      FVOICD+FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [T ] */      FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [D ] */      FVOICD+FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [K ] */      FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [G ] */      FVOICD+FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [DX] */      FVOICD+FOBST+FCONSON+FSTOP,
      /* [TQ] */      FVOICD+FPLOSV+FBURST+FOBST+FCONSON+FSTOP,
      /* [Q ] */      FVOICD+FSTOP,
      /* [CH] */      FOBST+FBURST+FCONSON+FSTOP,
      /* [JH] */      FVOICD+FOBST+FBURST+FCONSON+FSTOP,
      /* [DF] */      FOBST+FCONSON+FSTOP,
      0x00000120,    // TZ
      0x00000120,    // CZ
      0x00000000,    // LY
      0x00000000,    // RE
      0x00000000,    // X1
      0x00000000,    // X2
      0x00000000,    // X3
      0x00000000,    // X4
      0x00000000,    // X5
      0x00000000,    // X6
      0x00000000,    // X7
      0x00000000,    // X8
      0x00000000,    // X9
      0x00000000,    // Z1

      /* place holders for null range ... */
      0,0,0,                         /* 57 ... 59 */
      0,0,0,0,0,0,0,0,0,0,            /* 60 ... 69 */
      0,0,0,0,0,0,0,0,0,0,            /* 70 ... 79 */
      0,0,0,0,0,0,0,0,0,0,            /* 80 ... 89 */
      0,0,0,0,0,0,0,0,0,0,            /* 90 ... 99 */

      /* [BLOCK_RULES] */  0,
      /* [S3] */                              FSTMARK,
      /* [S2] */                              FSTMARK,
      /* [S1] */                              FSTMARK,
      /* [SEMPH] */                   FSTMARK
      /* All others are zero  */
      };

/* Feature value bits for each boundary symbol in input */

#if 0
const short bounftab[] = {
      FSYBNEXT,               /* SBOUND       */
      FMBNEXT,                        /* MBOUND       */
      FMBNEXT,                        /* HYPHEN       */
      FWBNEXT,                        /* WBOUND       */
      FPPNEXT,                        /* PPSTART      */
      FVPNEXT,                        /* VPSTART      */
      FRELNEXT,               /* RELSTART     */
      FCBNEXT,                        /* COMMA        */
      FPERNEXT,               /* PERIOD       */
      FQUENEXT,               /* QUEST        */
      FEXCLNEXT               /* EXCLAIM      */
      };

const short getcosine[64] = {
      164,  163,  161,  158,  154,  148,  141,  132,
      123,  112,  100,   86,   72,   56,   38,   20,
      0,  -20,  -38,  -56,  -72,  -86, -100, -112,
      -123, -132, -141, -148, -154, -158, -161, -163,
      -164, -163, -161, -158, -154, -148, -141, -132,
      -123, -112, -100,  -86,  -72,  -56,  -38,  -20,
      0,   20,   38,   56,   72,   86,  100,  112,
      123,  132,  141,  148,  154,  158,  161,  163,
      };

/* Linearize the TILT variable */
/*  E.g. if you request 3 dB of tilt, must send 12 to chip to get 3 */

const char lineartilt[32] = {
      0,  6,  8, 12, 15, 17, 19, 21, 23, 25,
      26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
      35, 36, 36, 37, 37, 38, 38, 39, 39, 39,
      40, 40
      };
#endif

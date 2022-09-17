/* 			  
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All reights reserved.
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
 *    File Name:    p_sp_rom.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK  	 09/01/84	    Initial creation
 * 0002 DGC 	 12/27/84   	Added some "" things for the 80186, as
 *                      		these tables must go into the ROM.
 * 0003 DK  	 02/11/85	    Backed off amplitudes of nasals a bit, voice [bdg]
 *                       		replaced [EM] by [D$] (dentalized d)
 * 0004 DK  	 03/01/85	    Improve place[] array, free up two featb[] feature bits
 * 0005 MM 		 04/02/1985    	Mashed for Spanish
 * 0006 MM 		 06/13/1985    	Hacked out diphtongs
 * 0007 MM 		 08/18/1985    	First hacks after Quilis' evaluation.
 * 0008 MM 		 03/26/1986	    Dennis' changes
 * 0008 EB 		 03/31/1986     Changed value for e_t locus
 * 0009 eb		 03/31/1986     Put vowel dur -20ms to elimate +20ms change feb 12,86
 *                      		and increased e_t dur by 18ms from 100 to 118
 * 0010 eb 		 03/31/1986     put in amps for f2 in e_t
 *                      		and moved e_t f2 and f3 targets
 * 0011 eb		04/04/1986      Increase the third formant on the t's, it's too low
 * 0012 eb 		04/05/1986	    Third form locus of t wrong-changed it!
 * 0013 MM 		04/09/1986	    Merged Ed's changes into 26-Mar-86
 * 0014 MM  	04/10/1986  	Added FVBAR to mark [b d g bh dh gh], minor edits
 *                      		to [b] burst amplitudes.  Remeasured [b, d]
 * 0015 		04/11/1986      Remeasured [g bh dh gh] boundary values.
 * 0016 		04/14/1986      Remeasured rest of boundary values.
 * 0017 		15-Apr-86       Started remeasurment of parallel amp's.
 * 0018 MM		04/06/1986	    Continued parallel amp's, started [bh, dh, gh]
 * 0019 MM 		04/17/1986    	Removed locus tables, inserted boundary tables.
 * 0020 MM 		04/22/1986	    Removed female tables (phvset -> male tables)
 * 0021 MM  	04/22/1986   	Backed off some recent boundary value changes because
 *                      		the change to vowel targets made them unnecessary.
 * 0022 MM 		04/23/1986	    More parallel amp. work for fricitives.
 * 0023 MM 		04/28/1986	    Marked [i] and [ix] as F2BACKI | F2BACKF
 * 0024 MM 		05/05/1986	    [y] now a fricitive, [yh] now an affricate
 * 0027 MM 		07/12/1986    	Merged with 68000 sources
 * 0028 CJL		02/22/1995    	Merged wit Ed B sources. Many table value changes.
 * 0029 EAB		11/20/1995	    Tuned with cowel strength differences taken into account
 *                              a-o 1 ie-2 u-3
 * 0030	MGS		06/06/1996		Changed file name from sphrom.c p_sp_rom.c
 * 0031 MGS		06/06/1996		kill includes since this file is now included elsewhere
 * 0032 SIK		07/08/1996  	Cleaning up and maintenance
 * 0033 GL		11/13/1996		pick up Ed Bruckert's change
 * 0034 EDB 	12/10/1996		Many changes...
 * 0035 EDB		01/10/1997		Fix many data.
 * 0036 EAB		05/08/1997		Fix female intervocalic RR by changing the AV value 
 *								fixes BATS 371
 * 0037 EAB		05/12/97		E_R needs help will improve it more later this helps volume balance 
 *								between languages. Reference BATS 368
 */

/* Arrays used by the phonetic component                  */


/* 
 * Inherent durations in milliseconds.
 */

short inhdr[TOT_ALLOPHONES] =
{
	  /* 
	   * Increased vowel durations 20 msec.                           12-Feb-86
	   * Took out +20 msec. increase                                  31-Mar-86
	   * increased T dur from 100 to 118
	   * decreased yh dur from 130 to 55 msec.                        23-Apr-86
	   * E_R duration 25->75 (guesstimate)                            28-Apr-86
	   * [bh, dh, gh] dur's (40,50,35)->(60,70,35) (guesstimate)      28-Apr-86
	   * [dh] 70->50                                                  14-May-86
	   * [bh] 60->50                                                  14-May-86
	   * [wx] 80->45                                                  22-May-86
	   * [bh, dh, gh] (50,50,55)->(70,70,75) (after new dur rules)    27-May-86
	   * [rr] 110->140 (guesstimate)                                   8-Jul-86
	   *
	   * Are the voiceless stops [p, t, k] too long?  I added a rule  23-Jul-86
	   * to phtiming to shorten them to 70% after sonorants in
	   * in unstressed syllables.  It might be better to remeasure
	   * the durations themselves.
	   *
	   * Shorten vowels by 10msec.                            DK      24-Jul-86
	   */
	  /* SIL   E_A   E_E   E_I	E_O   E_U  E_WX  E_YX               */
		300,	130, 130, 120,	120, 115,	45, 70,

	  /* E_RR   E_L		   E_LL    E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
		140,   120 - 45, 110 - 40, 75,   75, 90, 120, 125, 110, 120,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	50, 50, 55, 100, 100, 90, 100, 80, 110, 100,

	 /* E_CH   E_Y   E_R   E_Q                                       */
		150,   75,    45,  20,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	75, 65, 100, 125, 40, 90, 120,
#endif

#ifdef E_V
	  /* E_Z   E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	75, 65, 100, 70, 40, 90, 120
#endif

};

/* 
 * Minimum durations in msec.
 *
 * Severly cut back (change in timing algorithm).
 * eb.--changed e_nh from 40 to 45 1/27/85
 * Cut back vowel minimum durations (by 50%) to get
 * more vowel compressibility (trial)                           18-Apr-86
 * decreased yh minimum.                                        23-Apr-86
 * E_R 25->50 (guesstimate)                                     28-Apr-86
 * [wx] 40->30                                                  22-May-86
 *
 * Lengthen vowel mindurs 10 msec                       DK      24-Jul-86
 */

short  mindur[TOT_ALLOPHONES] =
{
	  /* eab e_i from 60 t0 80 seis not working */
	  /* SIL   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	300, 60, 55, 80, 55, 60, 30, 30,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
	70, 40 + 10, 50, 50, 50, 45, 60, 60, 60, 60,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	30, 35, 30, 60, 80, 80, 80, 70, 90, 90,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		140, 35, 40, 20,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	60, 30, 60, 60, 40, 60, 60,
#endif

#ifdef E_V
	  /* E_Z   E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	60, 30, 60, 60, 40, 60, 60
#endif

};

/* 
 * Male targets for F1, F2, F3, B1, B2, B3, AV.
 *
 * The segments with an entry -1 do not have an assigned inherent value.
 * other negative values are pointers in the diphthong array phodp[].
 *
 * Targets for E_R and E_RR roughly hacked by DHK 21-May-85
 * Lots of hacking (guesswork) by MM after Quilis' evaluation 18-Oct-85
 */

short maltar[TOT_ALLOPHONES * 7] =
{
	  /* 
	   * F1 Table.
	   *
	   * [l] F1 changed from 340 to 280                               12-Apr-1986
	   * [bh dh gh] targets redone:                                   14-Apr-86
	   *     [bh] 360->180
	   *     [dh] 185->180
	   *     [gh] 210->180
	   * bh   F1 back to 360, also shortened trandur considerably     16-Apr-86
	   * gh   F1 back to 210, also shortened trandur considerably     16-Apr-86
	   * m    F1 245->195                                             23-Apr-86
	   * yx   F1  250->300    to match [i]                            15-May-86
	   * bh   F1 360->220 (bubu indistinct)                           16-May-86
	   * rr   F1 350->560->480                                         9-Jul-86
	   * r    F1 350->480                                              9-Jul-86
	   * Raise f1 for bh,dh,gh so it doesn't sound so much like a stop.
	   * bh   220->300                                        DK      24-Jul-86
	   * dh   180->300                                        DK      24-Jul-86
	   * gh   220->300                                        DK      24-Jul-86
	   *
	   * ll   195->280 make it sound less stop-like           DK      24-Jul-86
	   *              (fifi still sounds like thithi)
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX   E_YX               */
		-1,		-2,	 -20,	 -38, -56,	 -74, 295,  320,

	  /* E_RR   E_L		E_LL		E_M		E_N  E_NH   E_F   E_S   E_J  E_TH   */
			
		480, 280+60, 280 + 50, 210 , 235 , 215 , 225, 290, 185, 275 + 175,

	  /* E_BH  E_DH  E_GH  E_YH   E_P       E_B   E_T   E_D   E_K   E_G   */
		300, 238, 300, 250, 350 - 100, 210, 350, 238, 350, 210 + 220,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		475,    250,  480, -1,
	  /* F1 of R changed from 480        */

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	240, 295, 400, 300, 500, 400, 300,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
		240,	295, 400,	220,	 500, 400, 300,
#endif

	  /* 
	   * F2 Table.
	   * All "dental" phonemes were changed 18-Oct-85
	   * Nasals changed 21-Nov-85
	   * 1/27/85 Nh appears to be more toward boundary value than N value
	   * i changed it from 2450 to 2200--eb
	   * Nh changed from 1800 to 1315 (4-Feb-86, MM)
	   * G and GH changed from 1790 to 2400 (18-Feb-86, MM, EB)
	   *
	   * [bh] 1000->1000                                              16-Apr-86
	   * [m]  1235->1016                                              23-Apr-86
	   * [ix] 2350->2550 (to improve ~ni~ni)                           7-May-86
	   * y    1900->2200                                              13-May-86
	   * th    940->2040                                              12-May-86
	   * dh   1800-> (increase coarticulation)                        14-May-86
	   * yx   1900-> 2433 (to match [i])                              15-May-86
	   * f    2170-> 2000 (i change)                                  24-Jul-86
	   * yx   2433-> 2315 (to match [i])                              24-Jul-86
	   *
	   * f    2000->800 (going back to a very old value)              24-Jul-86
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	      -1, -8, -26, -44, -62, -80, 610, 2315,

	  /* E_RR   E_L     E_LL   E_M   E_N		 E_NH	E_F   E_S   E_J  E_TH  */
		1250, 1150 ,	2200,  1476, 1250, 1800 + 100, 800, 1400,	 1600, 2040,

	  /* E_BH  E_DH       E_GH     E_YH   E_P					E_B		E_T		E_D		 E_K	 E_G   */
		1000, 	1237,	 1500,     1760, 1600 + 163 /* eab */ , 1235, 1802, 1600 - 105, 1790, 2400 - 400,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	      1800, 2200, 1330, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	1420, 610, 1500, 1650, 2550 - 300, 1400, 1500,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                     */
	1420, 610, 1500, 1150, 2550 - 300, 1400, 1500,
#endif

	  /* 
	   * F3 Table.
	   * Changed NH from 3150 to 1465 (4-Feb-86, MM)
	   * Changed G, GH from 2400 to 2600, 18-Feb, MM)
	   * [m]  2140->2227                                              23-Apr-86
	   * [bh] 2335->2400                                              28-Apr-86
	   * [y]  3000->3050                                              13-May-86
	   * [yx] 3000->2900 (to match [i])                               15-May-86
	   * [rr] 2445->2550                                               8-Jul-86
	   * [r]  2470->2550                                               8-Jul-86
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	-1, -14, -32, -50, -68, -86, 2250, 2900,

	  /* E_RR       E_L     E_LL   E_M    E_N          E_NH			E_F		  E_S   E_J		 E_TH   */
		1711,	 2540 - 50, 2815,	2227, 2500, 2300 + 330, 2915 - 400, 1995, 2400, 2120 + 660,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G */
	2400, 2400, 2350, 3000, 2316 + 200, 2150, 2488, 2500 - 254, 2400, 2600 - 210,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		2700, 3050, 2143, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	2600, 2250, 2400, 2550, 3050 - 200, 2500, 2500,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX  E_V   E_IX  E_MX  E_PH                     */
	2600, 2250, 2400, 2080, 3050 - 200, 2500, 2500,
#endif

	  /* 
	   * B1 Table.
	   * [bh dh gh] targets redone:                                   14-Apr-86
	   *     [bh] 130->90
	   *     [dh] 120->60
	   *     [gh]  90->90
	   * [ix] 80->60 (to match [i])                                   15-May-86
	   * [u] 60->80 to lower spectral peak                            16-May-86
	   * [rr] 120->200                                                 7-Jul-86
	   * [r]  100->200                                                 7-Jul-86
	   *      Bandwidth changes for [r] and [rr] are to rebalance the
	   *      spectrum so there is a peak at F2.  The tilt was increased
	   *      (in phsettar.c) for the same reason.
	   */
	  /* E_SI   E_A  E_E   E_I	   E_O   E_U  E_WX  E_YX               */
		  250, 120,  80,  65 + 20, 90,	 80 - 5, 50, 80,

	  /* E_RR  E_L         E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
		200, 60 + 20 + 10, 60,    90,   90,  100 + 5, 300, 300, 300, 300,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	90, 60, 90 + 50, 125, 300, 90, 300, 90, 200, 90,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	250, 80, 200, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	140, 50, 90, 300, 120, 90, 300,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	140, 50, 90, 140, 120, 90, 300,
#endif

	  /* 
	   * B2 Table.
	   * Decreased nh bandwidth slightly form 350 to 325-1/27/85--eb
	   * Set [bh dh gh] bandwidths to match [b d g]                   14-Apr-86
	   *     [bh] 120->80
	   *     [dh] 130->80
	   *     [gh] 120->120
	   * [yx] 120->170 (to match [i])                                 15-May-86
	   * [bh] 120->160 (bibi sounds like [biwi])                      15-May-86
	   * [bh] 160->150 (bubu indistinct)                              16-May-86
	   * [r, rr] 150->60                                               7-Jul-86
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	250, 100, 170, 170 - 70, 90, 80 - 10, 80, 170,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
		125, 150 - 90 + 10, 300, 250, 350, 325 + 100, 150, 150, 150, 150,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	160, 130, 120, 175, 150, 80, 150, 80, 160, 120,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	250, 120, 60, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	100, 80, 250, 100, 170, 250, 150,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	100, 80, 250, 120, 170, 250, 150,
#endif

	  /* 
	   * B3 Table.
	   * [bh dh gh] bandwidths set to [b d g]                         14-Apr-86
	   *     [bh] 120->130
	   *     [dh] 120->240
	   *     [gh] 180->180
	   * [bh] 130->90         trying to raise formant peak            16-Apr-86
	   * [yx] 200->240 (to match [i])                                 15-May-86
	   * [bh] 90->130 (else bibi sounds like [biwi])                  15-May-86
	   * [r, rr] 250->130                                              7-Jul-86
	   */
	  /* E_SI   E_A   E_E   E_I       E_O       E_U    E_WX  E_YX               */
		250,	170,  240, 240 + 20, 130 + 40,	130,	80, 240,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
		130, 100 + 20, 400, 220, 250 + 50, 350 + 100, 150, 150, 150, 150,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
		 130, 240, 180, 175, 180, 130, 250, 240, 280, 180,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		250,	200, 130, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	300, 80, 150, 300, 240 + 20, 150, 150,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                     */
	300, 80, 150, 120, 240, 150, 150,
#endif

	  /* 
	   * AV Table.    Sonorant amplitude changed from 64 to prevent overload.
	   * R and RR amplitude changed from 48 to 61, 4-Feb-86
	   * [bh dh gh] redone:                                           14-Apr-86
	   *     [bh] 30->60
	   *     [dh] 30->60
	   *     [gh] 30->60
	   * [bh] 60->62                                                  16-Apr-86
	   * [gh] 60->62                                                  17-Apr-86
	   * [o]  62->60 to prevent overload                              30-Apr-86
	   * [u]  62->60 to prevent overload                              30-Apr-86
	   * [yh] 46->0                                                    7-May-86
	   * [bh] 62->54 (prevent bibi -> [biwi])                         15-May-86
	   * [r, rr] 61->63                                                7-Jul-86
	   */
	  /* E_SI    E_A     E_E        E_I      E_O   E_U  E_WX  E_YX */
		0,		62 - 5, 62 - 7,		60 , 60 - 7, 62 -3, 62-2, 62-5,

	  /* E_RR   E_L  E_LL   E_M      E_N   E_NH   E_F   E_S   E_J  E_TH   */
		 63-20,	58,	  59,	62-8,	  62-1,   62-1,    0,    0,    0,    0,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B	 E_T   E_D   E_K   E_G   */
	  54 -40,  50,   60,	0,    0,   20,    0,	30,     0, 30 + 5,

	  /* E_CH   E_Y   E_R   E_Q          Voicebar for B,D,G           */
			0, 58, 63-5, 0,					   /* set by rules in phsettar.c   */

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	56, 62, 60, 0, 62, 60, 0,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                     */
	56, 62, 60, 56, 62 - 10, 60, 0,
#endif

};

/* 
 * Tilt for [bh, dh, gh]
 * [dh] 24->30 (after adding parallel amp stuff)                14-May-86
 * [bh] 20->34 (after adding parallel amp stuff)                14-May-86
 */

short                   bdgtilt[] =
{
	  /* E_BH    E_DH    E_GH                                            */
	20 + 16, 24, 24
};

/* Incremental changes to F0 caused by segmental influences */

short f0segtars[TOT_ALLOPHONES] =
{
	  /* E_SI   E_A   E_E   E_I   E_O   E_U E_WX  E_YX               */
		30,		0,	 70,	100, 30,   60, -50 , -50,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -50 , -50 , 300 , 300, 300, 300 ,

	  /* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T   E_D   E_K   E_G  */
		-50,	-50, -50,	-50, 300 , -50, 300, -50, 300 , -50,

	  /* E_CH   E_Y   E_R   E_Q                                      */
		  300 , -50, -50, 0,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	-50, -50, -50, 300 - 150, 0, -50, 300 - 150,
#endif

#ifdef E_V
	  /* E_Z   E_W  E_NX  E_V   E_IX  E_MX  E_PH                     */
	-50, -50, -50, -50, 0, -50, 300 - 150
#endif

};

/* 
 * Burst durations in msec.
 * Duration of [ch] is set by rule.
 * [k,g] 13->21 (suggestion from Dr. Quilis)                     5-May-86
 *
 * Revised 22-Jul-86:
 * [p b]  7 -> 13
 * [t d] 13 -> 25
 * [k g] 21 -> 30
 *
 * p    7->13                                           DK      24-Jul-86
 * d    25->20
 * g    30->20
 */
short burdr[TOT_ALLOPHONES] =
{

	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX              */
	0, 0, 0, 0, 0, 0, 0, 0,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH  */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,

	  /* E_BH    E_DH   E_GH    E_YH   E_P   E_B   E_T   E_D   E_K   E_G  */
	0, 10, 10 - 10, 26, 12 + 7, 7, 25 - 5, 20 - 5, 30, 20,

	  /* E_CH   E_Y   E_R   E_Q                                      */
	75, 0, 0, 0,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                   */
	0, 0, 0, 0, 0, 0, 0,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                    */
	0, 0, 0, 0, 0, 0, 0
#endif

};

/* begfro=1, begbac=2, begrou=3, null=4, begrow/attenuated=5 */
/* 
 * In PHSETTAR.C, the following were defined:
 *      FRONT_VOWEL             1       E_I, E_E
 *      BACK_UNROUNDED_VOWEL    2       E_A
 *      BACK_ROUNDED_VOWEL      3       E_O, E_U
 *      OBSTRUENT               4
 *      ROUNDED_SONOR_CONS      5
 *
 * Note: Spanish doesn't have "rounded" vowels -- this causes
 * "labialization" of Plosive-Vowel transitions.
 * Spanish vowels are organized as noted above.
 *
 * The value is not necesarily identical to FOBST in featb[].
 * Obstruents are treated as unrounded sonorant consonants for the
 * amplitude target tables.  See comments at malbound[] for the
 * interaction among the various ways in which obstruents are specified.
 *
 * Rounded sonorant consonants [r rr l ll] have vowel-like transitions.
 * Made [y] a true-blue obstruent                               12-May-86
 * Made [r] and [rr] obstruents                                 10-Jul-86
 */

short begtyp[TOT_ALLOPHONES] =
{

	  /* E_SI  E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
		4,		2,		1, 1,	 3, 3, 3, 1,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH  */
	4, 5, 4, 4, 4, 4, 4, 4, 4, 4,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G  */
	4, 4, 4, 4, 4, 4, 4, 4, 4, 4,

	  /* E_CH   E_Y   E_R   E_Q                                      */
	4, 4, 4, 4,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	4, 4, 4, 4, 1, 4, 4,
#endif

#ifdef E_V
	  /* E_Z   E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	4, 4, 4, 4, 1, 4, 4
#endif

};

short endtyp[TOT_ALLOPHONES] =
{

	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX              */
	4, 2, 1, 1, 3, 3, 2, 1,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH  */
	4, 5, 5, 4, 4, 4, 4, 4, 4, 4,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G  */
	4, 4, 4, 4, 4, 4, 4, 4, 4, 4,

	  /* E_CH   E_Y   E_R   E_Q                                      */
	4, 4, 4, 4,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	4, 4, 4, 4, 1, 4, 4,
#endif

#ifdef E_V
	  /* E_Z   E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	4, 4, 4, 4, 1, 4, 4
#endif

};

/* 
 * Size of some arrays in PHROM (for compile-time tests)
 * ESIZPHDP     size of maldip[],  femdip[]
 */
#define ESIZPHDP        (( 5*18)+2)	   /* 18 entries per diphtong      */

/* Diphthongization specifications for all vowels. *      first number is initial steady state *      second number is duration in ms of initial
 * steady state *      (assuming total duration of vowel is equal to inherent dur) *      third number is value at end of time given by fourth number
 * *      next-to-last number is value at end of diphthong *      last value is minus 1 to signal end of diphthong * * Warning: code in phsettar.c
 * "knows" that all vowels have * entries in this table. */

short maldip[ESIZPHDP] =
{
	0, 0,
	  /* 
	   * E_A
	   743,  30, 743,  60, 743, -1,    730->700       16-Apr-86
	   1436,  30,1436,  60,1436, -1,
	   2352,  30,2352,  60,2352, -1,  */

	 650, 30,  650, 60,  650, -1,	   /* 730->700            */
	1383, 30, 1383, 60, 1383, -1,
	2367, 30, 2367, 60, 2367, -1,	

	  /* 
	   * E_E
	   */

	480, 30, 480, 60, 480, -1,
	1801 - 50, 30, 1901 - 50, 60, 1901 - 50, -1,	/* new eab */
	2501 - 300, 30, 2501 - 300, 60, 2501 - 300, -1,		/* 2680->2550   16-Apr-86       */

	  /* 
	   * E_I
	   */

	  /* 
	   * Change 24-Jul-86 per suggestion from Dennis.  Old values were:
	   *       250+50,  30, 250,  60, 250, -1,
	   *      2315+85,  15,2433,  75,2315, -1,
	   *      2900,  30,3000,  60,3000, -1,
	   * Note: if F2 gets too high, it might cause an internal overload
	   * in the synthesizer.*/

	342, 30, 342, 60, 342, -1,
	2200, 30, 2200, 75, 2200, -1,
	2700, 30, 2750, 75, 2800, -1,

	  /* 
	   * E_O
	   */
	 511, 30, 511 , 60, 611, -1,
	 995, 30, 995, 60, 995, -1,
	2411 , 30, 2411 , 60, 2411 , -1,		

	  

	  /* 
	   * E_U
	   */

	320 - 20, 30, 320 - 20, 60, 320 - 20, -1,
	740 , 30, 740 , 60, 740 , -1,
	2400 , 30, 2400 , 60, 2400 , -1
};

/* 
 * This table contains the boundary value and transition duration
 * for all consonants in all vowel contexts.  (Consonant-consonant
 * transitions are computed by defining an "equivalent" vowel for
 * the adjacent segment.)  Boundary values are in Hz, and transition
 * durations are in Msec.  The table is addressed using the index
 * vector pbound[phoneme] -- a non-zero entry indicates an entry
 * in this table.
 *
 * Entries are organized as follows:
 *      F1 bval, F1 tdur, F2 bval, F2 tdur, F3 bval, F3 tdur    A
 *      ... same for E, I, O, U ...
 *
 * In order for the values in this table to be used, the following
 * must be true:
 *  1.  There must be an entry in pbvalue[] (below).
 *  2.  The begtyp/endtyp values must be 4 (obstruent)
 * Note: all +FOBST phonemes (should) have entries in this table.
 */

/* 
 * Define the size of each table entry:
 *      2 entries per formant (boundary and duration)
 *      3 formants
 *      5 vowels
 */
#define BOUND_SIZE      (2 * 3 * 5)
/* 
 * NOTE: when the female table is done, change phvset.c.
 * All changed values were backed off 22-Apr-86 because
 * of the new vowel target coarticulation code in phsettar.c
 */
short malbound[] =
{
	0,								   /* Placeholder for non-entries  */
	  /* 
	   */

		/* JAH - 5/94 Change all boundaries    */
			/* not bv realy as E_M appears to take on bv as formant value for itself */

	247, 30, 924, 20, 2213, 40,	/* A    */
	243, 30, 1497 - 500, 20, 2450, 40 - 15,	/* E    */
	234, 30, 1445 - 400, 20, 2450, 35,	/* I    */
	234, 30, 907 , 20, 2220, 25,		/* O    */
	240, 30, 990, 20, 2220, 25,	/* U    */

	  /* 
	   *  E_N
	   *
	   * [ne] extra formant @ 900 Hz
	   * [ni] extra formant @ 900 Hz
	   * Check F2 carefully
	   * [ni] F2 1445->2452                                           29-Apr-86
	   * [no] F2 1758->1400                                           29-Apr-86
	   * [nu] F2 1494->1100, F3 2852->2200                            29-Apr-86
	   * [ni] F2 2452->2300, trandur 30->40                           30-Apr-86
	   */
	195, 40, 1460,50, 2832, 40,	   /* A    */
	214, 40, 1414 ,50, 2786 - 600, 30,	/* E    */
	208, 40, 1400, 50, 2832, 30,	   /* I    */
	204, 40, 1100 ,50, 2823 - 300, 40,	/* O    */
	204, 40, 1100, 50, 2200 + 300, 40, /* U    */
	  /* 
	   * E_NH
	   * [nh] extra formant @ 900 Hz
	   *
	   * Note that [nh] is generated by inserting an [ix] phoneme:
	   */

	/* 244,  20, 2385,  50, 2999,  40,    /* A 208,  20, 2246,  20, 3131,  20,    /* E 182,  20, 2324,  10+30, 3212-200,  10+30,    /* I 182,  20,
	 * 2326,  20, 3116,  20,    /* O 180,  20, 2315,  20, 3086,  20,    /* U */

	244, 30, 1723, 30 + 30, 2665, 40,  /* A */
	208, 30, 2346 - 600, 30 + 30, 2746, 30,		/* E */
	182, 30, 2624 - 600, 30 + 30, 2724, 30,		/* I */
	182, 30, 2245 - 600, 30 + 30, 2726, 30,		/* O */
	180, 30, 2310 - 600, 30 + 30, 2315, 30,		/* U    */

	  /* 
	   * E_F
	   *
	   * [fa] F3 2148->2250                                           14-Apr-86
	   * [fe] F3 2400->2450                                           14-Apr-86
	   * [fa] F1 573->625, F2 1347->1221, F3 2250->2044               22-Apr-86
	   * [fe] F3 2450->2400                                           22-Apr-86
	   * [fi] F2 2383->2000                                           28-Apr-86
	   * [fe] F2 1836->1550                                           28-Apr-86
	   * [fi] F2 2000->2223                                           30-Apr-86
	   * trandur (all == 50) set to 30 (front), 40 (F3 back/round)    30-Apr-86
	   * [fi] F2 2223->2000, trandur 30->50 (try, try, again)          1-May-86
	   * [fe] F2 trandur 30->40                                        1-May-86
	   * [fi] F2 trandur 50->20 (so f doesn't sound like h)            7-May-86
	   * [fi] F2 trandur 40->30 (so f doesn't sound like h)            7-May-86
	   * [fi] F2 2000->1700 (So fi doesn't sound like thi)             8-May-86
	   * Note: the f F2 transition must curve sharply downwards
	   * [fi] F2 1700->2380, F3 trandur 30->20                        13-May-86
	   * [fe] F2 1550->1750                                   DK      24-Jul-86
	   * [fi] F2 2380->2080   ([i] target changed)            DK      24-Jul-86
	   * [fi] F2 trandur 20->30                               DK      24-Jul-86
	   */
	625, 30, 1221, 30, 2044, 40,	   /* A    */
	449, 30, 1750, 40, 2400, 30,	   /* E    */
	300, 30, 1700, 30, 2443, 20,	   /* I    */
	517, 30, 908, 30, 2213, 40,		   /* O    */
	352, 30, 824, 30, 2148, 40,		   /* U    */
	  /* 
	   * E_S
	   * [sa]        F1 580->605, F2 1777->1512, F3 2591->2610       23-Apr-86
	   */
	605, 60, 1271, 60, 2610, 60,			   /* A    */
	449, 60, 1923 - 200, 60, 2669 - 200, 60,   /* E    */
	300, 60, 2288 - 400, 60, 2793 - 300, 60,   /* I    */
	478, 60, 1073, 60, 2636 - 200, 60, /* O    */
	326, 60, 1250, 60, 2532, 60,	   /* U    */

	  /* 
	   * E_J
	   * Note: the targets for [a] seem to shift after [j] to 750, 1280, 2157
	   * Check [ji] F3
	   * [je]         F1 497->577, F2 1868->2070, F3 2525->2597
	   * [je] F2: 2070->2200                                           1-May-86
	   * [ji] F2: 2539->2250 (trial) change in [i] target             24-Jul-86
	   */

		/* JAH [je] F1: 577 -> 500, F2: 2200 -> 1750, F3: 2297 */
		/* JAH [jo] F1: 577 -> 452, F3: 2376 -> 2676 */


	750, 70, 1347, 70, 2139, 70,	   /* A    */
	577 - 77, 70, 2200 - 450, 70, 2597 - 300, 70,	/* E    */
	339, 70, 2250, 70, 2843, 70,	   /* I    */
	577 - 125, 70, 829, 70, 2376 + 300, 70,		/* O    */
	404, 70, 750, 70, 2400, 70,		   /* U    */
	  /* 
	   * E_TH
	   *
	   * [tha] F1 616->605, F2 1419->1454, F3 2491->2509              17-Apr-86
	   * [tha] backed out above change                                22-Apr-86
	   * [thu] F1 475->361, F2 1484->1172, F3 2871->2603              23-Apr-86
	   * [thi] 273,50,2196,50,2675,50->298,40,2196,40,2675,40 DK?     24-Jul-86 ??
	   * (not sure if this was done by Dennis, Ed, or Martin)
	   */

	416, 50, 1419, 50, 2491, 50,	   /* A    */
	449, 50, 1705, 50, 2578, 50,	   /* E    */
	398, 40, 1196, 40, 2375, 40,	   /* I    */
	517, 50, 1224, 50, 2480, 50,	   /* O    */
	361, 50, 1172, 50, 2603, 50,	   /* U    */

	  /* 
	   * E_BH
	   *
	   * All durations changed to 20 msec.                            16-Apr-86
	   * All durations changed back to original "locus" dur's         29-Apr-86
	   * Note: the transition duration is much longer than the phoneme.
	   * this means that the F2 frequency won't actually reach the
	   * target before ramping to the next phoneme.
	   * [ba] 40,65,50->40,30,30                                      15-May-86
	   * [be] 40,60,45->40,30,30                                      15-May-86
	   * [bi] 40,80,45->40,30,30 (to prevent bibi>biwi)               15-May-86
	   * [bo] 40,65,50->40,30,30                                      15-May-86
	   * [bu] 40,65,50->40,30,30                                      15-May-86
	   *
	   * [bi] F1 264->300                                     DK      24-Jul-86
	   */
	311, 20, 1133, 30, 2181, 30,	   /* A    */
	382, 20, 1660, 30, 2357, 30,	   /* E    */
	300, 20, 1905, 30, 2448, 30,	   /* I    */
	397, 20, 825 + 275, 30, 2296, 30,  /* O    */
	303, 20, 761 + 320, 30, 2188, 30,  /* U    */
	  /* 
	   * E_DH
	   *
	   * [da] F2 1273->1350                                           16-Apr-86
	   * [di] F2 1956->2050                                           14-Apr-86
	   * [de] F3 should be raised.  Problem might be in [e]           16-Apr-86
	   * All durations changed to 25 msec.                            16-Apr-86
	   * Backed out above changes                                     22-Apr-86
	   * Changed durations back to locus table entries                29-Apr-86
	   * [da] F2 1273->1350 (specto looks wrong)                       5-May-86
	   *
	   * [di] F1 208->300                                     DK      24-Jul-86
	   */
	404, 40, 1350 + 250, 55 - 20, 2500 + 100, 10 + 40,	/* A    */
	378, 35, 1469, 35 + 20, 2345, 50,		/* E    */
	300, 35+15, 1956, 35 + 35, 2422 , 20 + 50,		/* I    */
	432, 40, 898+300, 55, 2430, 50,	/* O    */
	313 + 50, 40, 924 + 400, 55, 2392 + 250, 50,	/* U    */

	  /* 
	   * E_GH
	   *
	   * [gha] F2 1376->1400, F3 2063->2150                           14-Apr-86
	   * [ghe] F2 2305->2250, F3 2850->2775                           14-Apr-86
	   * [ghi] F2 2392->2450, F3 2878->2925                           14-Apr-86
	   * [gho] F2  962-> 940                                          14-Apr-86
	   * All durations changed to 25 msec.                            16-Aug-86
	   * [gha] F2 1400->1450, F3 2150->2200                           14-Apr-86
	   * Backed out above changes
	   * [go]  F1 404->439, F2 859->948, F3 2128->2163                22-Apr-86
	   * Changed durations back to locus table entries                29-Apr-86
	   *
	   * [gh] F1 234->300                                     DK      24-Jul-86
	   */
	478 - 46, 50, 1221, 50, 2223, 70,		/* A    */
	352 - 80, 45, 1105, 50, 2350, 50,	/* E    */
	300, 45, 1292, 50, 2828, 50,	   /* I    */
	439, 50, 948 + 50, 50, 2163 , 70,	/* O    */
	338 + 42, 50, 940 - 200, 50, 2291 - 128, 70,	/* U    */

	  /* 
	   * E_YH,
	   * Check [yhuyu]
	   * Values from running synthesizer.
	   */
	409, 60, 1756, 50, 2745, 50,	   /* A    */
	327, 60, 1955, 50, 2872, 50,	   /* E    */
	250, 60, 2060, 50, 3017, 50,	   /* I    */
	353, 60, 1606, 50, 2768, 50,	   /* O    */
	273, 60, 1519, 50, 2723, 50,	   /* U    */
	  /* 
	   * E_P
	   * Taken from synthesized
	   * [pe] F2 1918->1800                                           29-Apr-86
	   
	   699, 35,  1239,  55, 2171,  30,    /* A
	   452, 30,  1800,  55, 2519,  25,    /* E
	   366, 30,  2094,  55, 2606,  25,    /* I
	   481, 30,   940,  50, 2220,  30,    /* O
	   393, 30,   837,  50, 2177,  30,    /* U
	   eab 93 new values               */
	510, 35, 1083, 25, 2219, 30,	/* A    */
	442, 30, 1738, 25, 2268, 25,	   /* E    */
	366, 30, 1935, 25, 2306, 25,	   /* I    */
	481, 30, 940, 30, 2220, 30,		   /* O    */
	393, 30, 837, 50, 2177, 30,		   /* U    */

	  /* 
	   * E_B
	   *
	   * [ba]: F2 1220->1270.                                         14-Apr-86
	   * [a] target F2 is 1350 (syn), 1250 (nat)
	   * Backed out above change because of new vowel coart. stuff    22-Apr-86
	   * [bi]: F2 2240-2000 (see [bhi]                                 1-May-86
	   */
	525, 35, 1220, 35, 2139, 35,	   /* A    */
	417 - 125, 40, 1747 - 275, 40, 2431, 40,	/* E    */
	482 + 60, 50, 2000 - 150, 50, 2878 - 600, 50,	/* I    */
	455, 40, 853, 40, 2178, 40,		   /* O    */
	313, 50, 750, 50, 2169, 50,		   /* U    */

	  /* 
	   * E_T
	   * Taken from synthesized
	   * [ti] F2 2156->2225 per criticism of Miguel de Pablo:          8-Jul-86
	   * "ti" sounds between "ti" and "pi", not clear sound.
	   * [ti] F2 2225->2260 (still trying to fix above problem)       22-Jul-86
	   * [ta] F2 1585->1555 dur 35->30, F3 dur 30->20  (EB)           23-Jul-86
	   * [ti] F1 379->300 per Dennis                                  24-Jul-86
	   */
	558, 35, 1555, 30, 2496, 20,	   /* A    */
	480, 35, 1745, 35, 2501, 20,	   /* E    */
	300 - 30, 35, 2250 - 125, 35, 2855 - 275, 20,	/* I    */
	493, 35, 1422, 35, 2531, 30,	   /* O    */
	404, 35, 1297, 35, 2465, 30,	   /* U    */
	  /* 
	   * E_D
	   *
	   * [du] F2 1165->1250, tran 55->60                              14-Apr-86
	   * Backed out above F2 change, kept trandur                     22-Apr-86
	   */

	577 - 94, 40, 1669 - 218, 50, 2513, 50,		/* A    */
	416 - 93, 50, 1914 - 249, 50, 2578, 50,		/* E    */
	273 + 77, 50, 2266 - 192, 55, 2930, 55,		/* I    */
	503 - 30, 40, 1289 + 99, 40, 2491 - 244, 40,	/* O    */
	343 + 37, 50, 1417 - 52, 55, 2281 - 52, 60,		/* U    */
	  /* 
	   * E_K
	   * Taken from synthesized
	   * [ki] F2 2208->2350, F3 2716->2900 (avoid conf. with [ti])    28-Apr-86
	   * [ki] F2 2350->2450
	   * f1 in keke from 473 to 600 f2 from 2132 to 1386
	   *                                                              1-Apr-86
	   * [ki] F2 2450->2350, F3 2900->2879 (otherwise it sounds velarized)
	   *                                                              27-May-86
	   * [ki] F2 2350->2250 (change in [i] target)                    24-Jul-86
	   */
	297, 50, 1467, 50, 2328, 50,	   /* A    */
	290, 45, 2000, 50, 2400, 70,	   /* E    */
	290, 45, 2250, 50, 2879 - 110, 50,	/* I    */
	299, 45, 1199, 50, 2357, 70,	   /* O    */
	291, 45, 1045, 50, 2305, 70,	   /* U    */
	  /* 
	   * E_G
	   *
	   * [ga] F2 1458->1550, F3 2031->2150                            14-Apr-86
	   * [ge] F2 2234->2180, F3 2850->2750                            14-Apr-86
	   * [gi] F2 2296->2350                                           14-Apr-86
	   * [gu] F2  895-> 855                                           14-Apr-86
	   * Backed out above changes.                                    22-Apr-86
	   */

	580 - 148, 55, 1458 + 212, 55, 2031 - 113, 55,	/* A    */
	343 - 43, 50, 1963, 50, 2281, 50,  /* E    */
	259, 50, 2200, 55, 2590, 55,	   /* I    */
	439 - 7, 40, 948 + 158, 40, 2163 - 89, 40,	/* O    */
	326 + 60, 50, 895 - 152, 55, 2227 - 63, 55,		/* U    */

	  /* 
	   * E_CH
	   * Check trandur
	   * [a] targets 655 1627 2480
	   *
	   * trandur seems ok                                             14-Apr-86
	   * [cha] F1  750-> 700, F3 2545->2400                           14-Apr-86
	   * [che] F3 2519->2600                                          14-Apr-86
	   * [chi] F2 2363->2450                                          14-Apr-86
	   * [chu] F3 2461->2375                                          14-Apr-86
	   * Backed out above changes because of vowel target changes     22-Apr-86
	   * [cha] F1 750->700, F2 1693->1900, F3 2535->2650              24-Apr-86
	   * [che] F1 440->350, F2 2001->2100, F3 2519->2600              24-Apr-86
	   * [chi]              F2 2450->2550, F3 2841->2950              24-Apr-86
	   */
	700, 50, 1900, 50, 2650, 50,	   /* A    */
	350, 50, 1800, 50, 2600, 50,	   /* E    */
	286, 50, 1850, 50, 2950, 50,	   /* I    */
	460, 50, 1367 + 300, 50, 2422 + 300, 50,	/* O    */
	313, 50, 1289, 50, 2461, 50,	   /* U    */
	  /* 
	   * E_Y
	   * [ya] F1 476->382     F2 1729->2178   F3 2692->2921           13-May-86
	   *          35->70           30->80          30->80
	   */

	382, 70, 2178, 80, 2921, 80,	   /* A    *//* @ 360 ms */
	357, 35, 1978, 30, 2847, 30,	   /* E    */
	250, 35, 2119, 30, 3022, 30,	   /* I    */
	396, 35, 1523, 30, 2720, 30,	   /* O    */
	281, 35, 1312, 30, 2650, 30,	   /* U    */

	  /* 
	   * E_R
	   * E_RR (and E_R (for now))
	   * [a] targets 750 1392 2427
	   * [ra] has "formant" at 1950
	   * [o] F1 462->508                                               3-Jul-86
	   * [u] F1 283->595                                               3-Jul-86
	   * [o] transitions changed from 50->80->40 msec.                 7-Jul-86
	   * [u] F1 595->283, transitions 50->90->50 msec.                 7-Jul-86
	   * [u] F3 2435->2550                                             8-Jul-86
	   * [u] transitions 50->40 msec.                                  8-Jul-86
	   * Note: used only at the end of the phoneme                     9-Jul-86
	   * [u] F2 1230->1275                                             9-Jul-86
	   * [o,u] transitions 40->60                                     10-Jul-86
	   */

		/* 
		 * 595-150,  50, 1436+200,  50, 2427+50,  50,     A 
		 508,  50, 1699,  50, 2486,  50,     E    
		 338,  50, 1944+300,  50, 2597,  50,     I
	     508,  60, 1263,  60, 2500,  60,     O 
		 283,  60, 1275,  60, 2435,  60,    U */

	508 + 35, 30, 1440, 30, 2450, 30, /*a*/
	508 - 128, 40, 1700 , 40, 2300, 40, /*e*/
	508 - 250, 30, 1500 , 50, 2308, 30, /*i*/
	508 - 58, 30, 1400 , 40,  1935, 30,	/*o*/
	508 - 213, 30, 1400 - 100, 40, 2400, 30,/*u*/

	  /* 
	   * [E_L]
	   *
	   * Note: [l] appears to have an additional formant around
	   * 1200-1800 Hz at the consonant-vowel transition.
	   * This is most apparent in [li], [lo].  This "could"
	   * be modelled by widening the bandwidth of F2, but
	   * probably won't give the correct spectral shape.
	   *                                      *
	   *                                      * Not used -- placeholder only
	   *                                      *
	   */

		/* JAH - MAY2794 Change all values */

	375 + 100, 5, 1363 - 200, 40 - 10, 2441 + 100, 40 - 10,		/* A    */
	332 + 18, 40 - 10, 1768 - 68, 40 - 10, 2528 - 150, 40 - 10,		/* E    */
	313 - 25, 40 - 10, 2001 - 100, 30, 2473, 30,	/* I    */
	341 + 140, 40 - 20, 1320 - 250, 40 - 10, 2523 - 25, 40 - 10,	/* O    */
	341 + 140, 40 - 10, 1320 - 250, 40, 2385 + 115, 40 - 10,	/* U    */

	  /* 
	   * E_LL
	   *                                      *
	   *                                      * Not used -- placeholder only
	   *                                      *
	   */
	287, 40, 1708, 40, 2431, 40,	   /* A    */
	303, 40, 1939, 40, 3077, 40,	   /* E    */
	208, 40, 2246, 40, 3008, 40,	   /* I    */
	336, 40, 1412, 40, 2198, 40,	   /* O    */
	273, 40,  898, 40, 2285, 40		   /* U    */
};

/* 
 * Table of pointers to the first entry in malbound[] for each
 * phoneme.  A zero value indicates "no entry"
 *
 * Note that E_RR and E_R point to the same entry.               7-Jul-86
 * Removed [r] and [rr]                                          8-Jul-86
 * Reorganized malbound[] and pbvalue[] to put all               8-Jul-86
 * "placeholder" entries at the end, so they can be removed easily.
 */
#define X       * BOUND_SIZE + 1	   /* Just saves typing            */

short mpbvalue[TOT_ALLOPHONES] =
{
	  /* SIL   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	0, 0, 0, 0, 0, 0, 0, 0,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
	19 X, 20 X, 21 X, 0 X, 1 X, 2 X, 3 X, 4 X, 5 X, 6 X,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B  E_T   E_D   E_K   E_G    */
	      7 X, 8 X, 9 X, 10 X, 11 X, 12 X, 13 X, 14 X, 15 X, 16 X,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		 17 X, 18 X, 19 X, 0,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	6 X, 0, 0, 0, 0, 0, 0,
#endif


#ifdef E_V
	  /* E_Z   E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	6 X, 0, 0, 0, 0, 0, 0
#endif

};

#undef X

/* Parallel amps for obst before front, back, round, and nonsonor *                A2   A3   A4   A5   A6   AB * * A2   subtract cascade value (F2,
 * B2) * A3   add cascade value (F3, B3) * A4   subtract speaker-dependent, param F7 * A5   add around 4000 Hz (speaker dependent, param F8) * A6
 * subtract at high-frequency end * AB   wideband noise * * Note: to subtract from the high-frequency end, set A6 to (AB - 17). * Note, however, that 
 * this is a guess from looking at the evidence. */


short                   malamp[(21 * 24) + 1] =
{
	0,
	/* 
	 * E_F  front, back, round, nonsonor.
	 *      Remeasured                                              15-Apr-86
	 *      Yet again -- f sounds like s.                           23-Apr-86
	 * front        A5 25->0
	 * back         A5 25->0
	 * round        A5 22->0
	 * nonsonor     A5 25->0
	 * all          A3 -10db, A4 -10db                              28-Apr-86
	 * Oops: now [fi] sounds like English 'he'                      29-Apr-86
	 * front        A3 +10db, A4 +10db
	 * front        A4 15->0, AB 25->30                             30-Apr-86
	 * front        A3 27->34 A4 0->38                               9-May-86
	 * front        38->15                                           9-May-86
	 * Went back to English (wideband noise), except for Ed's front 27-May-86
	 *      was     0,0,0,0,45
	 * Went back to English (DHK)                                   24-Jul-86
	 */

#if 0
		0 + 25, 34 - 9, 15 + 10, 0 + 20, 0, 30,
		0, 25 - 10, 25 - 10, 0, 0, 25,
		0, 24 - 10, 22 - 10, 0, 0, 22,
		0, 25 - 10, 25 - 10, 0, 0, 25,
#else
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 43,
		0, 0, 0, 0, 0, 43,
#endif

	/* 
	 * E_S  front, back, round, nonsonor.
	 *      Remeasured                                              22-Apr-86
	 * back         A2 0->33                                        22-Apr-86
	 *              A2 33->0                                        23-Apr-86
	 * round        A3 0->40, A4 50->40, A5 50->40, A6 45->40       22-Apr-86
	 *              A3 40->0, A4 40->0,  A5 40->0,  A6 0->50        23-Apr-86
	 * all A6 52-> 56, round A5 0->50                       DK      24-Jul-86
	 */
		0, 0, 0, 0, 52, 0,
		0, 0, 0, 0, 52, 0,
		0, 0, 0, 50, 54, 0,
		0, 0, 0, 0, 54, 0,
	/* 
	 * E_J  front, back, round, nonsonor.
	 * Lowered all values 5 db (suggestion from Dr. Quilis).
	 * Redone, old =                                        DK      24-Jul-86
	 *               22-5,  32-5,  42-5,  31-5,   0,   0,
	 *               40-5,  22-5,  42-5,  31-5,   0,   0,
	 *               32-5,  20-5,  42-5,  24-5,   0,   0,
	 *               20-5,  30-5,  39-5,  29-5,   0,   0,
	 */
		37, 0, 33, 0, 0, 0,
		37, 0, 33, 0, 0, 0,
		37, 0, 33, 0, 0, 0,
		37, 0, 33, 0, 0, 0,

	/* 
	 * E_TH  front, back, round, nonsonor.
	 *      Remeasured                                              24-Apr-86
	 * front        A3 30->20, A4 25->20, A5 25->20, AB 47->15       9-May-86
	 *              backed out above changes (sounds like [f])       9-May-86
	 */
		0, 0, 0, 0, 44, 47,
		0, 0, 0, 0, 44, 47,
		0, 0, 0, 0, 44, 45,
		0, 0, 0, 0, 44, 45,
	/* 
	 * E_YH front, back, round, nonsonor.
	 *
	 *      Use English [jh] values (temp)                           7-May-86
	 */

		0, 45, 61, 0, 44, 0,
		0, 45, 61, 0, 44, 0,
		0, 45, 56, 0, 38, 0,
		0, 45, 56, 0, 38, 0,

	/* 
	 * E_CH front, back, round, nonsonor.
	 *
	 * Remeasured                                                   17-Apr-86
	 * Too much low frequency energy                                23-Apr-86
	 * [che, chi]   A2 30->0, A3 29->39
	 * [cha]        A2 35->0, A3 29->39
	 * [cho, chu]   A2 35->0
	 * [ch nonson]  follows [cha]
	 */

		0, 39, 0, 0, 52, 0,
		0, 29, 0, 0, 52, 0,
		0, 39, 0, 0, 46, 0,
		0, 39, 0, 0, 46, 0,

	/* E_P     */
	/* 
	 * front 25,25,0,0,34,41 -> 0,0,0,0,40,57       DK      24-Jul-86
	 * Added 6 to other values, too.
	 *eab 93 seems too strong. high freq plus need some low feq.
	 *dennis wrong orig numbers closer
	 
	 0,   0,   0,   0,  34+6,   51+6, Use A6 = 44 to subtract
	 0,   0,   0,   0,  34+6,  51+6, a little energy at 5 kHz
	 0,   0,   0,   0,  34+6,  51+6, from typical AB spectrum
	 0,   0,   0,   0,  34+6,  51+6, */

		25, 25, 0, 0, 0, 0,
		25, 25, 0, 0, 0, 0,
		25, 25, 0, 0, 0, 0,
		25, 25, 0, 0, 0, 0,

	/* E_B     */
	/* 
	 * 10-Apr-86 MM, for U context, A4 (0->20), A5 (0->20)
	 * front: A6 35->28 try to hit "subtract" hack.  (16 db diff?)  16-Apr-86
	 
	 0,   0,   0,   0,  28,  42,
	 0,   0,   0,   0,  35,  42,
	 0,   0,  20,  20,  35,  42,   10-Apr
	 0,   0,   0,   0,  35,  42, not what I see eab 93 */

		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,
		0, 0, 10, 10, 0, 0,			   /* 10-Apr               */
		0, 0, 0, 0, 0, 0,

	/* E_T     */
	/* 
	 * Increased amplitude 2db for front and back, 19-Feb
	 * added f2 amplitudes 31-mar-86--eb
	 * increased 3rd form. 4 db on front and a little on other
	 * 4-apr-86 it was too weak relative to f2
	 * causing too much percieved retroflextion. Changed from 42+2,44+2,
	 * 44,44 to 48,48,46,46
	 * 5-19-86--changed a6 to 25 from 0 and a3 from 38 to 45
	 *
	 * Remeasured, old values were:                                 12-May-86
	 * Front:          30,  48,  55,  46,   0,   0,
	 * Back:           40,  50,  54,  52,  48,   0,
	 * Round:          30,  46,  54,  50,  48,   0,
	 * Nonsonor:       30,  46,  54,  50,  48,   0,
	 *
	 * More remeasurment                                            28-May-86
	 * Front        A2 40->45, A3 20->30, A4 25->35, A5 16->31, A6 48->40
	 * Back                    A3 56->46, A4 34->29, A5 37->32
	 * Round        A2 40->45
	 * Nonsonor follows round
	 *
	 * Front A6 40->48 to make it more 't' like.                    22-Jul-86
	 * Added AB noise 0->40                                         22-Jul-86
	 * Still not satisfactory, changed back to 12-May values with   24-Jul-86
	 * slight modifications (per Dennis).  Old values were:
	 *                 45,  30,  35,  31,  48,  40,
	 *                 46-5,  46-4,  29,  32,  33,  40,
	 *                 45,  51,  54,  40,  18,  40,
	 *                 45,  51,  54,  40,  18,  40,
	 
	 30-7,  48-7,  55-54,  46-7,   0,   0,
	 40-7,  50-7,  54-54,  52-7,  48-40,   0,
	 30-7,  46-7,  54-54,  50-7,  48-40,   0,
	 30-7,  46-7,  54-54,  50-7,  48-40,   0, */

		30 - 8, 48 - 10, 44, 48, 43, 0,
		40 - 8, 50 - 10, 44, 48, 43, 0,
		30 - 8, 46 - 10, 44, 48, 43, 0,
		30 - 8, 46 - 10, 44, 48, 43, 0,

	/* E_D     */
	/* 
	 * lowered hf energy A6 46->0                                   16-Apr-86
	 *
	 36-2,  44-2,  55-2,  46-2-20,     0,   0,
	 36-2,  46-2,  54-2,  52-2-20,     0,   0,
	 36-2,  44-2,  54-2,  50-2-20,     0,   0,
	 36-2,  44-2,  54-2,  50-2-20,     0,   0,  eab */
/*	0, 0, 44, 0, 52, 0,
	0, 0, 46, 0, 51, 0,
	0, 0, 57, 0, 0, 0,
	0, 0, 55, 0, 0, 0,
	*/
		32, 40, 30, 0, 0, 0,
		32, 40, 30, 0, 0, 0,
		32, 40, 30, 0, 0, 0,
		32, 40, 30, 0, 0, 0,		   /* eab */
	/* 5-20-86 found a6 for front had +40 changed to 0 and a5 frm 40 to 20 */
	/* E_K * Front 0, 40, 53, 20 -> 30, 45, 35, 20 (DK)                   24-Jul-86 */
		40, 0, 0, 40, 0, 0,
		40, 0, 0, 40, 0, 0,
		40, 0, 0, 40, 0, 0,
		40, 0, 0, 40, 0, 0,

	/* E_G     */

		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,

	/* * new * */
	/* 
	 * E_Z front, back, round, nonsonor.
	 */
		0, 0, 0, 0, 45, 0,
		0, 0, 0, 0, 46, 0,
		0, 0, 0, 0, 47, 0,
		0, 0, 0, 0, 46, 0,

#ifdef E_SH
	/* 
	 * E_SH  front, back, round, nonsonor.
	 */
		0, 45, 62, 54, 45, 0,
		0, 45, 62, 54, 45, 0,
		0, 42, 57, 47, 36, 0,
		0, 43, 59, 52, 43, 0,
#endif

#ifdef E_V
	/* 
	 * E_V  from English DECtalk
	 */
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 43,
		0, 0, 0, 0, 0, 43,
#endif

	/* 
	 * E_IX                         NO LONGER USED -- PLACEHOLDER ONLY
	 */
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 43,
		0, 0, 0, 0, 0, 43,
	/* 
	 * E_PH  front, back, round, nonsonor.
	 */
		0, 0, 0, 0, 0, 47,
		0, 0, 0, 0, 0, 47,
		0, 0, 0, 0, 0, 44,
		0, 0, 0, 0, 0, 44,
	/* 
	 * E_RR  front, back, round, nonsonor.
	 * NOTE: If you add resonances, be sure to change the trill code in PHDRAW.
	 *
	 * round AB 0->20                                               8-Jul-86
	 */
		20 , 20, 0, 0, 0, 0,
		20 , 20, 0, 0, 0, 0,
		20 , 20, 0, 0, 0, 0,
		20 , 20, 0, 0, 0, 0,
	

	/* 
	 * E_R  front, back, round, nonsonor.
	 *
	 * NOTE: if you add resonances, be sure to change the trill code in PHDRAW.C
	 *
	 * round AB 0->20                                                8-Jul-86
	 */
/* 20,  20,   0,   0,   0,   0, 
   20,  20,   0,   0,   0,   0, 
   20,  20,   0,   0,   0,  20,
   20,  20,   0,   0,   0,   0,
   eab 5/94 try dif settings */

		20 - 15, 20 - 18, 0, 0, 0, 0,
		20 - 15, 20 - 18, 0, 0, 0, 0,
		20 - 15, 20 - 18, 0, 0, 0, 0,
		20 - 15, 20 - 18, 0, 0, 0, 0,

	/* 
	 * E_BH
	 * Increased [bi, be, bo, bu] and non-sonorant slightly to      14-May-86
	 * prevent "bobo" -> "bo[w]o".
	 * Decreased [bi] to prevent "bibi">[biwi]                      15-May-86
	 * [bu] too "buzzy", lowered hf slightly (A6 17->13, AB 37->33) 16-May-86
	 *      and raised A3 12->14
	 * AB 35,35,33,35->55                                   DK      24-Jul-86
	 *
	 0,  10,   0,   0,  15,  55,
	 0,  10,   0,   0,  15,  55,
	 0,  14,   0,   0,  13,  55,
	 0,  10,   0,   0,  15,  55,
	 eab 93 to me it seems like bypass noise much too loud. */

		0, 10, 0, 0, 15, 55 - 40,
		0, 10, 0, 0, 15, 55 - 40,
		0, 14, 0, 0, 13, 55 - 40,
		0, 10, 0, 0, 15, 55 - 40,

	/* 
	 * E_DH
	 * Remeasured                                                   14-May-86
	 * AB 0-> 55                                            DK      24-Jul-86
	 */
		10, 22 - 10, 13, 0, 0, 45 - 45,
		10, 24 - 10, 12, 0, 0, 45 - 45,
		10, 24 - 10, 12, 0, 0, 45 - 45,
		10, 24 - 10, 12, 0, 0, 45 - 45,

	/* 
	 * E_GH
	 * front A4 0->13                                               30-Apr-86
	 * Increase all values by 13                            DK      24-Jul-86
	 * A4 13,13,13,13->26,36,36,36
	 * A5 23,23,23,23->36,0,0,0
	 */
		0, 41 - 41, 26 - 20, 36 - 36, 0, 0,
		42 - 20, 0, 36 - 30, 0, 0, 0,
		41 - 20, 0, 36 - 30, 0, 0, 0,
		41 - 20, 0, 36 - 30, 0, 0, 0
};

/* Arrays that apply to both male and female voice */

/* Pointers to parallel formant amplitudes for obstruents */
/* 
 *
 * PTRAM[] Table
 * Pointer in the MALAMP[] Matrix with the
 * amplitudes of the parallel branch.
 *
 *      NOTE: when you add non-zero entries to this table,
 *      be sure to update the size of malamp[] above.
 *      The offsets are incremented by 24.
 */

short ptram[TOT_ALLOPHONES] =
{
/* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX */
	0, 0, 0, 0, 0, 0, 0, 0,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
	385, 0, 0, 0, 0, 0, 1, 25, 49, 73,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	433, 457, 481, 97, 145, 169, 193, 217, 241, 265,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	121, 0, 409, 0,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	289, 0, 0, 313, 0, 0, 361,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	289, 0, 0, 313, 0, 0, 361
#endif

};

/* 
 * These are pretty much fixed.
 */

/* 
 * This table is used to modify f0 in order to make glottal stops.
 * it is apparantly not used in Spanish DECtalk.  The values are
 * Hertz * <something -- probably 100>
 */

short f0glstp[6] =
{
	-600, -450, -320, -210, -120, -50
};

/* 
 * Initial values for parameters
 */

short parini[] =
{
	  /* F1   F2   F3   FZ   B1   B2   B3   AV              */
	500, 1600, 2600, 300, 50, 150, 250, 0,
	  /* AP   A2   A3   A4   A5   A6   AB   TILT            */
	0, 0, 0, 0, 0, 0, 0, 0
};

/* 
 * This table is used by phsettar.c to classify each parameter
 * as a FORMANT_FREQUENCY, BANDWIDTH, VOICING AMPLITUDE, or
 * PARALLEL AMPLITUDE.  The values are bit-encoded and named
 * by #defines in phsettar.c.
 *
 * Switch to set target to const, taram[ptram], or flocu[plocu]
 */

char partyp[] =
{
	  /* F1   F2   F3   FZ   B1   B2   B3   AV              */
	3, 3, 3, 1, 4, 4, 4, 0,
	  /* AP   A2   A3   A4   A5   A6   AB   TILT            */
	0, 2, 2, 2, 2, 2, 2, 2
};

/* 
 * Table to permit use of mulsh() for division by 1 to 20 --
 * multiplying by divtab[I] and shifting appropriately yields
 * a division by I.
 */

short divtab[] =
{
	16384, 16384, 8192, 5461, 4096,
	3276, 2730, 2340, 2048, 1820,
	1638, 1489, 1365, 1260, 1170,
	1092, 1024, 964, 910, 862,
	819, 780, 745, 712, 682,
	655, 630, 607, 585, 565,
	546, 528, 512, 496, 482,
	468, 455, 443, 431, 420,
	409, 399, 390, 381, 372,
	364, 356, 349, 341, 334
};

/* 
 * Stress-related rise/fall amount in Hz*10 for
 * first, second, ... accent in a phrase
 * Check against MAX_NRISES in phinton.c
 */

short f0_phrase_position[] =
{
	  /* First clause    Second clause  */
/* 300, 275, 250, 200, 175, 150, 50,50 last pos=0 causes bad problems */
	300, 100+175, 200, 175, 150, 50, 50	   /* last pos=0 causes bad problems */

};

/* 
 * F0 rise as f(stress-level); Order is
 *      FNOSTRESS       unstressed
 *      FSTRESS_1       primary stress
 *      FSTRESS_2       secondary stress
 *      FEMPHASIS       emphatic stress
 */

#if FSTRESS_SHIFT != 0
<<error, the following won 't work >>
#endif
/* 0,       71,     31,    261 eab original stress */

short f0_stress_level[] =
{
/* 'stress `stress "stress                      */
/* 0,       51-10,     31-10,    161-50   /*eab  */
	0, 51+20, 31+10, 261					   /* eab original stress */

};

/* Realize quasi-sinusoidal vibratto by trapezoidal approximation       */
/* (if |vibdel| is 4, vibratto is plus-or-minus 1.2 percent)           */

short                   vibdel[] =
{-6, 0, 6, 0};

/* Notes in F0*10 from C2 to C5 */

short                   notetab[] =
{
	640,							   /* 1 = C2              */
	678,							   /* 2 = C#              */
	718,							   /* 3 = D               */
	761,							   /* 4 = D#              */
	806,							   /* 5 = E    B                  (HARRY)         */
	854,							   /* 6 = F    A          */
	905,							   /* 7 = F#   S          */
	959,							   /* 8 = G    S B                (PAUL)          */
	1016,							   /* 9 = G#   | A        */
	1076,							   /* 10 = A    | R        */
	1140,							   /* 11 = A#   | A        */
	1208,							   /* 12 = B    | T        */
	1280,							   /* 13 = C3   | O T              (FRANK)         */
	1356,							   /* 14 = C#   | N E      */
	1437,							   /* 15 = D    | E N      */
	1522,							   /* 16 = D#   | | O      */
	1613,							   /* 17 = E    | | R      */
	1709,							   /* 18 = F    | | | A            (BETTY)         */
	1810,							   /* 19 = F#   | | | L    */
	1918,							   /* 20 = G    | | | T    */
	2032,							   /* 21 = G#   | | | O    */
	2152,							   /* 22 = A    | | | |    */
	2280,							   /* 23 = A#   | | | |    */
	2416,							   /* 24 = B    | | | | S          (URSULA or KIT) */
	2560,							   /* 25 = C4   | B | | O  */
	2712,							   /* 26 = C#   B A | | P  */
	2874,							   /* 27 = D    A R | | R  */
	3044,							   /* 28 = D#   A A | | A  */
	3226,							   /* 29 = E    S T | | N  */
	3418,							   /* 30 = F      O | | O  */
	3620,							   /* 31 = F#     N | | |  */
	3836,							   /* 32 = G      E T | |  */
	4064,							   /* 33 = G#       E | |  */
	4304,							   /* 34 = A        N | |  */
	4560,							   /* 35 = A#       O | |  */
	4832,							   /* 36 = B        R | |  */
	5120							   /* 37 = C5         | |  */
};

/* Phonetic features */

/* Phonetic feature values allowed in place[]                     */
/* 
 * Note: Spanish does not currently use FDENTAL or FALVEL.  It is
 * not clear what the proper value for [l] should be, possibly dental.
 */
/* FLABIAL      0000001          p, b, m, f, v                          */
/* FDENTAL      0000002          th, dh, d$                             */
/* FPALATL      0000004          sh, zh, ch, jh                         */
/* FALVEL       0000010          t, d, n, en, s, z, tx (not l,r,dx)     */
/* FVELAR       0000020          k, g, nx                               */
/* FGLOTAL      0000040          q, tq (signals glottal stop)           */
/* F2BACKI      0000100          iy, y, yu, ir (E_I E_YX)               */
/* F2BACKF      0000200          iy, y, ey (E_I E_YX E_E)               */

short                   place[] =
{
	0,								   /* E_SI */
	0,								   /* E_A  */
	0,								   /* E_E  */
	F2BACKI | F2BACKF,				   /* E_I  */
	0,								   /* E_O  */
	0,								   /* E_U  */
	FPALATL,						   /* E_WX */
	FPALATL | F2BACKI | F2BACKF,	   /* E_YX */
	FALVEL,							   /* E_RR */
	FALVEL,							   /* E_L  */
	FPALATL,						   /* E_LL */
	FLABIAL,						   /* E_M  */
	FALVEL,							   /* E_N  */
	FPALATL,						   /* E_NH */
	FLABIAL,						   /* E_F  */
	FALVEL,							   /* E_S  */
	FVELAR,							   /* E_J  */
	FDENTAL,						   /* E_TH */
	FLABIAL,						   /* E_BH */
	FDENTAL,						   /* E_DH */
	FVELAR,							   /* E_GH */
	FPALATL,						   /* E_YH */
	FLABIAL,						   /* E_P  */
	FLABIAL,						   /* E_B  */
	FDENTAL,						   /* E_T  */
	FDENTAL,						   /* E_D  */
	FVELAR,							   /* E_K  */
	FVELAR,							   /* E_G  */
	FPALATL,						   /* E_CH */
	FPALATL + F2BACKI + F2BACKF,	   /* E_Y  */
	FALVEL,							   /* E_R  */
	FGLOTAL,						   /* E_Q  */
	FALVEL,							   /* E_Z  */
	FLABIAL,						   /* E_W  */
	FVELAR,							   /* E_NX */

#ifdef E_SH
	FPALATL,						   /* E_SH */
#endif

#ifdef E_V
	FLABIAL,						   /* E_V  */
#endif

	F2BACKI | F2BACKF,				   /* E_IX */
	FLABIAL,						   /* E_MX */
	FLABIAL							   /* E_PH */
};

/* 
 * Phonetic features:
 *
 *      FSYLL   0000001  Syllabics: vowels and dipthongs
 *      FVOICD  0000002  Voiced segments
 *      FVOWEL  0000004  Vowels
 *      FSEMIV  0000010, Semivowels (Y, W, YX, WX)
 *      FSONOR  0000020  [-obst], except E_Q  which is [-sonor, -obst]
 *      FOBST   0000040  Occlusives, except E_Q is [-obst]
 *      FPLOSV  0000100  Plosives, but not affricates
 *      FNASAL  0000200  Nasals
 *      FCONSON 0000400  [-syll], except for  SI and  E_Q
 *      FSONCON 0001000  Laterals (was vd liq & glides, RR, lat's and  YH)
 *      FDIPTH  0002000  [i, u, yx, wx]
 *      FBURST  0004000  Plosives and affricates
 *      FSTMARK 0010000  Stress marks
 *      FGLOTAL 0020000  The glottal stop
 *      FVBAR   0040000  Generates voicebar
 * Note: FSYLL and FVOWEL are identical
 */
/* 
 * [bh, dh, gh]->FOBST (needed to trigger nasal assimilation)    8-May-86
 * Note: Everything marked FOBST here must have entries in
 * the boundary value table.
 * [y] -> +FOBST, -FDIPTH -FSONOR                               12-May-86
 */
short                   featb[PHO_SYM_TOT] =
{
	  /* [ SIL ]  */ FSONOR,
	  /* [ E_A ]  */ FSYLL + FVOICD + FVOWEL + FSONOR,
	  /* [ E_E ]  */ FSYLL + FVOICD + FVOWEL + FSONOR,
	  /* [ E_I ]  */ FSYLL + FVOICD + FVOWEL + FSONOR + FDIPTH,
	  /* [ E_O ]  */ FSYLL + FVOICD + FVOWEL + FSONOR,
	  /* [ E_U ]  */ FSYLL + FVOICD + FVOWEL + FSONOR + FDIPTH,
	  /* [ E_WX ] */ FVOICD + FSONOR + FSEMIV + FDIPTH,
	  /* [ E_YX ] */ FVOICD + FSONOR + FSEMIV + FDIPTH,
	  /* [ E_RR ] */ FVOICD + FSONOR + FCONSON,
	  /* [ E_L ]  */ FVOICD + FSONOR + FCONSON + FSONCON,
	  /* [ E_LL ] */ FVOICD + FSONOR + FCONSON + FSONCON,
	  /* [ E_M ]  */ FVOICD + FSONOR + FNASAL + FCONSON,
	  /* [ E_N ]  */ FVOICD + FSONOR + FNASAL + FCONSON,
	  /* [ E_NH ] */ FVOICD + FSONOR + FNASAL + FCONSON,
	  /* [ E_F ]  */ FOBST + FCONSON,
	  /* [ E_S ]  */ FOBST + FCONSON,
	  /* [ E_J ]  */ FOBST + FCONSON,
	  /* [ E_TH ] */ FOBST + FCONSON,
	  /* [ E_BH ] */ FVOICD + FSONOR + FCONSON + FOBST,
	  /* [ E_DH ] */ FVOICD + FSONOR + FCONSON + FOBST,
	  /* [ E_GH ] */ FVOICD + FSONOR + FCONSON + FOBST + FVBAR,
	/* [ E_YH ] */ FVOICD + FOBST + FCONSON + FBURST,
			/* 23-Apr-86, 5-May */
	  /* [ E_P ]  */ FOBST + FPLOSV + FCONSON + FBURST,
	  /* [ E_B ]  */ FVOICD + FOBST + FPLOSV + FCONSON + FBURST + FVBAR,  
	/* [ E_T ]  */ FOBST + FPLOSV + FCONSON + FBURST,
																/* [ E_D ]  */ FVOICD + FOBST + FPLOSV + FCONSON + FBURST,
																/* EAB -FVBAR */
	  /* [ E_K ]  */ FOBST + FPLOSV + FCONSON + FBURST,
	  /* [ E_G ]  */ FVOICD + FOBST + FPLOSV + FCONSON + FBURST + FVBAR + FGLOTAL,
	  /* [ E_CH ] */ FOBST + FCONSON + FBURST,
												/* [ E_Y ]  */ FOBST + FVOICD + FCONSON,
												/* 12-May-86    */
	  /* [ E_R ]  */ FVOICD + FSONOR + FCONSON,
	  /* [ E_Q ]  */ FVOICD + FGLOTAL,
												/* [ E_Z ]  */ FVOICD + FOBST + FCONSON,
												/* 5-May-86     */
	  /* [ E_W ]  */ FVOICD + FOBST + FCONSON + FSEMIV,
	  /* [ E_NX ] */ FVOICD + FSONOR + FNASAL + FCONSON,

#ifdef E_SH
	  /* [ E_SH ] */ FOBST + FCONSON,
#endif

#ifdef E_V
	  /* [ E_V ]  */ FVOICD + FSONOR + FCONSON,
#endif

									   /* [ E_IX ] */ FVOICD + FSONOR,
									   /* 7-May: not a vowel  */
	  /* [ E_MX]  */ FVOICD + FSONOR + FNASAL + FCONSON,
	  /* [ E_PH ] */ FOBST + FCONSON,
	  /* [NOVALID] */ 0,

	  /* place holders for null range ... */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	   /* 40 ... 49 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	   /* 50 ... 59 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	   /* 60 ... 69 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	   /* 70 ... 79 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	   /* 80 ... 89 */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,	   /* 90 ... 99 */

#if (NOVALID != (E_PH + 1)) || (BLOCK_RULES != 100)
	<<error, the table isn 't correct >>
#endif
/* [BLOCK_RULES] */ 0,
/* [ S3  ]  */ FSTMARK,
/* [ S2  ]  */ FSTMARK,
/* [ S1  ]  */ FSTMARK,
/* [SEMPH]  */ FSTMARK,
/* [HAT_R]  */ 0,
/* [HAT_FALL] */ 0,
/* [HAT_RF]  */ 0,
/* [SBOUND]  */ 0,
/* [MBOUND]  */ 0,
/* [HYPHEN]  */ FSTMARK,
/* [WBOUND]  */ 0, 0, 0, 0, 0, 0, 0, 0, 0
				/* The rest are zero          */
};

/* Feature value bits for each boundary symbol in input */

short                   bounftab[EXCLAIM - SBOUND + 1] =
{
	FSBOUND,						   /* SBOUND       */
	FMBNEXT,						   /* MBOUND       */
	FMBNEXT,						   /* HYPHEN       */
	FWBNEXT,						   /* WBOUND       */
	FPPNEXT,						   /* PPSTART      */
	FVPNEXT,						   /* VPSTART      */
	FRELNEXT,						   /* RELSTART     */
	FCBNEXT,						   /* COMMA        */
	FPERNEXT,						   /* PERIOD       */
	FQUENEXT,						   /* QUEST        */
	FEXCLNEXT						   /* EXCLAIM      */
};

short                   getcosine[64] =
{
	164, 163, 161, 158, 154, 148, 141, 132,
	123, 112, 100, 86, 72, 56, 38, 20,
	0, -20, -38, -56, -72, -86, -100, -112,
	-123, -132, -141, -148, -154, -158, -161, -163,
	-164, -163, -161, -158, -154, -148, -141, -132,
	-123, -112, -100, -86, -72, -56, -38, -20,
	0, 20, 38, 56, 72, 86, 100, 112,
	123, 132, 141, 148, 154, 158, 161, 163,
};

/* Linearize the TILT variable */
/* E.g. if you request 3 dB of tilt, must send 12 to chip to get 3 */

short                   lineartilt[32] =
{
	0, 6, 8, 12, 15, 17, 19, 21, 23, 25,
	26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
	35, 36, 36, 37, 37, 38, 38, 39, 39, 39,
	40, 40
};

/* 
 * This table contains the boundary value and transition duration
 * for all consonants in all vowel contexts.  (Consonant-consonant
 * transitions are computed by defining an "equivalent" vowel for
 * the adjacent segment.)  Boundary values are in Hz, and transition
 * durations are in Msec.  The table is addressed using the index
 * vector pbound[phoneme] -- a non-zero entry indicates an entry
 * in this table.
 *
 * Entries are organized as follows:
 *      F1 bval, F1 tdur, F2 bval, F2 tdur, F3 bval, F3 tdur    A
 *      ... same for E, I, O, U ...
 *
 * In order for the values in this table to be used, the following
 * must be true:
 *  1.  There must be an entry in pbvalue[] (below).
 *  2.  The begtyp/endtyp values must be 4 (obstruent)
 * Note: all +FOBST phonemes (should) have entries in this table.
 */

/* 
 * Define the size of each table entry:
 *      2 entries per formant (boundary and duration)
 *      3 formants
 *      5 vowels
 */
#define BOUND_SIZE      (2 * 3 * 5)
/* 
 */
short                   femdip[ESIZPHDP] =
{
	0, 0,
	  /* 
	   * E_A
	   eab tuned 11/95*/

	859, 30 + 10, 859, 60, 859, -1,	   /* 730->700            */
	1370, 30 + 10, 1370, 60, 1370, -1,
	2990, 30 + 10, 2990, 60, 2990, -1, /* changed eab */

	  /* 
	   * E_E
	   */

	484, 30, 484, 60, 484, -1,
	2114, 30, 2114, 60, 2114, -1,	   /* new eab */
	2820, 30, 2820, 60, 2820, -1,	   /* 2680->2550   16-Apr-86       */

	  /* 
	   * E_I
	   */

	  /* 
	   * Change 24-Jul-86 per suggestion from Dennis.  Old values were:
	   *       250+50,  30, 250,  60, 250, -1,
	   *      2315+85,  15,2433,  75,2315, -1,
	   *      2900,  30,2900,  60,2900, -1,
	   * Note: if F2 gets too high, it might cause an internal overload
	   * in the synthesizer.*/

	437, 30, 437, 60, 437, -1,
	2742, 15, 2742, 75, 2742, -1,
	3300, 15, 3300, 75, 3350, -1,

	  /* 
	   * E_O
	   */
	642, 30, 642, 60, 642, -1,
	1050, 30, 1050, 60, 1050, -1,
	2825, 30, 2842, 60, 2842, -1,	   /* eab reduce value */

	  /* not enough but can't chnage the world. yet */
	  /* 
	   * E_U
	   */

	320 - 70, 30, 320 - 70, 60, 320 - 70, -1,
	1000 - 120, 30, 1000 - 120, 60, 1000 - 120, -1,
	2690, 30, 2690, 60, 2690, -1
};

short                   fembound[] =
{
	0,								   /* Placeholder for non-entries  */
	  /* 
	   * E_M
	   * [ma] F1 692->247, F2 1220-> 924;     bouval 30,40,40->15     23-Apr-86
	   * [me] F1 547->243, F2 1966->1497;     bouval 30,40,40->15     23-Apr-86
	   * [mi]              F2 2168->1445;     bouval 30,40,25->15     23-Apr-86
	   * [mo]                                 bouval 30,40,25->15     23-Apr-86
	   * [mu] F1 204->332, F2  928->655;      bouval 30,40,25->15     23-Apr-86
	   * Changed boundary values back to original                     29-Apr-86
	   * so e.g. "mimi" doesn't sound like "nini"
	   */

		/* JAH - 5/94 Change all boundaries    */
			/* not bv realy as E_M appears to take on bv as formant value for itself */

	247, 30, 1124, 20, 2743, 40,	   /* A    */
	243, 30, 1100, 20, 2667, 40 - 15,  /* E    */
	234, 30, 1100, 20, 2850, 35,	   /* I    */
	234, 30, 907 - 80, 20, 2578 - 325, 25,	/* O    */
	235, 70, 880, 20, 2495, 25,  /* U    */

	  /* 
	   * E_N
	   *
	   */
	293, 40, 1280, 60, 2832, 40,	   /* A    */
	293, 40, 1300, 60, 2786, 30,	   /* E    */
	293, 40, 1850, 60, 2832, 30,	   /* I    */
	293, 40, 1400, 60, 2523, 40,	   /* O    */
	293, 40, 1280, 60, 2380, 60,	   /* U    */
	  /* 
	   * E_NH
	   * [nh] extra formant @ 900 Hz
	   *
	   * Note that [nh] is generated by inserting an [ix] phoneme:
	   */

	/* 244,  20, 2385,  50, 2999,  40,    /* A 208,  20, 2246,  20, 3131,  20,    /* E 182,  20, 2324,  10+30, 3212-200,  10+30,    /* I 182,  20,
	 * 2326,  20, 3116,  20,    /* O 180,  20, 2315,  20, 3086,  20,    /* U */

	244, 30, 1723, 30 + 30, 2665, 40,  /* A */
	208, 30, 2346 - 600, 30 + 30, 2746, 30,		/* E */
	182, 30, 2624 - 600, 30 + 30, 2724, 30,		/* I */
	182, 30, 2245 - 600, 30 + 30, 2726, 30,		/* O */
	180, 30, 2310 - 600, 30 + 30, 2315, 30,		/* U    */

	  /* 
	   * E_F
	   *
	   */

	725, 60, 1521, 60, 2644, 60,	   /* A    */
	475, 60, 1950, 60, 2810, 60,	   /* E    */
	250, 60, 2220, 60, 2743, 60,	   /* I    */
	424, 60, 1208, 60, 2813, 60,	   /* O    */
	356, 60, 985, 60, 2634, 60,		   /* U    */

	  /* 
	   * E_S
	   * [sa]        F1 580->605, F2 1777->1512, F3 2591->2610       23-Apr-86
	   */
	605, 60, 1271, 60, 2610, 60,	   /* A    */
	406, 60, 1923, 60, 2931, 60,	   /* E    */
	300, 60, 2288 - 400, 60, 2793 - 300, 60,	/* I    */
	478, 60, 1073, 60, 2636 - 200, 60, /* O    */
	326, 60, 1250, 60, 2532, 60,	   /* U    */
	  /* 
	   * E_J
	   * Note: the targets for [a] seem to shift after [j] to 750, 1280, 2157
	   * Check [ji] F3
	   * [je]         F1 497->577, F2 1868->2070, F3 2525->2597
	   * [je] F2: 2070->2200                                           1-May-86
	   * [ji] F2: 2539->2250 (trial) change in [i] target             24-Jul-86
	   */

		/* JAH [je] F1: 577 -> 500, F2: 2200 -> 1750, F3: 2297 */
		/* JAH [jo] F1: 577 -> 452, F3: 2376 -> 2676 */

	750, 70, 1347, 70, 2139, 70,	   /* A    */
	577 - 77, 70, 2200 - 450, 70, 2597 - 300, 70,	/* E    */
	339, 70, 2250, 70, 2843, 70,	   /* I    */
	577 - 125, 70, 829, 70, 2376 + 300, 70,		/* O    */
	404, 70, 750, 70, 2400, 70,		   /* U    */
	  /* 
	   * E_TH
	   *
	   * [tha] F1 616->605, F2 1419->1454, F3 2491->2509              17-Apr-86
	   * [tha] backed out above change                                22-Apr-86
	   * [thu] F1 475->361, F2 1484->1172, F3 2871->2603              23-Apr-86
	   * [thi] 273,50,2196,50,2675,50->298,40,2196,40,2675,40 DK?     24-Jul-86 ??
	   * (not sure if this was done by Dennis, Ed, or Martin)
	   */

	767, 30, 1652, 50, 2891, 50,	   /* A    */
	575, 50, 1688, 50, 3000, 50,	   /* E    */
	435, 40, 1649, 40, 3160, 40,	   /* I    */
	523, 50, 1724, 50, 3050, 50,	   /* O    */
	470, 50, 1621, 50, 2667, 50,	   /* U    */

	  /* 
	   * E_BH
	   *
	   * All durations changed to 20 msec.                            16-Apr-86
	   * All durations changed back to original "locus" dur's         29-Apr-86
	   * Note: the transition duration is much longer than the phoneme.
	   * this means that the F2 frequency won't actually reach the
	   * target before ramping to the next phoneme.
	   *
	   */
	656, 40, 1365, 30, 2983, 30,	   /* A    */
	560, 40, 1728, 30, 2734, 30,	   /* E    */
	362, 40, 2478, 30, 3023, 30,	   /* I    */
	501, 40, 1024, 30, 2700, 30,	   /* O    */
	303, 40, 881, 30, 2610, 30,		   /* U    */
	  /* 
	   * E_DH
	   *
	   * [da] F2 1273->1350                                           16-Apr-86
	   * [di] F2 1956->2050                                           14-Apr-86
	   * [de] F3 should be raised.  Problem might be in [e]           16-Apr-86
	   * All durations changed to 25 msec.                            16-Apr-86
	   * Backed out above changes                                     22-Apr-86
	   * Changed durations back to locus table entries                29-Apr-86
	   * [da] F2 1273->1350 (specto looks wrong)                       5-May-86
	   *
	   * [di] F1 208->300                                     DK      24-Jul-86
	   */
	626, 40, 1813, 55 - 20, 2981, 10 + 40,	/* A    */
	526, 35, 2107, 40, 2911, 50,	   /* E    */
	382, 35, 2649, 45, 3033, 20 + 50,  /* I    */
	492, 40, 1574, 55, 2874, 50,	   /* O    */
	424, 40, 1800, 55, 2838, 50,	   /* U    */

	  /* 
	   * E_GH
	   *
	   * [gh] F1 234->300          DK      24-Jul-86
	   */
	518, 50, 1901, 50, 2817, 70,	   /* A    */
	356, 45, 2478, 50, 2889, 50,	   /* E    */
	342, 45, 2676, 50, 2800, 50,	   /* I    */
	600, 50, 1450, 50, 2842, 70,	   /* O    */
	250, 50, 1380, 50, 2740, 70,		   /* U    */

	  /* 
	   * E_YH,
	   * Check [yhuyu]
	   * Values from running synthesizer.
	   */
	409, 60, 1756, 50, 2745, 50,	   /* A    */
	327, 60, 1955, 50, 2872, 50,	   /* E    */
	250, 60, 2060, 50, 3017, 50,	   /* I    */
	353, 60, 1606, 50, 2768, 50,	   /* O    */
	273, 60, 1519, 50, 2723, 50,	   /* U    */
	  /* 
	   * E_P
	   * Taken from synthesized
	   * [pe] F2 1918->1800
	   */

	679, 35, 1343, 25, 2861, 30,	   /* A    */
	594, 30, 1858, 25, 2772, 25,	   /* E    */
	594, 30, 2587, 25, 3184, 25,	   /* I    */
	460, 30, 1044, 30, 2713, 30,	   /* O    */
	426, 30, 881, 50, 2696, 30,		   /* U    */

	  /* 
	   * E_B
	   *
	   */
	628, 30, 1563, 35, 2651, 35,	   /* A    */
	543, 30, 1903, 30, 2787, 40,	   /* E    */
	424, 30, 2345, 30, 2838, 50,	   /* I    */
	560, 30, 1104, 30, 2923, 40,	   /* O    */
	441, 30, 1120, 30, 2669, 50,	   /* U    */

	  /* 
	   * E_T
	   * Taken from synthesized
	   * [ti] F2 2156->2225 per criticism of Miguel de Pablo:          8-Jul-86
	   * "ti" sounds between "ti" and "pi", not clear sound.
	   * [ti] F2 2225->2260 (still trying to fix above problem)       22-Jul-86
	   * [ta] F2 1585->1555 dur 35->30, F3 dur 30->20  (EB)           23-Jul-86
	   * [ti] F1 379->300 per Dennis                                  24-Jul-86
	   */

	767, 30, 1652, 50, 2891, 50,	   /* A    */
	459, 50, 2101, 50, 2970, 50,	   /* E    */
	435, 40, 2649, 40, 3160, 40,	   /* I    */
	523, 50, 1724, 50, 3050, 50,	   /* O    */
	470, 50, 1621, 50, 2667, 50,	   /* U    */

	  /* 
	   * E_D
	   *
	   */

	594, 40, 2141, 50, 3059, 50,	   /* A    */
	543, 50, 2464, 50, 3110, 50,	   /* E    */
	441, 50, 2566, 55, 3059, 55,	   /* I    */
	509, 40, 1631, 40, 2906, 40,	   /* O    */
	492, 50, 1600, 55, 2730, 60,	   /* U    */
	  /* 
	   * E_K
	   * Taken from synthesized
	   * [ki] F2 2208->2350, F3 2716->2900 (avoid conf. with [ti])    28-Apr-86
	   * [ki] F2 2350->2450
	   * f1 in keke from 473 to 600 f2 from 2132 to 1386
	   *                                                              1-Apr-86
	   * [ki] F2 2450->2350, F3 2900->2879 (otherwise it sounds velarized)
	   *                                                              27-May-86
	   * [ki] F2 2350->2250 (change in [i] target)                    24-Jul-86
	   */
	400, 50, 2074, 50, 2588, 50,	   /* A    */
	383, 45, 2475, 50, 3100, 70,	   /* E    */
	397, 45, 2710, 50, 3260, 50,	   /* I    */
	575, 45, 1324, 50, 2560, 70,	   /* O    */
	421, 45, 1045, 50, 2705, 70,	   /* U    */
	  /* 
	   * E_G
	   *
	   * [ga] F2 1458->1550, F3 2031->2150                            14-Apr-86
	   * [ge] F2 2234->2180, F3 2850->2750                            14-Apr-86
	   * [gi] F2 2296->2350                                           14-Apr-86
	   * [gu] F2  895-> 855                                           14-Apr-86
	   * Backed out above changes.                                    22-Apr-86
	   */

	580 - 148, 55, 1458 + 212, 55, 2031 - 113, 55,	/* A    */
	343 - 43, 50, 2363, 50, 2481, 50,  /* E    */
	259, 50, 2200, 55, 2590, 55,	   /* I    */
	439 - 7, 40, 948 + 158, 40, 2163 - 89, 40,	/* O    */
	326 + 60, 50, 950, 55, 2743, 55,   /* U    */

	  /* 
	   * E_CH
	   * Check trandur
	   * [a] targets 655 1627 2480
	   *
	   * trandur seems ok                                             14-Apr-86
	   * [cha] F1  750-> 700, F3 2545->2400                           14-Apr-86
	   * [che] F3 2519->2600                                          14-Apr-86
	   * [chi] F2 2363->2450                                          14-Apr-86
	   * [chu] F3 2461->2375                                          14-Apr-86
	   * Backed out above changes because of vowel target changes     22-Apr-86
	   * [cha] F1 750->700, F2 1693->1900, F3 2535->2650              24-Apr-86
	   * [che] F1 440->350, F2 2001->2100, F3 2519->2600              24-Apr-86
	   * [chi]              F2 2450->2550, F3 2841->2950              24-Apr-86
	   */
	700, 50, 1900, 50, 2650, 50,	   /* A    */
	350, 50, 2100, 50, 2600, 50,	   /* E    */
	286, 50, 2550, 50, 2950, 50,	   /* I    */
	460, 50, 1367, 50, 2422, 50,	   /* O    */
	313, 50, 1289, 50, 2461, 50,	   /* U    */
	  /* 
	   * E_Y
	   * [ya] F1 476->382     F2 1729->2178   F3 2692->2921           13-May-86
	   *          35->70           30->80          30->80
	   */

	382, 70, 2178, 80, 2921, 80,	   /* A    *//* @ 360 ms */
	357, 35, 1978, 30, 2847, 30,	   /* E    */
	250, 35, 2119, 30, 3022, 30,	   /* I    */
	396, 35, 1523, 30, 2720, 30,	   /* O    */
	281, 35, 1312, 30, 2650, 30,	   /* U    */

	  /* 
	   * E_R
	   * E_RR (and E_R (for now))
	   */

	380, 30, 1401, 30, 2427, 30,
	387, 40, 1403, 40, 2484, 40,
	387, 30, 1408, 30, 2562, 30,
	383, 30, 1409, 30, 2469, 30,
	348, 30, 1359, 30, 2266, 30,

	  /* 
	   * [E_L]
	   *
	   * Note: [l] appears to have an additional formant around
	   * 1200-1800 Hz at the consonant-vowel transition.
	   * This is most apparent in [li], [lo].  This "could"
	   * be modelled by widening the bandwidth of F2, but
	   * probably won't give the correct spectral shape.
	   *                                      *
	   *                                      * Not used -- placeholder only
	   *                                      *
	   */

		/* JAH - MAY2794 Change all values */

	375 + 100, 5, 1363 - 200, 40 - 10, 2441 + 100, 40 - 10,		/* A    */
	332 + 18, 40 - 10, 1768 - 68, 40 - 10, 2528 - 150, 40 - 10,		/* E    */
	313 - 25, 40 - 10, 2001 - 100, 30, 2473, 30,	/* I    */
	341 + 140, 40 - 20, 1320 , 40 - 10, 2523 - 25, 40 - 10,	/* O    */
	341 + 140, 40 - 10, 1320 - 250, 40, 2385 + 115, 40 - 10,	/* U    */

	  /* 
	   * E_LL
	   *                                      *
	   *                                      * Not used -- placeholder only
	   *                                      *
	   */
	287, 40, 1708, 40, 2431, 40,	   /* A    */
	303, 40, 1939, 40, 3077, 40,	   /* E    */
	208, 40, 2246, 40, 3008, 40,	   /* I    */
	336, 40, 1412, 40, 2198, 40,	   /* O    */
	273, 40, 898, 40, 2285, 40		   /* U    */
};

/* 
 * Table of pointers to the first entry in malbound[] for each
 * phoneme.  A zero value indicates "no entry"
 *
 * Note that E_RR and E_R point to the same entry.               7-Jul-86
 * Removed [r] and [rr]                                          8-Jul-86
 * Reorganized malbound[] and pbvalue[] to put all               8-Jul-86
 * "placeholder" entries at the end, so they can be removed easily.
 */
#define X       * BOUND_SIZE + 1	   /* Just saves typing            */

short                   fpbvalue[TOT_ALLOPHONES] =
{
	  /* SIL   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	0, 0, 0, 0, 0, 0, 0, 0,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
	19 X, 20 X, 21 X, 0 X, 1 X, 2 X, 3 X, 4 X, 5 X, 6 X,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B  E_T   E_D   E_K   E_G    */
	7 X, 8 X, 9 X, 10 X, 11 X, 12 X, 13 X, 14 X, 15 X, 16 X,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	17 X, 18 X, 19 X, 0,

#ifdef E_SH
	  /* E_Z   E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	6 X, 0, 0, 0, 0, 0, 0,
#endif

#ifdef E_V
	  /* E_Z   E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	6 X, 0, 0, 0, 0, 0, 0
#endif

};

#undef X

/* Parallel amps for obst before front, back, round, and nonsonor *                A2   A3   A4   A5   A6   AB * * A2   subtract cascade value (F2,
 * B2) * A3   add cascade value (F3, B3) * A4   subtract speaker-dependent, param F7 * A5   add around 4000 Hz (speaker dependent, param F8) * A6
 * subtract at high-frequency end * AB   wideband noise * * Note: to subtract from the high-frequency end, set A6 to (AB - 17). * Note, however, that 
 * this is a guess from looking at the evidence. */

short                   femamp[(21 * 24) + 1] =
{
	0,
	/* 
	 * E_F  front, back, round, nonsonor.
	 */

#if 0
		0 + 25, 34 - 9, 15 + 10, 0 + 20, 0, 30,
		0, 25 - 10, 25 - 10, 0, 0, 25,
		0, 24 - 10, 22 - 10, 0, 0, 22,
		0, 25 - 10, 25 - 10, 0, 0, 25,
#else
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 43,
		0, 0, 0, 0, 0, 43,
#endif

	/* 
	 * E_S  front, back, round, nonsonor.
	 *      Remeasured                                              22-Apr-86
	 * back         A2 0->33                                        22-Apr-86
	 *              A2 33->0                                        23-Apr-86
	 * round        A3 0->40, A4 50->40, A5 50->40, A6 45->40       22-Apr-86
	 *              A3 40->0, A4 40->0,  A5 40->0,  A6 0->50        23-Apr-86
	 * all A6 52-> 56, round A5 0->50                       DK      24-Jul-86
	 */
		0, 0, 0, 0, 52, 0,
		0, 0, 0, 0, 52, 0,
		0, 0, 0, 50, 54, 0,
		0, 0, 0, 0, 54, 0,
	/* 
	 * E_J  front, back, round, nonsonor.
	 * Lowered all values 5 db (suggestion from Dr. Quilis).
	 * Redone, old =                                        DK      24-Jul-86
	 *               22-5,  32-5,  42-5,  31-5,   0,   0,
	 *               40-5,  22-5,  42-5,  31-5,   0,   0,
	 *               32-5,  20-5,  42-5,  24-5,   0,   0,
	 *               20-5,  30-5,  39-5,  29-5,   0,   0,
	 */
		37-3, 0, 33-2, 0, 0, 0,
		37-3, 0, 33-2, 0, 0, 0,
		37-3, 0, 33-2, 0, 0, 0,
		37-3, 0, 33-2, 0, 0, 0,

	/* 
	 * * E_TH  front, back, round, nonsonor. *      Remeasured                                              24-Apr-86 * front        A3 30->20, A4
	 * 25->20, A5 25->20, AB 47->15       9-May-86 *              backed out above changes (sounds like [f])       9-May-86 */
		0, 0, 0, 0, 44, 47,
		0, 0, 0, 0, 44, 47,
		0, 0, 0, 0, 44, 45,
		0, 0, 0, 0, 44, 45,

	/* 
	 * E_YH front, back, round, nonsonor.
	 *
	 *      Use English [jh] values (temp)                           7-May-86
	 */

		0, 45, 61, 0, 44, 0,
		0, 45, 61, 0, 44, 0,
		0, 45, 56, 0, 38, 0,
		0, 45, 56, 0, 38, 0,

	/* 
	 * E_CH front, back, round, nonsonor.
	 *
	 * Remeasured                                                   17-Apr-86
	 * Too much low frequency energy                                23-Apr-86
	 * [che, chi]   A2 30->0, A3 29->39
	 * [cha]        A2 35->0, A3 29->39
	 * [cho, chu]   A2 35->0
	 * [ch nonson]  follows [cha]
	 */

		0, 39, 0, 0, 52, 0,
		0, 29, 0, 0, 52, 0,
		0, 39, 0, 0, 46, 0,
		0, 39, 0, 0, 46, 0,

	/* E_P     */
	/* 
	 * front 25,25,0,0,34,41 -> 0,0,0,0,40,57       DK      24-Jul-86
	 * Added 6 to other values, too.
	 *eab 93 seems too strong. high freq plus need some low feq.
	 *dennis wrong orig numbers closer
	 
	 0,   0,   0,   0,  34+6,   51+6, Use A6 = 44 to subtract
	 0,   0,   0,   0,  34+6,  51+6, a little energy at 5 kHz
	 0,   0,   0,   0,  34+6,  51+6, from typical AB spectrum
	 0,   0,   0,   0,  34+6,  51+6, */

		25, 25, 0, 0, 0, 0,
		25, 25, 0, 0, 0, 0,
		25, 25, 0, 0, 0, 0,
		25, 25, 0, 0, 0, 0,

	/* E_B     */
	/* 
	 * 10-Apr-86 MM, for U context, A4 (0->20), A5 (0->20)
	 * front: A6 35->28 try to hit "subtract" hack.  (16 db diff?)  16-Apr-86
	 
	 0,   0,   0,   0,  28,  42,
	 0,   0,   0,   0,  35,  42,
	 0,   0,  20,  20,  35,  42,   10-Apr
	 0,   0,   0,   0,  35,  42, not what I see eab 93 */

		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,
		0, 0, 10, 10, 0, 0,			   /* 10-Apr               */
		0, 0, 0, 0, 0, 0,

	/* E_T     */
	/* 
	 * Increased amplitude 2db for front and back, 19-Feb
	 * added f2 amplitudes 31-mar-86--eb
	 * increased 3rd form. 4 db on front and a little on other
	 * 4-apr-86 it was too weak relative to f2
	 * causing too much percieved retroflextion. Changed from 42+2,44+2,
	 * 44,44 to 48,48,46,46
	 * 5-19-86--changed a6 to 25 from 0 and a3 from 38 to 45
	 *
	 * Remeasured, old values were:                                 12-May-86
	 * Front:          30,  48,  55,  46,   0,   0,
	 * Back:           40,  50,  54,  52,  48,   0,
	 * Round:          30,  46,  54,  50,  48,   0,
	 * Nonsonor:       30,  46,  54,  50,  48,   0,
	 *
	 * More remeasurment                                            28-May-86
	 * Front        A2 40->45, A3 20->30, A4 25->35, A5 16->31, A6 48->40
	 * Back                    A3 56->46, A4 34->29, A5 37->32
	 * Round        A2 40->45
	 * Nonsonor follows round
	 *
	 * Front A6 40->48 to make it more 't' like.                    22-Jul-86
	 * Added AB noise 0->40                                         22-Jul-86
	 * Still not satisfactory, changed back to 12-May values with   24-Jul-86
	 * slight modifications (per Dennis).  Old values were:
	 *                 45,  30,  35,  31,  48,  40,
	 *                 46-5,  46-4,  29,  32,  33,  40,
	 *                 45,  51,  54,  40,  18,  40,
	 *                 45,  51,  54,  40,  18,  40,
	 
	 30-7,  48-7,  55-54,  46-7,   0,   0,
	 40-7,  50-7,  54-54,  52-7,  48-40,   0,
	 30-7,  46-7,  54-54,  50-7,  48-40,   0,
	 30-7,  46-7,  54-54,  50-7,  48-40,   0, */

		30 - 8, 48 - 10, 44, 48, 43, 0,
		40 - 8, 50 - 10, 44, 48, 43, 0,
		30 - 8, 46 - 10, 44, 48, 43, 0,
		30 - 8, 46 - 10, 44, 48, 43, 0,

	/* E_D     */
	/* 
	 * lowered hf energy A6 46->0                                   16-Apr-86
	 *
	 36-2,  44-2,  55-2,  46-2-20,     0,   0,
	 36-2,  46-2,  54-2,  52-2-20,     0,   0,
	 36-2,  44-2,  54-2,  50-2-20,     0,   0,
	 36-2,  44-2,  54-2,  50-2-20,     0,   0,  eab */

		32, 40, 30, 0, 0, 0,
		32, 40, 30, 0, 0, 0,
		32, 40, 30, 0, 0, 0,
		32, 40, 30, 0, 0, 0,		   /* eab */
	/* 5-20-86 found a6 for front had +40 changed to 0 and a5 frm 40 to 20 */
	/* E_K * Front 0, 40, 53, 20 -> 30, 45, 35, 20 (DK)                   24-Jul-86 */
		40, 0, 0, 40, 0, 0,
		40, 0, 0, 40, 0, 0,
		40, 0, 0, 40, 0, 0,
		40, 0, 0, 40, 0, 0,

	/* E_G     */

		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0,

	/* * new * */
	/* 
	 * E_Z front, back, round, nonsonor.
	 */
		0, 0, 0, 0, 45, 0,
		0, 0, 0, 0, 46, 0,
		0, 0, 0, 0, 47, 0,
		0, 0, 0, 0, 46, 0,

#ifdef E_SH
	/* 
	 * E_SH  front, back, round, nonsonor.
	 */
		0, 45, 62, 54, 45, 0,
		0, 45, 62, 54, 45, 0,
		0, 42, 57, 47, 36, 0,
		0, 43, 59, 52, 43, 0,
#endif

#ifdef E_V
	/* 
	 * E_V  from English DECtalk
	 */
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 43,
		0, 0, 0, 0, 0, 43,
#endif

	/* 
	 * E_IX                         NO LONGER USED -- PLACEHOLDER ONLY
	 */
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 45,
		0, 0, 0, 0, 0, 43,
		0, 0, 0, 0, 0, 43,
	/* 
	 * E_PH  front, back, round, nonsonor.
	 */
		0, 0, 0, 0, 0, 47,
		0, 0, 0, 0, 0, 47,
		0, 0, 0, 0, 0, 44,
		0, 0, 0, 0, 0, 44,
	/* 
	 * E_RR  front, back, round, nonsonor.
	 * NOTE: If you add resonances, be sure to change the trill code in PHDRAW.
	 *
	 * round AB 0->20                                               8-Jul-86
	 */
		20 - 5, 20 - 10, 0, 0, 0, 0,
		20 - 5, 20 - 10, 0, 0, 0, 0,
		20 - 5, 20 - 10, 0, 0, 0, 0,
		20 - 5, 20 - 10, 0, 0, 0, 0,

	/* 
	 * E_R  front, back, round, nonsonor.
	 *
	 * NOTE: if you add resonances, be sure to change the trill code in PHDRAW.C
	 *
	 * round AB 0->20                                                8-Jul-86
	 */
/* 20,  20,   0,   0,   0,   0, 20,  20,   0,   0,   0,   0, 20,  20,   0,   0,   0,  20, 20,  20,   0,   0,   0,   0,eab 5/94 try dif settings */

		20 - 5, 20 - 8, 0, 0, 0, 0,
		20 - 5, 20 - 8, 0, 0, 0, 0,
		20 - 5, 20 - 8, 0, 0, 0, 0,
		20 - 5, 20 - 8, 0, 0, 0, 0,

	/* 
	 * E_BH
	 * Increased [bi, be, bo, bu] and non-sonorant slightly to      14-May-86
	 * prevent "bobo" -> "bo[w]o".
	 * Decreased [bi] to prevent "bibi">[biwi]                      15-May-86
	 * [bu] too "buzzy", lowered hf slightly (A6 17->13, AB 37->33) 16-May-86
	 *      and raised A3 12->14
	 * AB 35,35,33,35->55                                   DK      24-Jul-86
	 *
	 0,  10,   0,   0,  15,  55,
	 0,  10,   0,   0,  15,  55,
	 0,  14,   0,   0,  13,  55,
	 0,  10,   0,   0,  15,  55,
	 eab 93 to me it seems like bypass noise much too loud. */

		0, 10, 0, 0, 15, 55 - 20,
		0, 10, 0, 0, 15, 55 - 20,
		0, 14, 0, 0, 13, 55 - 20,
		0, 10, 0, 0, 15, 55 - 20,

	/* 
	 * E_DH
	 * Remeasured                                                   14-May-86
	 * AB 0-> 55                                            DK      24-Jul-86
	 */
		10, 22 - 10, 13, 0, 0, 45 - 45,
		10, 24 - 10, 12, 0, 0, 45 - 45,
		10, 24 - 10, 12, 0, 0, 45 - 45,
		10, 24 - 10, 12, 0, 0, 45 - 45,

	/* 
	 * E_GH
	 * front A4 0->13                                               30-Apr-86
	 * Increase all values by 13                            DK      24-Jul-86
	 * A4 13,13,13,13->26,36,36,36
	 * A5 23,23,23,23->36,0,0,0
	 */
		0, 41 - 41, 26 - 20, 36 - 36, 0, 0,
		42 - 20, 0, 36 - 30, 0, 0, 0,
		41 - 20, 0, 36 - 30, 0, 0, 0,
		41 - 20, 0, 36 - 30, 0, 0, 0
};

/* Arrays that apply to both male and female voice */

short            femtar[TOT_ALLOPHONES * 7] =
{
	  /* 
	   * F1 Table.
	   *
	   * [l] F1 changed from 340 to 280                               12-Apr-1986
	   * [bh dh gh] targets redone:                                   14-Apr-86
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	-1, -2, -20, -38, -56, -74, 295, 300,

	  /* E_RR   E_L     E_LL     E_M   E_N     E_NH     E_F   E_S   E_J  E_TH   */
			/* nasal f1 increased unexplained "oilcan" sound assosiated */
		480, 280 + 60, 280 + 50, 221,  235+100, 215 + 150, 225, 290, 185, 275 + 175,
	  /* E_BH  E_DH     E_GH  E_YH   E_P       E_B   E_T   E_D   E_K   E_G   */
	329, 338, 300 - 50, 250, 350 - 100, 210, 350, 238, 470, 220,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		 475,   250,  480,  -1,
	  /* F1 of R changed from 480        */

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	240, 295, 400, 300, 500, 400, 300,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	240, 295, 400, 220, 500, 400, 300,
#endif

	  /* 
	   * F2 Table.
	   * All "dental" phonemes were changed 18-Oct-85
	   * Nasals changed 21-Nov-85
	   * 1/27/85 Nh appears to be more toward boundary value than N value
	   * i changed it from 2450 to 2200--eb
	   * Nh changed from 1800 to 1315 (4-Feb-86, MM)
	   * G and 
	   changed from 1790 to 2400 (18-Feb-86, MM, EB)
	   *
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
	-1, -8, -26, -44, -62, -80, 610, 2315,

/* E_RR     E_L   E_LL   E_M        E_N      E_NH    E_F   E_S   E_J  E_TH  */
	1743,  1280,  2200, 1244 + 200, 1350, 1800 + 100, 800, 1940, 1600, 2040,

	  /* E_BH  E_DH  E_GH  E_YH   E_P      E_B    E_T    E_D     E_K   E_G   */
	1312, 1737, 1970, 1760, 1800, 1735, 2182, 1600 - 105, 2336, 1300,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		2100,  2200,  1450, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	1420, 610, 1500, 1650, 2550 - 300, 1400, 1500,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                     */
	1420, 610, 1500, 1150, 2550 - 300, 1400, 1500,
#endif

	  /* 
	   * F3 Table.
	   * Changed NH from 3150 to 1465 (4-Feb-86, MM)
	   * Changed G, GH from 2400 to 2600, 18-Feb, MM)
	   * [m]  2140->2227                                              23-Apr-86
	   * [bh] 2335->2400                                              28-Apr-86
	   * [y]  3000->3050                                              13-May-86
	   * [yx] 3000->2900 (to match [i])                               15-May-86
	   * [rr] 2445->2550                                               8-Jul-86
	   * [r]  2470->2550                                               8-Jul-86
	   */
	  /* E_SI   E_A   E_E   E_I   E_O   E_U  E_WX  E_YX               */
				-1, -14, -32, -50, -68, -86, 2250, 2900,
/* E_RR    E_L  E_LL   E_M    E_N     E_NH    E_F          E_S   E_J  E_TH     */
	2550, 2710, 2815, 2457, 2904, 2300 + 330, 2915 - 200, 3072, 2400, 2120 + 660,

/*  E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G */
	2610, 2800, 2782, 3000, 2716, 2150, 2888, 2789, 2400, 2600,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	     2700, 3050, 2550, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	2600, 2250, 2400, 2550, 3050 - 200, 2500, 2500,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX  E_V   E_IX  E_MX  E_PH                     */
	2600, 2250, 2400, 2080, 3050 - 200, 2500, 2500,
#endif

	  /* 
	   * B1 Table.
	   */
	  /* E_SI   E_A   E_E   E_I     E_O     E_U      E_WX  E_YX               */
	250, 170 + 30, 80, 70 - 5, 70 + 80, 80 + 30, 50, 60,

/* E_RR     E_L        E_LL  E_M   E_N  E_NH    E_F   E_S   E_J  E_TH   */
	200, 60 + 20 + 10, 60,   120,   120,  100 + 5, 300, 300, 300, 300,

	  /* E_BH  E_DH     E_GH  E_YH   E_P   E_B      E_T   E_D   E_K   E_G   */
	80, 60 + 70, 90 + 50, 125, 300, 90 + 10, 300, 60, 200, 90,

	  /* E_CH   E_Y   E_R   E_Q                                       */
	      250,  80,  200,  -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	140, 50, 90, 300, 120, 90, 300,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	140, 50, 90, 140, 120, 90, 300,
#endif

	  /* 
	   * B2 Table.
	   * Decreased nh bandwidth slightly form 350 to 325-1/27/85--eb
	   * Set [bh dh gh] bandwidths to match [b d g]                   14-Apr-86
	   * [r, rr] 150->60                                               7-Jul-86
	   */
	  /* E_SI   E_A   E_E   E_I     E_O   E_U  E_WX  E_YX               */
	250, 100 + 50, 150, 170 + 100, 180 + 50, 80, 80, 170,

/* E_RR   E_L    E_LL  E_M   E_N  E_NH       E_F   E_S   E_J  E_TH   */
	60, 150 -80, 200,  150,  350, 325 + 100, 150,  150,  150, 150,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	160, 130, 120, 175, 150, 80, 150, 80 + 50, 160, 120,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		 250,	120,	60, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	100, 80, 250, 100, 170, 250, 150,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V   E_IX  E_MX  E_PH                    */
	100, 80, 250, 120, 170, 250, 150,
#endif

	  /* 
	   * B3 Table.
	   * [bh dh gh] bandwidths set to [b d g]                         14-Apr-86
	   *     [bh] 120->130
	   *     [dh] 120->240
	   *     [gh] 180->180
	   * [bh] 130->90         trying to raise formant peak            16-Apr-86
	   * [yx] 200->240 (to match [i])                                 15-May-86
	   * [bh] 90->130 (else bibi sounds like [biwi])                  15-May-86
	   * [r, rr] 250->130                                              7-Jul-86
	   */
	  /* E_SI   E_A		  E_E		  E_I       E_O  E_U  E_WX  E_YX               */
		250,	200 + 50, 240 + 60, 240 + 120, 150,  250, 80, 240,
/* E_RR   E_L      E_LL   E_M   E_N       E_NH       E_F   E_S   E_J  E_TH   */
	130, 100 + 20, 400,   150, 250 + 100, 350 + 100, 150, 150, 150, 150,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B   E_T   E_D   E_K   E_G   */
	130 + 50, 240, 180, 175, 180, 130, 250, 240, 280, 180,

	  /* E_CH   E_Y   E_R   E_Q                                       */
		250,	200, 130, -1,

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	300, 80, 150, 300, 240 + 20, 150, 150,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                     */
		300, 80, 150, 120, 240, 150, 150,
#endif

	  /* 
	   * AV Table.    Sonorant amplitude changed from 64 to prevent overload.
	   * R and RR amplitude changed from 48 to 61, 4-Feb-86
	   */
	  /* E_SI    E_A     E_E        E_I    E_O     E_U    E_WX  E_YX               */
			0, 62 - 3,	 62-2,		60 , 60 - 1, 62 + 2, 62, 62-3,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH   */
		   63-15,  58,   59,    62,  60,   62,    0,    0,    0,   0,

	  /* E_BH  E_DH  E_GH  E_YH   E_P   E_B    E_T   E_D   E_K   E_G   */
		 50, 60 - 10, 62,   0,     0, 30 - 10, 0,    30,    0, 30 + 5,

	  /* E_CH   E_Y   E_R   E_Q          Voicebar for B,D,G           */
			0,	 58,  63-2, 0,					   /* set by rules in phsettar.c   */

#ifdef E_SH
	  /* E_Z    E_W  E_NX  E_SH   E_IX  E_MX  E_PH                    */
	56, 62, 60, 0, 62, 60, 0,
#endif

#ifdef E_V
	  /* E_Z    E_W  E_NX   E_V  E_IX  E_MX  E_PH                     */
	56, 62, 60, 56, 62 - 10, 60, 0,
#endif

};

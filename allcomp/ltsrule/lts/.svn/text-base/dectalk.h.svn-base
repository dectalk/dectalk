/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1985, 1996, 1997. All rights reserved.
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
 *    File Name:	dectalk.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * 	  This header file is used
 * 	  by all parts of DECtalk III. This file
 * 	  includes all the changes needed to run
 * 	  with the new syntnesizer.
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 01   DGC		01/19/1985		Removed "undef vax" for DHK.
 * 02   DGC		01/31/1985		Added "PTSYNC".
 * 03   DGC		02/12/1985		Modified error syndromes. Deleted "NTASK".
 *                      		Added diagnostic states.
 * 04   DGC		02/13/1985		Added definition for ABO "test ok" flag.
 *                      		Changed the power-up mode definitions to
 *                      		ignore W11. Put firmware version code into
 *                      		this file, so "dialup" can get it.
 * 05   DK		02/22/1985		[M] is no more. It's slot is now used by
 *                      		D_DENTALIZED.
 * 06   DGC		03/05/1985		Ripped out all of the clock queue stuff.
 *                      		Moved the definition of the NUDPHON from
 *                      		"lsdef.h" to here, where it belongs.
 * 07   DGC		03/06/1985      Changed the test and sync codes fed to
 *                      		the SPC again.
 * 08   DGC		03/11/1985		Changes to the I/O map to deal with
 *                      		the bugs in the DTMF chip. The "option
 *                      		present" moved to SWJMPR. The "tone valid"
 *                      		is brought in where "option present" was
 *                      		in GPIO (read).
 * 09   DGC		03/19/1985		Added some definitions to deal with the
 *                      		call progress detection system.
 * 10   DGC		04/04/1985		Added support for 150 baud and the SNUSECR
 *                      		option switch.
 * 11   DGC		04/10/1985		Added the definitions for the option module.
 * 12   DGC		04/17/1985		Added default versus 0 stuff to "SEQ".
 *                      		Added the "PPARSE" structure.
 * 13   DGC		04/29/1985		Added a subfunction code for testing the
 *                      		TLI cadence detector.
 * 14   DGC		04/30/1985		Rearranged the switches so that the
 *                      		"factory default" is all switches open.
 * 15   DGC		05/10/1985		W11 => NNOTIME
 * 16   DGC		06/07/1985	    "ef" => "lx" in speaker definition.
 * 17   DGC		06/18/1985   	"g5" => "lo" in speaker definition.
 * 18   DGC		06/19/1985      Added a new telephone subfunction code to
 *                      		request reduced level DTMF bursts during the
 *                      		self tests.
 * 19   DGC		08/08/1985    	Put the NTASK back. Needed by the new code
 *                      		for sync.
 * ------------------   Released as C5005 V1.0 firmware.
 * 20   DGC		10/21/1986	    Changes for KRM.
 * 21   DGC		04/06/1987	    Bumped firmware revision to 1.1
 * 22   DGC		05/06/1987	    Added KRMMOD conditional for real KRM module.
 * 23   eab		11/22/1989	    updated for new krm build added bch define
 *                      		added nkr define
 * 24   eab		01/16/1990	    Remove bch def. all version now support
 *								sprate to 550.
 * 25	cjl		12/15/1994	 	Added pre-processor code to prevent duplicates.
 * 26	gl		04/04/1996	 	Added debug flag to support the debug command.
 */

#ifndef DECTALKH
#define DECTALKH 1

#define EOS               0             /* Some folks like to use this  */
#define NINTER           10             /* Intermediates, ANSI sequence */
#define NPARAM           10             /* Parameters, ANSI sequence    */
#define NSTRING         254             /* Control string, < 256        */
#define NUDPHON         100             /* User phonemes,  < 128 (byte) */
#define NLPIPE          250             /* # of words in LTS pipe       */
#define NKPIPE          250             /* # of words in KLSYN pipe     */
#define MSHZ             10             /* Basic clock is 10 ms.        */
#define TANDY             0             /* TRUE for the Tandy.          */
#define DTCXX             0             /* TRUE for DECtalk 3.5         */

#define KRM               0             /* Defined if Kurzweil.         */
#define KRMMOD            0             /* TRUE if Kurzweil hardware.   */

#define NKR               0             /* define foR new krm           */
#define FWREV            13             /* V1.0, VT240 style.           */

typedef char    FLAG;                   /* A nice type for a Boolean    */


/*
 * This structure is used to
 * pass pre-parsed ANSI control sequences around
 * inside DECtalk. This is a little bit different from the
 * old version of the structure. The default-ness of a parameter
 * used to be implied in its zero value. Now there is an array
 * of default flags (the "s_dflag" field) that carries this
 * information.
 */

typedef struct  SEQ  {
	int             s_type;         /* Type code.                   */
	char    s_badf;                 /* TRUE if sequence is bad.     */
	char    s_pintro;               /* Non zero if private intro.   */
	short   s_nparam;               /* # of parameters.             */
	short   s_ninter;               /* # of intermediates.          */
	short   s_param[NPARAM];        /* Parameters.                  */
	char    s_dflag[NPARAM];        /* Default parameter flags.     */
	char    s_inter[NINTER];        /* Intermediates.               */
	char    s_final;                /* Final.                       */
}       SEQ;

/*
 * The "PPARSE" structure defines the
 * inpure area used by the finite state machine phoneme
 * parser that lives in "com2.c". This is used by the communication
 * line task, the user dictionary code, and the option task.
 * It will be used soon by the local terminal task.
 */

typedef struct PPARSE_struc     {
	short   p_state;                /* Parse state.                 */
	short   p_nbuf;                 /* # of entries in "p_buf".     */
	short   p_buf[4];               /* "dhx<1,2>" is the longest.   */
} PPARSE;       


#define PERFECT_PAUL            0   /* Index into voice tables      */
#define BEAUTIFUL_BETTY         1
#define HUGE_HARRY              2
#define FRAIL_FRANK             3
#define DOCTOR_DENNIS           4
#define KIT_THE_KID             5
#define UPPITY_URSULA           6
#define ROUGH_RITA              7
#define WHISPERY_WILLY          8
#define CRAFTY_CHRIS            9
#define VARIABLE_VAL            10

/*
 *  pipe connection codes ...   supports up to 32 languages
 */

#define LTS_PIPE                0x00
#define PH_PIPE                 0x20

/*
 * debug switch :
 * bit  15  CMD module
 *      14  LTS module
 *      13  PH  module
 *      12  VTM module
 *    11-0  12 debug points
 */

#define CMD_DBG       0x8000
#define LTS_DBG       0x4000
#define PH_DBG        0x2000
#define VTM_DBG       0x1000

#define DT_DBG(section, code) \
		((pKsd_t->debug_switch & section) && (pKsd_t->debug_switch & code))

#define DTT_DBG(section, code) \
                ((KS.debug_switch & section) && (KS.debug_switch & code))



#endif

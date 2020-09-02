/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	c_us_cde.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality: Language-dependent code 
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who     Date            Description
 * ---	-----   -----------     --------------------------------------------
 * 001	gl		04/4/1996		add debug command.   
 * 002  gl      08/1/1996       change cmd_power() and cmd_version() to
 *                              cmd_cmd_power() and cm_cmd_version()
 * 003	gl		08/29/1996		add skip command and skip option
 * 004	gl		10/29/1996		add mode table option
 * 005  gl		11/21/1996		add command [:gender ..]
 * 006  gl		11/27/1996		add "lspeak" option for power_options[]
 * 007  ncs     1/28/1997         c_format field MUST be in quotes!!! (dtpc_command table)
 * 008  gl		02/04/1997		add mode_email option
 * 009  gl      02/06/1997		add skip_email option
 * 010  gl      03/27/1997		for BATS#317
 *                              add "us" option for [:lang] command
 * 011	tek		12nov97			bats404: new index options (SAPI transport)
 * 012  gl		03/25/1998		Added DBGV command for debug variable passing
 * 013  gl      04/27/1998      Added glottal speeds DV command support.
 * 014	MFG		04/23/1998		added dbglog option for debug logging 
 * 015	gl		12/02/1998		BATS#751 add more language support for [:lang] command 
 * 016	GL		12/17/1998		BATS#846 add say_fletter mode to skip control character 
 * 017  EAB		10/28/1999		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 * 018	MGS		07/14/2000		Sapi 5 additions
 * 019	NAL		07/14/2000		Added additional :pron flags for homographs
 * 020 	CAB		10/16/2000		Changed copyright info
 * 021	MGS		02/28/2001		Added volume att command for attenuation
 * 022	MGS		02/21/2002		Added Trial SDK noise
 * 023	MGS		04/11/2002		ARM7 port
 * 024	CAB		05/01/2002		Updated copyright info
 * 025	MFG		09/19/2002	 	Added support for new chris voice
 */

#ifndef CUSCDEH
#define CUSCDEH 1
	
/* Used in cm_cmd_phoneme() */
const unsigned char *phoneme_modes[] = {
	"asky",
	"arpabet",
	"speak",
	"silent",
	"off",
	"on",
	0
};

/*  
 *	Used in cm_cmd_log()
 *  log flags are used to send text back to the user in some way shape or
 *  form ... all are immediate commands ...
 */
const unsigned char *log_options[] = {
	"text",
	"phonemes",
	"types",
	"forms",
	"syllables",
	"outphon",
	"dbglog",		/* MFG 04/23/1998 added option for debug logging */
	"on",
	"off",
	"set",
	0
};
 
/* 
 * Used in cm_cmd_say()
 * Say flags are used to control how the word is broken up
 */

const unsigned char *say_options[] = {
	"clause",
	"word",
	"letter",
	"filtered_letter",
	"line",
	"syllable",
	0
};            

/* 
 * Used in cm_cmd_error()
 * Error flags are used to control how errors are processed
 */

const unsigned char *error_options[] = {
	"ignore",
	"text",
	"escape",
	"speak",
	"tone",
	0
};

/*
 * Used in cm_cmd_flush()
 *
 */

const unsigned char *flush_options[] = {
	"all",
	"until",
	"mask",
	"after",
	"speech",
	0
};

/*
 *  Used in cm_cmd_punct()
 *  Punctuation flags are used to control how punctuation characters
 *  are dealt with ...
 */

const unsigned char *punct_options[] = {
	"none",
	"some",
	"all",
	"pass",
	0
};

/*
 *  Used in cm_cmd_skip()
 *  Punctuation flags are used to control how punctuation characters
 *  are dealt with ...
 */

const unsigned char *skip_options[] = {
	"none",
	"email",
	"punct",
	"rule",
	"all",
	"cpg",
	0
};

/*  
 *  Used in cm_cmd_volume()
 *  Option parameters for volume command.
 */

#ifndef MSDOS
/*
 *  change the volume 
 */

const unsigned char *volume_options[] = {
	"set",
	"up",
	"down",
	"lset",
	"lup",
	"ldown",
	"rset",
	"rup",
	"rdown",
	"sset",
	"att",
	0
};

#else

const unsigned char *volume_options[] = {
	"set",
	"up",
	"down",
#ifdef SW_VOLUME /* eab 10/9 99 added the "tone" option */
	"tone",
#endif /* SW_VOLUME */

	0
};
#endif // MSDOS

/*  
 *  Used in cm_cmd_language()
 *  change to an alternately loaded language ...
 */
/* GL 03/27/1997 for BATS#317 add "us" option */
/* GL 12/02/1998 for BATS#751 add more language option */
const unsigned char *lang_options[] = {
	"english",
	"british",
	"french",
	"german",
	"spanish",
	"latin_amercian",
	"us",
	"uk",
	"fr",
	"gr",
	"sp",
	"la",
	0
};

#ifdef DTEX
/*  
 * Used in cm_cmd_power()
 * things related to the battery and external power..
 */
const unsigned char *power_options[] = {
	"speak",	// say the power status.
	"interval",	// interval to repeat batt-low beeps (0=don't beep)
	"status",	// send back the power status.
	"sleep",	// time to wait before sleeping.. 
	"check",	// beep if batt low.
	"lspeak",	// say the power status in loader.c .
	0
	};

/* 
 * Used in cm_cmd_version()
 * version stuff
 */
const unsigned char *version_options[] = {
	"speak",
	"status",
	0
	};
                                 
/*  
 * Used in cm_cmd_tsr()
 * [:tsr  stuff
 */
const unsigned char *tsr_options[] = {
	"on",
	"off",
	0
	};
#endif /* DTEX */

/* Used in cm_cmd_mode() */
const unsigned char *mode_options[] = {
	"math",
	"europe",
	"spell",
	"name",
	"homograph",
	"citation",
	"latin",
	"table",
	"email",
	"on",
	"off",
	"set",
	0
};
 
/* Used in cm_cmd_pronounce() */
const unsigned char *pronounce_options[] = {
	"alternate",
	"name",
	"primary",
	"noun",
	"verb",
	"adjective",
	"function",
	"interjection", 
	0
};

/*  
 *  Used in cm_cmd_name()
 *  set the speaking voice ...
 */
#ifndef EPSON_ARM7
const unsigned char *voice_names[] = {
	"paul",
	"betty",
	"harry",
	"frank",
	"dennis",
	"kit",
	"ursula",
	"rita",
	"wendy",
	"chris",
	"val",
	0
}; 
#endif

/*  
 *  Used in cm_cmd_mark()
 *  process index commands ...
 */

const unsigned char *index_options[] = {
	"mark",
	"reply",
	"query",
	"pause",
#ifdef _WIN32	//tek 12nov97 bats404 new index types
	"bookmark",
	"wordpos",
	"start",
	"stop",
	"sentence",
	"volume",
	"noise",
#endif //_WIN32
	0
};

const unsigned char *gender_options[] = {
	"masculine",
	"neuter",
	"feminine",
	0
};

/* 
 * Used in cm_cmd_define()
 * new, complete define voice ...
 */

const unsigned char *define_options[] = {
	"save", /* make the changes permanent */
	"sx",   /* SEX = m */
	"sm",   /* SM (smoothness in %, actually spectral tilt offset) */
	"as",   /* AS (assertiveness, degree of final f0 fall in % */
	"ap",   /* AP (Average pitch in Hz) */
	"pr",   /* PR (pitch range in percent of Paul's range) */
	"br",   /* BR (breathiness in dB) */
	"ri",   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	"nf",   /* NF (additional fixed number of samples in nopen) */
	"la",   /* LA (laryngealization, in percent) */
	"hs",   /* HS (head size, in percent relative to normal for SEX) */
	"f4",   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	"b4",   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	"f5",   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	"b5",   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	"f7",   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	"f8",   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	"gf",   /* GF (gain of frication source in dB) */
	"gh",   /* GH (gain of aspiration source in dB) */
	"gv",   /* GV (gain of voicing source in dB ) */
	"gn",   /* GN (gain of input to cascade nasal pole pair in dB) */
	"g1",   /* G1 (gain of input to cascade 5th formant in dB) */
	"g2",   /* G2 (gain of input to cascade 4th formant in dB) */
	"g3",   /* G3 (gain of input to cascade 3rd formant in dB) */
	"g4",   /* G4 (gain of input to cascade 2nd formant in dB) */
	"g5",   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	"ft",   /* FT (f0-dependent spectral tilt in % of max) */
	"bf",   /* BF (baseline f0 fall in Hz) */
	"lx",   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	"qu",   /* QU (quickness of larynx gestures in % of max quickness) */
	"hr",   /* HR (hat-pattern fundamental frequency rise in Hz) */
	"sr",	/* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	"ago",   /* average voiced glottal opening */
	"agvo",	//delta for a voiced obstruent
	"aguo",  //delta for an unvoiced obstryuent
	"chink",
	"oq",
	0
};

/* HELPME check cm_data.h for the cm element and correct its size for ARM7 */

const struct dtpc_command command_table[] = {
	{"rate","d",1,DCS_RATE,cm_cmd_rate},
	{"latin","d",1,DCS_LATIN,cm_cmd_latin},
#ifdef EPSON_ARM7
	{"name","d",1,DCS_NAME,cm_cmd_name},
#else
	{"name","a",1,DCS_NAME,cm_cmd_name},
    {"np","",0,DCS_NAME_PAUL,cm_cmd_name},
    {"nb","",0,DCS_NAME_BETTY,cm_cmd_name},
    {"nc","",0,DCS_NAME_CHRIS,cm_cmd_name},
    {"nh","",0,DCS_NAME_HARRY,cm_cmd_name},
    {"nf","",0,DCS_NAME_FRANK,cm_cmd_name},
    {"nd","",0,DCS_NAME_DENNIS,cm_cmd_name},
    {"nk","",0,DCS_NAME_THE_KID,cm_cmd_name},
    {"nu","",0,DCS_NAME_URSULA,cm_cmd_name},
    {"nr","",0,DCS_NAME_RITA,cm_cmd_name},
    {"nw","",0,DCS_NAME_WILLY,cm_cmd_name},
    {"nv","",0,DCS_NAME_VAL,cm_cmd_name},
#endif
	{"comma","d",1,DCS_COMMA,cm_cmd_comma},
	{"cp","d",1,DCS_COMMA,cm_cmd_comma},
	{"period","d",1,DCS_PERIOD,cm_cmd_period},
	{"pp","d",1,DCS_PERIOD,cm_cmd_period},
	{"volume","add",3,DCS_VOLUME_SET,cm_cmd_volume},
#ifdef MSDOS
#ifdef SW_VOLUME //eab 10/6/99 added the lockheed martin tone volume
	{NULL_COMMAND,"",0,DCS_VOLUME_TONE,cm_cmd_volume},
#endif
#endif // MSDOS

	{"vs","d",1,0,cm_cmd_vs},
#ifdef MSDOS
    {NULL_COMMAND,"",0,DCS_VOLUME_UP,cm_cmd_volume},
    {NULL_COMMAND,"",0,DCS_VOLUME_DOWN,cm_cmd_volume},
#endif
	{"index","add",2,DCS_INDEX,cm_cmd_mark}, // tek bats404 add another parameter
#ifdef MSDOS
    {NULL_COMMAND,"",0,DCS_INDEX_REPLY,cm_cmd_mark},
    {NULL_COMMAND,"",0,DCS_INDEX_QUERY,cm_cmd_mark},
#endif
	{"error","a",1,DCS_ERROR,cm_cmd_error},
	{"phoneme","aaa",3,DCS_PHONEME,cm_cmd_phoneme},
	{"log","aa",2,DCS_LOG,cm_cmd_log},
	{"mode","aa",2,DCS_MODE,cm_cmd_mode},
	{"say","a",1,DCS_SAY,cm_cmd_say},
	{"punctuation","a",1,DCS_PUNCT,cm_cmd_punct},
	{"skip","a",1,DCS_SKIP,cm_cmd_skip},
	{"pause","d",1,DCS_PAUSE,cm_cmd_pause},
#ifndef MSDOS
#ifndef ARM7
	{"play","a",1,0,cm_cmd_play},
#endif
#endif // MSDOS
	{"resume","",0,DCS_RESUME,cm_cmd_resume},
	{"sync","",0,DCS_SYNC,cm_cmd_sync},
#ifdef MSDOS
	{"flush","ad",2,DCS_FLUSH,cm_cmd_flush},
	{"enable","",1,DCS_ENABLE,cm_cmd_enable},
#ifdef SW_VOLUME //eab 10/6/99 added the lockheed martin tone volume
	{"mtone","dddd",4,0,cm_cmd_mtone},
#endif
#endif // MSDOS
	{"dial","a",1,DCS_DIAL,cm_cmd_dial},
	{"tone","dd",1,DCS_TONE,cm_cmd_tone},
#ifdef MSDOS
	{"timeout","d",1,DCS_TIMEOUT,cm_cmd_timeout},
#endif
	{"pronounce","aa",2,DCS_PRONOUNCE,cm_cmd_pronounce},
#ifdef MSDOS
        {"digitized","",0,DCS_DIGITIZED,cm_cmd_digitized},
	{"language","a",1,DCS_LANGUAGE,cm_cmd_language},
	{"remove","",1,DCS_REMOVE,cm_cmd_remove},
	/*   Not used anymore - KM 4/29/94     
	 * {"type","da",2,DCS_TYPE,cm_cmd_type}, 
	 */
#endif // MSDOS
	{"pitch","d",1,DCS_STRESS,cm_cmd_stress},
	{"define_voice","ad*",2,DCS_DEFINE,cm_cmd_define},
	{"dv","ad*",2,DCS_DEFINE,cm_cmd_define},
    {"debug","h",1,DCS_DEBUG,cm_cmd_debug},
	{"setv","d",1,0,cm_cmd_setv},
	{"loadv","d",1,0,cm_cmd_loadv},
	{"gender","a",1,DCS_GENDER,cm_cmd_gender},

	{"preamble","d",1,0,cm_cmd_preamble},
#ifdef DBGV_ON
	{"dbgv","dddddddddd",1,DCS_DBGV,cm_cmd_dbgv},
#endif

#ifdef MSDOS
	{"clk_rate","d",1,DCS_CPU_RATE,cm_cmd_cpu_rate},
	{"code_page","d",1,DCS_CODE_PAGE,cm_cmd_code_page},
	{"plang","d",1,0,cm_cmd_plang},
        {"break","a",1,DCS_BREAK,cm_cmd_break}
#ifdef DTEX
	,{"power","ad",2,0,cm_cmd_power},
        {"version","a",1,0,cm_cmd_version},
        {"tsr","a",1,0,cm_cmd_tsr}
#endif /* DTEX */
#endif // MSDOS
};

#define TOTAL_COMMANDS  (sizeof(command_table)/sizeof(struct dtpc_command))

const int total_commands = TOTAL_COMMANDS;                         

#ifdef MSDOS
short cm[TOTAL_COMMANDS+1];                             /* command match parse array */
#endif

#ifdef ARM7
//short cm[TOTAL_COMMANDS+1];                             /* command match parse array */
#endif
#endif // CUSCDEH

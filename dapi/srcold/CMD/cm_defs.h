/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computers Inc., a Solectron company. All rights reserved.
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
 *    File Name:    cm_defs.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Contains all #define statements 
 *
 ***********************************************************************
 *    Revision History:
 *
 *  Rev Name    Date        Description
 *  --- -----   ----------- --------------------------------------------
 *  001 MGS     04/22/1996  	added WIN32 CMD_ defines and MSDOS #ifdef's
 *  002 MGS     05/31/1996  	removed SPDEF sectiion of defines, they are in cmd.h 
 *  003 SIK     10/10/1996  	Added old char type definitions to work with 
 *                          	VOCAL code build
 *  004 GL      12/02/1996  	Add "RESET" symbol definition.
 *  005 GL		12/04/1996  	Add SKIP_cpg
 *  006 GL		02/06/1997  	Add SKIP_email
 *  007 tek		12nov97			bats404: new index control codes (SAPI transport)
 *								also merged in MGS 10/17/97change to cmd.def
 *  008 MGS		04/13/2000		Changes for integrated phoneme set
 *  009 MGS		07/14/2000		Sapi 5 additions
 *  010 NAL		07/14/2000		Added additional :pron flags for homographs
 *  011 CAB		10/16/00		Changed copyright info
 *  012 MGS		02/28/2001		Merged in base changes needed for ACCESS32 merge
 *  013 MGS		02/21/2002		Added Trial SDK noise
 *  014 CAB		05/03/2002		Removed redundant code
 *	015	MFG		07/01/2003		moved MAX RATE from ttsapi.c to here for bug BTS#10102
 *	016	MFG		07/16/2003		added Period Pause limits for bug BTS#10100
 *
 */
 
#ifndef CMDEFSH
#define CMDEFSH 1

#ifndef PFUSA
#define PFUSA       0x1E    /* Used for phonemic code passing thru pipe */
#endif

#ifdef MSDOS
#define NULL ((unsigned void *) 0)
#endif

#ifdef ACCESS32
#define  MIN_SPEAKING_RATE   50			// Slowtalk for Kurtzweil
#else
#define  MIN_SPEAKING_RATE   75
#endif	/* ACCESS32 */

#define  MAX_SPEAKING_RATE  600

#define MIN_PERIOD_PAUSE	-420
#define MAX_PERIOD_PAUSE	30000


/*
 *  command parser control states ...
 */

#define STATE_NORMAL		0	/* passing characters */
#define STATE_BRACKET		1	/* found a [ */
#define STATE_COMMAND		2	/* found [: */
#define STATE_PHONEME		3	/* found [, no :, in phonemic */
#define STATE_PARAM			4	/* matched command, parsing */
#define STATE_TOSS			5	/* bad [:, waiting for ] */
#define STATE_KEEP			6	/* hold parse data */

#define NULL_COMMAND            ((unsigned char *)0)
#define NUM_INTER               20                      /* Intermediates, ANSI sequence */
#define NUM_PARAM               20                      /* Parameters, ANSI sequence    */

#define SP      (*pCmd_t->esc_seq)
#define CT      command_table

/*
 *  params are stored in this global array for all the routines to see, if
 *  a number is desired, then that number is in the proper array index, if
 *  a string is the parameter, then the array index is an index into the
 *  string buffer ...  params[] stores the parameters ... next_param tells
 *  how many of the parameters the user entered and acts as a pointer
 *  into the array for the parameters ...       p_count counts the characters
 *  entered for this command ... p_flag is used to store state about numeric
 *  and string parases
 */

#define CURR_PARAM              (pCmd_t->params[pCmd_t->param_index])
#define CURR_DEFAULT            (pCmd_t->defaults[pCmd_t->param_index])
#define PUSH_PHONE              (pCmd_t->params[pCmd_t->param_index++])
#define CURR_PHONE              (pCmd_t->params[pCmd_t->param_index - 1])
#define FORMAT_PARAM            (CT[pCmd_t->cmd_index].c_format[pCmd_t->format_index])

/*
 *  parameter string buffers ... the string buffer is used to save string
 *  based parameters, note for this to properly wrap, it must be a power
 *  of two ...  the next char pointer continues counting but will store only
 *  STRING_MAX characters ...
 */

#define STRING_MAX              (0x200)
#define STRING_MASK             (0x1ff)
/*
#define STRING_BYTE             string_buff[next_char & STRING_MASK]
#define PUSH_BYTE               string_buff[next_char++ & STRING_MASK]
*/

/*
 * command error codes ...
 */
#ifdef MSDOS
#define CMD_success             0
#define CMD_bad_string          1
#define CMD_bad_value           2
#define CMD_bad_command         3
#define CMD_bad_param           4
#define CMD_bad_phoneme         5
#define CMD_flushing            6

#else

#define CMD_success                      0
#define CMD_bad_string                   1
#define CMD_bad_value                    2
#define CMD_bad_command                  3
#define CMD_bad_param                    4
#define CMD_bad_phoneme                  5
#define CMD_out_of_memory                6
#define CMD_unable_to_open_file          7
#define CMD_bad_wave_file_format         8
#define CMD_unsupported_wave_file_format 9
#define CMD_unsupported_audio_format     10
#define CMD_flushing                     11

#endif

#define NO_STRING_MATCH         0xffff

/*
 *  error processing modes ...
 */

#define ERROR_ignore            0
#define ERROR_text              1
#define ERROR_escape            2
#define ERROR_speak             3
#define ERROR_tone              4

/*
 *  punctuation modes ...
 */

#define PUNCT_none              0
#define PUNCT_some              1
#define PUNCT_all               2
#define PUNCT_pass              3

/*
 *  skip modes ...
 */

#define SKIP_none               0
#define SKIP_email              1
#define SKIP_punct              2
#define SKIP_rule               3
#define SKIP_all                4
#define SKIP_cpg                5

/*
 *  min/max things ...
 */

#define MAX_VOICES              11
#define MIN_RATE               100
#define MAX_RATE               550

#define MARK_null              0x00		/* null marker for place holder */
#define MARK_vowel             0x01		/* has a vowel */
#define MARK_upper             0x02		/* has an upper */
#define MARK_cons              0x04		/* has a consonant*/
#define MARK_digit             0x08		/* has a digit */
#define MARK_non_alpha         0x10		/* has a non-alpha character */
#define MARK_punct             0x20		/* has some MARK of punctuation */
#define MARK_clause            0x40		/* punctuation used as clause terminator */
#define MARK_space             0x80		/* white space character */

#ifdef VOCAL 
/* SIK 10/10/96 Added old char type definitions to work with VOCAL code */
#define TYPE2_null              0x0000                    /* null marker for place holder */
#define TYPE2_vowel             0x0001                    /* has a vowel */
#define TYPE2_upper             0x0002                    /* has an upper */
#define TYPE2_cons              0x0004                    /* has a consonant*/
#define TYPE2_digit             0x0008                    /* has a digit */
#define TYPE2_non_alpha         0x0010                    /* has a non-alpha character */
#define TYPE2_punct             0x0020                    /* has some type of punctuation */
#define TYPE2_clause            0x0040                    /* punctuation used as clause terminator */
#define TYPE2_space             0x0080                    /* white space character */
#define TYPE2_number            0x0100                    /* char can be part of number */
#endif /* VOCAL */

/*
 * Rule engine variables
 */
 
#define MAXRULES  500

// CAB Added define from .\include\cmd.h to avoid defining more than once
#ifndef CMDH
#define PUNUSED     0x8000      /* This bit is unused       */
#define PNEXTRA     0x6000      /* # of extra words (0 - 3) */
#define PFONT       0x1F00      /* Font code (0 - 31)       */
#define PVALUE      0x00FF      /* The actual code value    */

#define PSNEXTRA    13      	/* Shift for "PNEXTRA"      */
#define PSFONT      8       	/* Shift for "PFONT"        */

#define PFASCII     0x00        /* ASCII_G/Multinational    */
#define PFCONTROL   0x1F        /* Control font         	*/


/*
 * Phoneme definitions for the control set. The definitions include the
 * font bits. They do not include the number of extra words bits. These are 
 * added by parser when the parameters are parsed.
 */

#define RATE					((PFCONTROL<<PSFONT)+0)
#define CPAUSE					((PFCONTROL<<PSFONT)+1)
#define PPAUSE					((PFCONTROL<<PSFONT)+2)
#define LAST_VOICE				((PFCONTROL<<PSFONT)+3)
#define LTS_SYNC				((PFCONTROL<<PSFONT)+4)
#define NEW_SPEAKER				((PFCONTROL<<PSFONT)+5)
#define NEW_PARAM				((PFCONTROL<<PSFONT)+6)
#define SAVE					((PFCONTROL<<PSFONT)+7)
#define INDEX					((PFCONTROL<<PSFONT)+8)
#define INDEX_REPLY				((PFCONTROL<<PSFONT)+9)
#define SYNC					((PFCONTROL<<PSFONT)+10)
#define BREATH_BREAK			((PFCONTROL<<PSFONT)+11)
#define KILL_TASK				((PFCONTROL<<PSFONT)+12)
#define FLUSH_SYNC				((PFCONTROL<<PSFONT)+13)
#define PITCH_CHANGE			((PFCONTROL<<PSFONT)+14)
#define LATIN					((PFCONTROL<<PSFONT)+15)
#define PAPAUSE					((PFCONTROL<<PSFONT)+16)
#define CNTRLK					((PFCONTROL<<PSFONT)+17)
#define RESET					((PFCONTROL<<PSFONT)+18)
//#ifdef _WIN32 // tek 12nov97 bats 404 new index control codes
// WARNING: these are also in cmd.h!
#define	INDEX_BOOKMARK			((PFCONTROL<<PSFONT)+19)
#define	INDEX_WORDPOS			((PFCONTROL<<PSFONT)+20)
#define	INDEX_START				((PFCONTROL<<PSFONT)+21)
#define	INDEX_STOP				((PFCONTROL<<PSFONT)+22)

#define	INDEX_SENTENCE			((PFCONTROL<<PSFONT)+24)
#define	INDEX_VOLUME			((PFCONTROL<<PSFONT)+25)
#define	INDEX_NOISE  			((PFCONTROL<<PSFONT)+26)
//#endif //_WIN32
#define WORD_CLASS				((PFCONTROL<<PSFONT)+23)
#define PREAMBLE				((PFCONTROL<<PSFONT)+27)

/*
 *  commands synchronous to lts have these as a second parameter ...
 */

#define LTS_MODE_SET			 0
#define LTS_MODE_CLEAR			 1
#define LTS_MODE_ABS			 2
#define LTS_DIC_ALTERNATE		 3
#define LTS_ACNA_NAME			 4
#define LTS_DIC_PRIMARY			 5
#define LTS_DIC_NOUN			 6
#define LTS_DIC_VERB			 7
#define LTS_DIC_ADJECTIVE		 8
#define LTS_DIC_FUNCTION		 9
#define LTS_DIC_INTERJECTION	10

/*
 *  when we flush, we need to know wether or not to toss the next
 *  few characters out ...
 */

#define CMD_flush_toss      1
#define CMD_flush_sync      2
#define CMD_flush_done      3
#define CMD_sync_char       0xff
#define CMD_sync_out        0xfe

/*  
 *  voice table indexes...
 */

/* CAB Removed redundant code
#define PERFECT_PAUL        0
#define BEAUTIFUL_BETTY     1
#define HUGE_HARRY			2
#define FRAIL_FRANK			3
#define DOCTOR_DENNIS       4
#define KIT_THE_KID			5
#define UPPITY_URSULA       6
#define ROUGH_RITA			7
#define WHISPERY_WILLY      8
#define VARIABLE_VAL        9
*/

/*
 * Symbolic names for the parameters of
 * a voice. These are the used in the first extra
 * word of a "NEW_PARAM" phoneme. They index into tables
 * in "klvdef.c" and "klvset.c". Be careful if you change
 * any of them; there are tables that have to be
 * edited. Three new ones on the end.
 */
#endif // CMDH


/* define the DTMF tones to be 1600 samples on and 600 samples off */
/* (160/60 ms) */
#define DTMF_OFF    (600)
#ifdef DTPC2
#define DTMF_ON     (1600>>4)
#else /*DTPC2*/
#define DTMF_ON     (1600)
#endif /*DTPC2*/

#define NWDTMF      10

#endif  /* CMDEFSH */
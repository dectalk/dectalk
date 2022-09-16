/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *		Copyright, Digital Equipment Corporation, 1995
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
 *    File Name:	kernel.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Kernel interface includes ... this file defines values, structures,
 *  and routines that are needed to interface to the kernel ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001  TEK		07/06/1995		initial for DTPC-II  
 * 002  TEK		07/14/1995		added gpio images for dtpcII
 * 003  TEK		08/09/1995		rationalized with DTPC1 stutter changes.
 * 004	TEK		12/13/1995		merge DTEX.
 * 005	MGS		03/26/1995		Merge WIN32 code 2 fields added to share data
 * 006	GL		04/08/1996      Add debug_switch for debug command
 * 007  MGS     05/01/1996		Added typedefs for kernel share data structure 
 * 008  GL		11/22/1996		Add gender_switch for gender command
 * 009	TEK		04/02/1997      BATS 278; add pcsSpcPktSave
 * 010	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 011  tek     04/02/1997		add critical section for spc_pkt_free (bats 278)
 * 012	tek		06/09/1997		typing changes
 * 013  ncs     07/29/1997      OCTEL changes
 * 014  MGS		09/08/1997		Made change for osf build
 * 015  GL      09/25/1997      change the dictionary pointer structure to support
 *                              UK_english and language expansion
 * 016	tek		13nov97			bats404: index transport changes (aug97)
 * 017	tek		21nov97			bats530: interlock variables for VTM pipe
 * 018	gl		03/25/1998		Added DBGV command for PH debug variable passing
 *								add dbgv[] kernel variable
 * 019	MFG		04/22/1998		log file pointer added for dttest debug(FILE *)
 * 020	MGS		05/22/1998		Added index types to __osf__ build
 * 021	MFG		06/18/1998		Added LANG_latin_american changed MAX_langages to 7 
 * 022	tek		24aug98			ConvertToPhoneme support
 * 023	ETT		10/12/1998		Added some linux code
 * 024	ETT		11/19/1998	fixed stuff for osf...
 *	
 ********************************************************************/

#ifndef  kernel_defs
#define  kernel_defs 1

#include "port.h"
#ifdef MSDOS
#include "libp.h"
#include "kernp.h"
#endif

#define VOID_FP volatile void _far *

/*
 *  what a pcb looks like ...
 */

typedef struct PCB_struct {

	volatile        struct pcb _far *link;
	volatile        struct pcb _far *priority;
	volatile        unsigned int    saved_sp;
	volatile        unsigned int    saved_ss;
	volatile        unsigned int    saved_ds;
	volatile        unsigned int    mem_seg;
	volatile        unsigned int    mem_off;
	volatile        unsigned int    scratch[8];
} PCB;

#define NULL_PCB        ((PCB _far *)0L)
#define P_PCB           volatile        PCB _far *
#define ALLOCATE_STACK                  0000

/*
 *   ... semaphore ...
 */

typedef struct SEMAPHORE_struct {
  volatile        unsigned int value;
  P_PCB         queue;
} SEMAPHORE;

#define P_SEMAPHORE     volatile SEMAPHORE _far *

/*
 *  a queue semaphore ...
 */

typedef struct  queue_semaphore {
	volatile        struct queue_semaphore  _far *head;
	volatile        struct queue_semaphore  _far *tail;
	P_PCB           process;
} QUEUE_SEMAPHORE;

#define P_QS    volatile QUEUE_SEMAPHORE _far *
#define NULL_QS ((QUEUE_SEMAPHORE _far *)0L)

/*
 *  ... a gate ...
 */

typedef struct GATE_struct {
	volatile        int             value;
	volatile        int             state;
	P_PCB           block_queue;
	P_PCB           wait_queue;
} GATE;

#define P_GATE  volatile GATE _far *
#define NULL_PIPE       ((PIPE _far *)0L)

/*
 *   ... a pipe ....
 */

#ifdef _PIPE
#undef _PIPE
#endif

#ifdef MSDOS

#define _PIPE

typedef struct PIPE_struct {

	volatile        void _far *             link;
	P_PCB           get_queue;
	P_PCB           put_queue;
	volatile        int                     size;
	volatile        int                     id;
	volatile        int                     count;
	volatile        unsigned int            head;
	volatile        unsigned int            tail;
	volatile        unsigned char           buff[1];
} PIPE;

#endif /* MSDOS */

#ifdef WIN32
#define _PIPE

#ifndef _WINDOW_H
#define _WINDOW_H
#include <windows.h>
#endif

// tek 30apr97 some debugging stuff..
#ifdef _DEBUG
extern FILE *fpODS_File;
#undef OutputDebugString
#define OutputDebugString(x) {\
	if (!(fpODS_File)) \
		fpODS_File = fopen("odslog.log","w"); \
	fprintf(fpODS_File,"%s",x); \
  } \


#define ODSFlush()

#else //_DEBUG
#undef OutputDebugString
#define OutputDebugString(x)
#define ODSFlush()
#endif //DEBUG
#include "pipe.h"
#endif //WIN32

/* GL 04/21/1997  add this for OSF build */
#if defined __osf__ || defined __linux__
#define _PIPE
#include "opthread.h"
#include "pipe.h"
#endif

#ifndef _PIPE
typedef struct PIPE_struct {
	/* opaque data type */
	int dummy;
} PIPE;
#endif

// tek 30apr97 some debugging stuff..
#if defined __osf__ || defined __linux__
#ifdef _DEBUG
#ifdef __linux__
#define timeGetTime() (unsigned long)(time(NULL))
#endif
extern FILE *fpODS_File;
#undef OutputDebugString
#define OutputDebugString(x) {\
	if (!(fpODS_File)) \
		fpODS_File = fopen("odslog.log","w"); \
	fprintf(fpODS_File,"%s",x); \
  } \
#else //DEBUG
#undef OutputDebugString
#define OutputDebugString(x)
#ifdef __linux__
#undef timeGetTime()
#define timeGetTime()
#endif
#endif // _DEBUG
#endif // __osf__ || __linux__

/* GL 04/21/1997 add this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
typedef  PIPE_T  PIPE;
typedef  LPPIPE_T  P_PIPE;
#endif

#ifdef MSDOS
#define P_PIPE          volatile PIPE _far *
#endif

/*
 *  ... a memory block ...
 */

struct memory_block     {

	volatile        struct memory_block _far *link;
	volatile        int                                                     paras;
};

#define NULL_MEM        ((struct memory_block _far *)0L)

/*
 *  ... a ring buffer ...
 */

typedef struct RING_struct      {

	volatile        void    _far                            *put_que;
	volatile        void    _far                            *get_que;
	volatile        void    _far                            *lock_que;
	volatile        int                                             size;
	volatile        int                                             head;
	volatile        int                                             tail;
	volatile        int                                             count;
	volatile        int                                             key;
	volatile        unsigned char                   buff[1];

} RING;
#define P_RING          volatile RING _far *

/*
 *  flush index max flag ...
 */

#define HUGE    (9999)           /* Bigger then NPHON_MAX   */

/*
 *  spc control structures, defines, etc ...
 */
#ifdef _WIN32 //tek 01aug97 bats 404 index transport
// break the packet type field down into two parts; the 
// low nibble is the actual packet type, and the high 
// nibble is the subtype. Define the subtypes here, so we
// don't lose track..
#define SPC_TYPE_MASK			(0x00ff) 
#endif //_WIN32

#define SPC_type_voice                  0
#define SPC_type_speaker                1
#define SPC_type_tone                   2
#define SPC_type_test                   3
#define SPC_type_nop                    4
#define SPC_type_digitized              5
#define SPC_type_mixed                  6
#define SPC_type_index                  7
#if defined _WIN32 || defined __osf__ || defined __linux__ /* tek 01aug97 index subtypes for the new messages */
#define		SPC_subtype_bookmark	(0x0100) // this is already shifted.
#define		SPC_subtype_wordpos		(0x0200)
#define		SPC_subtype_start		(0x0300)
#define		SPC_subtype_stop		(0x0400)
#endif //_WIN32
#define SPC_type_sync                   8
#define SPC_type_flush                  9
#define SPC_type_flush_sync            10
#define SPC_type_force                 11
// tek 26aug97 tyoe_visual isn't ever sent to the VTM, but is used
// for consistency in the Sync path when we're doing visual marks; 
// it needs to be unique among the SPC controls, so define it here to
// make sure we don't forget it.
#define SPC_type_visual					(128)


#define SPC_flush_all                   0
#define SPC_flush_until         1
#define SPC_flush_mask                  2
#define SPC_flush_after         3

#define SPC_mode_text                   0
#define SPC_mode_digital                1

/*
 *  text to speech spc packets ...
 */

#define MAX_SPC_DATA            32
/*#define       MAX_SPC_PACKETS 1024 eab 2/18/94 6.4 seconds of speech too long
change to smaller number*/
#ifdef MSDOS
#ifndef DTEX
#define MAX_SPC_PACKETS 400 /* tek 8/9/95 */
#else
#define MAX_SPC_PACKETS 128
#endif
#else
#define MAX_SPC_PACKETS 128
#endif

#ifdef MSDOS

struct  spc_packet      {
	volatile        struct spc_packet _far  *link;                                  /* thread to next */
	volatile        unsigned int                            high_addr;                              /* high physical address */
	volatile        unsigned int                            low_addr;                               /* low physical address */
	volatile        unsigned int                            length;                                 /* length of data in packets */
	volatile        unsigned int                            type;                                           /* type code for packet */
	volatile        unsigned int                            data[MAX_SPC_DATA];     /* caller supplied data */
};

#else

struct  spc_packet      {
  volatile  struct spc_packet _far *link;                                       /* thread to next */
  volatile  void *        high_addr;    /* high physical address */
  volatile  void *        low_addr;     /* low physical address */
  volatile  unsigned int  length;       /* length of data in packets */
  volatile  unsigned int  type;         /* type code for packet */
  volatile  unsigned int  data[MAX_SPC_DATA];  /* caller supplied data */
};

#endif

#define SPC_DATA_OFFSET (12)                            /* offset to data array in struct in bytes */
#define SPC_PACKET_POOL ((sizeof(struct spc_packet)*(MAX_SPC_PACKETS/16))+1)
#define NULL_SPC_PACKET ((struct spc_packet _far *)0L)

/*
 *  digitized data spc packets ...
 */

#define MAX_DGT_PACKETS                         16
#define DGT_WORDS_PER_FRAME                     65
#define DGT_BYTES_PER_FRAME                     130
#define MAX_DGT_FRAMES                                  8
#define MAX_DGT_DATA                                    (DGT_WORDS_PER_FRAME*MAX_DGT_FRAMES)

struct  dgt_packet      {

	volatile        struct dgt_packet _far  *link;                                  /* thread to next */
	volatile        unsigned int                            high_addr;                              /* high physical address */
	volatile        unsigned int                            low_addr;                               /* low physical address */
	volatile        unsigned int                            length;                                 /* length of data in packets */
	volatile        unsigned int                            data[MAX_DGT_DATA];     /* caller supplied data */
};

#define DGT_DATA_OFFSET (12)                            /* offset to data array in struct in bytes */
#define DGT_PACKET_POOL ((sizeof(struct dgt_packet)*(MAX_DGT_PACKETS/16))+1)
#define NULL_DGT_PACKET ((struct dgt_packet _far *)0L)

/*
 *  multi-language support ...
 */
/* GL 09/25/1997 add LANG_british also change MAX_langages to 6 */
/* added LANG_latin_american changed MAX_langages to 7 mfg 6/18/98 */
#define LANG_english            0x0000
#define LANG_french                     0x0001
#define LANG_german                     0x0002
#define LANG_spanish            0x0003
#define LANG_japanese           0x0004
#define LANG_british            0x0005
#define LANG_latin_american		0x0006
#define LANG_none                       0xffff
#define MAX_languages           7

#define LANG_lts_ready          0x1
#define LANG_ph_ready           0x2
#define LANG_map_ready          0x4
#define LANG_tables_ready       0x4
#define LANG_both_ready         0x7


struct  dtpc_code_pages {

	struct  dtpc_code_pages _far     *link;
	int                               dos_id;
	unsigned char _far               *translation_page;

};

struct  dtpc_language_tables    {
	struct  dtpc_language_tables    _far    *link;
#ifdef MSDOS
	unsigned int							lang_id;
#else
	int                                     lang_id;
#endif
	unsigned char _far *                    lang_ascky;
	int                                     lang_ascky_size;
	unsigned int _far *                     lang_reverse_ascky;
	unsigned char _far *                    lang_arpabet;
	int                                     lang_arpa_size;
	int                                     lang_arpa_case;
	unsigned char _far *    _far *          lang_typing;
	unsigned char _far *    _far *          lang_error;
};

#define NULL_CP ((struct dtpc_code_pages _far *)0L)
#define NULL_LT ((struct dtpc_language_tables _far *)0L)


typedef struct language_tables  {

	unsigned char _far *                            lang_ascky;
	unsigned char _far * _far *     lang_arpa;
	unsigned char _far *                            char_map;
	unsigned char _far *                            char_types;
	unsigned char _far *                            char_lower;
	unsigned char _far *                            char_upper;
	unsigned char _far *                            char_feat;
	unsigned char _far * _far *     type_table;
	unsigned        char _far * _far *      error_table;
} LANG_TABLES;

#define P_LANG  volatile        LANG_TABLES     _far *

#define ASCKY_MAP               (*((*lang_tables[lang_curr]).lang_ascky))       
#define ARPA_MAP                        (*((*lang_tables[lang_curr]).lang_arpa))        
#define CHAR_MAP                        (*((*lang_tables[lang_curr]).char_map))
#define CHAR_TYPES              (*((*lang_tables[lang_curr]).char_types))
#define CHAR_LOWER              (*((*lang_tables[lang_curr]).char_lower))
#define CHAR_UPPER              (*((*lang_tables[lang_curr]).char_upper))
#define CHAR_FEAT               (*((*lang_tables[lang_curr]).char_feat))
#define TYPE_TABLE              (*((*lang_tables[lang_curr]).type_table))
#define ERROR_TABLE             (*((*lang_tables[lang_curr]).error_table))
	

/*
 * ASYNC change flags ...
 */

#define ASYNC_voice                             0x0001
#define ASYNC_rate                              0x0002
#define ASYNC_period                    0x0004
#define ASYNC_comma                             0x0008
#define ASYNC_rate_delta                0x0010

/*
 *  phonemic modes ...
 */

#define PHONEME_OFF                     0x1                     /* not parsing phonemes */
#define PHONEME_ASCKY           0x2                     /* parse type ascky or arpabet */
#define PHONEME_SPEAK           0x4                     /* phonemes are spoken */

#ifdef DTEX
#define VERSIONLEN (80)
#define SPEAKLEN   (190)
#endif /* DTEX */

/**********************************************************
 *  kernel shared data ... a single common far pointers is
 *  linked via the kernel stub into every runtime image that
 *  that is loaded ... this image contains common system wide
 *  variables that other routine will access.
 **********************************************************/

/*
 * platform dependent typedef of a DICTIONARY REFERENCE
 */

#ifdef MSDOS
typedef volatile unsigned int _far *DICT_REF;
typedef volatile S32 DICT_SIZ;
#endif

#ifndef MSDOS
typedef struct dic_entry **DICT_REF;
typedef unsigned int DICT_SIZ;
#endif

/****************************************************************/
/*        KERNEL SHARE DATA STRUCTURE DEFINITION                */
/****************************************************************/
// MVP: The structure name is to be changed from share_data to kernel_share_data

struct share_data {

/*
 *  user dictionary control ...
 */

/*
 * GL 06/19/1997 use array structure for all dictionary entry data
 */
	volatile        unsigned int far     *fdic[MAX_languages];                   /* pointer to installed dictionarys */
#ifdef MSDOS
	volatile        long                 fdic_entries[MAX_languages];            /*   total entries in dictionarys */
#else
	volatile        S32                  fdic_entries[MAX_languages];            /*   total entries in dictionarys */
#endif
	volatile        unsigned int far     *udic[MAX_languages];                   /* pointer to installed dictionarys */
#ifdef MSDOS
	volatile        long                 udic_entries[MAX_languages];            /*   total entries in dictionarys */
#else
	volatile        S32                  udic_entries[MAX_languages];            /*   total entries in dictionarys */
#endif
	volatile        unsigned int far     *adic[MAX_languages];                   /* pointer to installed dictionarys */
#ifdef MSDOS
    volatile		long 				 adic_entries[MAX_languages];
#else
	volatile        S32                  adic_entries[MAX_languages];             /*   total entries in dictionarys */
#endif

/*
 *  character i/o control ...
 */

	volatile        SEMAPHORE                                       print_sem;                                      /* output sync */
	P_RING                                                                  in_ring;                                                /* character input */
	P_RING                                                                  out_ring;                                       /*   and output */
	volatile        int                                                     eight_bit;                                      /* eight bit escape sequences */

	volatile        SEMAPHORE                                       isa_sem;                                                /* isa interface interrupt */
	volatile        SEMAPHORE                                       flush_sem;                                      /* flush synchronization */
	volatile unsigned int                           isa_status;                                     /* status of module on isa bus */
/*
 *  current language interprocess pipes ...
 */
	P_PIPE          lts_pipe;               /* lts pipe input */
	P_PIPE          ph_pipe;                /* ph pipe input */
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
	P_PIPE          cmd_pipe;               /* cmd input  */
	P_PIPE          vtm_pipe;               /* vtm input  */
	P_PIPE          sync_pipe;              /* sync input */
	P_PIPE          buffer_pipe;            /* Used to pass buffers */
/* MGS 09/08/1997 change this for the osf build */
#ifdef WIN32
	// 16jun97 tek bats385 (delay return of "remaining buffers"
	P_PIPE			buffer_delay_pipe;		/* holding tank for returning buffers */
	// tek 21nov97 BATS 530 provide a secondary interlock on the
	// pipe draining process to avoid deadlock
	volatile BOOL	bVtmDrainRequested;		/* EmptyVTMPipe wants the pipe.*/
	volatile BOOL	bVtmIsReadingPipe;		/* VTM is in the pipe critical section */
	LPCRITICAL_SECTION	pcsVtmPipeRead;		/* tek 16may97 for atomic read of vtm pkts*/
#endif
#endif

/*
 *  language specific pipes and enables ...
 */

	volatile        int                     lang_curr;      
	volatile        int                     lang_ready[MAX_languages];
	P_PIPE                                  lang_lts[MAX_languages];
	P_PIPE                                  lang_ph[MAX_languages];
	P_LANG                                  lang_tables[MAX_languages];

/*
 *  process flush flags ...
 */

	volatile        int                                                     cmd_flush;                                      /* flush cmd output */
	volatile int                                                    text_flush;                                     /* flush text and phones but not commands */
	volatile        int                                                     halting;                                                /* panic halt */
	volatile        int                                                     pause;                                          /* spc output stalled */
#ifdef MSDOS
	volatile 		int												spc_flush_reset;
#endif
/*
 *  index control ...
 */
#ifndef MSDOS
	volatile        struct spc_packet * spc_pkt_save;
#ifdef WIN32
	LPCRITICAL_SECTION	pcsSpcPktSave;	/* tek 6mar97 bats 278 protect this linked list */
#endif
#endif
	volatile        QUEUE_SEMAPHORE                         index_pending;                          /* indexes waiting for flush */
	volatile        QUEUE_SEMAPHORE                         index_active;                           /* indexes waiting to print*/
	volatile        unsigned int                            lastindex;                                      /* last flushed index */

/*
 *  spc flags ...
 */

	volatile        int                                                     spc_mode;                                               /* digital or text mode */
	volatile int                                                    spc_flush;                                              /* flush all packets */
#ifdef MSDOS
    volatile		int												spc_ffinish;
    volatile unsigned int											spc_flush_value;
#else
	volatile        int                                             spc_flush_value;                                /* mask or search value */
#endif

	volatile        int                                                     spc_flush_type;                         /* style of flush */
	volatile        QUEUE_SEMAPHORE                         spc_pool;                                               /* free queue */
	volatile        QUEUE_SEMAPHORE                         spc_active;                                             /* packets queued to the spc */
	volatile        QUEUE_SEMAPHORE                         dgt_pool;                                               /* free queue */
	volatile        QUEUE_SEMAPHORE                         dgt_active;                                             /* packets queued to the spc */

	volatile        SEMAPHORE                                       spc_sync;                                               /* where sync callers block ... */
	volatile        SEMAPHORE                                       spc_resume;                                             /* where spc process blocks for pauses */
	volatile        SEMAPHORE                                       spc_dma;                                                        /* dma0 semaphore */
	volatile        SEMAPHORE                                       text_sync;                                              /* where text to speech waits */
#ifdef MSDOS
	volatile		SEMAPHORE								getc_empty;
#endif

/*
 *  misc settings ...
 */

	volatile        unsigned int                            modeflag;                                       /* current running mode */
	volatile        unsigned int                            logflag;                                                /* current logging mode */
	volatile        unsigned int                            sayflag;                                                /* how to break up input text */
	volatile        unsigned int                            pronflag;                                       /* how to say input text */
	volatile        unsigned int                            phoneme_mode;                                   /* how to interpret user phonemes */
	volatile        unsigned int                            wbreak;                                         /* generate wbound pauses */
	volatile        unsigned int                            input_timeout;                          /*      input character timeout */
	volatile        int                                                     volume;                                         /* current module volume */

#ifdef DTEX
	/* things that only the express uses.. */
	P_RING					p_out_ring;
	volatile unsigned short int command;
	volatile unsigned short int in_data;
	volatile unsigned short int out_data;

	volatile short int 					l_verbose;
	volatile short int					power_interval;
        volatile short int                                      sleep_interval;
	volatile long int					idleseconds;		   /* how long we've been idle.. */
	volatile short int					idleflag;			   /* cleared when anything is done */
	volatile short int					spc_sleeping;		   /* spc has been shut down. */
        volatile short int                                      spc_waking;                         /* the spc is awakened, waiting for speakerdef. */

	volatile unsigned char version[VERSIONLEN];
	volatile unsigned char versionspeak[SPEAKLEN];
	volatile unsigned short int			sc_flush;              /* single-char flush req. */
	volatile unsigned short int			dleseq_OK;
#endif /*DTEX*/

/*
 * The following 6 elements are added for Multiple instances :MVP
 */

/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS
    volatile short  sprate;
    volatile short  last_voice;
#else  
	short           last_voice;         /* used by API,VTM,PH */
	short           sprate;             /* used by API,PH */
	short           uiCurrentSpeaker;  /* Current speaker,used by API,VTM*/
	DWORD           dwLastPhoneme;      /* used by VTM,PH */
	U32             uiSampleRate;      /* used by vtm,ph,cmd*/
	double          SamplePeriod;     /*Used by VTM,SYNC threads*/
#endif
/*
 *  async change flags ...
 */

	volatile int                                                            async_change;                           /* async speech change request */
	volatile        int                                                             async_voice;
	volatile        int                                                             async_rate;
	volatile        int                                                             async_period;
	volatile        int                                                             async_comma;
	volatile int _far *                                             speaker;                                                /* current speaker def settings */
/*
 *  quick changes  ...
 */

	volatile int    pitch_delta;

#ifdef MSDOS
/*
 *  DOS code page translations ...
 */

	volatile unsigned char                  code_page[256];
	volatile struct dtpc_code_pages _far    *loaded_code_pages;
#endif 
/*
 *  common iso tables ...
 */

	volatile        unsigned char          iso_to_upper[256];
	volatile unsigned char                 iso_to_lower[256];

/*
 *  language specific user interface tables ...
 */

	volatile struct dtpc_language_tables _far *loaded_languages;
	volatile unsigned char _far *        ascky;
	volatile        int                  ascky_size;
	volatile unsigned int _far *         reverse_ascky;
	volatile unsigned char _far *        arpabet;
	volatile int                         arpa_size;
	volatile int                         arpa_case;
	volatile unsigned char _far * _far *    typing_table;
	volatile unsigned char _far *   _far *  error_table;
	
#ifdef DTPC2
/* images of read-only registers */
	volatile unsigned short              gpio0_image;
	volatile unsigned short              gpio2_image;
#endif		

/*
 *      debug switch for debug command. GL 4/8/96
 */
		volatile unsigned short         debug_switch;

/*
 *      gender switch for gender command. GL 11/22/96
 */
		volatile unsigned short         gender_switch;

/*
 *      dbgv[] for dbgv command.         GL 03/25/98
 */
#ifdef DBGV_ON
		volatile short					dbgv[10];
#endif
	
		
/*
 *	log file pointer for dttest		 MFG 04/22/98
 */
#ifdef MSDOS

		volatile int *dbglog;
#else 
		volatile FILE *dbglog;
#endif


#ifdef WIN32
		volatile unsigned short			ph_reload;
		volatile unsigned short			ph_group;
#endif
#ifdef TYPING_MODE
		volatile BOOL					bInTypingMode;
#endif //TYPING_MODE
#ifndef MSDOS
	// tek 20aug98 this is needed so that ls_util_write_pipe can log phonemes
	PVOID			phTTS;	// should be LPTTS_HANDLE_T, but we can't see that.
#endif //MSDOS

};    

/* JDB: merges from DTPC/DTEX with Win95 code 8/16/96 */
extern struct share_data far *kernel_share;
#define KS (*kernel_share)

typedef struct share_data KSD_T;        /* Kernel Share Data structure */
typedef KSD_T _far *PKSD_T;
typedef KSD_T _far **PPKSD_T;

/* The following two lines are to be commented for Multiple instances MVP*/
/* Structure name changed */
/*
extern struct share_data far *kernel_share;
#define KS              (*kernel_share)
*/

#ifdef MSDOS
#define WAIT_PRINT              wait_semaphore(&KS.print_sem)
#define SIGNAL_PRINT            signal_semaphore(&KS.print_sem)
#else
#define WAIT_PRINT
#define SIGNAL_PRINT
// extern void wait_semaphore(SEMAPHORE *);
#endif  /* #ifdef MSDOS */

#ifdef MSDOS
#define IN_RING                         (*KS.in_ring)
#define OUT_RING                        (*KS.out_ring)
#define IN_RING_MAX                     (IN_RING.size-16)

#ifdef MSDOS
#define CODEPAGE                (KS.code_page)
#else
#define CODEPAGE                (pKsd_t->code_page)
#endif
/*
 *  misc macros ...
 */

#define _FP_SEG(fp) (*((unsigned _far *)&(fp)+1))
#define _FP_OFF(fp) (*((unsigned _far *)&(fp)))

#define FP_SEG _FP_SEG
#define FP_OFF _FP_OFF
/**********************************************************
 *  kernel entry points ...
 **********************************************************/

/*
 *  queueing routines ...
 */


kernel_enqueue(VOID_FP,VOID_FP);
void _far *kernel_dequeue(VOID_FP);
void _far *wait_queue(P_QS);
int signal_queue(P_QS,VOID_FP);

/*
 * process control
 */

signal_semaphore(P_SEMAPHORE);
wait_semaphore(P_SEMAPHORE);

sleep(int);
block(VOID_FP);
create_process();
connect_sem(int,P_SEMAPHORE);
gate_init(P_GATE);
gate_register(P_GATE);
gate_deregister(P_GATE);
gate_open(P_GATE);
gate_close(P_GATE);
gate_entry(P_GATE);

#ifdef MSDOS
flush_pipe();
#endif

#define TICKS_PER_SECOND        100

/*
 *  timer control 
 */

start_timer();
stop_timer();
get_timer();

/*
 *  memory allocation ...
 */

void _far *malloc();
void _far *free(VOID_FP);
unsigned int max_block();

#endif

/*
 * character pipe ...
 */

#ifdef _DEF_PIPES
#undef _DEF_PIPES
#endif

#ifdef MSDOS

#define _DEF_PIPES
P_PIPE  create_pipe(int,int);
write_pipe(P_PIPE, VOID_FP,int);
read_pipe(P_PIPE, VOID_FP,int);
int test_pipe(P_PIPE);
#ifndef MSDOS
int printf(VOID_FP,);
#endif
#endif

#ifdef WIN32
#define _DEF_PIPES
/* Pipes declared previously in pipe.h for Windows NT (see above) */
/*
#ifndef _WINDOW_H
#define _WINDOW_H
#include <windows.h>
#endif
PIPE * create_pipe( UINT, UINT );
void write_pipe( PIPE *, PIPE_ITEM_T *, UINT );
void read_pipe( PIPE *, PIPE_ITEM_T *, UINT );
void reset_pipe( PIPE * );
void destroy_pipe( PIPE * );
*/
#endif

/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
#define _DEF_PIPES
#include "opthread.h"
#endif
#ifdef __linux__
#define _DEF_PIPES
#include "opthread.h"
#endif


#ifndef _DEF_PIPES
#define _DEF_PIPES

/* Pipe function prototypes for OSF1 go here. */

P_PIPE  create_pipe(int,int);

#endif

#ifndef MSDOS
#ifndef WIN32
/*
 * over-ride the getc function in cmd_get.c
 */
#ifdef getc
#undef getc
#endif
#define getc    cmd_read_char
#ifdef putc
#undef putc
#endif
#ifdef __linux__
#define putc(c)      putc(c,stderr)
#else
#define putc(c)
#endif

/* Volume control */

/*
 * on non-MSDOS platforms, stub these functions
 */

/*
#define vol_set(x)
#define vol_up(x)
#define vol_down(x)
#define reset_spc()

#define clr_gpio(x)
#define set_gpio(x)
*/

#endif
#endif

/*
 *  ring stuff ..
 */

P_RING create_ring(int);
int put_ring(P_RING,unsigned char far *);
int get_ring(P_RING,unsigned char far *);
void flush_ring(P_RING);
unsigned int test_ring(P_RING);
void lock_ring(P_RING);
void unlock_ring(P_RING);

/*
 *  general and gpio interface ...
 */

#ifdef MSDOS
port_out(int,char);
char port_in(int);
#ifndef DTPC2
#ifndef DTEX
set_gpio(int);
clr_gpio(int);
#endif 
#endif  
#endif
#ifdef DTEX
extern SEMAPHORE isa_port_sem;
#endif /* DTEX */

/*
 *  physical i/o stuff ...
 */

#define IO_BASE         0x400

#define ISA_STATUS              (IO_BASE+0x00)                  /* posted isa status */
#define ISA_COMMAND             (IO_BASE+0x00)                  /* command data from isa */

/* JDB: common code pool merge */
#ifndef DTPC2
#define ISA_DO                  (IO_BASE+0x80)                  /* data out to isa */
#define ISA_DI                  (IO_BASE+0x80)                  /* data in from isa */
#endif

#define SPCIO                   (IO_BASE+0x100)
#define ISA_INT         (IO_BASE+0x180)
#define IN_VOL          (IO_BASE+0x200)
#define DMA_BUFF                (IO_BASE+0x280)

/* JDB: common code pool merge */
#ifndef DTPC2
#define RAM_ENABLE      (IO_BASE+0x300)
#endif

#define    GPIO_VINC    0x02
#define   GPIO_VDIR             0x04
#define   GPIO_VCS              0x08
#define    GPIO_RESET   0x10
#define    GPIO_STOP    0x20

#define ANY_CHANGE              0
#define LOW_CHANGE              1
#define HIGH_CHANGE             2

/*
 *  dictionary load   (return type is to be changed to kernel_share_data far * for MI :MVP)
 */

struct share_data far *get_share();

/* 
 *  usefull little macros ...
 */

#define get_ds( where ) _asm \
{ \
  _asm    mov     ax, ds \
    _asm    mov     where, ax \
    }

#define get_cs( where ) _asm \
{  \
  _asm    mov     ax, cs \
    _asm    mov     where, ax \
    }

#endif

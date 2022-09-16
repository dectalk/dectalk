/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *	Copyright, Digital Equipment Corporation, 1995
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
 * 06 jul 95	...tek		initial for DTPC-II  
 * 14 jul 95	...tek		added gpio images for dtpcII
 * 09 aug 95	...tek		rationalized with DTPC1 stutter changes.
 * 13 dec 95	...tek		merge DTEX.
 * 26 Mar 96	...MGS		Merge WIN32 code 2 fields added to share data
 * 27 Jun 96    ...CJL		Changed put_ring type to volatile.
 *
 */

#ifndef KERNELH
#define KERNELH 1

#include       "libp.h"
#include       "kernp.h"

#ifdef SIMULATOR
#define far
#define _far
#define	__far
#endif

/*
 *  common routines that access the kernel are in a lib and need to be
 *  included here for all to see ...
 */


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
	P_PCB                                            queue;
} SEMAPHORE;

#define P_SEMAPHORE     volatile SEMAPHORE _far *

/*
 *  a queue semaphore ...
 */

typedef struct  queue_semaphore {
	volatile        struct queue_semaphore  _far *head;
	volatile        struct queue_semaphore  _far *tail;
	P_PCB                                                   process;
} QUEUE_SEMAPHORE;

#define P_QS    volatile QUEUE_SEMAPHORE _far *
#define NULL_QS ((QUEUE_SEMAPHORE _far *)0L)

/*
 *  ... a gate ...
 */

typedef struct GATE_struct {
	volatile        int             value;
	volatile        int             state;
	P_PCB                                   block_queue;
	P_PCB                                   wait_queue;
} GATE;

#define P_GATE  volatile GATE _far *
#define NULL_PIPE       ((PIPE _far *)0L)


/*
 *   ... a pipe ....
 */


typedef struct PIPE_struct {

	volatile        void _far *                     link;
	P_PCB                                                           get_queue;
	P_PCB                                                           put_queue;
	volatile        int                                     size;
	volatile        int                                     id;
	volatile        int                                     count;
	volatile        unsigned int            head;
	volatile        unsigned int            tail;
	volatile        unsigned char           buff[1];
} PIPE;
#define P_PIPE          volatile PIPE _far *



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

#define HUGE    (9999)                          /* Bigger then NPHON_MAX        */

/*
 *  spc control structures, defines, etc ...
 */

#define SPC_type_voice          0
#define SPC_type_speaker        1
#define SPC_type_tone           2
#define SPC_type_test           3
#define SPC_type_nop            4
#define SPC_type_digitized      5
#define SPC_type_mixed          6
#define SPC_type_index          7
#define SPC_type_sync           8
#define SPC_type_flush          9
#define SPC_type_flush_sync    10

#define SPC_flush_all           0
#define SPC_flush_until         1
#define SPC_flush_mask          2
#define SPC_flush_after         3

#define SPC_mode_text           0
#define SPC_mode_digital        1

/*
 *  text to speech spc packets ...
 */

#define MAX_SPC_DATA           32
/*#define       MAX_SPC_PACKETS 1024 eab 2/18/94 6.4 seconds of speech too long
change to smaller number*/
#ifndef DTEX /* for non-express code */
#define MAX_SPC_PACKETS       400 /* ...tek 8/9/95 */
#else /* express code */
#define MAX_SPC_PACKETS	128
#endif /*DTEX*/

struct  spc_packet      {

	volatile        struct spc_packet _far  *link;                                  /* thread to next */
	volatile        unsigned int                            high_addr;                              /* high physical address */
	volatile        unsigned int                            low_addr;                               /* low physical address */
	volatile        unsigned int                            length;                                 /* length of data in packets */
	volatile        unsigned int                            type;                                           /* type code for packet */
	volatile        unsigned int                            data[MAX_SPC_DATA];     /* caller supplied data */
};

#define SPC_DATA_OFFSET (12)                            /* offset to data array in struct in bytes */
#define SPC_PACKET_POOL ((sizeof(struct spc_packet)*(MAX_SPC_PACKETS/16))+1)
#define NULL_SPC_PACKET ((struct spc_packet _far *)0L)

/*
 *  digitized data spc packets ...
 */

#define MAX_DGT_PACKETS        16
#define DGT_WORDS_PER_FRAME    65
#define DGT_BYTES_PER_FRAME   130
#define MAX_DGT_FRAMES          8
#define MAX_DGT_DATA          (DGT_WORDS_PER_FRAME*MAX_DGT_FRAMES)

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

#define LANG_english          0x0000
#define LANG_french           0x0001
#define LANG_german           0x0002
#define LANG_spanish          0x0003
#define LANG_japanese         0x0004
#define LANG_none             0xffff
#ifdef SINGLE_LANGUAGE
#define MAX_languages         1
#else
#define MAX_languages         5
#endif

#define LANG_lts_ready        0x1
#define LANG_ph_ready         0x2
#define LANG_tables_ready     0x4
#define LANG_both_ready       0x7

struct  dtpc_code_pages {

	struct  dtpc_code_pages _far     *link;
	int                                                                             dos_id;
	unsigned char _far                                      *translation_page;

};

struct  dtpc_language_tables    {
	struct  dtpc_language_tables    _far    *link;
	unsigned int                                                            lang_id;
	unsigned char _far *                                            lang_ascky;
	int                                                                                     lang_ascky_size;
	unsigned short _far *                                             lang_reverse_ascky;
	unsigned char _far *                                            lang_arpabet;
	int                                                                                     lang_arpa_size;
	int                                                                                     lang_arpa_case;
	unsigned char _far *    _far *                  lang_typing;
	unsigned char _far *    _far *                  lang_error;
};

#define NULL_CP ((struct dtpc_code_pages _far *)0L)
#define NULL_LT ((struct dtpc_language_tables _far *)0L)

/*
 * ASYNC change flags ...
 */

#define ASYNC_voice           0x0001
#define ASYNC_rate            0x0002
#define ASYNC_period          0x0004
#define ASYNC_comma           0x0008
#define ASYNC_rate_delta      0x0010

/*
 *  phonemic modes ...
 */

#define PHONEME_OFF           0x1                /* not parsing phonemes */
#define PHONEME_ASCKY         0x2                /* parse type ascky or arpabet */
#define PHONEME_SPEAK         0x4                /* phonemes are spoken */

#ifdef DTEX
#define VERSIONLEN		(80)
#define SPEAKLEN		(190)
#endif /*DTEX*/


/**********************************************************
 *  kernel shared data ... a single common far pointers is
 *  linked via the kernel stub into every runtime image that
 *  that is loaded ... this image contains common system wide
 *  variables that other routine will access.
 **********************************************************/

struct share_data {

/*
 *  dictionary control ...
 */

	volatile        unsigned int far                        *fdic;                                          /* pointer to installed dictionarys */
	volatile        long                                     fdic_entries;                           /*   total entries in dictionarys */
	volatile        unsigned int far                        *udic;                                          /* pointer to installed dictionarys */
	volatile        long                                     udic_entries;                           /*   total entries in dictionarys */
#ifndef SINGLE_LANGUAGE
	volatile        unsigned int far                        *sdic;                                          /* pointer to installed dictionarys */
	volatile        long                                     sdic_entries;                           /*   total entries in dictionarys */
	volatile        unsigned int far                        *usdic;                                         /* pointer to installed dictionarys */
	volatile        long                                     usdic_entries;                          /*   total entries in dictionarys */
	
	volatile        unsigned int far                        *frdic;                                         /* pointer to installed dictionarys */
	volatile        long                                     frdic_entries;                          /*   total entries in dictionarys */
	volatile        unsigned int far                        *ufdic;                                         /* pointer to installed dictionarys */
	volatile        long                                     ufdic_entries;                          /*   total entries in dictionarys */

	volatile        unsigned int far                        *gdic;                                          /* pointer to installed dictionarys */
	volatile        long                                     gdic_entries;                           /*   total entries in dictionarys */
	volatile        unsigned int far                        *ugdic;                                         /* pointer to installed dictionarys */
	volatile        long                                     ugdic_entries;                          /*   total entries in dictionarys */

#endif

#ifndef SINGLE_LANGUAGE
	volatile        unsigned int far                        *adic;                                          /* pointer to installed dictionarys */
	volatile        long                                     adic_entries;                           /*   total entries in dictionarys */
#endif

/*
 *  character i/o control ...
 */

//	volatile        SEMAPHORE                                print_sem;                                      /* output sync */
	P_RING                                                   in_ring;                                                /* character input */
	P_RING                                                   out_ring;                                       /*   and output */
	volatile        int                                      eight_bit;                                      /* eight bit escape sequences */

	volatile        SEMAPHORE                                isa_sem;                                                /* isa interface interrupt */
	volatile        SEMAPHORE                                flush_sem;                                      /* flush synchronization */
	volatile unsigned int                                    isa_status;                                     /* status of module on isa bus */
/*
 *  current language interprocess pipes ...
 */

#ifndef SINGLE_THREADED
	P_PIPE                                                   lts_pipe;                                       /* lts pipe input */
	P_PIPE                                                   ph_pipe;                                                /* ph pipe input */
#endif

/*
 *  language specific pipes and enables ...
 */

	volatile        int                                      lang_curr;
	volatile        int                                      lang_ready[MAX_languages];
	P_PIPE                                                   lang_lts[MAX_languages];
	P_PIPE                                                   lang_ph[MAX_languages];

/*
 *  process flush flags ...
 */

	volatile        int                                      cmd_flush;                                      /* flush cmd output */
	volatile int                                             text_flush;                                     /* flush text and phones but not commands */
	volatile        int                                      halting;                                                /* panic halt */
	volatile        int                                      pause;                                          /* spc output stalled */
	volatile        int                                      spc_flush_reset;                                                /* spc output stalled */

/*
 *  index control ...
 */

//	volatile        QUEUE_SEMAPHORE                         index_pending;                          /* indexes waiting for flush */
//	volatile        QUEUE_SEMAPHORE                         index_active;                           /* indexes waiting to print*/
#ifndef NO_CMD
		volatile        unsigned int                            lastindex;                                      /* last flushed index */
#endif                                                         
/*
 *  spc flags ...
 */

	volatile        int                                     spc_mode;                                               /* digital or text mode */
	volatile int                                            spc_flush;                                              /* flush all packets */
	volatile int                                            spc_ffinish;                                            /* flush finished */
	volatile        int                                     spc_flush_type;                         /* style of flush */
	volatile        unsigned int                            spc_flush_value;                                /* mask or search value */

	volatile        QUEUE_SEMAPHORE                         spc_pool;                                               /* free queue */
	volatile        QUEUE_SEMAPHORE                         spc_active;                                             /* packets queued to the spc */
	volatile        QUEUE_SEMAPHORE                         dgt_pool;                                               /* free queue */
	volatile        QUEUE_SEMAPHORE                         dgt_active;                                             /* packets queued to the spc */

	volatile        SEMAPHORE                               spc_sync;                                               /* where sync callers block ... */
	volatile        SEMAPHORE                               spc_resume;                                             /* where spc process blocks for pauses */
	volatile        SEMAPHORE                               spc_dma;                                                        /* dma0 semaphore */
	volatile        SEMAPHORE                               text_sync;                                              /* where text to speech waits */
	volatile        SEMAPHORE                               getc_empty;                                             /* where text to speech waits */

/*
 *  misc settings ...
 */

	volatile        unsigned int                            modeflag;                                       /* current running mode */
	volatile        unsigned int                            logflag;                                                /* current logging mode */
	volatile        unsigned int                            sayflag;                                                /* how to break up input text */
	volatile        unsigned int                            pronflag;                                       /* how to say input text */
#ifndef NO_CMD
	volatile        unsigned int                            phoneme_mode;                           /* how to interpret user phonemes */
#endif
	volatile        unsigned int                            wbreak;                                         /* generate wbound pauses */
#ifndef NO_CMD
	volatile        unsigned int                            input_timeout;                          /*      input character timeout */
#endif
	volatile        int                                     volume;                                         /* current module volume */
#ifdef DTEX
	/* things that only the express uses.. */
	P_RING					p_out_ring;
	volatile unsigned short int command;
	volatile unsigned short int in_data;
	volatile unsigned short int out_data;

	volatile	short int 				l_verbose;
	volatile	short int			power_interval;
	volatile	short int 			sleep_interval;
	volatile	long int			idleseconds;	// how long we've been idle..
	volatile	short int			idleflag;	// cleared when anything is done
	volatile 	short int			spc_sleeping;	// spc has been shut down.
	volatile	short int			spc_waking;	// the spc is awakened, waiting for speakerdef.

	volatile	unsigned char version[VERSIONLEN];
	volatile 	unsigned char versionspeak[SPEAKLEN];
	volatile	unsigned short int		sc_flush; //single-char flush req.
	volatile	unsigned short int		dleseq_OK;
#endif /*DTEX*/

/*
 *  async change flags ...
 */

	volatile int                                            async_change;                           /* async speech change request */
	volatile        int                                     async_voice;
	volatile        int                                     async_rate;
	volatile        int                                     async_period;
	volatile        int                                     async_comma;
	volatile int _far *                                     speaker;                                                /* current speaker def settings */
/*
 *  quick changes  ...
 */

	volatile int                                            pitch_delta;
	
/*
 *  DOS code page translations ...
 */

#ifndef NO_CMD
	volatile unsigned char                                  code_page[256];
	volatile struct dtpc_code_pages _far                   *loaded_code_pages;
#endif

/*
 *  common iso tables ...
 */

#ifdef UNUSED_ISO_TABLES
	volatile        unsigned char                           iso_to_upper[256];
	volatile unsigned char                                  iso_to_lower[256];
#endif

/*
 *  language specific user interface tables ...
 */

#ifdef FULL_LANGUAGE_SUPPORT
	volatile struct dtpc_language_tables _far              *loaded_languages;
#endif

	volatile unsigned char _far *                           ascky;
	volatile        int                                                                     ascky_size;
	volatile short int _far *                            reverse_ascky;

#ifdef FULL_LANGUAGE_SUPPORT
	volatile unsigned char _far *                           arpabet;
	volatile int                                                                    arpa_size;
	volatile int                                                                    arpa_case;
#endif
#ifndef CALLER_ID
	volatile unsigned char _far * _far *                    typing_table;
	volatile unsigned char _far *   _far *                  error_table;
#endif                               
#ifdef DTPC2                               
/* images of read-only registers.. */
	volatile unsigned short		gpio0_image;
	volatile unsigned short		gpio2_image;
#endif /*DTPC2*/   

/*
 * 	addition from Windows 95 code merge
 */
 	volatile short 				sprate;
 	volatile short				last_voice;

};

extern struct share_data far                               *kernel_share;
#define KS              (*kernel_share)
/* XXX */
#if 0
#define WAIT_PRINT                      wait_semaphore(&KS.print_sem)
#define SIGNAL_PRINT                    signal_semaphore(&KS.print_sem)
#else
#define WAIT_PRINT                      
#define SIGNAL_PRINT                    

#endif

#define IN_RING                         (*KS.in_ring)
#define OUT_RING                        (*KS.out_ring)
#define IN_RING_MAX                     (IN_RING.size-16)

#define CODEPAGE                        (KS.code_page)

/*
 *  misc macros ...
 */

#define FP_SEG(fp) (*((unsigned _far *)&(fp)+1))
#define FP_OFF(fp) (*((unsigned _far *)&(fp)))

/**********************************************************
 *  kernel entry points ...
 **********************************************************/

/*
 *  queueing routines ...
 */


int kernel_enqueue(VOID_FP,VOID_FP);
void _far *kernel_dequeue(VOID_FP);
void _far *wait_queue(P_QS);
int signal_queue(P_QS,VOID_FP);

/*
 * process control
 */

int signal_semaphore(P_SEMAPHORE);
int wait_semaphore(P_SEMAPHORE);
int sleep(int);
int block(VOID_FP);
#ifdef	SIMULATOR
#define	create_process(p1,p2,p3,p4, p5) \
	CreateThread(0, 0, (void *) p1, 0,0, 0)
#else
create_process();
#endif
int connect_sem(int,P_SEMAPHORE);
int gate_init(P_GATE);
int gate_register(P_GATE);
int gate_deregister(P_GATE);
int gate_open(P_GATE);
int gate_close(P_GATE);
int gate_entry(P_GATE);
int flush_pipe();

#define TICKS_PER_SECOND        100

/*
 *  timer control 
 */

int start_timer();
int stop_timer();
int get_timer();

/*
 *  memory allocation ...
 */
#ifndef SIMULATOR
void _far *malloc();
void _far *free(VOID_FP);
#endif

unsigned int max_block();
/*
 * character pipe ...
 */

P_PIPE  create_pipe(int,int);
int write_pipe(P_PIPE, VOID_FP,int);
int read_pipe(P_PIPE, VOID_FP,int);
int test_pipe(P_PIPE);
/* int printf(VOID_FP,); */

/*
 *  ring stuff ..
 */

P_RING create_ring(int);
int put_ring(P_RING,volatile unsigned char far *);
int get_ring(P_RING,unsigned char far *);
void flush_ring(P_RING);
unsigned int test_ring(P_RING);
void lock_ring(P_RING);
void unlock_ring(P_RING);

/*
 *  general interface ...
 */

int port_out(int,char);
char port_in(int);

/*
 * SPC stuff
 */
 
void * spcget( unsigned short spc_type );
int spcwrite( unsigned short * spc_buffer );
void spcfree(unsigned short * spc_buffer);



/*
 *  gpio interface ...
 */
#ifndef DTPC2
#ifndef DTEX
int set_gpio(int);
int clr_gpio(int);
#endif
#endif

#ifdef DTEX

extern SEMAPHORE isa_port_sem;


#endif /*DTEX*/
/*
 *  physical i/o stuff ...
 */

#define ANY_CHANGE              0
#define LOW_CHANGE              1
#define HIGH_CHANGE             2

/*
 *  dictionary load 
 */

struct share_data       far *get_share();

/*
 *  usefull little macros ...
 */

#define get_ds(where)   _asm            \
{                                                                                       \
		_asm    mov     ax, ds                  \
		_asm    mov     where, ax               \
}

#define get_cs( where ) _asm            \
{                                                                                               \
		_asm    mov     ax, cs                          \
		_asm    mov     where, ax                       \
}

#endif

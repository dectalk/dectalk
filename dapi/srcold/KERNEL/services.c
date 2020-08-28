/* **********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
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
 * ******************************************************************* 
 * Comments
 * Kernel services ... this is a shared file of common routines that
 * can be included with other processes.  It uses only kernel data
 * structures (KS.xxx) and stack, both of which will resolve at link
 * time.
 * rev	who		date		description
 * ------------------------------------------------------------------
 * 001  KSB     02/10/1997  Index mark clearing bug
 * 002	TEK		04/02/1997  BATS 278 (index mark list)
 * 003	GL		04/21/1997	BATS#357  Add the code for __osf__ build
 * 004  TQL		05/01/1997	BATS#365  Removed includes of cmd.h and cm_def.h
 * 005	NCS		05/01/1997	Moved an #if 0 statement above the comment
 * 006	tek		12nov97		bats404: handle new index messages (SAPI traansport)
 * 007  MGS		12/29/1997	ifdefed sapi index stuff for WIN32
 * 008  ETT		10/05/1998  Added Linux code.
 * 009	MGS		07/14/2000	Sapi 5 additions
 * 010 	CAB		10/16/00	Changed copyright info
 * 011	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 * 012 	CAB		03/01/2001	Updated copyright info.
 * 013	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 014	MFG		05/29/2001	Included dectalkf.h
 * 015	MGS		06/19/2001	Solaris Port BATS#972
 * 016	MGS		02/25/2002	Trial SDK Noise
 * 017	MGS		03/20/2002	Single threaded vtm
 * 018	MGS		03/21/2002	Single threaded ph
 * 019	MGS		04/03/2002	Single threaded lts
 * 020	MGS		04/11/2002	ARM7 port
 * 021	CAB		07/30/2002	Condensed repeated __osf__ code
 */


#include "dectalkf.h"
#ifdef WIN32
#include  <windows.h>
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
#include "opthread.h"
#endif

#include  <math.h>
#ifndef VXWORKS
#ifndef ARM7
#include  <malloc.h>
#endif
#endif
#include  "defs.h"
#include  "dectalk.h"
#include  "cmd.h"	//tek 12nov97 bats404
#include  "kernel.h"
#include  "esc.h"
#include  "tts.h"

#ifdef ARM7
#include "stdlib.h"
#include "string.h"
#endif


#ifdef WIN32
#include "playaud.h"

/*LPTTS_HANDLE_T TextToSpeechGetHandle(void);*/
#endif

int vtm_loop(LPTTS_HANDLE_T phTTS,short *input);

/*
 * #define SERVDEBUG 1
 * char tmp[200];
 */

/* Added declarartion of check_index  MVP */
void check_index( LPTTS_HANDLE_T phTTS, unsigned int which_phone );
void kernel_enable(PKSD_T pKsd_t, unsigned int);
unsigned int kernel_disable(PKSD_T pKsd_t);
#ifdef WIN32
void wait_semaphore( int * );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
void wait_semaphore( P_SEMAPHORE );
#endif

void signal_semaphore( int * );
void free_index(PKSD_T pKsd_t);

#ifndef MSDOS
static DWORD ModifyVolume( DWORD, int, int );
#endif

#ifdef ARM7
#ifdef ACCESS_SOLUTIONS
	struct spc_packet global_spc_pkt[100];
	short cur_packet_number=0;
	short max_packet_number=0;

struct spc_packet *get_spc_packet(void)
{
	if (cur_packet_number<99)
	{
		cur_packet_number++;
		max_packet_number++;
		return(&(global_spc_pkt[cur_packet_number-1]));
	}
	else
	{
		cur_packet_number=0;
		cur_packet_number++;
		max_packet_number++;
		return(&(global_spc_pkt[cur_packet_number-1]));
	}
}
void free_spc_packet(struct spc_packet *spc_pkt)
{
//	if (spc_pkt==&(global_spc_pkt[0]))
//	{
//		cur_packet_number=0;
//	}
}
#else
#ifndef EPSON_ARM7
	struct spc_packet global_spc_pkt[1];
	short cur_packet_number;
	short max_packet_number;

struct spc_packet *get_spc_packet(void)
{
	if (cur_packet_number==0)
	{
		return(&(global_spc_pkt[0]));
		cur_packet_number=1;
	}
	else
	{
		return NULL;
	}
}
void free_spc_packet(struct spc_packet *spc_pkt)
{
	if (spc_pkt==&(global_spc_pkt[0]))
	{
		cur_packet_number=0;
	}
}
#endif
#endif
#endif

/**********************************************************************/
/**********************************************************************/
/*  Function: save_index                                              */
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Index marks are now handled a bit diferently ... they are flushed */
/*  out tighter to the spc processing the phoneme, so they are saved  */
/*  in a pending queue until the phoneme is ready to be placed in the */
/*  spc queue, then they are placed in the spc queue, and the spc     */
/*  driver flushes them out as the data is processed ..               */
/*                                                                    */
/*  data field usage ...                                              */
/*                                                                    */
/*  data[0] == symbol marker (lts-phmain-phsort)                      */
/*  data[1] == index style (mark or reply)                            */
/*  data[2] == index value (user specified)                           */
/*  data[3] == reply style (escape, text or pause)                    */
/*  data[4] == phone offset (phsort converts)                         */
/*  data[5] == allophone offset (phalloph converts)                   */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void save_index( PKSD_T pKsd_t,unsigned int sym,
		 unsigned int type,
		 unsigned int value,
		 unsigned int how )
{
  struct spc_packet _far *spc_pkt;   /*MVP : Doesn't appear like a static variable */
  struct spc_packet _far *last_pkt;  /*MVP : Doesn't appear like a static variable */

  /********************************************************************/
  /*  Go to the end of the packet chain and add a new packet.         */
  /********************************************************************/
//#ifdef WIN32
#ifndef ARM7
  /* tek 6mar97 bats 278 this is protected by a critial section */
  EnterCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  spc_pkt = pKsd_t->spc_pkt_save;

  if ( spc_pkt == NULL_SPC_PACKET )
  {
#ifdef ARM7
#ifdef EPSON_ARM7
	  spc_pkt=pKsd_t->g_spc_packet;
#else
	spc_pkt = get_spc_packet();
#endif
	if (spc_pkt==NULL)
		return;
#else
	spc_pkt = (struct spc_packet *)malloc(sizeof(struct spc_packet));
#endif
	spc_pkt->link = NULL_SPC_PACKET;
	pKsd_t->spc_pkt_save = spc_pkt;
  }
  else
  {
	last_pkt = spc_pkt;
	spc_pkt = spc_pkt->link;

	while( spc_pkt != NULL_SPC_PACKET )
	{
	  last_pkt = spc_pkt;
	  spc_pkt = spc_pkt->link;
	}

#ifdef ARM7
#ifdef EPSON_ARM7
	  spc_pkt=pKsd_t->g_spc_packet;
#else
	spc_pkt = get_spc_packet();
#endif
	if (spc_pkt==NULL)
		return;
#else
	spc_pkt = (struct spc_packet *)malloc(sizeof(struct spc_packet));
#endif
	spc_pkt->link = NULL_SPC_PACKET;
	last_pkt->link = spc_pkt;
  }

  spc_pkt->type = SPC_type_index;
  spc_pkt->data[0] = sym;
  spc_pkt->data[1] = type;
  spc_pkt->data[2] = value;
  spc_pkt->data[3] = how;
  spc_pkt->data[4] = sym;
  spc_pkt->data[5] = sym;
  spc_pkt->data[6] = 0;  /* KSB 11/14/1996,  Sync bug for uninitialized number */
//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  LeaveCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif


  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: check_index                                             */
/**********************************************************************/
/**********************************************************************/

void check_index( LPTTS_HANDLE_T phTTS,unsigned int which_phone )
{

	PKSD_T pKsd_t=phTTS->pKernelShareData;
  struct spc_packet _far *spc_pkt;
  struct spc_packet _far *last_pkt; /*MVP : Usuage doesn't appear like a static variable*/
  DT_PIPE_T buf[3];

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  EnterCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  while(( spc_pkt = pKsd_t->spc_pkt_save ) != NULL_SPC_PACKET )
  {
	if( spc_pkt->data[5] > which_phone )
	  break;

	// tek 12nov97 bats404 generate pkts for the new indices
	switch (spc_pkt->data[1])	// see what kind of index it is.. 
	{
	case INDEX:
	case INDEX_REPLY:
		buf[0] = SPC_type_index;
		break;
/* MGS 007 12/29/1997 ifdefed sapi stuff for WIN32 only */
//#ifdef WIN32
	case INDEX_BOOKMARK:
		buf[0] = SPC_type_index	| SPC_subtype_bookmark;
		break;
	case INDEX_WORDPOS:
		buf[0] = SPC_type_index	| SPC_subtype_wordpos;
		break;
	case INDEX_START:
		buf[0] = SPC_type_index	| SPC_subtype_start;
		break;
	case INDEX_STOP:
		buf[0] = SPC_type_index	| SPC_subtype_stop;
		break;
	case INDEX_SENTENCE:
		buf[0] = SPC_type_index	| SPC_subtype_sentence;
		break;
	case INDEX_VOLUME:
		buf[0] = SPC_type_index	| SPC_subtype_volume;
		break;
	case INDEX_NOISE:
		buf[0] = SPC_type_index	| SPC_subtype_noise;
		break;
//#endif
	} // switch

	buf[1] = spc_pkt->data[2];
	buf[2] = spc_pkt->data[3];

	last_pkt = spc_pkt;
	spc_pkt = spc_pkt->link;
	pKsd_t->spc_pkt_save = spc_pkt;

#ifdef ARM7
#ifndef EPSON_ARM7
	free_spc_packet( last_pkt );
#endif
#else
	free( last_pkt );
#endif
	/* GL 04/21/1997  change this for OSF build */
#ifndef SINGLE_THREADED
	write_pipe( pKsd_t->vtm_pipe, buf, 3 );
#else
	vtm_loop(phTTS,buf);
#endif

  }
//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  LeaveCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: adjust_index                                            */
/**********************************************************************/
/**********************************************************************/

void adjust_index( PKSD_T pKsd_t,unsigned int which, int direction, int del )
{
  struct spc_packet _far *spc_pkt;
  /*static struct spc_packet _far *last_pkt;*/  /*MVP : NEVER USED */

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  EnterCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  if(( spc_pkt = pKsd_t->spc_pkt_save ) != NULL_SPC_PACKET )
  {
	while(spc_pkt != NULL_SPC_PACKET)
	{
	  if ( spc_pkt->data[5] >= which+(int)spc_pkt->data[6] )
	  {
	spc_pkt->data[4] = (unsigned int)((int)(spc_pkt->data[4]) + direction);
	spc_pkt->data[6] = (unsigned int)((int)(spc_pkt->data[6]) + del);
	  }
	  spc_pkt = spc_pkt->link;
	}
  }
//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  LeaveCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

}

/**********************************************************************/
/**********************************************************************/
/*  Function: adjust_allo                                             */
/**********************************************************************/
/**********************************************************************/

void adjust_allo( PKSD_T pKsd_t,unsigned int which, int direction )
{
  struct spc_packet _far *spc_pkt;

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  EnterCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  if((spc_pkt = pKsd_t->spc_pkt_save ) != NULL_SPC_PACKET )
  {
	while(spc_pkt != NULL_SPC_PACKET)
	{
	  if ((spc_pkt->data[5] >= which ))
	  {
	/* (int)spc_pkt->data[4] += direction; */
	spc_pkt->data[5] = (unsigned int)((int)(spc_pkt->data[5]) + direction);
	  }
	  spc_pkt = spc_pkt->link;
	}
  }

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  LeaveCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

}


/**********************************************************************/
/**********************************************************************/
/*  Function: set_index_allo                                          */
/**********************************************************************/
/**********************************************************************/

void set_index_allo( PKSD_T pKsd_t,unsigned int nphone, unsigned int nallo )
{
  struct spc_packet _far *spc_pkt;

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  EnterCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  if (( spc_pkt = pKsd_t->spc_pkt_save ) != NULL_SPC_PACKET )
  {
	while( spc_pkt != NULL_SPC_PACKET )
	{
	  if(spc_pkt->data[4] == nphone )
	  {
	spc_pkt->data[5] = nallo;
	  }
	  spc_pkt = spc_pkt->link;
	}
  }

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  LeaveCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

}

/**********************************************************************/
/**********************************************************************/
/*  Function: free_index                                              */
/**********************************************************************/
/**********************************************************************/

void free_index(PKSD_T pKsd_t)
{
  struct spc_packet _far *spc_pkt;
  struct spc_packet _far *free_pkt;

//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  EnterCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

  if (( spc_pkt = pKsd_t->spc_pkt_save ) != NULL_SPC_PACKET )
  {
	while( spc_pkt != NULL_SPC_PACKET )
	{
	  free_pkt = spc_pkt;
	  spc_pkt = spc_pkt->link;
#ifdef ARM7
#ifndef EPSON_ARM7
	  free_spc_packet( free_pkt );
#endif
#else
	  free( free_pkt );
#endif
	}
//#ifdef WIN32
  /* tek 7mar97 bats 278 - have to update spc_pkt_save! */
  pKsd_t->spc_pkt_save = NULL_SPC_PACKET;
//#endif
  }
//#ifdef WIN32
  /* tek 6mar97 bats 278 this is protected by a critial section */
#ifndef ARM7
  LeaveCriticalSection(pKsd_t->pcsSpcPktSave);
#endif
//#endif

}

/**********************************************************************/
/**********************************************************************/
/*  Function: send_index                                              */
/*  Common routine to send an index back. (Only used by DTC0X)        */
/**********************************************************************/
/**********************************************************************/

void send_index( int how, int value )
{
/*
  SEQ     seq;

  WAIT_PRINT;
  if(how == ESCAPE_OUTPUT)
  {
	seq.s_type   = DCS;
	seq.s_pintro = 0;
	seq.s_final  = DCS_F_DECTALK;
	seq.s_ninter = 0;
	seq.s_nparam = 3;
	seq.s_dflag[0] = FALSE;
	seq.s_param[0] = P1_DECTALK;
	seq.s_param[1] = R2_IX_REPLY;
	seq.s_dflag[1] = FALSE;
	seq.s_param[2] = value;
	seq.s_dflag[2] = FALSE;
	if (seq.s_param[2] == 0)
	seq.s_dflag[2] = TRUE;
	putseq((SEQ _far *)&seq);
	seq.s_type = ST;
	putseq((SEQ _far *)&seq);
  }
  else
  {
	printf("/n[:index %d]",value);
  }
  SIGNAL_PRINT;
*/
  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: start_flush                                             */
/*  Start a system wide buffer flush.  (Not implemented)              */
/**********************************************************************/
/**********************************************************************/

void start_flush( int serial_mode )
{
/*
#ifdef WIN32
  int i;
  LPTTS_HANDLE_T phTTS;

  phTTS = TextToSpeechGetHandle();

  TextToSpeechReset( phTTS, TRUE );

  return;
#endif
*/

/*
  unsigned int            temp,flags;
  int                                     old_volume,old_log;
  PCB _far        *sw;


  status_set_update(STAT_flushing);

  flags=kernel_disable();

  old_volume = KS.volume;
  old_log = KS.logflag;
  KS.logflag = 0;
  vol_set(0);

  if(serial_mode == false)
  {
	KS.cmd_flush = CMD_flush_toss;
	flush_ring(KS.in_ring);
	status_set(STAT_rr_char);
  }

  flush_ring(KS.out_ring);
  KS.spc_flush_type = SPC_flush_all;
  KS.spc_flush = true;
  KS.halting = true;

  flush_pipe(KS.lts_pipe);
  flush_pipe(KS.ph_pipe);

  if(KS.spc_sync.queue)
	signal_semaphore(&KS.spc_sync);
  if(KS.spc_resume.queue)
	signal_semaphore(&KS.spc_resume);

*/
/*
 *  hack time ... now the pipes may be waiting for some data (psnextra is
 *  was set, so push some data through the pipe to insure we see the sync
 *  pop out ...
 */
/*
  set_gpio(GPIO_STOP);

  KS.spc_sync.value = 0;
  temp = ((PFASCII<<PSFONT)+0xb);
  write_pipe(KS.lts_pipe,&temp,1);
  temp = SYNC;
  write_pipe(KS.lts_pipe,&temp,1);

  kernel_enable(flags);
  wait_semaphore(&KS.spc_sync);
  KS.spc_sync.value = 1;
  flags=kernel_disable();

  KS.spc_flush = false;
  KS.halting = false;
  KS.logflag = old_log;

  reset_spc();
  vol_set(old_volume);
  kernel_enable(flags);
*/
}


/**********************************************************************/
/**********************************************************************/
/*  Function: reset_spc   (NOT IMPLEMENTED)                           */
/**********************************************************************/
/**********************************************************************/

void reset_spc()
{
/*
  unsigned int temp,old_vol;

  old_vol = KS.volume;
  vol_set(0);
  clr_gpio(GPIO_RESET+GPIO_STOP);
  set_gpio(GPIO_RESET+GPIO_STOP);
  if(KS.pause)
	clr_gpio(GPIO_STOP);
  temp = LAST_VOICE;
  write_pipe(KS.lts_pipe,&temp,1);
  while(old_vol)
  {
	vol_up(1);
	old_vol -= 1;
  }
*/
}


/**********************************************************************/
/**********************************************************************/
/*  Function: default_lang                                            */
/*  The first language to have both ph and lts loaded and running     */
/*  becomes the default language.                                     */
/**********************************************************************/
/**********************************************************************/

void default_lang( PKSD_T pKsd_t,unsigned int lang_code, unsigned int ready_code )
{
	unsigned int flags;
	volatile struct dtpc_language_tables _far *cp;

#ifdef SERVDEBUG
sprintf(tmp, "serv: In default lang %d ready code: %d\n", lang_code, ready_code);
f_fprintf(tmp);
#endif

	if(pKsd_t->lang_ready[lang_code] == 0)
		{
#ifdef MSDOS
		pKsd_t->lang_lts[lang_code] = create_pipe(LTS_PIPE+lang_code,256);
		pKsd_t->lang_ph[lang_code] = create_pipe(PH_PIPE+lang_code,256);
#else
#ifndef SINGLE_THREADED
		pKsd_t->lang_lts[lang_code] = pKsd_t->lang_lts[lang_code];
		pKsd_t->lang_ph[lang_code]  = pKsd_t->lang_ph[lang_code];
#endif
#endif
		}
	
	pKsd_t->lang_ready[lang_code] |= ready_code;
	flags=kernel_disable(pKsd_t);

#ifdef SERVDEBUG
sprintf(tmp, "serv: pKsd_t->lang_ready %d \n", pKsd_t->lang_ready[lang_code]);
f_fprintf(tmp);
#endif
	
	if((pKsd_t->lang_ready[lang_code] == LANG_both_ready) && (pKsd_t->lang_curr == LANG_none || ready_code == 0))
		{
		pKsd_t->lang_curr = lang_code;
#ifndef SINGLE_THREADED
		pKsd_t->lts_pipe = pKsd_t->lang_lts[lang_code];
		pKsd_t->ph_pipe = pKsd_t->lang_ph[lang_code];
#endif

		cp = pKsd_t->loaded_languages;
		while(cp != NULL_LT)
			{
			if((*cp).lang_id == (int)lang_code)
				{
				pKsd_t->ascky = (*cp).lang_ascky;
				pKsd_t->ascky_size = (*cp).lang_ascky_size;
				pKsd_t->reverse_ascky = (*cp).lang_reverse_ascky;
				pKsd_t->arpabet = (*cp).lang_arpabet;
				pKsd_t->arpa_size = (*cp).lang_arpa_size;
				pKsd_t->arpa_case = (*cp).lang_arpa_case;
				pKsd_t->typing_table = (*cp).lang_typing;
				pKsd_t->error_table = (*cp).lang_error;
#ifdef SERVDEBUG
f_fprintf("serv: Updated typing table \n");    
#endif
				}
			cp = (*cp).link;
			}
		}
	kernel_enable(pKsd_t, flags);
}

/**********************************************************************/
/**********************************************************************/
/*  Function: flush_done                                              */
/*  Function flush_done() clears the flushing bit and allows the      */
/*  command processor to restart.                                     */
/**********************************************************************/
/**********************************************************************/

void flush_done(PKSD_T pKsd_t)
{

  pKsd_t->cmd_flush = false;
  pKsd_t->spc_sync.value = 0;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: kernel_disable                                          */
/**********************************************************************/
/**********************************************************************/

unsigned int kernel_disable(PKSD_T pKsd_t)
{
#ifdef MSDOS
  pause_pipe( pKsd_t->cmd_pipe );
  pause_pipe( pKsd_t->lts_pipe );
  pause_pipe( pKsd_t->ph_pipe );
  pause_pipe( pKsd_t->vtm_pipe );
  pause_pipe( pKsd_t->sync_pipe );
#endif

  return( 0 );
}

/**********************************************************************/
/**********************************************************************/
/*  Function: kernel_enable                                           */
/**********************************************************************/
/**********************************************************************/

void kernel_enable( PKSD_T pKsd_t, unsigned int flags )
{

#ifdef MSDOS 

  resume_pipe( pKsd_t->sync_pipe );
  resume_pipe( pKsd_t->vtm_pipe );
  resume_pipe( pKsd_t->ph_pipe );
  resume_pipe( pKsd_t->lts_pipe );
  resume_pipe( pKsd_t->cmd_pipe );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: wait_semaphore                                          */
/**********************************************************************/
/**********************************************************************/
/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
void wait_semaphore( int * semaphore )
#endif

#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
void wait_semaphore( P_SEMAPHORE semaphore )
#endif

#ifdef ARM7
void wait_semaphore( int * semaphore )
#endif
{
}

/**********************************************************************/
/**********************************************************************/
/*  Function: signal_semaphore                                        */
/**********************************************************************/
/**********************************************************************/

void signal_semaphore( int * semaphore )
{
}

/**********************************************************************/
/**********************************************************************/
/*  Function: set_gpio (STUB)                                         */
/**********************************************************************/
/**********************************************************************/

void set_gpio( int dummy )
{
}

/**********************************************************************/
/**********************************************************************/
/*  Function: clr_gpio (STUB)                                         */
/**********************************************************************/
/**********************************************************************/

void clr_gpio( int dummy )
{
}

/**********************************************************************/
/**********************************************************************/
/*  Function: sleep                                                   */
/**********************************************************************/
/**********************************************************************/

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
void sleep( unsigned int uiTimeInMsec )
{
  Sleep((DWORD)uiTimeInMsec );
}
#endif

/**********************************************************************/
/**********************************************************************/
/*  Function: putseq                                                  */
/**********************************************************************/
/**********************************************************************/

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
int putseq( void *sp )
{
  return(0);
}
#else
extern int putseq( struct SEQ_struct __far *sp )
{
  return(0);
}
#endif

/**********************************************************************/
/**********************************************************************/
/*  Table used by the EncodeDectalkVolume() function.                 */
/**********************************************************************/
/**********************************************************************/

#define  MAX_VOLUME  99

#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
static int dwVolumeTable[MAX_VOLUME+1] =
{
 0, 32768, 32768, 32768, 33792,
 33792, 33792, 34816, 34816, 34816,
 35840, 35840, 35840, 36864, 36864,
 36864, 37888, 37888, 37888, 38912,
 38912, 38912, 39936, 39936, 39936,
 39936, 40960, 40960, 40960, 41984,
 41984, 41984, 43008, 43008, 43008,
 44032, 44032, 44032, 45056, 45056,
 45056, 46080, 46080, 46080, 47104,
 47104, 47104, 48128, 48128, 48128,
 48128, 49152, 49152, 49152, 50176,
 50176, 50176, 51200, 51200, 51200,
 52224, 52224, 52224, 53248, 53248,
 53248, 54272, 54272, 54272, 55296,
 55296, 55296, 55296, 56320, 56320,
 56320, 57344, 57344, 57344, 58368,
 58368, 58368, 59392, 59392, 59392,
 60416, 60416, 60416, 61440, 61440,
 61440, 62464, 62464, 62464, 63488,
 63488, 63488, 63488, 64512, 64512
};
#endif

#ifdef WIN32
static dwVolumeTable[MAX_VOLUME+1] =
{
  0,  2220,  2298,  2379,  2463,
  2549,  2639,  2731,  2827,  2927,
  3030,  3136,  3246,  3361,  3479,
  3601,  3727,  3858,  3994,  4134,
  4280,  4430,  4586,  4747,  4914,
  5087,  5265,  5450,  5642,  5840,
  6046,  6258,  6478,  6706,  6941,
  7185,  7438,  7699,  7970,  8250,
  8540,  8840,  9151,  9472,  9805,
  10150,  10506,  10876,  11258,  11653,
  12063,  12487,  12926,  13380,  13850,
  14337,  14841,  15362,  15902,  16461,
  17040,  17638,  18258,  18900,  19564,
  20252,  20963,  21700,  22463,  23252,
  24069,  24915,  25791,  26697,  27635,
  28607,  29612,  30653,  31730,  32845,
  33999,  35194,  36431,  37711,  39036,
  40408,  41828,  43298,  44820,  46395,
  48025,  49713,  51460,  53268,  55140,
  57078,  59084,  61160,  63310,  65535
};
#endif

/**********************************************************************/
/**********************************************************************/
/*  Function: EncodeDectalkVolume                                     */
/*  Convert the volume numbers from 0 to MAX_VOLUME to 0 to 65535.    */
/**********************************************************************/
/**********************************************************************/

DWORD EncodeDectalkVolume( DWORD dwVolume )
{
  /*DWORD dwEncodedVolume;*/ /* MVP : Unreferenced variable */

  if ( dwVolume > MAX_VOLUME )
	dwVolume = MAX_VOLUME;

  return( dwVolumeTable[dwVolume] );
}

/**********************************************************************/
/**********************************************************************/
/*  Function: DecodeDectalkVolume                                     */
/*  Convert the volume from 0 to 65535 to 0 to MAX_VOLUME.            */
/**********************************************************************/
/**********************************************************************/

DWORD DecodeDectalkVolume( DWORD dwVolume )
{
  DWORD dwLow;
  DWORD dwMid;
  DWORD dwHigh;

  if ( dwVolume > 65535 )
  {
	dwMid = MAX_VOLUME;
  }
  else
  {
	dwLow = 0;
	dwHigh = MAX_VOLUME;

	while ( dwLow <= dwHigh )
	{
	  dwMid = ( dwLow + dwHigh ) >> 1;

	  if ( dwVolume < EncodeDectalkVolume( dwMid ))
	  {
	dwHigh = dwMid - 1;
	  }
	  else
	  {
	if ( dwVolume > EncodeDectalkVolume( dwMid ))
	{
	  dwLow = dwMid + 1;
	}
	else
	{
	  break;
	}
	  }
	}
  }
  return( dwMid );
}

/**********************************************************************/
/**********************************************************************/
/*  Function: StereoVolumeControl                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: June 30, 1994                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function changes the volume level of the audio system.     */
/*    The current volume level for the left and right channels is     */
/*    obtained. The value of iVolume is used to modify the value      */
/*    of either channels volume. The flags bLeft annd bRight          */
/*    allow conditional volume modification for each channel.         */
/*    State variable iVolumeType indicates if the volume is to be     */
/*    turned UP, turned DOWN or SET.                                  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    iVolume        The value used to change the volume.             */
/*                                                                    */
/*    iVolumeType    Used to indicate how the volume is to be         */
/*                   modified. It must be one of the following        */
/*                   constants;                                       */
/*                                                                    */
/*                     VOLUME_SET         0                           */
/*                     VOLUME_UP          1                           */
/*                     VOLUME_DOWN        2                           */
/*                                                                    */
/*    bLeft          If this boolean is true then the left channel    */
/*                   volume is modified.                              */
/*                                                                    */
/*    bRight         If this boolean is true then the right channel   */
/*                   volume is modified.                              */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function does not return a value. The audio system volume  */
/*    may be modified upon return.                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void StereoVolumeControl( LPTTS_HANDLE_T phTTS,
			  int iVolume,
			  int iVolumeType,
			  BOOL bLeft,
			  BOOL bRight )
{
  DWORD dwStereoVolume;
  DWORD dwRightChannelVolume;
  DWORD dwLeftChannelVolume;
  /*LPTTS_HANDLE_T phTTS;*/

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
  /*phTTS = TextToSpeechGetHandle();*/
  PA_GetVolume( phTTS->pAudioHandle, &dwStereoVolume );
#endif


  /********************************************************************/
  /*  Extract the right channel volume from the high 16 bits and      */
  /*  the left channel volume from the low 16 bits.                   */
  /*  (Although shifting a DWORD 16 bits should not involve sign      */
  /*  extension, mask with 0xFFFF anyways to be sure.)                */
  /********************************************************************/

  dwRightChannelVolume = ( dwStereoVolume >> 16 ) & 0xFFFF;
  dwLeftChannelVolume = dwStereoVolume & 0xFFFF;

  /********************************************************************/
  /*  Conditionally update the left channel volume.                   */
  /********************************************************************/

  if ( bLeft )
  {
	/******************************************************************/
	/*  Convert the volume from 0 to 65535 to 0 to MAX_VOLUME.        */
	/******************************************************************/

	dwLeftChannelVolume = DecodeDectalkVolume( dwLeftChannelVolume );

	/******************************************************************/
	/*  Change the left volume level.                                 */
	/******************************************************************/

	dwLeftChannelVolume = ModifyVolume( dwLeftChannelVolume,
					iVolume,
					iVolumeType );

	/******************************************************************/
	/*  Convert the volume numbers from 0 to MAX_VOLUME to 0 to 65535 */
	/******************************************************************/

	dwLeftChannelVolume = EncodeDectalkVolume( dwLeftChannelVolume );
  }

  /********************************************************************/
  /*  Conditionally update the right channel volume.                  */
  /********************************************************************/

  if ( bRight )
  {
	/******************************************************************/
	/*  Convert the volume from 0 to 65535 to 0 to MAX_VOLUME.        */
	/******************************************************************/

	dwRightChannelVolume = DecodeDectalkVolume( dwRightChannelVolume );

	/******************************************************************/
	/*  Change the right channel volume level.                        */
	/******************************************************************/

	dwRightChannelVolume = ModifyVolume( dwRightChannelVolume,
					 iVolume,
					 iVolumeType );

	/******************************************************************/
	/*  Convert the volume numbers from 0 to MAX_VOLUME to 0 to 65535 */
	/******************************************************************/

	dwRightChannelVolume = EncodeDectalkVolume( dwRightChannelVolume );
  }

  /********************************************************************/
  /*  Set the new volume levels.                                      */
  /********************************************************************/

  dwStereoVolume = ( dwRightChannelVolume << 16 ) | dwLeftChannelVolume;

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
  PA_SetVolume( phTTS->pAudioHandle, dwStereoVolume );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: ModifyVolume                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: June 30, 1994                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function modifies the passed volume level 'dwVolume'. The  */
/*    value of iVolume is used to modify the value of 'dwVolume'.     */
/*    State variable iVolumeType indicates if the volume is to be     */
/*    turned UP, turned DOWN or SET.                                  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    dwVolume       The passed volume level.                         */
/*                                                                    */
/*    iVolume        The value used to change the volume.             */
/*                                                                    */
/*    iVolumeType    Used to indicate how the volume is to be         */
/*                   modified. It must be one of the following        */
/*                   constants;                                       */
/*                                                                    */
/*                     VOLUME_SET         0                           */
/*                     VOLUME_UP          1                           */
/*                     VOLUME_DOWN        2                           */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns the new volume level.                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static DWORD ModifyVolume( DWORD dwVolume,
			   int iVolume,
			   int iVolumeType )
{
  switch( iVolumeType )
  {
  /********************************************************************/
  /*  Volume set.                                                     */
  /********************************************************************/

  case VOLUME_SET:

	dwVolume = iVolume;

	break;

  /********************************************************************/
  /*  Volume up.                                                      */
  /********************************************************************/

  case VOLUME_UP:

	dwVolume += (DWORD)iVolume;

	if ( dwVolume > MAX_VOLUME )
	  dwVolume = MAX_VOLUME;

	break;

  /********************************************************************/
  /*  Volume down.                                                    */
  /********************************************************************/

  case VOLUME_DOWN:

	dwVolume -= (DWORD)iVolume;

	if ((int)dwVolume < 0 )
	  dwVolume = 0;

	break;

  default:
	break;
  }

  return( dwVolume );
}

/**********************************************************************/
/**********************************************************************/
/*  Function: SetStereoVolume                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: June 30, 1994                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function independanntly sets the left and right channel    */
/*    volume levels.                                                  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    iLeftVolume     The left channel volume level from 0 to 99.     */
/*                                                                    */
/*    iRightVolume    The right channel volume level from 0 to 99.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function does not return a value. The audio system volume  */
/*    may be modified upon return.                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void SetStereoVolume( LPTTS_HANDLE_T phTTS, int iLeftVolume, int iRightVolume )
{
  DWORD dwStereoVolume;
  DWORD dwRightChannelVolume;
  DWORD dwLeftChannelVolume;
  /*LPTTS_HANDLE_T phTTS;*/

  if  (( iLeftVolume >= 0 ) && ( iLeftVolume <= MAX_VOLUME )
	&& ( iRightVolume >= 0 ) && ( iRightVolume <= MAX_VOLUME ))
  {

	/********************************************************************/
	/*  Convert the volume numbers from 0 to MAX_VOLUME to 0 to 65535   */
	/********************************************************************/

	dwLeftChannelVolume = EncodeDectalkVolume((DWORD)iLeftVolume );
	dwRightChannelVolume = EncodeDectalkVolume((DWORD)iRightVolume );

	dwStereoVolume = ( dwRightChannelVolume << 16 ) | dwLeftChannelVolume;

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	/*phTTS = TextToSpeechGetHandle();*/
	PA_SetVolume( phTTS->pAudioHandle, dwStereoVolume );
#endif

  }

  return;
}

#ifdef MSDOS
/**********************************************************************/
/**********************************************************************/
/*  Function: vol_up                                                  */
/*  Bump volume up "count" notches.                                   */
/**********************************************************************/
/**********************************************************************/

void vol_up( int count )
{
}


/**********************************************************************/
/**********************************************************************/
/*  Function: vol_down                                                */
/*  Bump volume down "count" notches.                                 */
/**********************************************************************/
/**********************************************************************/

void vol_down( int count )
{
}
/**********************************************************************/
/**********************************************************************/
/*  Function: vol_set                                                 */
/*  Set volume to "count". Out of range values ignored.               */
/**********************************************************************/
/**********************************************************************/

void vol_set( int count )
{
}
#endif

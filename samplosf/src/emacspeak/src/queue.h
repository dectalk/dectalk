/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	06/24/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	06/24/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	06/24/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	06/24/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	06/24/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	06/24/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	06/24/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	06/24/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	06/24/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	06/24/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	06/24/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	06/24/97	leeber	Initial Version
$
 * Revision 1.1.2.3  1996/10/01  17:14:32  Cathy_Page
 * 	Removed dtmmedefs header file
 * 	[1996/10/01  17:13:19  Cathy_Page]
 *
 * Revision 1.1.2.2  1995/11/14  21:35:10  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:48  Krishna_Mangipudi]
 * 
 * $EndLog$
 */
#include <stdio.h>
#ifndef _TTSAPI_H_
#include <ttsapi.h>
#endif

typedef struct _item {
  /* 	*/
  struct _item	*p_forwp;
  struct _item	*p_backp;
  /* 	*/
  void		*p_key;
  int  (*compare)(int,int);
  /*    */
  union {
     TTS_BUFFER_T	*dtp;
  } u;
} QITEM;

typedef struct _IOQ {
  QITEM	*q_hp;
  QITEM	*q_tp;
  int	q_pri;		/* Boolean, is this a priority queue? */
} QUEUE;


extern void makeQueueNull(QUEUE *qp, int prioflag);
extern void insertQueueTail(QUEUE *qp, QITEM *p);
extern void insertQueue(QUEUE *qp, QITEM *p);
extern QITEM * deQueue(QUEUE *qp);
extern void deleteQueueEntry(QUEUE *qp, QITEM *p);
/*extern void printQueue(QUEUE *qp, char *s);*/
extern int searchQueue(QUEUE *qp, QITEM *p);
extern int numQueue(QUEUE *qp);

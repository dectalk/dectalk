/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.2  1995/11/14  21:35:00  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:46  Krishna_Mangipudi]
 *
 * $EndLog$
 */

#include "queue.h"

/*************************************************************
 *	 procedures.
 *************************************************************/
void makeQueueNull(QUEUE *qp, int flag)
{
  qp->q_hp = qp->q_tp = (QITEM *)NULL;
  qp->q_pri = flag;
}

void insertQueueTail(QUEUE *qp, QITEM *ip)
{
  if (qp->q_tp == (QITEM *)NULL) {
    qp->q_tp = ip;
    qp->q_hp = ip;
    ip->p_forwp = ip->p_backp = (QITEM *)NULL;
    return;
  } 
  qp->q_tp->p_forwp = ip;
  ip->p_forwp = (QITEM *)NULL;
  ip->p_backp = qp->q_tp;
  qp->q_tp = ip;
}

/*
 * 
 */
void insertQueue(QUEUE *qp, QITEM *ip)
{
  QITEM *old,*p;

  if (qp->q_pri == 0) {
    /* Not a prio queue, place at end. */
    insertQueueTail(qp, ip); 
    return;
  }
  /* Priority queue, insert based on comparison of key. */
  if (qp->q_tp == (QITEM *)NULL) {
	  qp->q_tp = ip;
	  qp->q_hp = ip;
	  ip->p_forwp = ip->p_backp = (QITEM *)NULL;
	  return;
  } 
  p = qp->q_hp;
  old = (QITEM *)NULL;
  while(p) {
    /*
     * Maintain sorted by key, however for equal keys,
     * the new key is placed furthest down the list
     * (obeying some form of FCFS, round robin scheduling.)
     */
    if (p->p_key <= ip->p_key) {
      old = p;
      p = p->p_forwp;
    } else {
      if (p->p_backp) {
	/* Middle of list. */
	p->p_backp->p_forwp = ip;
	ip->p_forwp = p;
	ip->p_backp = p->p_backp;
	p->p_backp = ip;
	return;
      }
      /* New first element */
      ip->p_forwp = p;
      ip->p_backp = (QITEM *)NULL;
      p->p_backp = ip;
      qp->q_hp = ip;
      return;
    }
  }
  /* New end element. */
  ip->p_forwp = (QITEM *)NULL;
  ip->p_backp = qp->q_tp;
  qp->q_tp->p_forwp = ip;
  qp->q_tp = ip;
}

QITEM * deQueue(QUEUE *qp)
{
  QITEM	*ip;

  if( (ip=qp->q_hp) == (QITEM *)NULL)
    return ((QITEM *)NULL);

  deleteQueueEntry(qp, ip);
  return (ip);
}

void deleteQueueEntry(QUEUE *qp, QITEM *ip)
{
  if (ip->p_backp != (QITEM *)NULL)
    ip->p_backp->p_forwp = ip->p_forwp;
  else {
    qp->q_hp = ip->p_forwp;
    if (qp->q_hp != (QITEM *)NULL)
      qp->q_hp->p_backp = (QITEM *)NULL;
  }
  if (ip->p_forwp != (QITEM *)NULL)
    ip->p_forwp->p_backp = ip->p_backp;
  else
    qp->q_tp = ip->p_backp;

  /* Clobber deleted entries links, he does not belong to a list. */
  ip->p_forwp = ip->p_backp = (QITEM *)NULL;
}

/*
void printQueue(QUEUE *qp, char *s)
{
  QITEM *ip=qp->q_hp;

  while(ip != (QITEM *)NULL) {
    fprintf(stderr,"%s %8x\n",s, ip);
    ip = ip->p_forwp;
  }
}
*/

int searchQueue(QUEUE *qp, QITEM *p)
{
  QITEM *ip=qp->q_hp;

  while(ip != (QITEM *)NULL) {
    if (ip == p) return TRUE;
    ip = ip->p_forwp;
  }
  return FALSE;
}


int numQueue(QUEUE *qp) {
  QITEM *ip=qp->q_hp;
  int index;

  index=0;
  while(ip !=(QITEM *)NULL) {
    index++;
    ip = ip->p_forwp;
  }
  return index;
}
    





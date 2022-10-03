/*                       COPYRIGHT NOTICE 
   Copyright © 2001 Force Computers Inc. A Solectron company. All rights reserved.    

   All Rights reserved. Unpublished rights reserved under the 
   copyright laws of the United States. Copyright is claimed in 
   the computer program and user interface thereof. 
 
   The software contained on this media is proprietary to and 
   embodies the confidential technology of Force Computers Incorporated.
   Possession, use, duplication or dissemination of 
   the software and media is authorized only pursuant to a valid
   written license from Force Computers Incorporated.
  
   The name of Force Copmuters Incorporated may not be used to endorse or 
   promote products derived from this software without specific prior 
   written permission. All other rights reserved.
  
   THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
   WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF
   NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. 
   Force assumes no responsibility AT ALL for the use or reliability of 
   this software.
*/
/*
 *****************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     ---------------------
 * 001	ETT		11/19/1999		fixed stuff for osf...
 * 002	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 003	MGS		05/21/2001		More VxWorks porting
 * 004 	CAB		05/25/2001		Added copyright info
 * 005	MGS		06/19/2001		Solaris Port BATS#972
 ****************************************************/

#include <stdio.h>
#include <sys/types.h>
#ifndef VXWORKS
#include <sys/ipc.h>
#include <sys/shm.h>
#endif
#include <errno.h>

#include "shmalloc.h"


#if defined DEMO && defined _SPARC_SOLARIS_
void __init_shared_mem(void);
void __fini_shared_mem(void);
#pragma init (__init_shared_mem)
#pragma fini (__fini_shared_mem)
#endif


pshared_mem_t pShm_t;
int shared_mem_id;
int allocated;
#ifdef __osf__
pthread_mutex_t *tlPlayAudio;
#endif

#if defined VXWORKS || defined _SPARC_SOLARIS_
pthread_mutex_t *tlPlayAudio;
pthread_mutex_t *loaded_license_mutex;
#endif
#if !defined DEMO && defined _SPARC_SOLARIS_
void _init(void)
#else
void __init_shared_mem(void)
#endif
{
  int ret;
  int init_it=0;
  allocated=0;
#ifdef VXWORKS
  pthreadLibInit();
#endif
#ifdef __osf__
  shared_mem_id=shmget(getpid(),sizeof(shared_mem_t),IPC_CREAT|0666);
  if (shared_mem_id<0)
  {
     perror("Cannot get shared memory");
     exit(3);
  }
  pShm_t=(pshared_mem_t)shmat(shared_mem_id,0,0);
  if ((int)pShm_t==-1)
    {
      perror("Cannot attach to shared memory");
      exit(2);
    }
#endif
  
#ifdef __osf__
  tlPlayAudio=OP_CreateMutex();
#endif
#if defined VXWORKS || defined _SPARC_SOLARIS_
  tlPlayAudio=OP_CreateMutex();
  loaded_license_mutex=OP_CreateMutex();
#endif
  allocated=1;
}

#if !defined DEMO && defined _SPARC_SOLARIS_
void _fini(void)
#else
void __fini_shared_mem(void)
#endif
{
	int shared_mem_id2;
	if (allocated)
	{
#ifdef __osf__
		shmdt((char *)pShm_t);
		shmctl(shared_mem_id,IPC_RMID,0);
	OP_DestroyMutex(tlPlayAudio);
#endif
#if defined VXWORKS || defined _SPARC_SOLARIS_
	OP_DestroyMutex(tlPlayAudio);
	OP_DestroyMutex(loaded_license_mutex);
#endif
	}
}

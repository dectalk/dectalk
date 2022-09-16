/*
 *****************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     ---------------------
 * 001	ETT		11/19/1999		fixed stuff for osf...
 ****************************************************/

#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <errno.h>

#include "shmalloc.h"

pshared_mem_t pShm_t;
int shared_mem_id;
int allocated;
pthread_mutex_t *tlPlayAudio;

void __init_shared_mem(void)
{
  int ret;
  int init_it=0;
  allocated=0;
  shared_mem_id=shmget(getpid(),0,0);
  pShm_t=(pshared_mem_t)shmat(shared_mem_id,0,0);
  if ((int)pShm_t==-1)
    {
      perror("Cannot attach to shared memory");
      exit(2);
    }
  
  tlPlayAudio=OP_CreateMutex();

  allocated=1;
}

void __fini_shared_mem(void)
{
	if (allocated)
	{
		shmdt((char *)pShm_t);
	}
}

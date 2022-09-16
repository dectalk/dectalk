/*
 * 001 MGS	02/02/1998	Added thread-safe code
 * 002 MGS      02/17/1998      Fixed Thread safe code for UNIX 3.2.
 * 003 MGS	11/03/1998	Made changes for 4.0 vs 4.0D differences BATS #764
 */

/*
 * Note: This file is dependent on the Makefile correctly determining
 * the version of UNIX.
 */

#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <errno.h>
#include <pthread.h>

#include "shmalloc.h"

#ifndef __linux__ /* we don't use this stuf in linux */

pshared_mem_t pShm_t;
int shared_mem_id;
int allocated;
#ifdef OSF_VERSION_V3.2
pthread_mutex_t *hGreatLoadMutex;
pthread_mutex_t *hGreaterPIDMutex;
pthread_mutex_t *hGreatestInitMutex;
#else
pthread_mutex_t GreatLoadMutex=PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t GreaterPIDMutex=PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t GreatestInitMutex=PTHREAD_MUTEX_INITIALIZER;

pthread_mutex_t *hGreatLoadMutex=&GreatLoadMutex;
pthread_mutex_t *hGreaterPIDMutex=&GreaterPIDMutex;
pthread_mutex_t *hGreatestInitMutex=&GreatestInitMutex;
#endif

pthread_mutexattr_t loadattr;
pthread_mutexattr_t PIDattr;
pthread_mutexattr_t initattr;


void __init_shared_mem_s(void)
{
	int ret;
	int init_it=0;
	allocated=0;
	shared_mem_id=shmget(getpid(),sizeof(shared_mem_t)+64,IPC_CREAT | SHM_R | SHM_W );
	if (shared_mem_id==-1)
	{
		perror("cannot allocated shared memory\n");
		exit(1);
	}
	allocated=1;	
	pShm_t=(pshared_mem_t)shmat(shared_mem_id,0,0);
	if (pShm_t==-1)
	{
		perror("Cannot attach to shared memory");
		exit(2);
	}
	memset(pShm_t,0,sizeof(shared_mem_t));
#ifdef MME_THREAD_SAFE
	pShm_t->hmxGlobalMmeServer=NULL;
#endif
	pShm_t->uiGlobalPlayAudioInstance = 0;
	pShm_t->bGlobalPlayAudioThreadExit = TRUE;
	pShm_t->hGlobalPlayAudioThread = NULL;
	pShm_t->hmxGlobalSendPlayAudio = NULL;
	pShm_t->pGlobalReportMessageQueue = NULL;
	pShm_t->pGlobalPlayAudioMessageQueue = NULL;
#ifdef USE_MME_SERVER
	pShm_t->bGlobalMmeCallbackExit = FALSE;
	pShm_t->hGlobalMmeCallbackThread = NULL;
#endif

#ifdef OS_SIXTY_FOUR_BIT
	pShm_t->uiGlobalHandleListLength = 0;
	pShm_t->hmxGlobalHandleList = NULL;
	pShm_t->ppGlobalHandleList = NULL;
#endif

	pShm_t->pFreePool=NULL;
	pShm_t->pSharedMemoryList=NULL;
	pShm_t->pAllocatedMemoryList=NULL;

#ifdef OSF_VERSION_V3.2
	hGreatLoadMutex=(pthread_mutex_t *)malloc(sizeof(pthread_mutex_t));
	if (hGreatLoadMutex==NULL)
	{
		perror("cannot allocate memory");
		exit(-3);
	}

	hGreaterPIDMutex=(pthread_mutex_t *)malloc(sizeof(pthread_mutex_t));
	if (hGreaterPIDMutex==NULL)
	{
		perror("cannot allocate memory");
		exit(-3);
	}

	hGreatestInitMutex=(pthread_mutex_t *)malloc(sizeof(pthread_mutex_t));
	if (hGreatestInitMutex==NULL)
	{
		perror("cannot allocate memory");
		exit(-3);
	}

#ifdef OSF_VERSION_V3.2
	pthread_mutexattr_create( &loadattr);
	pthread_mutexattr_create( &PIDattr);
	pthread_mutexattr_create( &initattr);
#else
	pthread_mutexattr_init( &loadattr);
	pthread_mutexattr_init( &PIDattr);
	pthread_mutexattr_init( &initattr);
#endif

	pthread_mutex_init(hGreatLoadMutex,loadattr);
	if (hGreatLoadMutex==NULL)
	{
		perror("cannot initialize mutex");
		exit(-3);
	}

	pthread_mutex_init(hGreaterPIDMutex,PIDattr);
	if (hGreaterPIDMutex==NULL)
	{
		perror("cannot initialize mutex");
		exit(-3);
	}

	pthread_mutex_init(hGreatestInitMutex,initattr);
	if (hGreatestInitMutex==NULL)
	{
		perror("cannot initialize mutex");
		exit(-3);
	}
#ifdef OSF_VERSION_V3.2
	pthread_mutexattr_delete(&loadattr);
	pthread_mutexattr_delete(&PIDattr);
	pthread_mutexattr_delete(&initattr);
#else
	pthread_mutexattr_destroy(&loadattr);
	pthread_mutexattr_destroy(&PIDattr);
	pthread_mutexattr_destroy(&initattr);
#endif

#endif

}

void __fini_shared_mem_s(void)
{
	if (allocated)
	{
//		shmdt(pShm_t);
		shmctl(shared_mem_id,IPC_RMID,0);
	}
#ifdef OSF_VERSION_V3.2
	pthread_mutex_destroy(hGreatLoadMutex);
	pthread_mutex_destroy(hGreaterPIDMutex);
	pthread_mutex_destroy(hGreatestInitMutex);
#endif

}

#endif /* #ifndef __linux__ */

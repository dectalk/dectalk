/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.10  1996/02/27  15:59:04  Bill_Hallahan
 * 	Removed redundnat memory de-allocation
 * 	[1996/02/27  15:58:11  Bill_Hallahan]
 *
 * Revision 1.1.2.9  1996/02/27  02:55:52  Krishna_Mangipudi
 * 	Temporary fix in OP_THREAD_ROUTINE - Bill.H needs to look at it
 * 	[1996/02/27  02:55:40  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.8  1996/02/15  05:19:58  Bill_Hallahan
 * 	Fixed queued character count and wave file problems
 * 	[1996/02/15  05:16:42  Bill_Hallahan]
 * 
 * Revision 1.1.2.7  1996/02/15  03:16:18  Bill_Hallahan
 * 	Link List now feeds the text thread
 * 	[1996/02/15  03:15:45  Bill_Hallahan]
 * 
 * Revision 1.1.2.6  1996/01/22  17:02:29  Bill_Hallahan
 * 	{** Merge Information **}
 * 		{** Command used:	bsubmit **}
 * 		{** Ancestor revision:	1.1.2.2 **}
 * 		{** Merge revision:	1.1.2.5 **}
 * 	{** End **}
 * 	Added deeeebug statements in reset functions
 * 	[1996/01/22  17:01:30  Bill_Hallahan]
 * 
 * 	Fixed Synchronization problem
 * 	[1996/01/04  19:19:28  Bill_Hallahan]
 * 
 * 	New audio subsystem and fixed reset
 * 	[1996/01/04  03:21:12  Bill_Hallahan]
 * 
 * 	New audio subsystem and fixed reset
 * 	[1996/01/03  21:02:49  Bill_Hallahan]
 * 
 * Revision 1.1.2.2  1995/07/05  19:36:26  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:34:05  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.5  1995/06/12  20:01:12  Krishna_Mangipudi
 * 	Modified text_pipe to pass PIPE_TYPE_QWORD
 * 	[1995/06/12  20:00:55  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.4  1995/03/17  15:23:30  Krishna_Mangipudi
 * 	Rearrange Include files
 * 	[1995/03/17  15:23:08  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.3  1994/11/09  15:59:29  Krishna_Mangipudi
 * 	V4.2 SSB
 * 	[1994/11/08  22:16:42  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:09:54  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:16:51  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/**********************************************************************/
/*                                                                    */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Digital Equipment Corporation. Possession, use,     */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Digital or an authorized          */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Digital assumes no responsibility AT    */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/

/*****************************************************************************
**  PROGRAM:
**     ttsutils.c 
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**      This file contains utility routines called from ttsapi.c
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**     Darrell C. Stam
**
**  CREATION DATE:
**     October 12th, 1993
**     3 December, 1993  - DCS	Add Memory handling routines.
**
**  MODIFICATION HISTORY:
**
*****************************************************************************/
/* to enable us to use DEC specific mme structures */
#define DEC 1 

#include <stdio.h>
#include <pthread.h>
#include <fcntl.h>
#include <errno.h>
#include <math.h>
#include "opthread.h"
#include "pipe.h"
#include "tts.h"
#include "kernel.h"
#include "cmd.h"
#include "esc.h"
#include "phdefs.h"
#include "samprate.h"

#ifdef DBGLEV
  /*
   * Global variables to print out
   * average, rms and peak signal
   * levels of VTM output.
   */
  double avgsum;
  double rmssum;
  double peak;
#endif

/**********************************************************************/
/*  Function Prototypes.                                              */
/**********************************************************************/

void EmptyVtmPipe();
unsigned int GetQueuedCharacterCount( LPTTS_HANDLE_T ttsHandle );

/*
 **********************************************************************
 * thread entry points
 **********************************************************************
 */
extern cmd_main(); 
extern lts_main();
extern ph_main();
extern vtm_main();
extern sync_main();

OP_THREAD_ROUTINE( text_main, LPTTS_HANDLE_T ttsHandle );

/*
 **********************************************************************
 * externally referenced routines 
 **********************************************************************
 */
#ifdef AF_SERVER 
extern AF_play_main();
#endif

/*  extern stdout_play_main();  */

/***********************************************************************/
/* Function prototypes.						       */
/***********************************************************************/


#ifdef AF_SERVER
MMRESULT init_AF();
#endif

unsigned char LinearToMuLaw( short );

/*
 **********************************************************************
 * thread id's
 **********************************************************************
 */
#define TEXT_THREAD      1 
#define CMD_THREAD       2
#define LTS_THREAD       3
#define PH_THREAD        4
#define VTM_THREAD       5
#define PLAY_THREAD      6
#define SYNC_THREAD      7 
/*
 **********************************************************************
 * thread handles
 **********************************************************************
 */

extern pthread_t text_thread;
extern pthread_t cmd_thread;
extern pthread_t lts_thread;
extern pthread_t ph_thread;
extern pthread_t vtm_thread;
extern pthread_t sync_thread;
extern pthread_t play_thread;
/*
 **********************************************************************
 * inter-thread communication channels
 **********************************************************************
 */
extern P_PIPE cmd_pipe;
extern P_PIPE lts_pipe;
extern P_PIPE ph_pipe;
extern P_PIPE vtm_pipe;
extern P_PIPE sync_pipe;
extern P_PIPE buffer_pipe;

/*
 **********************************************************************
 * Macros
 **********************************************************************
 */
#define syserr_exit(proc_name,mesg) \
{ \
    fprintf(stderr,mesg); \
    perror(proc_name); \
    fflush(stderr); \
    return(MMSYSERR_ERROR); \
}

#define BYTES_TO_ITEMS(_pipe,_nbytes) ( (_nbytes) >> (_pipe)->bshift )

/****************************************************************************
**                                                                    
**  WriteAudioToFile                                        
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**    This function writes audio samples to the wave output file.     
**                                                                    
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    ttsHandle     A pointer to a structure of type LPTTS_HANDLE_T.  
**                                                                    
**    pBuffer       A pointer (of type LPAUDIO_T) to a buffer which   
**                  contains samples (of type AUDIO_T).               
**                                                                    
**                                                                    
**    uiLength      The number of audio sample in the buffer.         
**                                                                    
**                                                                    
**  RETURN VALUE:                                                           
**                                                                    
**    This function returns a value of type MMRESULT.                 
**    The value will be zero if the function is successful.           
**                                                                    
*****************************************************************************/

MMRESULT WriteAudioToFile( LPTTS_HANDLE_T ttsHandle, 
                           unsigned short *pBuffer,
                           UINT uiLength )
{
  UINT i;
  unsigned char * pTemp;
  size_t Size;
  DWORD dwFormatTmp;
  short *pSource;

#ifdef TTSDBG
  char proc_name[]="WriteAudioToFile";
  printf("%s\n",proc_name);
#endif
  
#ifdef DBGLEV
  double level = 0.0; 
#endif


  /********************************************************************/
  /*  Return error if NULL handle.                                    */
  /********************************************************************/

  if (ttsHandle == NULL)
     return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Convert the 16 bit samples to the desired output format.        */
  /********************************************************************/

  switch( ttsHandle->dwFormat )
  {
  case WAVE_FORMAT_1M16:

#ifdef DBGLEV
    pSource = pBuffer;
    for ( i = 0; i < uiLength; i++ )
    {
      level = (double) fabs ( (double) (*pSource++)  );
      if ( level > peak )
         peak = level;
      
      avgsum = avgsum + level;
      rmssum = rmssum + (level * level);
    }
#endif

    Size = sizeof( short );

    break;

  case WAVE_FORMAT_1M08:

    pSource = pBuffer;
    pTemp = (unsigned char *)pBuffer;

    for ( i = 0; i < uiLength; i++ )
      *pTemp++ = ((unsigned char)((*pSource++) >> 8)) ^ 0x80;

    Size = sizeof( unsigned char );
    break;

  case WAVE_FORMAT_08M08:

    pSource = pBuffer;
    pTemp = (unsigned char *)pBuffer;

    for ( i = 0; i < uiLength; i++ )
      *pTemp++ = LinearToMuLaw( *pSource++ );

    Size = sizeof( unsigned char );
    break;

  default:

    return( MMSYSERR_INVALHANDLE );
  }

  /********************************************************************/
  /*  Write the samples to the output file.                           */
  /********************************************************************/

  if ( uiLength != fwrite( pBuffer,
                           Size,
                           (size_t)uiLength,
                           ttsHandle->pWaveFile ))
    return( MMSYSERR_ERROR );

  ttsHandle->uiFileSampleCount += uiLength;

  return( MMSYSERR_NOERROR );
}

/****************************************************************************
**                                                                    
**  LinearToMuLaw.c                                         
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**    This routine converts from linear to ulaw.                      
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    wSample       A signed 16 bit linear sample                     
**                                                                    
**  RETURN VALUE
**                                                                    
**    This function returns a value of type unsigned char which is    
**    an 8 bit ulaw sample.                                           
**                                                                    
*****************************************************************************/

/**********************************************************************/
/*  Turn on the trap as per the MIL-STD                               */
/*  Turn off the trap for telephone applications.                     */
/**********************************************************************/

/* #define ZEROTRAP */

/**********************************************************************/
/*  Define the add-in bias for 16 bit samples                         */
/**********************************************************************/

#define  MULAW_BIAS         0x84
#define  MULAW_CLIP_LEVEL  32635

unsigned char LinearToMuLaw( short wSample )
{
  static short wExponentLut[256] = { 0,0,1,1,2,2,2,2,3,3,3,3,3,3,3,3,
                                     4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
                                     5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                                     5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                                     6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                                     6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                                     6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                                     6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                                     7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 };
  short wSign;
  short wExponent;
  short wMantissa;
  unsigned char cMuLawByte;

  /********************************************************************/
  /*  Get the sample into sign-magnitude.                             */
  /*  First save the sign.                                            */
  /********************************************************************/

  wSign = ( wSample >> 8 ) & 0x80;

  /********************************************************************/
  /*  Get magnitude.                                                  */
  /********************************************************************/

  if ( wSign != 0 )
    wSample = - wSample;
                                                                                
  /********************************************************************/
  /*  Clip the magnitude.                                             */
  /********************************************************************/

  if ( wSample > MULAW_CLIP_LEVEL )
    wSample = MULAW_CLIP_LEVEL;

  /********************************************************************/
  /*  Convert from 16 bit linear to mu-law.                           */
  /********************************************************************/

  wSample = wSample + MULAW_BIAS;
  wExponent = wExponentLut[ ( wSample >> 7 ) & 0xFF ];
  wMantissa = ( wSample >> ( wExponent + 3 ) ) & 0x0F;
  cMuLawByte = ~ ( wSign | ( wExponent << 4 ) | wMantissa );

  /********************************************************************/
  /*  Optional CCITT trap                                             */
  /********************************************************************/

#ifdef ZEROTRAP
  if ( cMuLawByte == 0 )
    cMuLawByte = 0x02;
#endif

  return( cMuLawByte );
}

/*******************************************************************************
**
**  create_pipes 
**
**  FUNCTIONAL DESCRIPTION:
**
**    create inter-thread communication pipes for the DECtalk synthesizer
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
******************************************************************************/
create_pipes( LPTTS_HANDLE_T ttsHandle )
{
#ifdef TTSDBG
  char proc_name[]="create_pipes";
  printf("%s\n",proc_name);
#endif

  /********************************************************************/
  /*  Return error if NULL handle.                                    */
  /********************************************************************/

   if (ttsHandle == NULL)
     return( MMSYSERR_INVALHANDLE );

   cmd_pipe  = tts_create_pipe( CMD_THREAD, ttsHandle->uiBufferSize,
                                                     PIPE_TYPE_BYTE  );
   lts_pipe  = tts_create_pipe( LTS_THREAD,    64,   PIPE_TYPE_WORD  );
   ph_pipe   = tts_create_pipe( PH_THREAD,     128,  PIPE_TYPE_WORD  );
   vtm_pipe  = tts_create_pipe( VTM_THREAD,    4096, PIPE_TYPE_WORD  );
   sync_pipe = tts_create_pipe( SYNC_THREAD,   256,  PIPE_TYPE_DWORD );
}
/*******************************************************************************
**
**  start_threads
**
**  FUNCTIONAL DESCRIPTION:
**
**    start the DECtalk synthesizer threads
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
******************************************************************************/
start_threads( LPTTS_HANDLE_T ttsHandle, pthread_attr_t attr )
{
   if (ttsHandle == NULL)
     return( MMSYSERR_INVALHANDLE );

    /******************************************************************/
    /*  Create the text queuing thread.                               */
    /******************************************************************/

    ttsHandle->hTextQueueingThread =
              OP_CreateThread( 0,
                               (THREAD_PROCEDURE_T)text_main,
                               ttsHandle );

    if ( ttsHandle->hTextQueueingThread == NULL )
    {
#ifdef TTSDBG
       syserr_exit("TextToSpeechStartup","Error creating TEXT_THREAD!\n");
#endif
       return ( MMSYSERR_NOTENABLED );
    }

   if ( pthread_create( &vtm_thread, attr, vtm_main, ttsHandle ) != 0 )
     {
#ifdef TTSDBG
       syserr_exit("TextToSpeechStartup","Error creating VTM_THREAD!\n");
#endif
       return ( MMSYSERR_NOTENABLED );
     }

   if ( pthread_create( &sync_thread, attr, sync_main, ttsHandle ) != 0 )
     {
#ifdef TTSDBG
       syserr_exit("TextToSpeechStartup","Error creating SYNC_THREAD!\n");
#endif
       return ( MMSYSERR_NOTENABLED );
     }

   if ( pthread_create( &ph_thread, attr, ph_main, PH_THREAD ) != 0 )
     {
#ifdef TTSDBG
       syserr_exit("TextToSpeechStartup","Error creating PH_THREAD!\n");
#endif
       return ( MMSYSERR_NOTENABLED );
     }

   if ( pthread_create( &lts_thread, attr, lts_main, LTS_THREAD ) != 0 )
     {
#ifdef TTSDBG
       syserr_exit("TextToSpeechStartup","Error creating LTS_THREAD!\n");
#endif
       return ( MMSYSERR_NOTENABLED );
     }

   if ( pthread_create( &cmd_thread, attr, cmd_main, CMD_THREAD ) != 0 )
     {
#ifdef TTSDBG
       syserr_exit("TextToSpeechStartup","Error creating CMD_THREAD!\n");
#endif
       return ( MMSYSERR_NOTENABLED );
     }
}
/*********************************************************************
**                                                                    
**  Function: QueueToMemory                                           
**  Author: Bill Hallahan                                             
**  Date: September 28, 1993                                          
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**         This function queues a buffer of samples to a circular     
**    buffer in shared memory. This function will block until there   
**    is enough space in the circular buffer. This function is called 
**    by the driver for the vocal tract model in file vtmiont.c.      
**                                                                    
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    ttsHandle              A pointer to a structure of type             
**                       TTS_HANDLE_T.                                
**                                                                    
**    pSamples           A pointer (of type LPAUDIO_T) to a buffer    
**                       which contains samples (of type AUDIO_T).    
**                                                                    
**                                                                    
**    dwNumberOfSamples  A DWORD which is equal to the number of 16   
**                       bit samples to be queued which are in the    
**                       buffer pointed to by "pBuffer".              
**                                                                    
**                                                                    
**  RETURN VALUE
**                                                                    
**    None.                                                           
**                                                                    
*****************************************************************************/

void QueueToMemory( LPTTS_HANDLE_T ttsHandle,
                    short *pSamples,
                    DWORD dwNumberOfSamples )
{
  static unsigned int i;
  static DWORD dwBytesLeft;
  static DWORD dwSpaceLeft;
  static LPSTR pBuffer;
  LPSTR  dwSyncParams[3];
  static LPTTS_BUFFER_T pSpeechBuffer;
  static LPTTS_BUFFER_T pPipeArray[1];

#ifdef TTSDBG
  char proc_name[]="QueueToMemory";
  printf("%s\n",proc_name);
#endif

  /********************************************************************/
  /*  Loop until all samples have been moved into buffers.            */
  /********************************************************************/
  while( dwNumberOfSamples )
  {
     /****************************************************************/
     /*  Block if function TextToSpeechReturnBuffer() is returning   */
     /*  the current buffer.                                         */ 
     /****************************************************************/

     pthread_mutex_lock( &ttsHandle->MemoryBuffer_mutex );

    /******************************************************************/
    /*  If a new Text-To-Speech buffer is needed then get one from    */
    /*  the application. Block if one is not available.               */
    /******************************************************************/

    if ( ttsHandle->pSpeechBuffer == NULL )
    {
      ttsHandle->pSpeechBuffer = GetBuffer( ttsHandle );
    }

    /******************************************************************/
    /*  Move as many samples as possible into the buffer.             */
    /*  Get the current buffer pointer and the number of bytes left   */
    /*  in the buffer.                                                */
    /******************************************************************/

    pSpeechBuffer = ttsHandle->pSpeechBuffer;
    pBuffer = pSpeechBuffer->lpData + pSpeechBuffer->dwBufferLength;
    dwBytesLeft = pSpeechBuffer->dwMaximumBufferLength - 
		  pSpeechBuffer->dwBufferLength;

    /******************************************************************/
    /*  Put the samples into the buffer in the proper format.         */
    /******************************************************************/

    switch( ttsHandle->dwFormat )
    {
    case WAVE_FORMAT_1M16:

      dwSpaceLeft = dwBytesLeft >> 1;

      if ( dwNumberOfSamples >= dwSpaceLeft )
      {
        for ( i = 0; i < dwSpaceLeft; i++ )
          *((short *)pBuffer)++ = *pSamples++;

        pSpeechBuffer->dwBufferLength += dwSpaceLeft << 1;
        dwNumberOfSamples = dwNumberOfSamples - dwSpaceLeft;
      }
      else
      {
        for ( i = 0; i < dwNumberOfSamples; i++ )
          *((short *)pBuffer)++ = *pSamples++;

        pSpeechBuffer->dwBufferLength += dwNumberOfSamples << 1;
        dwNumberOfSamples = 0;
      }

      break;

    /******************************************************************/
    /*  Output 8 bit samples.                                         */
    /******************************************************************/

    case WAVE_FORMAT_1M08:

      if ( dwNumberOfSamples >= dwBytesLeft )
      {
        for ( i = 0; i < dwBytesLeft; i++ )
          *pBuffer++ = ((unsigned char)((*pSamples++) >> 8)) ^ 0x80;

        pSpeechBuffer->dwBufferLength += dwBytesLeft;
        dwNumberOfSamples = dwNumberOfSamples - dwBytesLeft;
      }
      else
      {
        for ( i = 0; i < dwNumberOfSamples; i++ )
          *pBuffer++ = ((unsigned char)((*pSamples++) >> 8)) ^ 0x80;

        pSpeechBuffer->dwBufferLength += dwNumberOfSamples;
        dwNumberOfSamples = 0;
      }

      break;

    /******************************************************************/
    /*  Output 8 bit mu-law samples.                                  */
    /******************************************************************/

    case WAVE_FORMAT_08M08:

      if ( dwNumberOfSamples >= dwBytesLeft )
      {
        for ( i = 0; i < dwBytesLeft; i++ )
          *pBuffer++ = LinearToMuLaw( *pSamples++ );

        pSpeechBuffer->dwBufferLength += dwBytesLeft;
        dwNumberOfSamples = dwNumberOfSamples - dwBytesLeft;
      }
      else
      {
        for ( i = 0; i < dwNumberOfSamples; i++ )
          *pBuffer++ = LinearToMuLaw( *pSamples++ );

        pSpeechBuffer->dwBufferLength += dwNumberOfSamples;
        dwNumberOfSamples = 0;
      }

      break;

    default:

      break;
    }

    /******************************************************************/
    /*  Save the updated buffer pointer.                              */
    /******************************************************************/

    ttsHandle->pBuffer = pBuffer;

    /******************************************************************/
    /*  The buffer is full. Return it to the application.             */
    /******************************************************************/

    if ( pSpeechBuffer->dwBufferLength >= pSpeechBuffer->dwMaximumBufferLength )
    {
      pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );

      SendBuffer( ttsHandle );
    }
    else
    {
      /******************************************************************/
      /*  Release the buffer.                                           */
      /******************************************************************/
 
      pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
    }
  }
  return;
}
/****************************************************************************
**                                                                    
**  Function: GetBuffer                                               
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**         This function will get an application provided buffer.     
**    The buffer address will be copied into the pTTS_Buffer element  
**    of the Text-To-Speech handle ttsHandle.                             
**                                                                    
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    ttsHandle     A pointer to a structure of type TTS_HANDLE_T.  
**                                                                    
**  RETURN VALUE
**                                                                    
**    A pointer to a structure of type TTS_HANDLE_T.                  
**                                                                    
*****************************************************************************/

static LPTTS_BUFFER_T GetBuffer( LPTTS_HANDLE_T ttsHandle )
{
  static LPTTS_BUFFER_T pSpeechBufferArray[1];
  static LPTTS_BUFFER_T pSpeechBuffer;

#ifdef TTSDBG
  char proc_name[]="GetBuffer";
  printf("%s\n",proc_name);
#endif

  read_pipe( buffer_pipe, &pSpeechBufferArray[0], 1 );

  pSpeechBuffer = pSpeechBufferArray[0];

  if ( pSpeechBuffer != NULL )
  {
    pSpeechBuffer->dwBufferLength = 0;
    pSpeechBuffer->dwNumberOfPhonemeChanges = 0;
    pSpeechBuffer->dwNumberOfIndexMarks = 0;

    if ( ttsHandle->dwFormat == WAVE_FORMAT_1M16 )
      pSpeechBuffer->dwMaximumBufferLength &= 0xFFFFFFFE;
  }
  return( pSpeechBuffer );
}

/****************************************************************************
**                                                                    
**  SendBuffer                                              
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**         This function returns the current buffer to the            
**    application.                                                    
**                                                                    
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    ttsHandle    A pointer to a structure of type TTS_HANDLE_T.
**                                                                    
**  RETURN VALUE
**                                                                    
**    None.                                                           
**                                                                    
*****************************************************************************/

void SendBuffer( LPTTS_HANDLE_T ttsHandle )
{
  UINT i;
  UINT uiBufferCount;
  LPTTS_BUFFER_T pPipeArray[1];
  LPTTS_BUFFER_T pSpeechBuffer;
  LPSTR  dwSyncParams[3];

#ifdef TTSDBG
  char proc_name[]="SendBuffer";
  printf("%s\n",proc_name);
#endif
  
  if ( ! ttsHandle->bMemoryReset )
  {
    if ( ttsHandle->pSpeechBuffer != NULL )
    {
      pSpeechBuffer = ttsHandle->pSpeechBuffer;

      /****************************************************************/
      /*  NULL buffers sent by reset to fix hang. WIH 3/27/95         */
      /****************************************************************/

      if ( pSpeechBuffer == NULL )
      {
        return;
      }

      /****************************************************************/
      /*  It is possible to get here with nothing in the buffer if    */
      /*  a force caused the buffer to be returned. Check the buffer  */
      /*  to see if it has any sections full.                         */
      /****************************************************************/

      if (( pSpeechBuffer->dwBufferLength > 0 )
         || ( pSpeechBuffer->dwNumberOfIndexMarks > 0 )
         || ( pSpeechBuffer->dwNumberOfPhonemeChanges > 0 ))
      {
        dwSyncParams[0] = MEMORY_BUFFER;
        dwSyncParams[1] = (LPARAM)ttsHandle->pSpeechBuffer;

        ttsHandle->bSendingBuffer = TRUE;
	
	Report_TTS_Status( ttsHandle,
			   dwSyncParams[0],
			   dwSyncParams[1] );
        
        ttsHandle->bSendingBuffer = FALSE;

        pthread_mutex_lock( &ttsHandle->MemoryBuffer_mutex );
        ttsHandle->pSpeechBuffer = NULL;
        pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
      }
    }
  }
  else
  {
    /******************************************************************/
    /*  Empty the VTM pipe.                                           */
    /******************************************************************/

    OP_LockMutex( ttsHandle->hmxEmpty );
    EmptyVtmPipe();
    OP_UnlockMutex( ttsHandle->hmxEmpty );
    
    /******************************************************************/
    /*  Send the current buffer back.                                 */
    /******************************************************************/

    if ( ttsHandle->pSpeechBuffer != NULL )
    {
      pSpeechBuffer = ttsHandle->pSpeechBuffer;

      /****************************************************************/
      /*  NULL buffers sent by reset to fix hang. WIH 3/27/95         */
      /*  This is needed in spite of previous "if" statement because  */
      /*  the app is multi-threaded.                                  */
      /****************************************************************/

      if ( pSpeechBuffer != NULL )
      {
        /**************************************************************/
        /*  Empty the VTM pipe.                                       */
        /**************************************************************/

        OP_LockMutex( ttsHandle->hmxEmpty );
        EmptyVtmPipe();
        OP_UnlockMutex( ttsHandle->hmxEmpty );
    
        ttsHandle->bSendingBuffer = TRUE;

        dwSyncParams[0] = MEMORY_BUFFER;
        dwSyncParams[1] = (LPARAM)pSpeechBuffer;
	
        Report_TTS_Status( ttsHandle,
			   dwSyncParams[0],
			   dwSyncParams[1] );

      }
    }

    /******************************************************************/
    /*  Send all the remaining buffers back.                          */
    /******************************************************************/

    uiBufferCount = BYTES_TO_ITEMS( buffer_pipe, 
				    queue_used(buffer_pipe->queue_handle));

    for ( i = 0; i < uiBufferCount; i++ )
    {
      /****************************************************************/
      /*  Empty the VTM pipe.                                         */
      /****************************************************************/

      OP_LockMutex( ttsHandle->hmxEmpty );
      EmptyVtmPipe();
      OP_UnlockMutex( ttsHandle->hmxEmpty );
    
      read_pipe( buffer_pipe, &pPipeArray, 1 );

      pSpeechBuffer = pPipeArray[0];

      if ( pSpeechBuffer != NULL )
      {
        pSpeechBuffer->dwBufferLength = 0;
        pSpeechBuffer->dwNumberOfPhonemeChanges = 0;
        pSpeechBuffer->dwNumberOfIndexMarks = 0;

        dwSyncParams[0] = MEMORY_BUFFER;
        dwSyncParams[1] = (LPARAM)ttsHandle->pSpeechBuffer;

        ttsHandle->bSendingBuffer = TRUE;

	Report_TTS_Status( ttsHandle,
			   dwSyncParams[0],
			   dwSyncParams[1] );
        
	ttsHandle->bSendingBuffer = FALSE;
      }
    }
    
    /******************************************************************/
    /*  Empty the VTM pipe.                                           */
    /******************************************************************/

    OP_LockMutex( ttsHandle->hmxEmpty );
    EmptyVtmPipe();
    OP_UnlockMutex( ttsHandle->hmxEmpty );

    pthread_mutex_lock( &ttsHandle->MemoryBuffer_mutex );
    ttsHandle->pSpeechBuffer = NULL;
    pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
    
    ttsHandle->bSendingBuffer = FALSE;
    ttsHandle->bMemoryReset = FALSE;
  }

  return;
}

/**********************************************************************/
/*                                                                    */
/*  Function: EmptyVtmPipe                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function is called from the vtm thread to empty the VTM    */
/*    pipe.                                                           */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

void EmptyVtmPipe()
{
  unsigned int uiCount;
  S16 wControl;
  S16 parambuff[128];

  uiCount = tts_items_in_pipe( vtm_pipe );

  while ( uiCount )
  {
    read_pipe( vtm_pipe, &wControl, 1 );

    uiCount = uiCount - 1;

    /******************************************************************/
    /*  Get the control word. This is the first word of a packet.     */
    /*  There are currently 4 types of packets. Speech packets,       */
    /*  Speaker Definition packets, Sync. packets, and Index Mark     */
    /*  packets.                                                      */
    /******************************************************************/

    switch ( wControl )
    {
    case SPC_type_voice:

      read_pipe( vtm_pipe, &parambuff[1], VOICE_PARS );

      uiCount = uiCount - VOICE_PARS;

      break;

    case SPC_type_tone:

      read_pipe( vtm_pipe, &parambuff[1], TONE_PARS );

      uiCount = uiCount - TONE_PARS;

      break;

    case SPC_type_speaker:

      read_pipe( vtm_pipe, &parambuff[1], SPDEF_PARS );

      uiCount = uiCount - SPDEF_PARS;

      break;

    /******************************************************************/
    /*  Process a Sync. packet.                                       */
    /******************************************************************/

    case SPC_type_sync:

      break;

    /******************************************************************/
    /*  Process an Index Mark packet.                                 */
    /******************************************************************/

    case SPC_type_index:

      read_pipe( vtm_pipe, &parambuff[0], INDEX_PARS );

      uiCount = uiCount - INDEX_PARS;

      break;

    case SPC_type_force:

      break;

    default:
      break;
    }
  }
  
  return;
}

/****************************************************************************
**                                                                    
**  PutIndexMarkInBuffer                                    
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**         This function returns an index mark in the current         
**    wave header.                                                    
**                                                                    
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    ttsHandle           A pointer to a structure of type TTS_HANDLE_T.
**                                                                    
**    dwIndexValue       A DWORD which equals the index mark value.   
**                                                                    
**    dwSampleNumber     A DWORD which equals the current sample      
**                       number.                                      
**                                                                    
**  RETURN VALUE
**                                                                    
**    None.                                                           
**                                                                    
*****************************************************************************/

void PutIndexMarkInBuffer( LPTTS_HANDLE_T ttsHandle,
                           DWORD dwIndexValue,
                           DWORD dwSampleNumber )
{
  static UINT uiIndex;
  static LPTTS_BUFFER_T pPipeArray[1];
  static LPTTS_BUFFER_T pSpeechBuffer;
  static LPTTS_INDEX_T pIndexArray;

#ifdef TTSDBG
  char proc_name[]="PutIndexMarkInBuffer";
  printf("%s\n",proc_name);
#endif

  /********************************************************************/
  /*  Block if function TextToSpeechReturnBuffer() is returning the   */
  /*  current Wave Header.                                            */
  /********************************************************************/

  pthread_mutex_lock( &ttsHandle->MemoryBuffer_mutex );
 
  /********************************************************************/
  /*  If a new Text-To-Speech buffer is needed then get one from      */
  /*  the application. Block if one is not available.                 */
  /********************************************************************/

  if ( ttsHandle->pSpeechBuffer == NULL )
  {
    ttsHandle->pSpeechBuffer = GetBuffer( ttsHandle );
  }

  /********************************************************************/
  /*  Put the index mark into the current buffer.                     */
  /********************************************************************/

  pSpeechBuffer = ttsHandle->pSpeechBuffer;
  pIndexArray = pSpeechBuffer->lpIndexArray;

  if ( pIndexArray != NULL )
  {
    uiIndex = pSpeechBuffer->dwNumberOfIndexMarks;

    if ( pSpeechBuffer->dwMaximumNumberOfIndexMarks  > 0 )
    {
      (pIndexArray+uiIndex)->dwIndexValue = dwIndexValue;
      (pIndexArray+uiIndex)->dwIndexSampleNumber = dwSampleNumber;
      pSpeechBuffer->dwNumberOfIndexMarks++;
    }

    /******************************************************************/
    /*  If the index mark array is full then return it to the         */
    /*  application.                                                  */
    /******************************************************************/
  
    if ( pSpeechBuffer->dwNumberOfIndexMarks
         >= pSpeechBuffer->dwMaximumNumberOfIndexMarks )
    {
      /*************************************************************/
      /*  Release the buffer.                                      */
      /*************************************************************/

      pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );

      SendBuffer( ttsHandle ); 
    }
    else
    {
      /**************************************************************/
      /*  Release the buffer.                                       */
      /**************************************************************/

      pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
    }
  }
  else
  {
    /**************************************************************/
    /*  Release the buffer.                                       */
    /**************************************************************/

    pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
  }
  return;
}

/****************************************************************************
**                                                                    
**  PutPhonemeInBuffer                                      
**                                                                    
**  FUNCTIONAL DESCRIPTION:
**                                                                    
**         This function puts phoneme data in the buffer structure    
**    which is used whenever the Text-To-Speech system is buffering   
**    speech samples in memory.                                       
**                                                                    
**                                                                    
**  FORMAL PARAMETERS:
**                                                                    
**    ttsHandle        A pointer to a structure of type TTS_HANDLE_T.
**                                                                    
**                                                                    
**    dwSampleNumber     A DWORD which equals the current sample      
**                       number.                                      
**                                                                    
**  RETURN VALUE
**                                                                    
**    None.                                                           
**                                                                    
*****************************************************************************/

void PutPhonemeInBuffer( LPTTS_HANDLE_T ttsHandle,
                         DWORD dwPhoneme,
                         DWORD dwPhonemeDuration,
                         DWORD dwSampleNumber )
{
  static UINT uiIndex;
  static LPTTS_BUFFER_T pPipeArray[1];
  static LPTTS_BUFFER_T pSpeechBuffer;
  static LPTTS_PHONEME_T pPhonemeArray;

  /********************************************************************/
  /*  Block if the TextToSpeechReturnBuffer() function is returning   */
  /*  the current buffer.                                             */
  /********************************************************************/

  pthread_mutex_lock( &ttsHandle->MemoryBuffer_mutex );

  /********************************************************************/
  /*  If a new Text-To-Speech buffer is needed then get one from      */
  /*  the application. Block if one is not available.                 */
  /********************************************************************/

  if ( ttsHandle->pSpeechBuffer == NULL )
  {
    ttsHandle->pSpeechBuffer = GetBuffer( ttsHandle );
  }

  /********************************************************************/
  /*  Put the index mark into the current buffer.                     */
  /********************************************************************/

  pSpeechBuffer = ttsHandle->pSpeechBuffer;
  pPhonemeArray = pSpeechBuffer->lpPhonemeArray;

  if ( pPhonemeArray != NULL )
  {
    uiIndex = pSpeechBuffer->dwNumberOfPhonemeChanges;

    if ( pSpeechBuffer->dwMaximumNumberOfPhonemeChanges > 0 )
    {
      (pPhonemeArray+uiIndex)->dwPhoneme = dwPhoneme;
      (pPhonemeArray+uiIndex)->dwPhonemeSampleNumber = dwSampleNumber;
      (pPhonemeArray+uiIndex)->dwPhonemeDuration = dwPhonemeDuration;
      pSpeechBuffer->dwNumberOfPhonemeChanges++;
    }

    /******************************************************************/
    /*  If the phoneme array is full then return it to the            */
    /*  application.                                                  */
    /******************************************************************/

    if ( pSpeechBuffer->dwNumberOfPhonemeChanges
           >= pSpeechBuffer->dwMaximumNumberOfPhonemeChanges )
    {
      /******************************************************************/
      /*  Release the buffer.                                           */
      /******************************************************************/

      pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );

      SendBuffer( ttsHandle );
    }
    else
    {
      /******************************************************************/
      /*  Release the buffer.                                           */
      /******************************************************************/

      pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
    }
  } 
  else
  {
    /******************************************************************/
    /*  Release the buffer.                                           */
    /******************************************************************/

    pthread_mutex_unlock( &ttsHandle->MemoryBuffer_mutex );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Thread Main: text_main                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This is the message processing loop for the Audio window   */
/*    procedure.                                                      */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  MAX_TEXT_WRITE_LENGTH  64

OP_THREAD_ROUTINE( text_main, LPTTS_HANDLE_T ttsHandle )
{
  unsigned int uiCurrentTextLength;
  unsigned int uiLength;
  unsigned char *pText;
  char FlushString[1];
  TEXT_MSG_T * pTextMsg;
  TEXT_MSG_T * pNextTextMsg;
  int nbw = 0;
  int nbytes = 0;
  int i = 0;

  while( ! ttsHandle->bTextThreadExit )
  {
    /******************************************************************/
    /*  Wait until the TextToSpeechSpeak() function queues some text. */
    /******************************************************************/

    OP_WaitForEvent( ttsHandle->hevTextInQueue, OP_INFINITE );

    /********************************************************************/
    /*  Get the next text message from the top of the linked list.      */
    /********************************************************************/

    OP_LockMutex( ttsHandle->hmxTextMsgList );

    pTextMsg = ttsHandle->pTextMsgList;

    /********************************************************************/
    /*  It should not be possible to get here with the text list empty  */
    /*  but this check can't hurt.                                      */
    /********************************************************************/
    
    if ( pTextMsg != NULL )
    {	
      pNextTextMsg = pTextMsg->pLink;
      pText = pTextMsg->pText;
      uiCurrentTextLength = pTextMsg->uiLength;
      ttsHandle->pTextMsgList = pNextTextMsg;
    }
    else
    {
      uiCurrentTextLength = 0;
    }
    
    if ( ttsHandle->pTextMsgList == NULL )
    {
      OP_ResetEvent( ttsHandle->hevTextInQueue );
    }

    OP_UnlockMutex( ttsHandle->hmxTextMsgList );

    /********************************************************************/
    /*  Increment the queued character count.                           */
    /********************************************************************/

    if ( uiCurrentTextLength != 0 )
    {
      /******************************************************************/
      /*  Queue the text unless a TextToSpeechReset() forces an abort   */
      /*  by setting the KS.halting flag.                               */
      /*  Write the text in 4096 byte chunks                            */
      /******************************************************************/

      uiLength = uiCurrentTextLength;
      
      while (( uiLength > 0 ) && ( ! KS.halting ))
      {
        nbytes =
	  uiLength > MAX_TEXT_WRITE_LENGTH ? MAX_TEXT_WRITE_LENGTH : uiLength;
        nbw = write_pipe( cmd_pipe, pText, nbytes );
        uiLength -= nbw;
        pText += nbytes;
        if ( nbw != nbytes )
          break;
      }

      if (( uiLength > 0 ) && ( ! KS.halting ))
        write_pipe( cmd_pipe, pText, uiLength );
      
      if ( pTextMsg->pText != NULL )
        free( pTextMsg->pText );
      
      if ( pTextMsg != NULL )
        free( pTextMsg );
    }
    
    /********************************************************************/
    /*  Decrement the queued character count.                           */
    /********************************************************************/

    OP_LockMutex( ttsHandle->hmxQueuedCharacterCount );
    ttsHandle->uiQueuedCharacterCount -= uiCurrentTextLength;
    OP_UnlockMutex( ttsHandle->hmxQueuedCharacterCount );
  }

  /********************************************************************/
  /*  Exit the thread.                                                */
  /********************************************************************/

  OP_ExitThread( 0 );
  
  OP_THREAD_RETURN;
}

#define NANO_SEC 1000000

/******************************************************************************
**
**  WaitForTextQueuingToComplete 
**
**  FUNCTIONAL DESCRIPTION:
**
**
******************************************************************************
*/

#define  TEXT_QUEUE_WAIT_TIME  50
#define  TEXT_LOCKUP_COUNT      2

void WaitForTextQueuingToComplete( LPTTS_HANDLE_T ttsHandle,
				   BOOL bReset )
{
  int iLockupCount;

  /********************************************************************/
  /*  Wait for the Text-To-Speech thread to complete all text         */
  /*  queueing.                                                       */
  /********************************************************************/

  iLockupCount = 0;

  while ( 0 != GetQueuedCharacterCount( ttsHandle ))
  {
    /******************************************************************/
    /*  Set the sync event in case the cmd thread is blocked in the   */
    /*  cmd_sync() function.                                          */
    /******************************************************************/

    if ( bReset )
    {
      OP_SetEvent( ttsHandle->hevSync );

      /****************************************************************/
      /*  Perform an audio reset to immediately stop audio from       */
      /*  playing and to make sure the VTM thread is not blocked.     */
      /****************************************************************/
	
      if ( ttsHandle->dwOutputState == STATE_OUTPUT_AUDIO )
      {
        PA_Reset( ttsHandle->pAudioHandle );
      }
    }
      
    OP_Sleep( TEXT_QUEUE_WAIT_TIME );

    if (( ttsHandle->dwOutputState == STATE_OUTPUT_MEMORY ) && ( bReset ))
    {
      iLockupCount++;

      if ( iLockupCount == TEXT_LOCKUP_COUNT )
      {
        TextToSpeechSpeak( ttsHandle, "", TTS_FORCE );
        TextToSpeechSpeak( ttsHandle, "", TTS_FORCE );
        TextToSpeechSpeak( ttsHandle, "", TTS_FORCE );
        TextToSpeechSpeak( ttsHandle, "", TTS_FORCE );

        FixMemoryLockup( ttsHandle );

	iLockupCount = 0;
      }
    }
  }
   
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetQueuedCharacterCount                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns the number of characters in the input     */
/*    queue.                                                          */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    ttsHandle         A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns an unsigned integer that equals the       */
/*    number of characters in the input queue.                        */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

unsigned int GetQueuedCharacterCount( LPTTS_HANDLE_T ttsHandle )
{
  unsigned int uiQueuedChharacterCount;

  /********************************************************************/
  /*  Get the queued character count.                                 */
  /********************************************************************/

  OP_LockMutex( ttsHandle->hmxQueuedCharacterCount );
  uiQueuedChharacterCount = ttsHandle->uiQueuedCharacterCount;
  OP_UnlockMutex( ttsHandle->hmxQueuedCharacterCount );

  return uiQueuedChharacterCount;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForLtsFlush                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function blocks until the inter-thread pipe queues from    */
/*    the lts pipe to the sync pipe are flushed. The TEXT and CMD     */
/*    pipes are ignored. This is used to flush pipes from the CMD     */
/*    thread. If a timeout value is exceeded then this function will  */
/*    return an error status value.                                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    ttsHandle         A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*    dwWaitTimeInMsec  A DWORD which contains the amount of time to  */
/*                      wait for all pipes to empty before returning  */
/*                      an error.                                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  WAIT_PIPE_SLEEP_TIME    100
#define  WAIT_PIPE_ABORT_COUNT   150

MMRESULT WaitForLtsFlush( LPTTS_HANDLE_T phTTS,
                          DWORD dwWaitTimeInMsec )
{
  BOOL bPipesNotEmpty;
  UINT uiSyncCount;
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  DWORD dwTotalTimeInMsec;

  /********************************************************************/
  /*  Wait for all the pipes to empty.                                */
  /*  If the pipes are not empty then sleep for 100 msec. and check   */
  /*  them again.                                                     */
  /********************************************************************/

  dwTotalTimeInMsec = 0;
  bPipesNotEmpty = TRUE;

  while ( bPipesNotEmpty )
  {
    bPipesNotEmpty = FALSE;

    uiSyncCount = tts_items_in_pipe( sync_pipe );
    uiVtmCount = tts_items_in_pipe( vtm_pipe );
    uiPhCount = tts_items_in_pipe( ph_pipe );
    uiLtsCount = tts_items_in_pipe( lts_pipe );

    if  (( uiSyncCount != 0 )
     || ( uiVtmCount != 0 )
     || ( uiPhCount != 0 )
     || ( uiLtsCount != 0 ))
      bPipesNotEmpty = TRUE;

    /******************************************************************/
    /*  If bPipesNotEmpty is still FALSE here then the pipes are      */
    /*  probably empty. It is possible that there is still data in    */
    /*  the pipes, but that it moved out of a pipe we are about to    */
    /*  check into a pipe we have we just checked. We now check the   */
    /*  pipes in the reverse order.                                   */
    /******************************************************************/

    if ( ! bPipesNotEmpty )
    {
      uiLtsCount = tts_items_in_pipe( lts_pipe );
      uiPhCount = tts_items_in_pipe( ph_pipe );
      uiVtmCount = tts_items_in_pipe( vtm_pipe );
      uiSyncCount = tts_items_in_pipe( sync_pipe );
      
      if  (( uiSyncCount != 0 )
        || ( uiVtmCount != 0 )
        || ( uiPhCount != 0 )
        || ( uiLtsCount != 0 ))
        bPipesNotEmpty = TRUE;
      else
        bPipesNotEmpty = FALSE;
    }

    /******************************************************************/
    /*  Go to sleep for WAIT_PIPE_SLEEP_TIME msec.                    */
    /******************************************************************/

    if ( bPipesNotEmpty )
    {
      OP_Sleep( WAIT_PIPE_SLEEP_TIME );

      dwTotalTimeInMsec += WAIT_PIPE_SLEEP_TIME;

      if ( dwTotalTimeInMsec > dwWaitTimeInMsec )
      {
        return( MMSYSERR_ERROR );
      }
    }
  }
  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: FixMemoryLockup                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: April 7, 1995                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function tests to see if the TTS pipes are near full and   */
/*    the VTM thread is trying to report a buffer back to the         */
/*    application using SendMessage(). If this lockup is detected     */
/*    then the VTM pipe is emptied here.                              */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    ttsHandle         A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  MEMORY_LOCKUP_SLEEP_TIME    20
#define  MEMORY_LOCKUP_COUNT          2

void FixMemoryLockup( LPTTS_HANDLE_T ttsHandle )
{
  BOOL bPipesNotChanging;
  UINT uiVtmLockCount;
  UINT uiLockedUpCount;
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  UINT uiCmdCount;
  UINT uiOldVtmCount;
  UINT uiOldPhCount;
  UINT uiOldLtsCount;
  UINT uiOldCmdCount;

  /********************************************************************/
  /*  Wait for all the pipes to change.                               */
  /*  If the pipes are not changing then go to sleep                  */
  /********************************************************************/

  uiVtmCount = tts_items_in_pipe( vtm_pipe );
  uiPhCount = tts_items_in_pipe( ph_pipe );
  uiLtsCount = tts_items_in_pipe( lts_pipe );
  uiCmdCount = tts_items_in_pipe( cmd_pipe );

  uiOldVtmCount = uiVtmCount;
  uiOldPhCount = uiPhCount;
  uiOldLtsCount = uiLtsCount;
  uiOldCmdCount = uiCmdCount;

  uiLockedUpCount = 0;
  bPipesNotChanging = TRUE;

  while ( bPipesNotChanging )
  {
    OP_Sleep( MEMORY_LOCKUP_SLEEP_TIME );

    uiVtmCount = tts_items_in_pipe( vtm_pipe );
    uiPhCount = tts_items_in_pipe( ph_pipe );
    uiLtsCount = tts_items_in_pipe( lts_pipe );
    uiCmdCount = tts_items_in_pipe( cmd_pipe );

    /******************************************************************/
    /*  Are any of the the pipes changing ?                           */
    /******************************************************************/

    if (( uiVtmCount == uiOldVtmCount )
      && ( uiPhCount == uiOldPhCount )
      && ( uiLtsCount == uiOldLtsCount )
      && ( uiCmdCount == uiOldCmdCount ))
    {
      bPipesNotChanging = TRUE;

      uiLockedUpCount++;

      if ( uiLockedUpCount > MEMORY_LOCKUP_COUNT )
      {
	OP_ResetEvent( ttsHandle->hevReadVtmPipe );  /* Block the VTM thread */

	uiVtmLockCount = 0;
	
	while ( uiVtmLockCount <= 3 )
	{
          if ( uiVtmCount == uiOldVtmCount )
	  {
	    uiVtmLockCount++;
	  }
	  else
	  {
	    uiVtmLockCount = 0;
	  }
	  
          uiOldVtmCount = uiVtmCount;
	  OP_Sleep( 10 );
          uiVtmCount = tts_items_in_pipe( vtm_pipe );
        }
	
        OP_LockMutex( ttsHandle->hmxEmpty );
        EmptyVtmPipe();
        OP_UnlockMutex( ttsHandle->hmxEmpty );
	
	OP_SetEvent( ttsHandle->hevReadVtmPipe );  /* Unblock the VTM thread */
      }

      uiOldVtmCount = uiVtmCount;
      uiOldPhCount = uiPhCount;
      uiOldLtsCount = uiLtsCount;
      uiOldCmdCount = uiCmdCount;
    }
    else
    {
      bPipesNotChanging = FALSE;
    }
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForEmptyPipes                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function blocks until the inter-thread pipe queues in the  */
/*    Text-To-Speech system are empty. If a timeout value is exceeded */
/*    then this function will return an error status value.           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    ttsHandle         A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*    dwWaitTimeInMsec  A DWORD which contains the amount of time to  */
/*                      wait for all pipes to empty before returning  */
/*                      an error.                                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  WAIT_PIPE_SLEEP_TIME    100
#define  WAIT_PIPE_ABORT_COUNT   150

MMRESULT WaitForEmptyPipes( LPTTS_HANDLE_T ttsHandle,
                            DWORD dwWaitTimeInMsec,
			    BOOL bReset )
{
  BOOL bPipesNotEmpty;
  UINT uiLockedUpCount;
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  UINT uiCmdCount;
  UINT uiOldVtmCount;
  UINT uiOldPhCount;
  UINT uiOldLtsCount;
  UINT uiOldCmdCount;
  DWORD dwTotalTimeInMsec;

#ifdef TTSDBG
  printf("\nIn Wait For Empty Pipes.");
#endif
  
  /********************************************************************/
  /*  Wait for all the pipes to empty.                                */
  /*  If the pipes are not empty then sleep for 100 msec. and check   */
  /*  them again.                                                     */
  /********************************************************************/

  dwTotalTimeInMsec = 0;

  uiOldVtmCount = 0xFFFFFFFF;
  uiOldPhCount = 0xFFFFFFFF;
  uiOldLtsCount = 0xFFFFFFFF;
  uiOldCmdCount = 0xFFFFFFFF;
  uiLockedUpCount = 0;
  bPipesNotEmpty = TRUE;

  while ( bPipesNotEmpty )
  {
    bPipesNotEmpty = FALSE;

    /******************************************************************/
    /*  In a reset, we don't care about the sync pipe.                */
    /******************************************************************/

    tts_empty_pipe( sync_pipe );

    uiVtmCount = tts_items_in_pipe( vtm_pipe );
    uiPhCount = tts_items_in_pipe( ph_pipe );
    uiLtsCount = tts_items_in_pipe( lts_pipe );
    uiCmdCount = tts_items_in_pipe( cmd_pipe );

    if  (( uiVtmCount != 0 )
     || ( uiPhCount != 0 )
     || ( uiLtsCount != 0 )
     || ( uiCmdCount != 0 ))
      bPipesNotEmpty = TRUE;

    /******************************************************************/
    /*  If bPipesNotEmpty is still FALSE here then the pipes are      */
    /*  probably empty. It is possible that there is still data in    */
    /*  the pipes, but that it moved out of a pipe we are about to    */
    /*  check into a pipe we have we just checked. We now check the   */
    /*  pipes in the reverse order.                                   */
    /******************************************************************/

    if ( ! bPipesNotEmpty )
    {
      uiCmdCount = tts_items_in_pipe( cmd_pipe );
      uiLtsCount = tts_items_in_pipe( lts_pipe );
      uiPhCount = tts_items_in_pipe( ph_pipe );
      uiVtmCount = tts_items_in_pipe( vtm_pipe );

#ifdef TTSDBG
  printf( "\nCMD count = %d", uiCmdCount );
  printf( "\nLTS count = %d", uiLtsCount );
  printf( "\nPH  count = %d", uiPhCount );
  printf( "\nVTM count = %d", uiVtmCount );
#endif
      
      if  (( uiVtmCount != 0 )
        || ( uiPhCount != 0 )
        || ( uiLtsCount != 0 )
        || ( uiCmdCount != 0 ))
        bPipesNotEmpty = TRUE;
      else
        bPipesNotEmpty = FALSE;
    }

    /******************************************************************/
    /*  Go to sleep for WAIT_PIPE_SLEEP_TIME msec.                    */
    /******************************************************************/

    if ( bPipesNotEmpty )
    {
      OP_Sleep( WAIT_PIPE_SLEEP_TIME );

      dwTotalTimeInMsec += WAIT_PIPE_SLEEP_TIME;

      if ( dwTotalTimeInMsec > dwWaitTimeInMsec )
      {
        return( MMSYSERR_ERROR );
      }
    }

    /******************************************************************/
    /*  If this is a reset then check to see if nothing is happening. */
    /*  If any of the threads block then the pipe state may not       */
    /*  change.                                                       */
    /******************************************************************/

    if  (( bReset )
      && ( uiVtmCount == uiOldVtmCount )
      && ( uiPhCount == uiOldPhCount )
      && ( uiLtsCount == uiOldLtsCount )
      && ( uiCmdCount == uiOldCmdCount ))
    {
      /****************************************************************/
      /*  Perform an audio reset to immediately stop audio from       */
      /*  playing and to make sure the VTM thread is not blocked.     */
      /****************************************************************/

      if ( ttsHandle->dwOutputState == STATE_OUTPUT_AUDIO )
      {
        PA_Reset( ttsHandle->pAudioHandle );
      }

      uiLockedUpCount++;

      /****************************************************************/
      /*  Fix hang when using speech-to-memory. WIH 4/6/95            */
      /****************************************************************/

      if ( ttsHandle->dwOutputState == STATE_OUTPUT_MEMORY )
      {
        FixMemoryLockup( ttsHandle );
      }
    }
    else
    {
      uiLockedUpCount = 0;
    }

    uiOldVtmCount = uiVtmCount;
    uiOldPhCount = uiPhCount;
    uiOldLtsCount = uiLtsCount;
    uiOldCmdCount = uiCmdCount;

    if ( uiLockedUpCount >= WAIT_PIPE_ABORT_COUNT )
      return( MMSYSERR_ERROR );
  }
  return( MMSYSERR_NOERROR );
}

/*****************************************************************************
**
**  ToggleLogfileMutex
**
**  FUNCTIONAL DESCRIPTION:
**
**     This routine either reserves or releases a semaphore.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************/
ToggleLogfileMutex(int flag)
{

   switch(flag)
   {
      case MUTEX_RESERVE :
         pthread_mutex_lock( &pcsLogFile_mutex);
         break;
      case MUTEX_RELEASE :
         pthread_mutex_unlock( &pcsLogFile_mutex);
         break;
   }
}

/**********************************************************************/
/**********************************************************************/
/*  Function: Report_TTS_Status                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: December 26, 1995                                           */
/**********************************************************************/
/**********************************************************************/

void Report_TTS_Status( LPTTS_HANDLE_T ttsHandle,
	                long lParam1,
		        long lParam2 )
{
  if (ttsHandle->DtCallbackRoutine != NULL)
  {
    OP_LockMutex( ttsHandle->hmxCallback );
    (*ttsHandle->DtCallbackRoutine)( lParam1,
				     lParam2,
				     ttsHandle->dwDtCallbackParameter );
    
    OP_UnlockMutex( ttsHandle->hmxCallback );
  }

  return;
}

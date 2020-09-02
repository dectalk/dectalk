/************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *    File Name:    cmd_wav.c
 *    Author:       ??
 *    Creation Date:??
 *
 *    Functionality:
 *    pcdt digitized data support ...
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 002  JAW		02/27/1998	Merged CE code.
 * 003  CJL		03/18/1998	Removed specific path for dectalkf.h.
 * 004  ETT		10/05/1998	added linux code
 * 005  mfg		10/15/1998	for WINDOWS CE sndPlaySound() added to play wav files  
 * 006  mfg		10/10/2000	for WINDOWS CE pc support for the new compilier  
 * 007 	CAB		10/16/2000	Changed copyright info
 * 008	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 009	CAB		05/14/2001 	Updated copyright info
 * 010	MGS		06/19/2001	Solaris Port BATS#972
 * 011	MGS		06/25/2001	Fixed sync problem with [:play ] on WinCE BATS#980
 * 012	MFG		06/25/2001	Removed \\ from the wave file string for WinCE
 * 013	MGS		04/11/2002	ARM7 port
 * 014	CAB		07/30/2002	Condense repeated __osf__ code
 */


#include "dectalkf.h"

#ifndef MSDOS

#ifdef VXWORKS
#include <stdlib.h>
#include <string.h>
#elif defined ARM7
#include <stdlib.h>
#include <string.h>
#else
#include <malloc.h>
#endif


#ifdef WIN32
#include <windows.h>
#include <mmsystem.h>
//#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#ifdef UNDER_CE
#include "cemm.h"
#else
#include <sys\types.h>
#include <sys\stat.h>
#include <fcntl.h>
#include <io.h>
#endif
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
/*#include "dtmmedefs.h"*/
/*#include "dtmmiodefs.h"*/
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include "opthread.h"

#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
#include <mmsystem.h>
typedef long          HMMIO;          /* a handle to an open file */
#endif /* __linux__ */

#include "port.h"
#endif /* (__osf__) || (__linux__) */
			 
#include "tts.h"
#include "mulawi.h"
#endif /* #ifndef MSDOS */

#include "cm_def.h"

#ifdef UNDER_CE
#include "cemm.h"
#endif /* UNDER_CE */


/* GL 04/21/1997  add this for OSF build */
/**********************************************************************/
/*  Digital UNIX and VMS definitions.                                 */
/**********************************************************************/

#ifdef OP_POSIX

#include "dtmmiodefs.h"

#define DTK_MMIO_OPEN     DTKmmioOpen
#define DTK_MMIO_CLOSE    DTKmmioClose
#define DTK_MMIO_DESCEND  DTKmmioDescend
#define DTK_MMIO_ASCEND   DTKmmioAscend
#define DTK_MMIO_READ     DTKmmioRead
#define DTK_MMIO_FOURCC   DTKmmioFOURCC

#endif

/**********************************************************************/
/*  Windows NT and Windows 95 definitions.                            */
/**********************************************************************/

#ifdef WIN32

#define DTK_MMIO_OPEN     mmioOpen
#define DTK_MMIO_CLOSE    mmioClose
#define DTK_MMIO_DESCEND  mmioDescend
#define DTK_MMIO_ASCEND   mmioAscend
#define DTK_MMIO_READ     mmioRead
#define DTK_MMIO_FOURCC   mmioFOURCC

#include <mmsystem.h>

#endif


static HMMIO wave_file_open( char *,
							 LPWAVEFORMATEX *,
							 int *,
							 LPTTS_HANDLE_T );


/* cm_cmd_digitized() is in cm_copt() as well. */
#if 0
int cm_cmd_digitized(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#ifdef MSDOS
	DT_PIPE_T pipe_value;

	if(cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
	pKsd_t->spc_mode = SPC_mode_digital;
	signal_semaphore(&(pKsd_t->isa_sem));
	wait_semaphore(&(pKsd_t->text_sync));

	pipe_value = LAST_VOICE;
        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
		return(CMD_success);
}
#endif

#ifndef MSDOS

#define  PLAY_READ_BUFFER_SIZE        8192
#define  SET_AUDIO_PARAMS_SLEEP_TIME   200

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

/**********************************************************************/
/**********************************************************************/
/*  Function: cmd_play                                                */
/*  Author: Bill Hallahan                                             */
/*  Date: May 23, 1994                                                */
/**********************************************************************/
/**********************************************************************/

int cm_cmd_play(LPTTS_HANDLE_T phTTS)
{

#ifndef UNDER_CE

  int i;
  int iLength;
  int iError;
  unsigned int uiBlockAlign;
  short * pWord;
  unsigned char * pByte;
  char * lpData;
  UINT uiReadSize;
  BOOL bMulawFlag;
  BOOL bNotDone;
  MMRESULT mmStatus;
  LPWAVEFORMATEX pWaveFormat;
  LPWAVEFORMATEX pOldWaveFormat;
  HMMIO hMmio = (int)NULL;
  int is_au=0;
  int au_fd=0;
  AU_FILE_HDR_T AuFileHdr;
#endif
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PCMD_T pCmd_t = phTTS->pCMDThreadData;
  /*
  LPTTS_HANDLE_T phTTS;
  */

  /********************************************************************/
  /*  Initialize local variables.                                     */
  /********************************************************************/
#ifdef UNDER_CE
    wchar_t string[128]={0x00};
	wchar_t instring[128]={0x00};
#endif

#ifndef UNDER_CE
  bMulawFlag = FALSE;
  pWaveFormat = NULL;
  pOldWaveFormat = NULL;
#endif

  /********************************************************************/
  /*  Get the text to speech handle.                                  */
  /********************************************************************/

  /*phTTS = TextToSpeechGetHandle();*/

  /********************************************************************/
  /*  If using the audio device in speech to audio device mode then   */
  /*  play the wave file.                                             */
  /********************************************************************/
  /********************************************************************/
  /*  Wait for audio to complete.  if WINDOWS CE use  sndPlaySound()  */
  /********************************************************************/

#ifdef UNDER_CE
  /* fix [:play xxx] for ce to keep the output synchronous */
	if( cm_cmd_sync(phTTS) == CMD_flushing )
	{
	  return(CMD_flushing);
	}
		
	WaitForLtsFlush( phTTS, 0xFFFFFFFF );

	PA_WaitForPlayToComplete( phTTS->pAudioHandle );


	MultiByteToWideChar(CP_ACP,0,pCmd_t->pString[0],strlen(pCmd_t->pString[0]),&string,sizeof(string));

	wcscpy(instring,string);


	if (sndPlaySound(&instring,SND_ASYNC))
	{
	return(CMD_success);
	}
	else
	{
	return(CMD_unable_to_open_file);
	}
#endif


#ifndef UNDER_CE

  if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
  {
	/******************************************************************/
	/*  Wait for all previously queued text to be processed.          */
	/******************************************************************/

	if( cm_cmd_sync(phTTS) == CMD_flushing )
	{
/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	mmioClose( hMmio, 0 );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	  DTK_MMIO_CLOSE( hMmio, 0 );
#endif
	  free( pWaveFormat );
	  return(CMD_flushing);
	}

	/******************************************************************/
	/*  Allocate the audio play buffer.                               */
	/*  Make it twice as big as the read to leave room to convert     */
	/*  8 bit mulaw samples to 16 bit samples.                        */
	/******************************************************************/

	lpData = (char *)malloc( 2 * PLAY_READ_BUFFER_SIZE * sizeof(char));

	if ( lpData == NULL )
	{
	  TextToSpeechErrorHandler( phTTS,
								0,
								MMSYSERR_NOMEM );
	  return( CMD_out_of_memory );
	}

	/******************************************************************/
	/*  Wait for audio to complete.                                   */
	/******************************************************************/

	WaitForLtsFlush( phTTS, 0xFFFFFFFF );
	PA_WaitForPlayToComplete( phTTS->pAudioHandle );
	/******************************************************************/
	/*  Allocate a WAVEFORMATEX structure used to save the current    */
	/*  audio state. The size of this structure would normally be     */
	/*  the size of the maximum WAVEFORMATEX structure supported      */
	/*  by the audio compression manager. This size may be determined */
	/*  by a call to the acmMetric() function. This is not necessary  */
	/*  here because we know that DECtalk is using WAVE_FORMAT_PCM.   */
	/******************************************************************/

	pOldWaveFormat = (LPWAVEFORMATEX)malloc(sizeof(WAVEFORMATEX));

	if ( pOldWaveFormat == NULL )
	{
	  free( pWaveFormat );
	  free( lpData );
	  TextToSpeechErrorHandler( phTTS,
								0,
								MMSYSERR_NOMEM );
	  return( CMD_out_of_memory );
	}

	/******************************************************************/
	/*  Open the wave file.                                           */
	/*  The pWaveFormat structure is allocated and filled in by the   */
	/*  wave_file_open() function. It is freed at the end of          */
	/*  the cmd_wav() function (this function).                       */
	/******************************************************************/

	if (_stricmp(strrchr(pCmd_t->pString[0],'.'),".au")==0)
	{
		is_au=1;
		/* open the file */
		if ((au_fd=open(pCmd_t->pString[0],O_RDONLY))==-1)
		{
	  		free( pOldWaveFormat );
	  		free( pWaveFormat );
		  	free( lpData );
			TextToSpeechErrorHandler( phTTS,
				 ERROR_OPENING_WAVE_FILE,
				 MMSYSERR_ERROR );
			return CMD_unable_to_open_file;
		}
		if (read(au_fd,&AuFileHdr,sizeof(AuFileHdr)-4)<sizeof(AuFileHdr)-4)
		{
			TextToSpeechErrorHandler( phTTS,
				  ERROR_BAD_WAVE_FILE_FORMAT,
				  MMSYSERR_ERROR );
			return CMD_bad_wave_file_format;
		}
		if (strcmp(AuFileHdr.magic,".snd"))
		{
			TextToSpeechErrorHandler( phTTS,
				  ERROR_BAD_WAVE_FILE_FORMAT,
				  MMSYSERR_ERROR );
			return CMD_bad_wave_file_format;
		}
		AuFileHdr.hdr_size=SWAP_32_BIG(AuFileHdr.hdr_size);
		AuFileHdr.data_size=SWAP_32_BIG(AuFileHdr.data_size);
		AuFileHdr.encoding=SWAP_32_BIG(AuFileHdr.encoding);
		AuFileHdr.sample_rate=SWAP_32_BIG(AuFileHdr.sample_rate);
		AuFileHdr.channels=SWAP_32_BIG(AuFileHdr.channels);
		if (lseek(au_fd,AuFileHdr.hdr_size,SEEK_SET)<0)
		{
			TextToSpeechErrorHandler( phTTS,
				  ERROR_BAD_WAVE_FILE_FORMAT,
				  MMSYSERR_ERROR );
			return CMD_bad_wave_file_format;
		}
	}
	else
	{
		
	hMmio = wave_file_open( pCmd_t->pString[0], &pWaveFormat, &iError, phTTS );

#ifndef ERRORCHECK
	if ( hMmio == NULL )
	{
	  free( pOldWaveFormat );
	  free( pWaveFormat );
		  free( lpData );
	  return( iError );
	}
#endif
	}

	/******************************************************************/
	/*  If the audio sample format is mulaw then open the device for  */
	/*  16 bit PCM and convert the mulaw data to 16 bit data.         */
	/******************************************************************/

	if (is_au)
	{
		pWaveFormat=(LPWAVEFORMATEX)malloc(sizeof(WAVEFORMATEX));
		switch(AuFileHdr.encoding)
		{
		case SUN_ULAW:
			pWaveFormat->wFormatTag=WAVE_FORMAT_MULAW;
			pWaveFormat->nChannels=(unsigned short)AuFileHdr.channels;
			pWaveFormat->nSamplesPerSec=AuFileHdr.sample_rate*
						    AuFileHdr.channels;
			pWaveFormat->nAvgBytesPerSec=AuFileHdr.sample_rate*
                                                    AuFileHdr.channels;
			pWaveFormat->nBlockAlign=(unsigned short)AuFileHdr.channels;
			pWaveFormat->wBitsPerSample=8;
			pWaveFormat->cbSize=0;
			
			break;

		case SUN_LIN_8:
			pWaveFormat->wFormatTag=WAVE_FORMAT_PCM;
			pWaveFormat->nChannels=(unsigned short)AuFileHdr.channels;
			pWaveFormat->nSamplesPerSec=AuFileHdr.sample_rate*
						    AuFileHdr.channels;
			pWaveFormat->nAvgBytesPerSec=AuFileHdr.sample_rate*
                                                    AuFileHdr.channels;
			pWaveFormat->nBlockAlign=(unsigned short)AuFileHdr.channels;
			pWaveFormat->wBitsPerSample=8;
			pWaveFormat->cbSize=0;
			break;

		case SUN_LIN_16:
			pWaveFormat->wFormatTag=WAVE_FORMAT_PCM;
			pWaveFormat->nChannels=(unsigned short)AuFileHdr.channels;
			pWaveFormat->nSamplesPerSec=AuFileHdr.sample_rate*
						    AuFileHdr.channels;
			pWaveFormat->nAvgBytesPerSec=AuFileHdr.sample_rate*
                                                    AuFileHdr.channels *2;
			pWaveFormat->nBlockAlign=(unsigned short)AuFileHdr.channels*2;
			pWaveFormat->wBitsPerSample=16;
			pWaveFormat->cbSize=0;
			break;
		default:
			TextToSpeechErrorHandler( phTTS,
				  ERROR_BAD_WAVE_FILE_FORMAT,
				  MMSYSERR_ERROR );
			return CMD_bad_wave_file_format;
		}
	}
	else
	{

	pWaveFormat->wFormatTag=SWAP_16_LITTLE(pWaveFormat->wFormatTag);
	pWaveFormat->nChannels=SWAP_16_LITTLE(pWaveFormat->nChannels);
	pWaveFormat->nSamplesPerSec=SWAP_32_LITTLE(pWaveFormat->nSamplesPerSec);
	pWaveFormat->nAvgBytesPerSec=SWAP_32_LITTLE(pWaveFormat->nAvgBytesPerSec);
	pWaveFormat->nBlockAlign=SWAP_16_LITTLE(pWaveFormat->nBlockAlign);
	pWaveFormat->wBitsPerSample=SWAP_16_LITTLE(pWaveFormat->wBitsPerSample);
	pWaveFormat->cbSize=SWAP_16_LITTLE(pWaveFormat->cbSize);
	}

	if ( pWaveFormat->wFormatTag == WAVE_FORMAT_MULAW )
	{
	  bMulawFlag = TRUE;
	  pWaveFormat->wFormatTag = WAVE_FORMAT_PCM;
	  pWaveFormat->nAvgBytesPerSec = pWaveFormat->nAvgBytesPerSec << 1;
	  pWaveFormat->nBlockAlign = pWaveFormat->nBlockAlign << 1;
	  pWaveFormat->wBitsPerSample = 16;
	}

	/******************************************************************/
	/*  Set up the audio device for the current wave data.            */
	/*  First get the current audio parameters.                       */
	/******************************************************************/
	
	PA_GetFormat( phTTS->pAudioHandle, pOldWaveFormat );
	
	/******************************************************************/
	/*  Set the audio parameters.                                     */
	/*  If OWN_AUDIO_DEVICE is specified then the format of the wave  */
	/*  file data must match the format that DECtalk is currently     */
	/*  using. The SetAudioParams() function performs this test       */
	/*  automatically and returns an error status in this case.       */
	/******************************************************************/
	
	while (( mmStatus = PA_SetFormat( phTTS->pAudioHandle,
										pWaveFormat ))
	  == MMSYSERR_ALLOCATED )

	{
/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	  Sleep( SET_AUDIO_PARAMS_SLEEP_TIME );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	  OP_Sleep( SET_AUDIO_PARAMS_SLEEP_TIME );
#endif
	}
	
	if ( mmStatus )
	{
	  /****************************************************************/
	  /*  An error occured while setting the audio parameters.        */
	  /*  Shutdown and exit with error status.                        */
	  /****************************************************************/
	if (is_au)
	{
		close(au_fd);
	}
	else
	{
/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	  mmioClose( hMmio, 0 );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	  DTK_MMIO_CLOSE( hMmio, 0 );
#endif
	}
	  free( pOldWaveFormat );
	  free( pWaveFormat );
	  free( lpData );

	  /****************************************************************/
	  /*  Report that the audio format cannot be supported.           */
	  /****************************************************************/

	  TextToSpeechErrorHandler( phTTS,
								ERROR_UNSUPPORTED_WAVE_AUDIO_FORMAT,
								MMSYSERR_ERROR );
	  return( CMD_unsupported_audio_format );
	}

	/******************************************************************/
	/*  Queue blocks that are a multiple of the block alignment.      */
	/******************************************************************/

	uiReadSize = PLAY_READ_BUFFER_SIZE;

	if ( pWaveFormat->nBlockAlign != 0 )
	{
	  uiBlockAlign = pWaveFormat->nBlockAlign;
	}
	else
	{
	  uiBlockAlign = 1;
	}

	/******************************************************************/
	/*  If the block alignment is too large then exit.                */
	/******************************************************************/

	if ( uiBlockAlign > uiReadSize )
	{
	  /****************************************************************/
	  /*  An error occured while setting the audio parameters.        */
	  /*  Shutdown and exit with error status.                        */
	  /****************************************************************/
	if (is_au)
	{
		close(au_fd);
	}
	else
	{

/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	  mmioClose( hMmio, 0 );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	  DTK_MMIO_CLOSE( hMmio, 0 );
#endif
	}
	  free( pOldWaveFormat );
	  free( pWaveFormat );
	  free( lpData );

	  /****************************************************************/
	  /*  Report that the audio format cannot be supported.           */
	  /****************************************************************/

	  TextToSpeechErrorHandler( phTTS,
								ERROR_UNSUPPORTED_WAVE_AUDIO_FORMAT,
								MMSYSERR_ERROR );
	  return( CMD_unsupported_audio_format );
	}
	
	uiReadSize = uiReadSize / uiBlockAlign;
	uiReadSize = uiReadSize * uiBlockAlign;

	/******************************************************************/
	/*  Loop and play all the wave data.                              */
	/******************************************************************/

	bNotDone = TRUE;

	while ( bNotDone )
	{
	  /****************************************************************/
	  /*  Read in a buffer of audio samples.                          */
	  /****************************************************************/

	if (is_au)
	{
		iLength=read(au_fd,lpData,uiReadSize);
	}
	else
	{

/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	  iLength = mmioRead( hMmio, lpData, uiReadSize );
#endif
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	  iLength = DTK_MMIO_READ( hMmio, lpData, (LONG)uiReadSize );
#endif
	}
	  /****************************************************************/
	  /*  If End Of File then clear the bNotDone flag.                */
	  /****************************************************************/

	  if (( iLength != (int)uiReadSize ) || ( pKsd_t->halting ))
	  {
		bNotDone = FALSE;

		/**************************************************************/
		/*  Queue blocks that are a multiple of the block alignment.  */
		/*  Discard any extra audio samples on the last block.        */
		/**************************************************************/

		iLength = iLength / uiBlockAlign;
		iLength = iLength * uiBlockAlign;
	  }

	  /****************************************************************/
	  /*  Play any data that was read.                                */
	  /****************************************************************/

	  if (( iLength > 0 ) && ( ! pKsd_t->halting ))
	  {
		/**************************************************************/
		/*  If necessary, convert mulaw data to 16 bit samples.       */
		/**************************************************************/

		if ( bMulawFlag )
		{
		  pWord = (short *)lpData;
		  pWord += ( iLength - 1 );
		  pByte = lpData;
		  pByte += ( iLength - 1 );

		  for ( i = 0; i < iLength; i++ )
		  {
			*pWord = wMulawTable[(*pByte)];
			pWord--;
			pByte--;
		  }

		  /************************************************************/
		  /*  Double the length since the 8 bit u-law samples have    */
		  /*  been converted to 16 bit samples.                       */
		  /************************************************************/

		  iLength = iLength << 1;
		}
		else
		{
#ifdef _BIGENDIAN_
			if (!is_au  && pWaveFormat->wBitsPerSample==16)
			{
				pWord=(short *)lpData;
				for (i=0;i<iLength>>1;i++)
					pWord[i]=SWAP_16_LITTLE(pWord[i]);
			}
#else
			if (is_au && pWaveFormat->wBitsPerSample==16)
			{
				pWord=(short *)lpData;
				for (i=0;i<iLength>>1;i++)
					pWord[i]=SWAP_16_BIG(pWord[i]);
			}
#endif

		}

		/**************************************************************/
		/*  Queue the audio samples.                                  */
		/**************************************************************/

		PA_Queue( phTTS->pAudioHandle, lpData, iLength );
	  }
	  else if ( iLength == -1 )
	  {
		/**************************************************************/
		/*  An error occured while reading the wave file.             */
		/**************************************************************/

		bNotDone = FALSE;

		TextToSpeechErrorHandler( phTTS,
								  ERROR_READING_WAVE_FILE,
								  MMSYSERR_ERROR );
	  }
	}

	/******************************************************************/
	/*  Close the wave file.                                          */
	/******************************************************************/
	if (is_au)
	{
		close(au_fd);
	}
	else
	{

/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	mmioClose( hMmio, 0 );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	DTK_MMIO_CLOSE( hMmio, 0 );
#endif
	}
	/******************************************************************/
	/*  Wait for audio to complete.                                   */
	/******************************************************************/
	PA_WaitForPlayToComplete( phTTS->pAudioHandle );
	/******************************************************************/
	/*  Reset the queued sample count to zero. Note: that Critical    */
	/*  Sections are not necessary here because the VTM and Audio     */
	/*  threads are now blocked.                                      */
	/******************************************************************/

	phTTS->dwQueuedSampleCount = 0;

	/******************************************************************/
	/*  Reset the audio subsystem. This is done to return the         */
	/*  audio position base to zero. The position is maintained even  */
	/*  when the audio device is closed and re-opened.                */
	/******************************************************************/

	PA_Reset( phTTS->pAudioHandle );

	/******************************************************************/
	/*  Return the audio system to the default state.                 */
	/*  The only thing that can cause this call to the                */
	/*  SetAudioParams() function to fail is the audio device being   */
	/*  taken by another process. In this case, the Text-To-Speech    */
	/*  system will wait until the audio device is free, before       */
	/*  returning because the correct number of channels and the      */
	/*  correct sample rate MUST be set here.                         */
	/******************************************************************/
	
	while ( PA_SetFormat( phTTS->pAudioHandle, pOldWaveFormat ))
	{
/* GL 04/21/1997  add this for OSF build */
#ifdef WIN32
	  Sleep( SET_AUDIO_PARAMS_SLEEP_TIME );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	  OP_Sleep( SET_AUDIO_PARAMS_SLEEP_TIME );
#endif
	}
	
	/******************************************************************/
	/*  Free the PCMWAVEFORMAT structures and the audio play buffer.  */
	/******************************************************************/

	free( pOldWaveFormat );

	if ( pWaveFormat != NULL )
	  free( pWaveFormat );

	free( lpData );
  }

  return(CMD_success);

#endif
}

#endif /* WIN32 || __osf__ */


#ifndef UNDER_CE
/**********************************************************************/
/**********************************************************************/
/*  Function: wave_file_open                                          */
/*  Author: Modified from OSF/1 MME sample program audioplay.c        */
/*  Date: May 31, 1994                                                */
/**********************************************************************/
/**********************************************************************/

static HMMIO wave_file_open( char * file_name,
							 LPWAVEFORMATEX * ppWaveFormat,
							 int * piError,
							 LPTTS_HANDLE_T phTTS )
{
  MMCKINFO ckInRIFF;  /* chunk info for input RIFF chunk */
  MMCKINFO ckIn;      /* info for a chunk in input file  */
  HMMIO hmmioIn;
  LPWAVEFORMATEX pWaveFormat;
  DWORD dwSize;

  /********************************************************************/
  /*  Attempt to open file using MM I/O routines - return on failure. */
  /********************************************************************/

  *piError = 0;

#ifdef WIN32
  hmmioIn = mmioOpen( file_name, NULL, MMIO_READ );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  hmmioIn = DTK_MMIO_OPEN( file_name, NULL, MMIO_READ );
#endif

#ifndef ERRORCHECK
  if ( hmmioIn == NULL )
  {
	TextToSpeechErrorHandler( phTTS,
							  ERROR_OPENING_WAVE_FILE,
							  MMSYSERR_ERROR );

	*piError = CMD_unable_to_open_file;
	return( hmmioIn );
  }
#endif

  /********************************************************************/
  /*  Descend the input file into the 'RIFF' chunk.                   */
  /********************************************************************/

#ifdef WIN32
  if ( mmioDescend(hmmioIn, &ckInRIFF, NULL, 0 ) != 0 )
  {
	mmioClose(hmmioIn, 0 );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  if ( DTK_MMIO_DESCEND(hmmioIn, &ckInRIFF, NULL, 0 ) != 0 )
  {
        DTK_MMIO_CLOSE(hmmioIn, 0 );
#endif
	TextToSpeechErrorHandler( phTTS,
							  ERROR_BAD_WAVE_FILE_FORMAT,
							  MMSYSERR_ERROR );
	*piError = CMD_bad_wave_file_format;
	return( (int)NULL );
  }
  
  /********************************************************************/
  /*  Make sure the input file is a WAVE file.                        */
  /********************************************************************/

#ifdef WIN32
  if (( ckInRIFF.ckid != FOURCC_RIFF )
   || ( ckInRIFF.fccType != mmioFOURCC( 'W', 'A', 'V', 'E' )))
  {
	mmioClose(hmmioIn, 0 );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  if (( ckInRIFF.ckid != FOURCC_RIFF )
   || ( ckInRIFF.fccType != DTK_MMIO_FOURCC( 'W', 'A', 'V', 'E' )))
  {
    DTK_MMIO_CLOSE(hmmioIn, 0 );
#endif
	TextToSpeechErrorHandler( phTTS,
							  ERROR_BAD_WAVE_FILE_FORMAT,
							  MMSYSERR_ERROR );
	*piError = CMD_bad_wave_file_format;
	return( (int)NULL );
  }

  /********************************************************************/
  /*  Search the input file for for the 'fmt ' chunk.                 */
  /********************************************************************/
#ifdef WIN32
  ckIn.ckid = mmioFOURCC( 'f', 'm', 't', ' ' );
  if ( mmioDescend( hmmioIn, &ckIn, &ckInRIFF, MMIO_FINDCHUNK ) != 0 )
  {
	mmioClose( hmmioIn, 0 );
#endif
/* GL 04/21/1997  change this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  ckIn.ckid = DTK_MMIO_FOURCC( 'f', 'm', 't', ' ' );
  if ( DTK_MMIO_DESCEND( hmmioIn, &ckIn, &ckInRIFF, MMIO_FINDCHUNK ) != 0 )
  {
    DTK_MMIO_CLOSE( hmmioIn, 0 );
#endif
	TextToSpeechErrorHandler( phTTS,
							  ERROR_BAD_WAVE_FILE_FORMAT,
							  MMSYSERR_ERROR );
	*piError = CMD_bad_wave_file_format;
	return( (int)NULL );
  }

  
  /********************************************************************/
  /*  Get the size of the 'fmt ' chunk.                               */
  /********************************************************************/

  dwSize = ckIn.cksize;

  if ( dwSize < sizeof(WAVEFORMATEX))
	dwSize = sizeof(WAVEFORMATEX);

  /********************************************************************/
  /*  Allocate a WAVEFORMATEX structure.                              */
  /********************************************************************/

  pWaveFormat = (LPWAVEFORMATEX)malloc((size_t)dwSize);

  if ( pWaveFormat == NULL )
  {

#ifdef WIN32
	mmioClose(hmmioIn, 0 );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
	    DTK_MMIO_CLOSE(hmmioIn, 0 );
#endif

	TextToSpeechErrorHandler( phTTS,
							  0,
							  MMSYSERR_NOMEM );
	*piError = CMD_out_of_memory;
	return( (int)NULL );
  }

  *ppWaveFormat = pWaveFormat;

  /********************************************************************/
  /*  Read 'fmt ' chunk into <WaveFormat>.                            */
  /********************************************************************/

#ifdef WIN32
  if ( dwSize != (DWORD)mmioRead( hmmioIn,
								  (HPSTR)&pWaveFormat->wFormatTag,
								  dwSize ))
  {
	mmioClose(hmmioIn, 0 );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  if ( dwSize != (DWORD) DTK_MMIO_READ( hmmioIn,
								  (HPSTR)&pWaveFormat->wFormatTag,
								  dwSize ))
  {
        DTK_MMIO_CLOSE(hmmioIn, 0 );
#endif
	TextToSpeechErrorHandler( phTTS,
							  ERROR_BAD_WAVE_FILE_FORMAT,
							  MMSYSERR_ERROR );
	*piError = CMD_bad_wave_file_format;
	return( (int)NULL );
  }


  /********************************************************************/
  /*  Ascend the input file out of the 'fmt ' chunk.                  */
  /********************************************************************/
#ifdef WIN32
  if ( mmioAscend(hmmioIn, &ckIn, 0 ) != 0 )
  {
	mmioClose(hmmioIn, 0 );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  if ( DTK_MMIO_ASCEND(hmmioIn, &ckIn, 0 ) != 0 )
  {
    DTK_MMIO_CLOSE(hmmioIn, 0 );
#endif
	TextToSpeechErrorHandler( phTTS,
							  ERROR_BAD_WAVE_FILE_FORMAT,
							  MMSYSERR_ERROR );
	*piError = CMD_bad_wave_file_format;
	return( (int)NULL );
  }



  /********************************************************************/
  /*  Search the input file for for the 'data' chunk & leave file     */
  /*  positioned there for when we start reading audio data.          */
  /********************************************************************/
#ifdef WIN32
  ckIn.ckid = mmioFOURCC( 'd', 'a', 't', 'a' );
  if ( mmioDescend( hmmioIn, &ckIn, &ckInRIFF, MMIO_FINDCHUNK ) != 0 )
  {
	mmioClose(hmmioIn, 0 );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
  ckIn.ckid = DTK_MMIO_FOURCC( 'd', 'a', 't', 'a' );
  if ( DTK_MMIO_DESCEND( hmmioIn, &ckIn, &ckInRIFF, MMIO_FINDCHUNK ) != 0 )
  {
    DTK_MMIO_CLOSE(hmmioIn, 0 );
#endif
	TextToSpeechErrorHandler( phTTS,
							  ERROR_BAD_WAVE_FILE_FORMAT,
							  MMSYSERR_ERROR );
	*piError = CMD_bad_wave_file_format;
	return( (int)NULL );
  }

  *piError = 0;
  return( hmmioIn );
}

#endif

#endif //UNDER_CE
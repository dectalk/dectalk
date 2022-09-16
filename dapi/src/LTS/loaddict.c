/************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    loaddict.c
 *    Author:       ??
 *    Creation Date:??
 *
 *    Functionality:
 *    Load a dictionary database.
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 002  JAW     02/27/1998  Merged CE code.
 * 003  CJL     03/18/1998  Removed specific path for dectalkf.h.
 * 004	tek		14may98		bats672 log failures in loading required dictionaries.
 * 005  JAW     07/07/1998  Made function load_dictionary store the size of the dictionary in
 *                          bytes in the first 4 bytes of the dictionary's block of memory.
 *                          Made function unload_dictionary properly free the block of memory.
 * 006  ETT		10/05/1998  Added Linux code.
 * 007  ETT		11/12/1998  Fixed rev 005 for osf.
 * 008	MGS		06/12/2000  Dictionary reduction
 * 009  CAB		06/20/2000	Fixed CE linker errors because it doesn't support freeLock().
 * 010	MFG		07/31/2000	Implemented dictionary memory mapping for Windows CE/NT/95
 * 011	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 012	CAB		10/16/2000	1. Previous Correction on 009(06/20/2000) was in error and 
 *							   lines were removed because which was not necessary. 
 *  						2. Added copyright info
 * 013	MFG		02/19/2001	used #pragma to shut off optimizing for CE loading of dictionary
 * 014	CAB		02/23/2001	updated copyright info			
 * 015	MFG		03/01/2001	added fallback code for dictionary mapping if the dic doesn't map out	
 * 016	MGS		03/13/2001	Removed global variable from fallback
 * 017 	CAB		03/16/2001	Updated copyright info.
 *
 */

#include "dectalkf.h"

/*
#define DBGDIC 1
*/
#include <stdio.h>
#if defined __linux__ || defined __osf__
#include <stdarg.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#endif
#include "ls_def.h"

 
/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__)
#include "dtmmedefs.h"
#include "opthread.h"
#include <unistd.h>
#include <sys/mman.h>
#endif

#ifdef WIN32
/* GL 10/30/1996, change to mmalloc.h as V4.3 */
#include "mmalloc.h"
#include "ttsapi.h"
#ifndef UNDER_CE
#include <time.h> // tek 14may98 needed for dic load log
#endif //UNDER_CE
#endif

// global varable in memory mapping fails
//int	dicfallback = MEMMAP_ON;

/*
 * unload_dictionary
 *
 * INPUTS:
 *   dict_ref      - Pointer to the in-memory user dictonary
 *   dict_siz      - Number of entries in the dictonary.
 * OUTPUTS:
 *   
 * RETURN PARAMETER:
 *   none.
 *
 * Author: Krishna Mangipudi 8/25/93
 */



void unload_dictionary( void ** dict_index, 
						void ** dict_data,
						unsigned int * dict_siz,
						unsigned int * dict_bytes, 
						LPVOID *dicMapStartAddr,
						HANDLE *dicMapObject,
						HANDLE *dicFileHandle,
						MEMMAP_T dict_map 
						)
{
	

	if(dict_map && dicMapStartAddr && *dicMapStartAddr)
	{	
#ifdef WIN32
		if(UnmapViewOfFile(*dicMapStartAddr)) //unmap file and close all handles
		{ 	
			CloseHandle(*dicMapObject);
			CloseHandle(*dicFileHandle);
			return;
		}
		return;
#endif // WIN32
#if defined __linux__ || defined __osf__
		munmap(*dicMapStartAddr,*dicMapObject);
		close(*dicFileHandle);
		*dicMapStartAddr=NULL;
		*dicMapObject=0;
		*dicFileHandle=0;
#endif
	}
	else
	{	

		if (( *dict_siz > 0 ) && ( dict_index != NULL ))
		{
		/* Make dict_ref point to real head of dictionary 
			(including the 4 bytes storing the size), JAW 7/7/98 */
#if (defined WIN32) && (!defined UNDER_CE)
			freeLock( *dict_index );
#else
			free( *dict_index );
#endif
			*dict_index = (void *)NULL;
#if (defined WIN32) && (!defined UNDER_CE)
			freeLock( *dict_data );
#else
			free( *dict_data );
#endif
			*dict_data = (void *)NULL;
		} 
		*dict_siz = 0;
		*dict_bytes=0;
		return;	
		
	}
	
}


/*
 * load_dictionary
 *
 * INPUTS:
 *   dict_name    - name of dictionary database file
 *
 * OUTPUTS:
 *   *dict_ref     - pointer to allocated memory is placed here
 *   *dict_siz     - number of dictionary entries is placed here
 *
 * RETURN PARAMETER:
 *   A value of type MMRESULT. It is MMSYSERR_NOERROR = 0 if no error occurred.
 */

#ifdef WIN32

void TextToSpeechErrorHandler( LPTTS_HANDLE_T,
			       UINT,
			       MMRESULT );

#ifdef UNDER_CE
#pragma optimize("",off)
#endif

MMRESULT load_dictionary( LPTTS_HANDLE_T phTTS,
			  void **dict_index,
			  void **dict_data,
			  unsigned int *dict_siz,
			  unsigned int *dict_bytes,
			  char *dict_nam,
			  BOOL bRequired,
			  BOOL bReportToWindow,
			  HANDLE *dicMapObject,		// Handle for mapped object
			  HANDLE *dicFileHandle,	    // File Handle	
			  LPVOID *dicMapStartAddr,	// Starting address of mapped view
			  MEMMAP_T dict_map)
#else
     int load_dictionary( void **dict_index,
			  void **dict_data,
			  unsigned int *dict_siz,
			  unsigned int *dict_bytes,
			  char *dict_nam,
			  int bRequired ,
			  HANDLE *dicMapObject,		// Handle for mapped object
			  HANDLE *dicFileHandle,	    // File Handle	
			  LPVOID *dicMapStartAddr,	// Starting address of mapped view
			  MEMMAP_T dict_map)
#endif
{

  FILE *dict_file;
  S32 *dict_index_buffer;
  unsigned char *dict_data_buffer;
  int entries, bytes, size, pointer_list_size;
  int status;


#ifdef UNDER_CE
  unsigned short wdict_nam[128];
#endif
  

#ifdef DBGDIC
  struct dic_entry far *ent;
#endif
  /*
   * set error return values
   */
restart:if ( *dict_siz > 0 )
		return( MMSYSERR_ERROR );
  
  *dict_siz = 0;
  *dict_bytes = 0;
  dict_index_buffer = NULL;
  dict_data_buffer = NULL;


#ifdef DBGDIC
  printf("In load dict:%s \n", dict_nam);
#endif
  if (( dict_file = fopen( dict_nam, "rb" )) == 0 )
  {
      if ( bRequired )
	{
#ifdef WIN32
#ifndef UNDER_CE
	  /* tek 14may98 We have had several OEMs who have had trouble
	     getting their registry entries and install scripts configured
	     to load the dictionary correctly. To help with this, log
	     load failures to a file. */
	  FILE *fpDicLogFile = NULL;
	  fpDicLogFile = fopen("\\dtdic.log","a+"); /* open for append, handle EOF */
	  if (fpDicLogFile)
	    {
	      char szDateBuf[64];
	      char szTimeBuf[64];
	      /* log the pertinent info */
	      _strdate(szDateBuf);
	      _strtime(szTimeBuf);
	      fprintf(fpDicLogFile,"%s %s : Dictionary %s not found.\n",
		      szDateBuf, szTimeBuf, dict_nam);
	      fflush(fpDicLogFile);
	      fclose(fpDicLogFile);
	    }
#endif //UNDER_CE
	  
	  /************************************************************/
	  /*  The dictionary size is set to 0xFFFFFFFF to signal the  */
	  /*  TextToSpeechStartup() function that the dictionary was  */
	  /*  not found.                                              */
	  /************************************************************/
	  /*MVP : Commented out,The error notification is sent to TextToSpeechStartup*/
	  /*    *dict_siz = 0xFFFFFFFF;   */
#else
	  fprintf(stderr,"Failed to open dictionary file %s\n",dict_nam);
#endif //WIN32
	  return( MMSYSERR_INVALPARAM );
	  
	}
      /*MVP : To make the loading user dictionary  an optional ,i.e if the user 
	dictionary file doesn't exist don't generate an error, return success.
the flag brequired for loading of user dictionary is FALSE.
	*/
      return( MMSYSERR_NOERROR ); 
    }
  /* Read in file header */
  if ( fread( &entries, 4, 1, dict_file ) != 1 )
    {
#ifdef WIN32
      
      if ( bReportToWindow )
	{
	  TextToSpeechErrorHandler( phTTS,
				    ERROR_READING_DICTIONARY,
				    MMSYSERR_ERROR );
	}
 
#else
      fprintf(stderr,"Error reading dictionary database: %s\n",dict_nam);
      perror("load_dictionary");
      
#endif

      fclose(dict_file);

      return( MMSYSERR_ERROR );
    }

#ifdef DBGDIC
printf("ent:%d %x\n", entries,entries);
#endif
  /* tek 30jan97 bail with no error if the dictionary has no entries */
  if (entries == 0)
    {
      fclose(dict_file);

      return (MMSYSERR_NOERROR);
    }
  
  pointer_list_size = ( entries * sizeof(S32) );
  if ( fread( &bytes, 4, 1, dict_file ) != 1 )
    {
      
#ifdef WIN32
      
      if ( bReportToWindow )
	{
	  TextToSpeechErrorHandler( phTTS,
				    ERROR_READING_DICTIONARY,
				    MMSYSERR_ERROR );
	}
#else
      
      fprintf(stderr,"Error reading dictionary database: %s\n",dict_nam);
      perror("load_dictionary");
      
#endif
      fclose(dict_file);
      return( MMSYSERR_ERROR );
    }
  
#ifdef DBGDIC
  printf("bytes:%d %x\n",bytes,bytes);
#endif
  
  /* Compute & allocate required memory for both parts of dictionary */
  /* Allocated 4 (8 on alpha) extra bytes to store the size of the dictionary in bytes.  JAW 7/7/98 */
  size = pointer_list_size + bytes;


	if(dict_map)
	{ 
	  
#ifdef WIN32
	  fclose(dict_file);
	  
#ifdef UNDER_CE
	  MultiByteToWideChar(CP_ACP,0,dict_nam,strlen(dict_nam),wdict_nam,sizeof(wdict_nam));
	  *dicFileHandle = CreateFileForMapping(wdict_nam, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING,  FILE_ATTRIBUTE_NORMAL, NULL);
#else
	  *dicFileHandle = (HANDLE) CreateFile(dict_nam, GENERIC_READ,FILE_SHARE_READ, NULL, OPEN_EXISTING,0,NULL);
#endif
	  
	  
	  if (*dicFileHandle == NULL){
			dict_map = MEMMAP_OFF;
//			dicfallback = MEMMAP_OFF;
			*dicFileHandle=NULL;
			*dicMapObject=NULL;
			*dicMapStartAddr=NULL;
			goto restart;
	  }
	  
	  
	  *dicMapObject = CreateFileMapping(	 //get map object
		  *dicFileHandle,		//File handle
		  NULL,             
		  PAGE_READONLY,      // read only access  
		  0,					
		  0,
		  NULL);
	  
	  
	  if (*dicMapObject == NULL){
			dict_map = MEMMAP_OFF;
//			dicfallback = MEMMAP_OFF;
			CloseHandle(*dicFileHandle);
			*dicFileHandle=NULL;
			*dicMapObject=NULL;
			*dicMapStartAddr=NULL;
			goto restart;
	  }
	  
	  *dicMapStartAddr = MapViewOfFile(  //map a view of the object get starting address
		  *dicMapObject,		// object to map view of     
		  FILE_MAP_READ,		// read access	 
		  0,              
		  0,               
		  0);					// default: map entire file
	  
	  
	  if (*dicMapStartAddr == NULL){
			dict_map = MEMMAP_OFF;
//			dicfallback = MEMMAP_OFF;
			CloseHandle(*dicMapObject);
			CloseHandle(*dicFileHandle);
			*dicFileHandle=NULL;
			*dicMapObject=NULL;
			*dicMapStartAddr=NULL;
			goto restart;
	  }
	  
#endif
#if defined __linux__ || defined __osf__
	  // open the file */
	  *dicFileHandle=open(dict_nam,O_RDONLY);
	  if (((int)*dicFileHandle)==-1)
	  {
	  	*dicFileHandle=0;
		  return(MMSYSERR_ERROR);
	  }
	  *dicMapObject=size+8;
	  *dicMapStartAddr=mmap(0,size+8,PROT_READ,MAP_SHARED,*dicFileHandle,0);
	  if (((int)*dicMapStartAddr)==-1)
	  {
	  	close(*dicFileHandle);
		*dicFileHandle=0;
	  	*dicMapObject=0;
	  	*dicMapStartAddr=0;
		  return(MMSYSERR_ERROR);
	  }


#endif

	  dict_index_buffer = (int *)(((int)*dicMapStartAddr) + 8); //start the index buffer at start address + 8 bytes
	  
	  dict_data_buffer = (unsigned char *)(pointer_list_size + ((int)dict_index_buffer)); //start 
	  
	  
  }
  else
  { 
	  
	  
#if (defined WIN32) && (!defined UNDER_CE)
  if ( !( dict_index_buffer = (void *)mallocLock(pointer_list_size )))
#else
    if ( !( dict_index_buffer = (void *)malloc(pointer_list_size )))
#endif
	{


#ifdef WIN32

	  if ( bReportToWindow )
	  {
		TextToSpeechErrorHandler( phTTS,
								  ERROR_READING_DICTIONARY,
								  MMSYSERR_NOMEM );
	  }
#else

	  fprintf(stderr,"Failed to allocated required %d bytes of memory to load dictionary\n",size + sizeof(long));

#endif
	  fclose(dict_file);

	  return( MMSYSERR_NOMEM );
	}




#if (defined WIN32) && (!defined UNDER_CE)
  if ( !( dict_data_buffer = (void *)mallocLock(bytes +1)))
#else
    if ( !( dict_data_buffer = (void *)malloc(bytes +1)))
#endif
	{

#ifdef WIN32	
	  if ( bReportToWindow )
	  {
		TextToSpeechErrorHandler( phTTS,
								  ERROR_READING_DICTIONARY,
								  MMSYSERR_NOMEM );
	  }
#ifndef UNDER_CE
		freeLock((dict_index_buffer));
#else
		free((dict_index_buffer));
#endif // UNDER_CE
#else
	  free(dict_index_buffer);
	  fprintf(stderr,"Failed to allocated required %d bytes of memory to load dictionary\n",size + sizeof(long));
#endif
	  fclose(dict_file);

	  return( MMSYSERR_NOMEM );
	}



	// store the total size of the dictionary in the first index position */

	
	/* read in the index table */
	if (fread(dict_index_buffer,4,entries,dict_file)!=(unsigned)entries)
	{
#ifdef WIN32
		
		if ( bReportToWindow )
		{
			TextToSpeechErrorHandler( phTTS,
				ERROR_READING_DICTIONARY,
				MMSYSERR_ERROR );
		}
		
		status = feof( dict_file );
#ifndef UNDER_CE
		freeLock((dict_index_buffer));
		freeLock(dict_data_buffer);
#else
		free((dict_index_buffer));
		free(dict_data_buffer);
#endif
		
#else
		fprintf(stderr,"Error reading dictionary database: %s\n",dict_nam);
		perror("load_dictionary");
		
		status = feof( dict_file );
		free(dict_index_buffer);
		free(dict_data_buffer);
#endif
		fclose(dict_file);
		
		return( MMSYSERR_ERROR );
	}


	/* Read in the rest of the dictionary */
	if ( fread( dict_data_buffer, bytes, 1, dict_file ) != 1 )
	{
#ifdef WIN32
		
		if ( bReportToWindow )
		{
			TextToSpeechErrorHandler( phTTS,
				ERROR_READING_DICTIONARY,
				MMSYSERR_ERROR );
		}
		
#ifndef UNDER_CE
		freeLock(dict_index_buffer);
		freeLock(dict_data_buffer);
#else
		free(dict_index_buffer);
		free(dict_data_buffer);
#endif
		
#else
		fprintf(stderr,"Error reading dictionary database: %s\n",dict_nam);
		perror("load_dictionary");
		free(dict_index_buffer);
		free(dict_data_buffer);
#endif
		fclose(dict_file);
		return( MMSYSERR_ERROR );
	}
	
#ifdef DBGDIC
	printf("base:%d %x\n",base,base);
	printf("sizeof(void*)=%d\n",sizeof(void *));
#endif
	fclose(dict_file);

} //MEMMAP	
	
	/* write output parameters */
	*dict_index = dict_index_buffer;
	*dict_data = dict_data_buffer;
	*dict_siz = entries;
	*dict_bytes=bytes;
#ifdef DBGDIC
#define DICT_HEAD       ((struct dic_entry far * far *)dict_buffer)
/*
   for (i=0; i< entries; i++)
   {
		ent = DICT_HEAD[i];
		printf("ent No:%d = %s\n",i, (*ent).text);
   }
*/
#endif

  return( MMSYSERR_NOERROR );
}
/***********************************end of loaddict.c(296)****************************/





/************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 */

#include "dectalkf.h"

/*
#define DBGDIC 1
*/
#include <stdio.h>
#include "ls_def.h"

/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
#include "opthread.h"
#endif

#ifdef WIN32
/* GL 10/30/1996, change to mmalloc.h as V4.3 */
#include "mmalloc.h"
#include "ttsapi.h"
#ifndef UNDER_CE
#include <time.h> // tek 14may98 needed for dic load log
#endif //UNDER_CE
#endif


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

void unload_dictionary( void ** dict_ref,
						unsigned int * dict_siz )
{
	if (( *dict_siz > 0 ) && ( dict_ref != NULL ))
	{
#if (defined WIN32) && (!defined UNDER_CE)
	   freeLock( *dict_ref );
#else
	   free( *dict_ref );
#endif
	   *dict_ref = (void *)NULL;
	} 
	*dict_siz = 0;
	return;
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

MMRESULT load_dictionary( LPTTS_HANDLE_T phTTS,
						  void **dict_ref,
						  unsigned int *dict_siz,
						  char *dict_nam,
						  BOOL bRequired,
						  BOOL bReportToWindow )
#else
int load_dictionary( void **dict_ref,
					 unsigned int *dict_siz,
					 char *dict_nam,
					 int bRequired )
#endif
{
	FILE *dict_file;
	void **ip, *dict_buffer;
	int i, entries, bytes, size, offset, pointer_list_size;
	int status;
	char *base;

#ifdef DBGDIC
struct dic_entry far *ent;
#endif
	/*
	 * set error return values
	 */
	if ( *dict_siz > 0 )
	  return( MMSYSERR_ERROR );

	*dict_siz = 0;
	*dict_ref = (void *)NULL;
#ifdef DBGDIC
printf("In load dict:%s \n", dict_nam);
#endif

	if (( dict_file = fopen( dict_nam, "rb" )) == 0 )
	{
	   if ( bRequired )
	   {
#ifdef WIN32
#ifndef UNDER_CE
		   // tek 14may98 We've had several OEMs who have had trouble
		   // getting their registry entries and install scripts configured
		   // to load the dictionary correctly. To help with this, log
		   // load failures to a file.
		   FILE *fpDicLogFile = NULL;
		   fpDicLogFile = fopen("\\dtdic.log","a+"); // open for append, handle EOF
		   if (fpDicLogFile)
		   {
			   char szDateBuf[64];
			   char szTimeBuf[64];
			   // log the pertinent info
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
#endif
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

	pointer_list_size = ( entries * sizeof(void *) );
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
	size = pointer_list_size + bytes;
#if (defined WIN32) && (!defined UNDER_CE)
	if ( !( dict_buffer = (void *)mallocLock(size)))
#else
	if ( !( dict_buffer = (void *)malloc(size)))
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

	  fprintf(stderr,"Failed to allocated required %d bytes of memory to load dictionary\n",size);

#endif

	  fclose(dict_file);

	  return( MMSYSERR_NOMEM );
	}

	/* Read in and fix up addresses for index entries */
	base = (char *)dict_buffer + pointer_list_size;
	ip = dict_buffer;
	for ( i=0 ; i<entries ; i++ )
	{
	if ( fread( &offset, 4, 1, dict_file ) != 1 )
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
			freeLock(dict_buffer);
#else
			free(dict_buffer);
#endif

#else
		fprintf(stderr,"Error reading dictionary database: %s\n",dict_nam);
		perror("load_dictionary");

			status = feof( dict_file );
			free(dict_buffer);
#endif
			fclose(dict_file);

			return( MMSYSERR_ERROR );
	}

	*ip++ = (void *)(base+offset);  /* relocate pointer to absolute addr */

#ifdef DBGDIC
/*    printf("offset:%d %x\n",offset,offset); */
#endif
	}

	/* Read in the rest of the dictionary */
	if ( fread( base, bytes, 1, dict_file ) != 1 )
	{
#ifdef WIN32

		if ( bReportToWindow )
		{
		  TextToSpeechErrorHandler( phTTS,
									ERROR_READING_DICTIONARY,
									MMSYSERR_ERROR );
		}

#ifndef UNDER_CE
		freeLock(dict_buffer);
#else
		free(dict_buffer);
#endif

#else
	fprintf(stderr,"Error reading dictionary database: %s\n",dict_nam);
	perror("load_dictionary");
		free(dict_buffer);
#endif
	fclose(dict_file);

		return( MMSYSERR_ERROR );
	}

#ifdef DBGDIC
printf("base:%d %x\n",base,base);
#endif

	fclose(dict_file);

	/* write output parameters */
	*dict_ref = dict_buffer;
	*dict_siz = entries;
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

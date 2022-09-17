/****************************************************************
 * RIFF File Format Reader / Writer                             *
 ****************************************************************
 *  File Format: Copyright (c) by Microsoft Corporation         *
 ****************************************************************
 * File History:
 *  Not Documented
 */

#ifndef _RIFF_HEADER
#define _RIFF_HEADER

#ifndef _PH_TYPES_HEADER
#include "ph_types.h"
#endif

typedef struct RIFFheader_STRUCT {
	U8 tag[4];
	DWORD dwRiffChunkSize;
	U8 type[4];
} RIFFheader;

typedef struct CHUNKheader_STRUCT {
	U8 type[4];
	DWORD dwChunkSize;
} CHUNKheader;

class RIFF {
	public:
		BOOL ReadRIFF(CArchive &ar, RIFFheader *header);
		BOOL WriteRIFF(CArchive &ar, LPSTR type);
		BOOL FinalizeRIFF(CArchive &ar, LPSTR type);
		U32 FindChunk(CArchive &file, LPSTR type);
		U32 FindCodedChunk(CArchive &file, LPSTR type);
		U32 WriteChunk(CArchive &file, LPSTR type, LPVOID data, U32 size);
		U32 WriteCodedChunk(CArchive &file, LPSTR type, LPVOID data, U32 size);
		U32 ReadChunk(CArchive &file, LPSTR type, LPVOID data, U32 size);
		U32 ReadCodedChunk(CArchive &file, LPSTR type, LPVOID data, U32 size);

		BOOL ReadRIFF(FILE *filePtr, RIFFheader *header);
		BOOL WriteRIFF(FILE *filePtr, LPSTR type);
		BOOL FinalizeRIFF(FILE *filePtr, LPSTR type);
		U32 FindChunk(FILE *filePtr, LPSTR type);
		U32 FindCodedChunk(FILE *filePtr, LPSTR type);
		U32 WriteChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size);
		U32 WriteCodedChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size);
		U32 ReadChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size);
		U32 ReadCodedChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size);
	private:
		void Encrypt(U8* newData, DWORD size, U8* key);
		void Decrypt(U8* newData, DWORD size, U8* key);
};

#endif
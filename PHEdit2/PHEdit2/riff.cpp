/****************************************************************
 * RIFF File Format Reader / Writer                             *
 ****************************************************************
 *  File Format: Copyright (c) by Microsoft Corporation         *
 ****************************************************************
 * File History:
 *  Not Documented
 */

#include "stdafx.h"
#include "riff.h"

BOOL RIFF::ReadRIFF(CArchive &ar, RIFFheader *header) {
	CFile *fp = ar.GetFile();

	fp->SeekToBegin();
	if ((fp->Read(header, sizeof(RIFFheader))) != sizeof(RIFFheader))	return FALSE;
	if (memcmp(header->tag,"RIFF",4) != 0)								return FALSE;	// RIFF tag test
	return TRUE;
}

BOOL RIFF::WriteRIFF(CArchive &ar, LPSTR type) {
	RIFFheader header;
	CFile* fp = ar.GetFile();

	memcpy(header.tag,"OPEN",4);
	memcpy(header.type, type, 4);
	fp->SeekToBegin();
	header.dwRiffChunkSize = 4;						// RIFF header (8 bytes) not including TAG type
	fp->Write(&header, sizeof(RIFFheader));
	return TRUE;
}

BOOL RIFF::FinalizeRIFF(CArchive &ar, LPSTR type) {
	RIFFheader header;
	CFile* fp = ar.GetFile();

	memcpy(header.tag,"RIFF",4);
	memcpy(header.type, type, 4);
	fp->SeekToBegin();
	header.dwRiffChunkSize = fp->GetLength() - 8;						// RIFF header (8 bytes) not including TAG type
	fp->Write(&header, sizeof(RIFFheader));
	return TRUE;
}

U32 RIFF::FindChunk(CArchive &ar, LPSTR type) {
	CFile* fp = ar.GetFile();
	DWORD len = fp->GetLength();
	DWORD pos = sizeof(RIFFheader);
	CHUNKheader chunk;

	while (pos < len-1) {
		fp->Seek(pos, CFile::begin);							// Skip the RIFF header
		if ((fp->Read(&chunk, sizeof(CHUNKheader))) != sizeof(CHUNKheader))	return 0;
		if (memcmp(chunk.type, type, 4) == 0)								return chunk.dwChunkSize;
		pos += chunk.dwChunkSize + sizeof(CHUNKheader);
	}
	return 0;
}

U32 RIFF::FindCodedChunk(CArchive &ar, LPSTR type) {
	CFile* fp = ar.GetFile();
	DWORD len = fp->GetLength();
	DWORD pos = sizeof(RIFFheader);
	DWORD dataSize;
	CHUNKheader chunk;

	while (pos < len-1) {
		fp->Seek(pos, CFile::begin);							// Skip the RIFF header
		if ((fp->Read(&chunk, sizeof(CHUNKheader))) != sizeof(CHUNKheader))	return 0;
		if (memcmp(chunk.type, type, 4) == 0) {
			fp->Read(&dataSize, sizeof(U32));
			return dataSize;
		}
		pos += chunk.dwChunkSize + sizeof(CHUNKheader);
	}
	return 0;
}

U32 RIFF::ReadChunk(CArchive &ar, LPSTR type, LPVOID data, U32 size) {
	CFile* fp = ar.GetFile();

	if (size == 0)								return 0;
	if (FindChunk(ar, type) != size)			return 0;
	if (fp->Read(data, size) != size)			return 0;
	return size;
}

U32 RIFF::WriteChunk(CArchive &ar, LPSTR type, LPVOID data, U32 size) {
	CFile* fp = ar.GetFile();
	CHUNKheader chunk;
	DWORD len = fp->GetLength();
	DWORD newlen;

	if (size == 0)							return 0;
	fp->SeekToEnd();
	memcpy(chunk.type,type,4);
	chunk.dwChunkSize = size;
	fp->Write(&chunk, sizeof(CHUNKheader));
	fp->Write(data, size);
	newlen = fp->GetLength();
	if (newlen == len)						return 0;
	newlen -= sizeof(CHUNKheader);
	if (newlen - len != size)				return 0;
	return size;
}

U32 RIFF::WriteCodedChunk(CArchive &ar, LPSTR type, LPVOID data, U32 size) {
	CFile* fp = ar.GetFile();
	CHUNKheader chunk;
	DWORD len = fp->GetLength();
	DWORD newlen;
	U8 *newData;
	U8 *key;
	DWORD newSize, keySize;

	if (size == 0)									return 0;
	if ((newData = (U8*) malloc(size)) == NULL)		return 0;
	keySize = 5;
	newSize = keySize + size;
	if ((key = (U8*) malloc(keySize)) == NULL)		return 0;
	memcpy(newData, (U8*) data, size);
	Encrypt(newData, size, key);

	fp->SeekToEnd();
	memcpy(chunk.type,type,4);
	chunk.dwChunkSize = (newSize + sizeof(U32));
	fp->Write(&chunk, sizeof(CHUNKheader));
	fp->Write(&size, sizeof(U32));
	fp->Write(newData, size);
	fp->Write(key, keySize);
	free(newData);
	free(key);
	newlen = fp->GetLength();
	if (newlen == len)								return 0;
	newlen -= sizeof(CHUNKheader);
	if (newlen - len != newSize + sizeof(U32))		return 0;
	return size;
}

U32 RIFF::ReadCodedChunk(CArchive &ar, LPSTR type, LPVOID data, U32 size) {
	CFile* fp = ar.GetFile();
	U8 *newData;
	U8 *key;
	DWORD newSize, keySize, oldSize;

	if (size == 0)									return 0;
	if (FindCodedChunk(ar, type) != size)			return 0;
	if ((newSize = FindChunk(ar, type)) == 0)		return 0;
	newSize -= sizeof(U32);
	keySize = newSize - size;

	if ((newData = (U8*) malloc(size)) == NULL)		return 0;
	if ((key = (U8*) malloc(keySize)) == NULL)		return 0;

	if (fp->Read(&oldSize, sizeof(U32)) == NULL)	return 0;
	if (fp->Read(newData, size) != size)			return 0;
	if (fp->Read(key, keySize) != keySize)			return 0;
	Decrypt(newData, size, key);
	memcpy((U8*) data, newData, size);
	free(newData);
	free(key);
	return size;
}


BOOL RIFF::ReadRIFF(FILE *filePtr, RIFFheader *header) {

	fseek(filePtr, 0, SEEK_SET);
	if ((fread(header, 1, sizeof(RIFFheader), filePtr)) != sizeof(RIFFheader))	return FALSE;
	if (memcmp(header->tag,"RIFF",4) != 0)									return FALSE;	// RIFF tag test
	return TRUE;
}

BOOL RIFF::WriteRIFF(FILE *filePtr, LPSTR type) {
	RIFFheader header;

	memcpy(header.tag,"OPEN",4);
	memcpy(header.type, type, 4);
	fseek(filePtr, 0, SEEK_SET);
	header.dwRiffChunkSize = 4;						// RIFF header (8 bytes) not including TAG type
	fwrite(&header, 1, sizeof(RIFFheader), filePtr);
	return TRUE;
}

BOOL RIFF::FinalizeRIFF(FILE *filePtr, LPSTR type) {
	RIFFheader header;
	DWORD len;

	memcpy(header.tag,"RIFF",4);
	memcpy(header.type, type, 4);
	fseek(filePtr, 0, SEEK_END);
	len = ftell(filePtr);
	fseek(filePtr, 0, SEEK_SET);
	header.dwRiffChunkSize = len - 8;						// RIFF header (8 bytes) not including TAG type
	fwrite(&header, 1, sizeof(RIFFheader), filePtr);
	return TRUE;
}

U32 RIFF::FindChunk(FILE *filePtr, LPSTR type) {
	DWORD len;
	DWORD pos = sizeof(RIFFheader);
	CHUNKheader chunk;

	fseek(filePtr, 0, SEEK_END);
	len = ftell(filePtr);
	while (pos < len-1) {
		fseek(filePtr, pos, SEEK_SET);							// Skip the RIFF header
		if ((fread(&chunk, 1, sizeof(CHUNKheader), filePtr)) != sizeof(CHUNKheader))	return 0;
		if (memcmp(chunk.type, type, 4) == 0)								return chunk.dwChunkSize;
		pos += chunk.dwChunkSize + sizeof(CHUNKheader);
	}
	return 0;
}

U32 RIFF::FindCodedChunk(FILE *filePtr, LPSTR type) {
	DWORD len;
	DWORD pos = sizeof(RIFFheader);
	DWORD dataSize;
	CHUNKheader chunk;

	fseek(filePtr, 0, SEEK_END);
	len = ftell(filePtr);
	while (pos < len-1) {
		fseek(filePtr, pos, SEEK_SET);							// Skip the RIFF header
		if ((fread(&chunk, 1, sizeof(CHUNKheader), filePtr)) != sizeof(CHUNKheader))	return 0;
		if (memcmp(chunk.type, type, 4) == 0) {
			fread(&dataSize, 1, sizeof(U32), filePtr);
			return dataSize;
		}
		pos += chunk.dwChunkSize + sizeof(CHUNKheader);
	}
	return 0;
}

U32 RIFF::ReadChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size) {
	if (size == 0)								return 0;
	if (FindChunk(filePtr, type) != size)			return 0;
	if (fread(data, 1, size, filePtr) != size)	return 0;
	return size;
}

U32 RIFF::WriteChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size) {
	CHUNKheader chunk;
	DWORD len;
	DWORD newlen;

	fseek(filePtr, 0, SEEK_END);
	len = ftell(filePtr);

	if (size == 0)							return 0;
	memcpy(chunk.type,type,4);
	chunk.dwChunkSize = size;
	fwrite(&chunk, 1, sizeof(CHUNKheader), filePtr);
	fwrite(data, 1, size, filePtr);
	newlen = ftell(filePtr);
	if (newlen == len)						return 0;
	newlen -= sizeof(CHUNKheader);
	if (newlen - len != size)				return 0;
	return size;
}

U32 RIFF::WriteCodedChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size) {
	CHUNKheader chunk;
	DWORD len;
	DWORD newlen;
	U8 *newData;
	U8 *key;
	DWORD newSize, keySize;

	fseek(filePtr, 0, SEEK_END);
	len = ftell(filePtr);

	if (size == 0)									return 0;
	if ((newData = (U8*) malloc(size)) == NULL)		return 0;
	keySize = 5;
	newSize = keySize + size;
	if ((key = (U8*) malloc(keySize)) == NULL)		return 0;
	memcpy(newData, (U8*) data, size);
	Encrypt(newData, size, key);

	memcpy(chunk.type,type,4);
	chunk.dwChunkSize = (newSize + sizeof(U32));
	fwrite(&chunk, 1, sizeof(CHUNKheader), filePtr);
	fwrite(&size, 1, sizeof(U32), filePtr);
	fwrite(newData, 1, size, filePtr);
	fwrite(key, 1, keySize, filePtr);
	free(newData);
	free(key);
	newlen = ftell(filePtr);
	if (newlen == len)								return 0;
	newlen -= sizeof(CHUNKheader);
	if (newlen - len != newSize + sizeof(U32))		return 0;
	return size;
}

U32 RIFF::ReadCodedChunk(FILE *filePtr, LPSTR type, LPVOID data, U32 size) {
	U8 *newData;
	U8 *key;
	DWORD newSize, keySize, oldSize;

	if (size == 0)											return 0;
	if (FindCodedChunk(filePtr, type) != size)				return 0;
	if ((newSize = FindChunk(filePtr, type)) == 0)			return 0;
	newSize -= sizeof(U32);
	keySize = newSize - size;

	if ((newData = (U8*) malloc(size)) == NULL)		return 0;
	if ((key = (U8*) malloc(keySize)) == NULL)		return 0;
	if (fread(&oldSize, 1, sizeof(U32), filePtr) == NULL)	return 0;
	if (fread(newData, 1, size, filePtr) != size)			return 0;
	if (fread(key, 1, keySize, filePtr) != keySize)			return 0;
	Decrypt(newData, size, key);
	memcpy((U8*) data, newData, size);
	free(newData);
	free(key);
	return size;
}


void RIFF::Encrypt(U8* newData, DWORD size, U8* key) {
	DWORD pos;
	DWORD seed, seedOdd, seedEven;
	int bit;
	DWORD scrambleBlock;

	/* Create seed */
	seed = (DWORD) time(NULL);
	srand(seed);

	/* Encrypt seed */
	seed ^= size;
	seedOdd = seed & 0xAAAAAAAA;
	seedEven = seed & 0x55555555;
	seed = 0;
	for (bit = 0; bit < 32; bit += 2) {
		seed += ((seedEven & (1 << bit)) >> bit);
		seed = seed << 1;
	}
	for (bit = 1; bit < 32; bit += 2) {
		seed += ((seedOdd & (1 << bit)) >> bit);
		if (bit != 31)	seed = seed << 1;
	}

	/* Build key */
	key[0] = (char) ((seed & 0xFF000000) >> 24);
	key[3] = (char) ((seed & 0x00FF0000) >> 16);
	key[2] = (char) ((seed & 0x0000FF00) >> 8);
	key[1] = (char) ((seed & 0x000000FF));
	key[4] = 0x01;	// Key ID

	for (pos = 0; pos < size; pos++) {
		if ((pos % 32) == 0) {
			scrambleBlock = rand() & 0x00FF;
			scrambleBlock += ((scrambleBlock << 24) + (scrambleBlock << 16) + (scrambleBlock << 8));
		}
		newData[pos] ^= rand();
		newData[pos] ^= scrambleBlock;
	}
	return;
}

void RIFF::Decrypt(U8* newData, DWORD size, U8* key) {
	DWORD pos;
	DWORD seed, seedOdd, seedEven;
	DWORD sourceOdd, sourceEven;
	int bit;
	DWORD scrambleBlock;

	seed = (key[0] << 24) + (key[3] << 16) + (key[2] << 8) + (key[1]);

	seedOdd = 0;
	seedEven = 0;
	sourceOdd = (seed & 0x0000FFFF);
	sourceEven = (seed & 0xFFFF0000) >> 16;
	for (bit = 0; bit < 16; bit++) {
		seedOdd += (((sourceOdd & (1 << bit)) >> bit) << (((15 - bit) << 1)+1));
		seedEven += (((sourceEven & (1 << bit)) >> bit) << ((15 - bit) << 1));
	}
	seed = seedOdd | seedEven;
	seed ^= size;

	srand(seed);
	for (pos = 0; pos < size; pos++) {
		if ((pos % 32) == 0) {
			scrambleBlock = rand() & 0x00FF;
			scrambleBlock += ((scrambleBlock << 24) + (scrambleBlock << 16) + (scrambleBlock << 8));
		}
		newData[pos] ^= rand();
		newData[pos] ^= scrambleBlock;
	}
	return;
}

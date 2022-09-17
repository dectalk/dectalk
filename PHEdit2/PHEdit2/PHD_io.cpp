/* PHFileIO - File routine class - By Kevin Bruckert
 *
 *  Copyright (c) 1997 by Digital Equipment Corporation
 *  All Rights Reserved.
 *
 */

#include "stdafx.h"
#include "PHEdit2.h"
#include "ph_struc.h"

#include "PHfileio.h"
#include "riff.h"

BOOL PHFileIO::LoadPHD(CArchive &ar, phone_type_struct *base) {
	RIFF riff;
	RIFFheader header;
	RevisionStruct *revs;
	LPVOID temp;
	U32 size;
	BOOL coded = FALSE;
	S32 phone;
	U32 loc, formant;

	base->lpReserved = NULL;
	base->dwReserved = 0;

	if (riff.ReadRIFF(ar, &header) == FALSE)	return FALSE;
	if (memcmp(header.type, "PHD ", 4) != 0)	return FALSE;
	if (riff.FindChunk(ar, "KEY ") != 0)		coded = TRUE;

	if (coded) {
		size = riff.FindCodedChunk(ar, "HEAD");
		if (size != sizeof(phone_type_struct))		return FALSE;
		if (riff.ReadCodedChunk(ar, "HEAD", base, sizeof(phone_type_struct)) == 0)	return FALSE;
		size = riff.FindCodedChunk(ar, "DATA");
		if (size != sizeof(phonemic_struct) * base->phoneme_count)	return FALSE;
		base->phonemes = (phonemic_struct*) malloc(size);
		if (base->phonemes == NULL)	return FALSE;
		memset((char*) base->phonemes, 0, size);

		if (riff.ReadCodedChunk(ar, "DATA", base->phonemes, size) == 0) {
			free(base->phonemes);
			return FALSE;
		}
		size = riff.FindCodedChunk(ar, "USBD");
		if (size == 0) {
			base->lpReserved = NULL;
			return TRUE;
		}
		if ((temp = malloc(size)) == NULL) {
			free(base->phonemes);
			return FALSE;
		}
		memset((char*) temp, 0, size);
		if (riff.ReadCodedChunk(ar, "USBD", temp, size) == 0) {
			free(temp);
			free(base->phonemes);
			return FALSE;
		}
	} else {
		size = riff.FindChunk(ar, "HEAD");
		if (size != sizeof(phone_type_struct))		return FALSE;
		if (riff.ReadChunk(ar, "HEAD", base, sizeof(phone_type_struct)) == 0)	return FALSE;
		size = riff.FindChunk(ar, "DATA");
		if (size != sizeof(phonemic_struct) * base->phoneme_count)	return FALSE;
		base->phonemes = (phonemic_struct*) malloc(size);
		if (base->phonemes == NULL)	return FALSE;
		memset((char*) base->phonemes, 0, size);

		/* Clear the locus's so that we can tell if they exist */
		for (phone = 0; phone < base->phoneme_count; phone++) {
			for (loc = 0; loc < FORMANT_TYPES; loc++) {
				for (formant = 0; formant < MAX_FORMANTS; formant++) {
					base->phonemes[phone].loc[loc].locus[formant] = -1;
					base->phonemes[phone].loc[loc].percent[formant] = -1;
					base->phonemes[phone].loc[loc].transdur[formant] = -1;
				}
			}
		}

		if (riff.ReadChunk(ar, "DATA", base->phonemes, size) == 0) {
			free(base->phonemes);
			return FALSE;
		}
		size = riff.FindChunk(ar, "USBD");
		if (size == 0) {
			base->lpReserved = NULL;
			return TRUE;
		}
		if ((temp = malloc(size)) == NULL) {
			free(base->phonemes);
			return FALSE;
		}
		memset((char*) temp, 0, size);
		if (riff.ReadChunk(ar, "USBD", temp, size) == 0) {
			free(temp);
			free(base->phonemes);
			return FALSE;
		}
	}
	if ((size % sizeof(RevisionStruct)) != 0) {
		free(temp);
		free(base->phonemes);
		return FALSE;
	}
	revs = (RevisionStruct*) malloc(size);
	if (revs == NULL) {
		free(temp);
		free(base->phonemes);
		return FALSE;
	}
	base->lpReserved = (U8*) revs;
	base->dwReserved = size;
	memcpy(revs, (char*) temp, size);
	free(temp);
	return TRUE;
}

BOOL PHFileIO::SavePHD(CArchive &ar, phone_type_struct base) {
	RIFF riff;
	RevisionStruct *revs, *temp;
	U32 size = 128;
	U8 key[5];

	sprintf((char*) key,"LKSB");
	revs = (RevisionStruct*) malloc(base.dwReserved + 640);
	if (base.lpReserved != NULL)	memcpy(revs, (char*) base.lpReserved, base.dwReserved);
	temp = (RevisionStruct*) ((U8*) revs + (U32) base.dwReserved);
	if (GetUserName((char*) temp->name, &size) == 0)	sprintf((char*) temp->name,"ERROR %d",GetLastError());
	sprintf((char*) temp->reason,"Old version of PH-Edit2 (No history save)");

	if (base.phoneme_count == 0)																			return FALSE;
	if (base.phonemes == NULL)																				return FALSE;
	if (riff.WriteRIFF(ar, "PHD ") == FALSE)																return FALSE;
	if (riff.WriteChunk(ar, "KEY ", key, 4) == 0)															return FALSE;
	if (riff.WriteCodedChunk(ar, "HEAD", &base, sizeof(phone_type_struct)) == 0)							return FALSE;
	if (riff.WriteCodedChunk(ar, "DATA", base.phonemes, sizeof(phonemic_struct) * base.phoneme_count) == 0)	return FALSE;
	if (riff.WriteCodedChunk(ar, "USBD", revs, base.dwReserved) == 0)										return FALSE;
	if (riff.FinalizeRIFF(ar, "PHD ") == FALSE)																return FALSE;

	free(revs);
	return TRUE;
}

BOOL PHFileIO::SavePHD(CArchive &ar, phone_type_struct *base) {
	RIFF riff;
	RevisionStruct *revs, *temp;
	U32 size = 128;
	U8 key[5];

	sprintf((char*) key,"LKSB");
	revs = (RevisionStruct*) malloc(base->dwReserved + 640);
	if (base->lpReserved != NULL)	memcpy(revs, (char*) base->lpReserved, base->dwReserved);
	temp = (RevisionStruct*) ((U8*) revs + (U32) base->dwReserved);
	if (GetUserName((char*) temp->name, &size) == 0)	sprintf((char*) temp->name,"ERROR %d",GetLastError());
	sprintf((char*) temp->reason,"Old version of PH-Edit2 (No history save)");

	temp = (RevisionStruct*) base->lpReserved;
	base->lpReserved = (U8*) revs;
	free(temp);
	base->dwReserved += 640;

	if (base->phoneme_count == 0)																				return FALSE;
	if (base->phonemes == NULL)																					return FALSE;
	if (riff.WriteRIFF(ar, "PHD ") == FALSE)																	return FALSE;
	if (riff.WriteChunk(ar, "KEY ", key, 4) == 0)																return FALSE;
	if (riff.WriteCodedChunk(ar, "HEAD", base, sizeof(phone_type_struct)) == 0)									return FALSE;
	if (riff.WriteCodedChunk(ar, "DATA", base->phonemes, sizeof(phonemic_struct) * base->phoneme_count) == 0)	return FALSE;
	if (riff.WriteCodedChunk(ar, "USBD", revs, base->dwReserved) == 0)											return FALSE;
	if (riff.FinalizeRIFF(ar, "PHD ") == FALSE)																	return FALSE;
	return TRUE;
}

BOOL PHFileIO::SavePHD(CArchive &ar, phone_type_struct *base, U8 *reason) {
	RIFF riff;
	RevisionStruct *revs, *temp;
	U32 size = 128;
	U8 key[5];

	sprintf((char*) key,"LKSB");
	revs = (RevisionStruct*) malloc(base->dwReserved + 640);
	if (base->lpReserved != NULL)	memcpy(revs, (char*) base->lpReserved, base->dwReserved);
	temp = (RevisionStruct*) ((U8*) revs + (U32) base->dwReserved);
	if (GetUserName((char*) temp->name, &size) == 0)	sprintf((char*) temp->name,"ERROR %d",GetLastError());
	strcpy((char*) temp->reason, (char*) reason);

	temp = (RevisionStruct*) base->lpReserved;
	base->lpReserved = (U8*) revs;
	free(temp);
	base->dwReserved += 640;

	if (base->phoneme_count == 0)																				return FALSE;
	if (base->phonemes == NULL)																					return FALSE;
	if (riff.WriteRIFF(ar, "PHD ") == FALSE)																	return FALSE;
	if (riff.WriteChunk(ar, "KEY ", key, 4) == 0)																return FALSE;
	if (riff.WriteCodedChunk(ar, "HEAD", base, sizeof(phone_type_struct)) == 0)									return FALSE;
	if (riff.WriteCodedChunk(ar, "DATA", base->phonemes, sizeof(phonemic_struct) * base->phoneme_count) == 0)	return FALSE;
	if (riff.WriteCodedChunk(ar, "USBD", revs, base->dwReserved) == 0)											return FALSE;
	if (riff.FinalizeRIFF(ar, "PHD ") == FALSE)																	return FALSE;
	return TRUE;
}

/* Port.C - Port a quick, temporary PH file for Ed Bruckert */

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <memory.h>
#include <string.h>

#include "..\phedit2\ph_struc.h"
#include "phnames.h"

#ifdef ENGLISH_US
#define LOCS	3
#define AMPS	4
#endif
#ifdef ENGLISH_UK
#define LOCS	3
#define AMPS	4
#endif
#ifdef GERMAN
#define LOCS	4
#define AMPS	5
#endif
#ifdef SPANISH_LA
#define LOCS	3
#define AMPS	4
#endif
#ifdef SPANISH_SP
#define LOCS	3
#define AMPS	4
#endif

typedef long BOOL;
#define TRUE	1
#define FALSE	0

#ifdef ENGLISH_US
#define PHONES	59
#endif
#ifdef ENGLISH_UK
#define PHONES	57
#endif
#ifdef GERMAN
#define PHONES	56
#endif
#ifdef SPANISH
#ifdef LATIN_AMERICAN
#define PHONES 39
#else
#define PHONES 39
#endif
#endif

extern short featb[];
extern short place[];
extern short plocu[];
extern short ptram[];
extern short inhdr[];
extern short burdr[];
extern short mindur[];
extern short f0segtars[];
extern short begtyp[];
extern short endtyp[];
extern short f0glstp[];
extern short f0_phrase_position[];
extern short f0_stress_level[];

extern short maleloc[];
extern short maltar[];
extern short maldip[];
extern short malamp[];

extern short femloc[];
extern short femtar[];
extern short femdip[];
extern short femamp[];

phone_type_struct base;

BOOL port(BOOL bIsMale);
BOOL save(BOOL bIsMale);

void main(void) {
	if (port(TRUE) == FALSE) {
		printf("Error porting male code.\n");
		return;
	}
	if (save(TRUE) == FALSE) {
		printf("Error saving male code.\n");
		return;
	}
	free(base.phonemes);
	if (port(FALSE) == FALSE) {
		printf("Error porting female code.\n");
		return;
	}
	if (save(FALSE) == FALSE) {
		printf("Error saving female code.\n");
		return;
	}
	printf("Completed successfully.\n");
	return;
}

BOOL port(BOOL bIsMale) {
	int f0;
	int pho, formant, loc, locptr;
	int tar, dipptr;
	int amp, ampptr;
	phonemic_struct *phstruc;

	base.type_id = 0;
	base.phoneme_count = PHONES;
	for (f0 = 0; f0 < 6; f0++)	base.f0glstp[f0] = f0glstp[f0];
	for (f0 = 0; f0 < 5; f0++)	base.f0_phrase_position[f0] = f0_phrase_position[f0];
	for (f0 = 0; f0 < 4; f0++)	base.f0_stress_level[f0] = f0_stress_level[f0];
	base.phonemes = calloc(sizeof(phonemic_struct), PHONES);

	for (pho = 0; pho < PHONES; pho++) {
		phstruc = &base.phonemes[pho];
		phstruc->name[0] = toupper(names[pho*2]);
		phstruc->name[1] = toupper(names[(pho*2)+1]);
		phstruc->name[2] = '\0';
		phstruc->inhdr = inhdr[pho];
		phstruc->mindur = mindur[pho];
		phstruc->burdur = burdr[pho];
		phstruc->f0segtars = f0segtars[pho];
		phstruc->begtype = begtyp[pho] - 1;
		phstruc->endtype = endtyp[pho] - 1;
		phstruc->featb = featb[pho];
		phstruc->place = place[pho];

		/* Diphthongs */
		for (formant = 0; formant < 3; formant++) {		// F1 - F3
			if (bIsMale)	tar = maltar[(formant * PHONES) + pho];
			else			tar = femtar[(formant * PHONES) + pho];
			if (tar < -1) {
				dipptr = abs(tar);
				tar = 0;
				do {
					if (bIsMale) {
						phstruc->diphthongs[formant].diph[tar] = maldip[dipptr++];
						phstruc->diphthongs[formant].diph_tm[tar] = maldip[dipptr++];
					} else {
						phstruc->diphthongs[formant].diph[tar] = femdip[dipptr++];
						phstruc->diphthongs[formant].diph_tm[tar] = femdip[dipptr++];
					}
				} while (phstruc->diphthongs[formant].diph_tm[tar++] >= 0 && tar < 10);
			} else {
				phstruc->diphthongs[formant].diph[0] = tar;
				phstruc->diphthongs[formant].diph_tm[0] = -1;
			}
		}
		for (formant = 3; formant < 6; formant++) {		// B1 - B3
			if (bIsMale)	tar = maltar[(formant * PHONES) + pho];
			else			tar = femtar[(formant * PHONES) + pho];
			if (tar < -1) {
				dipptr = abs(tar);
				tar = 0;
				do {
					if (bIsMale) {
						phstruc->diphthongs[formant+1].diph[tar] = maldip[dipptr++];
						phstruc->diphthongs[formant+1].diph_tm[tar] = maldip[dipptr++];
					} else {
						phstruc->diphthongs[formant+1].diph[tar] = femdip[dipptr++];
						phstruc->diphthongs[formant+1].diph_tm[tar] = femdip[dipptr++];
					}
				} while (phstruc->diphthongs[formant+1].diph_tm[tar++] >= 0 && tar < 10);
			} else {
				phstruc->diphthongs[formant+1].diph[0] = tar;
				phstruc->diphthongs[formant+1].diph_tm[0] = -1;
			}
		}
		formant = 6;
		if (bIsMale)	tar = maltar[(formant * PHONES) + pho];			// AV
		else			tar = femtar[(formant * PHONES) + pho];			// AV
		if (tar < -1) {
			dipptr = abs(tar);
			tar = 0;
			do {
				if (bIsMale) {
					phstruc->diphthongs[formant+2].diph[tar] = maldip[dipptr++];
					phstruc->diphthongs[formant+2].diph_tm[tar] = maldip[dipptr++];
				} else {
					phstruc->diphthongs[formant+2].diph[tar] = femdip[dipptr++];
					phstruc->diphthongs[formant+2].diph_tm[tar] = femdip[dipptr++];
				}
			} while (phstruc->diphthongs[formant+2].diph_tm[tar++] >= 0 && tar < 10);
		} else {
			phstruc->diphthongs[formant+2].diph[0] = tar;
			phstruc->diphthongs[formant+2].diph_tm[0] = -1;
		}

		/* Locus Theory */
		for (loc = 0; loc < LOCS; loc++) {					// Front, Back, Round
			if (plocu[(loc * PHONES) + pho] == 0) {		// No locus
				for (formant = 0; formant < MAX_FORMANTS; formant++) {
					phstruc->loc[loc].locus[formant] = -1;
					phstruc->loc[loc].percent[formant] = -1;
					phstruc->loc[loc].transdur[formant] = -1;
				}
			} else {
				locptr = plocu[(loc * PHONES) + pho];
				for (formant = 0; formant < 3; formant++) {		// F1 - F3
					if (bIsMale) {
						phstruc->loc[formant].locus[loc] = maleloc[locptr++];
						phstruc->loc[formant].percent[loc] = maleloc[locptr++];
						phstruc->loc[formant].transdur[loc] = maleloc[locptr++];
					} else {
						phstruc->loc[formant].locus[loc] = femloc[locptr++];
						phstruc->loc[formant].percent[loc] = femloc[locptr++];
						phstruc->loc[formant].transdur[loc] = femloc[locptr++];
					}
				}
				for (;formant < FORMANT_TYPES; formant++) {	// Clear rest
					phstruc->loc[formant].locus[loc] = -1;
					phstruc->loc[formant].percent[loc] = -1;
					phstruc->loc[formant].transdur[loc] = -1;
				}
			}
		}
		for (; loc < MAX_FORMANTS; loc++) {
			for (;formant < FORMANT_TYPES; formant++) {	// Clear rest
				phstruc->loc[formant].locus[loc] = -1;
				phstruc->loc[formant].percent[loc] = -1;
				phstruc->loc[formant].transdur[loc] = -1;
			}
		}

		/* Amps */
		ampptr = ptram[pho];
		for (amp = 0; amp < AMPS; amp++) {
			if (ampptr == 0) {
				phstruc->amp[amp].a_A2 = -1;
				phstruc->amp[amp].a_A3 = -1;
				phstruc->amp[amp].a_A4 = -1;
				phstruc->amp[amp].a_A5 = -1;
				phstruc->amp[amp].a_A6 = -1;
				phstruc->amp[amp].a_AB = -1;
			} else {
				if (bIsMale) {
					phstruc->amp[amp].a_A2 = malamp[ampptr++];
					phstruc->amp[amp].a_A3 = malamp[ampptr++];
					phstruc->amp[amp].a_A4 = malamp[ampptr++];
					phstruc->amp[amp].a_A5 = malamp[ampptr++];
					phstruc->amp[amp].a_A6 = malamp[ampptr++];
					phstruc->amp[amp].a_AB = malamp[ampptr++];
				} else {
					phstruc->amp[amp].a_A2 = femamp[ampptr++];
					phstruc->amp[amp].a_A3 = femamp[ampptr++];
					phstruc->amp[amp].a_A4 = femamp[ampptr++];
					phstruc->amp[amp].a_A5 = femamp[ampptr++];
					phstruc->amp[amp].a_A6 = femamp[ampptr++];
					phstruc->amp[amp].a_AB = femamp[ampptr++];
				}
			}
		}
		for (;amp < AMPTYPES; amp++) {		// Clear rest
			phstruc->amp[amp].a_A2 = -1;
			phstruc->amp[amp].a_A3 = -1;
			phstruc->amp[amp].a_A4 = -1;
			phstruc->amp[amp].a_A5 = -1;
			phstruc->amp[amp].a_A6 = -1;
			phstruc->amp[amp].a_AB = -1;
		}
	}
	return TRUE;
}

typedef struct RIFFheader_STRUCT {
	U8 tag[4];
	U32 dwRiffChunkSize;
	U8 type[4];
} RIFFheader;

typedef struct CHUNKheader_STRUCT {
	U8 type[4];
	U32 dwChunkSize;
} CHUNKheader;

typedef struct {
	U8	name[128];
	U8	reason[512];
} RevisionStruct;

BOOL save(BOOL bIsMale) {
	FILE *out;
	RIFFheader header;
	CHUNKheader chunk;
	RevisionStruct rev;
	U32 filelen;

	if (bIsMale)		out = fopen("male.phd", "wb");
	else				out = fopen("female.phd", "wb");
	if (out == NULL)	return FALSE;

	filelen = sizeof(RIFFheader) + sizeof(CHUNKheader) + sizeof(CHUNKheader);
	filelen += sizeof(phone_type_struct);
	filelen += (sizeof(phonemic_struct) * PHONES);

	memcpy(header.tag,"RIFF",4);
	header.dwRiffChunkSize = filelen - 8;
	memcpy(header.type,"PHD ",4);
	fwrite(&header, 1, sizeof(RIFFheader), out);

	memcpy(chunk.type, "HEAD", 4);
	chunk.dwChunkSize = sizeof(phone_type_struct);
	fwrite(&chunk, 1, sizeof(CHUNKheader), out);
	fwrite(&base, 1, sizeof(phone_type_struct), out);
	
	memcpy(chunk.type, "DATA", 4);
	chunk.dwChunkSize = sizeof(phonemic_struct) * PHONES;
	fwrite(&chunk, 1, sizeof(CHUNKheader), out);
	fwrite(base.phonemes, PHONES, sizeof(phonemic_struct), out);

	memcpy(chunk.type, "USBD", 4);
	chunk.dwChunkSize = sizeof(RevisionStruct) * 1;
	fwrite(&chunk, 1, sizeof(CHUNKheader), out);
	strcpy(rev.name,"kevinb");
	strcpy(rev.reason,"Initial Creation");
	fwrite(&rev, 1, sizeof(RevisionStruct), out);

	fclose(out);
	return TRUE;
}

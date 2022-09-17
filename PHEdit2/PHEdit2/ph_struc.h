/* PHEdit² - Version 2.0  Kevin Bruckert
 *
 * Copyright (c) 1997 by Digital Equipment Corporation
 * All rights reserved.
 *
 */

#ifndef _PH_STRUC_HEADER
#define _PH_STRUC_HEADER

#ifndef _PH_TYPES_HEADER
#include "ph_types.h"
#endif

#define MAX_DIPHTHONGS			10
#define MAX_FORMANT_PARAMS		9	/* F1 F2 F3 F4 B1 B2 B3 B4 AV */
#define MAX_FORMANTS			4
#define FORMANT_TYPES			6	/* Front, Back, Round */
#define AMPTYPES				6	/* Front, Back, ... */
#define ARTIC_TYPES				8	/* Articulation Types */

#define MAX_PHONES				100	/* Phonemes 0 thru 99 */

typedef struct {
	S16	diph[MAX_DIPHTHONGS];
	S16 diph_tm[MAX_DIPHTHONGS];
} diphthong_struct;

typedef struct {
	S16 locus[MAX_FORMANTS];
	S16 percent[MAX_FORMANTS];
	S16 transdur[MAX_FORMANTS];
} formant_trans_struct;

typedef struct {
	S16 a_A2;
	S16 a_A3;
	S16 a_A4;
	S16 a_A5;
	S16 a_A6;
	S16 a_AB;
} amp_struct;

typedef struct {
	U8 name[20];
	S16 inhdr;
	S16 mindur;
	S16 burdur;
	S16 f0segtars;
	S16 begtype;
	S16 endtype;
	U32 featb;
	U16 place;
	diphthong_struct diphthongs[MAX_FORMANT_PARAMS];
	formant_trans_struct loc[FORMANT_TYPES];
	amp_struct amp[AMPTYPES];
} phonemic_struct;

typedef struct {
	S16 type_id;
	S16 phoneme_count;
	S16 f0glstp[6];
	S16 f0_phrase_position[8];
	S16 f0_stress_level[8];
	phonemic_struct *phonemes;
	U8* lpReserved;
	U32 dwReserved;
} phone_type_struct;

#endif

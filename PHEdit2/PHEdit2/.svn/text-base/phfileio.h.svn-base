/*
 * PHFileIO - File routine class - By Kevin Bruckert
 *
 *  Copyright (c) 1997 by Digital Equipment Corporation
 *  All Rights Reserved.
 *
 * Modification History
 * ------------ -------
 * 001 nal	4.09.00	Added char* to SaveROM to pass language tag in
 * 002 mgs	1.05.04 Added char* to SaveROM to pass in suffix info for multiple voice data files
 *
 * ___ ____________ _______
 * End modification history
 */

#ifndef _PHFILEIO_HEADER
#define _PHFILEIO_HEADER

class PHFileIO {
	public:
		BOOL LoadROM(CArchive &ar, phone_type_struct *base);
		BOOL SaveROM(CArchive &ar, phone_type_struct base, char*, char*);
		BOOL SaveROM(CArchive &ar, phone_type_struct base1, phone_type_struct base2, char*, char*);
		BOOL LoadPHD(CArchive &ar, phone_type_struct *base);
		BOOL SavePHD(CArchive &ar, phone_type_struct base);
		BOOL SavePHD(CArchive &ar, phone_type_struct *base);
		BOOL SavePHD(CArchive &ar, phone_type_struct *base, U8 *reason);

	private:
		typedef struct {
			U8	name[128];
			U8	reason[512];
		} RevisionStruct;

		int AMPS;		// Amps
		int LOCAMP;		// Locus Amps

		BOOL CFCopyright(CFile *fp);
		void CFprintf(CFile *fp, char *fmt, ...);
		BOOL BuildROMData(phone_type_struct *base);
		BOOL FemaleBuildROMData(phone_type_struct *base, phone_type_struct *male);
		U16 NumberOfDips(diphthong_struct *dip);

		S32		featb[200], place[200];
		S16		begtyp[100], endtyp[100];
		S16		inhdr[100], mindur[100];
		S16		burdr[100], ptram[900];
		S16		plocu[900];
		S16		f0msegtars[100],f0fsegtars[100];
		S16		maltar[800], maldip[12000];
		S16		maleloc[12000];
		S16		malamp[12000];
		S16		femtar[800], femdip[12000];
		S16		femloc[12000];
		S16		femamp[12000];
		S16		dipcnt, femdipcnt, loccnt, ampcnt;

		S16		f0glstp[20]; 
		S16		f0_mphrase_position[20], f0_fphrase_position[20];
		S16		f0_mstress_level[20],	f0_fstress_level[20];

		S32		TOT_ALLOPHONES;
};

#endif _PHFILEIO_HEADER

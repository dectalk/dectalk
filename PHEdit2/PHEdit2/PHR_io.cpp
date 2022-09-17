/* PHFileIO - File routine class - By Kevin Bruckert
 *
 *	Copyright (c) 2002 Fonix Corporation. All rights reserved.
 *  Copyright (c) 1997 by Digital Equipment Corporation
 *  All Rights Reserved.
 *
 *	001 MGS				fixed space in output 2/24/1998 
 *	002	MGS 02/25/1998	fixed locus problem 
 *	003	MGS	12/29/1999	Made Male superior to female for durations and types
 *	004 NAL 04/09/2000	Renamed rom table defs fto be lang specific. Points old names
 *						to the current languages defs.
 *  005 NAL	06/16/2000	Removed the pointing from old name to current lang defs (comment 004)
 *						since they are not being used.
 *	006	MGS	08/02/2000	removed FSTMARK from featb array
 *	007	MGS	02/13/2001	Changed copyright info
 *	008	CAB	02/23/2001	Updated copyright info
 *	009	MGS	03/02/2001	removed FSTMARK again from featb array
 *	010	CAB	04/25/2002	Fixed added const as per ph_setar.c & ph_timng.c
*/

#include <stdlib.h>
#include <stdarg.h>

#include "stdafx.h"

#include "ph_struc.h"
#include "PHfileio.h"

#define HAVE_B1_B3


BOOL PHFileIO::LoadROM(CArchive &ar, phone_type_struct *base) {
	MessageBox(NULL, "This function is not available in the demo!", "Error", MB_ICONSTOP | MB_OK);
	return FALSE;
}

void PHFileIO::CFprintf(CFile *fp, char *fmt, ...) {
	char buffer[2048];
	va_list list;

	va_start(list, fmt);
	vsprintf(buffer, fmt, list);
	va_end(list);
	fp->Write(buffer, strlen(buffer));
	return;
}

BOOL PHFileIO::CFCopyright(CFile *fp) {
	CFprintf(fp, " * \r\n");
	CFprintf(fp, " *                           Copyright (c)\r\n");
	CFprintf(fp, " *    Copyright © 2002 Fonix Corporation. All rights reserved.\r\n");
	CFprintf(fp, " *    Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.\r\n");
	CFprintf(fp, " *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.\r\n");
	CFprintf(fp, " * \r\n");
	CFprintf(fp, " *    Restricted Rights: Use, duplication, or disclosure by the U.S.\r\n");
	CFprintf(fp, " *    Government is subject to restrictions as set forth in subparagraph\r\n");
	CFprintf(fp, " *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR\r\n");
	CFprintf(fp, " *    52.227-14 Alt. III, as applicable.\r\n");
	CFprintf(fp, " * \r\n");
	CFprintf(fp, " * \r\n");
	CFprintf(fp, " *    This software is proprietary to and embodies the confidential\r\n");
	CFprintf(fp, " *    technology of Fonix Corporation and other parties.\r\n");
	CFprintf(fp, " *    Possession, use, or copying of this software and media is authorized\r\n");
	CFprintf(fp, " *    only pursuant to a valid written license from Fonix or an\r\n");
	CFprintf(fp, " *    authorized sublicensor.\r\n");
	return TRUE;
}

BOOL PHFileIO::SaveROM(CArchive &ar, phone_type_struct base, char *pLang,char *pSuffix) {
	BOOL carry;
	RevisionStruct *revs;
	U32 rev, revcnt;
	U32 CommentChecksum;
	U32 seed;
	U32 nameSum;
	U32 cnt;

	BuildROMData(&base);

	CFile *fp = ar.GetFile();
	int phone;

	/* Write out copyright data */
	CFprintf(fp, "/* PH Rom file\r\n * \r\n");
	CFprintf(fp, " * Copyright Information:\r\n");
	CFCopyright(fp);
	CFprintf(fp, " * \r\n * Based on Dennis Klatt's PHRom File Format  Copyright (c) 1988 by Dennis Klatt\r\n");
	CFprintf(fp, " *\r\n");
	CFprintf(fp, " * Compile Type: Direct\r\n");
	CFprintf(fp, " * Program: PHEdit(2)\r\n");
	CFprintf(fp, " * Author: Kevin Bruckert\r\n");
	CFprintf(fp, " *\r\n");
#ifdef PRINT_COMMENTS
	CFprintf(fp, " * {{START_COMMENT_BLOCK}}\r\n");
	revs = (RevisionStruct*) base.lpReserved;

	/* Seed random number */
	seed = (U32) time(NULL);
	srand(seed);
	
	CommentChecksum = 0xA55AA55A;
	if (revs == NULL) {
		CFprintf(fp, " * NULL BLOCK\r\n");
	} else {
		revcnt = base.dwReserved / sizeof(RevisionStruct);
		for (rev = 0; rev < revcnt; rev++) {
			CFprintf(fp, " * %s - %s\r\n",revs[rev].name, revs[rev].reason);
			nameSum = 0;
			for (cnt = 0; cnt < strlen((char*)revs[rev].name); cnt++) {
				nameSum += (cnt * (U32) revs[rev].name[cnt]) + ((U32) revs[rev].name[cnt] << 16);
			}

			carry = ((CommentChecksum & 0x80000000) ? TRUE : FALSE);
			CommentChecksum = ((CommentChecksum << 1) + carry) ^ nameSum;
		}
	}

	CommentChecksum = (CommentChecksum << 1) ^ rand();
	revcnt ^= rand();
	CFprintf(fp, " * {{END_COMMENT_BLOCK}}\r\n");
	CFprintf(fp, " * {{COMMENT_BLOCK %04X %04X %04X %04X %04X}}\r\n *\r\n", (seed >> 16), (seed & 0x0000FFFF), (CommentChecksum >> 16), (CommentChecksum & 0x0000FFFF), revcnt);

	CFprintf(fp, " * {{%04X %04X %04X %04X %04X %04X %04X %04X}}\r\n",(base.type_id << 8), (base.phoneme_count << 8) ,rand(),rand(),rand(),rand(),rand(),rand());
#endif
	CFprintf(fp, " */\r\n");

	/* inhdr */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short inhdr[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_inhdr%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", inhdr[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n", inhdr[phone]);

	/* mindur */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short mindur[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_mindur%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", mindur[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",mindur[phone]);

	/* burdur */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short burdr[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_burdr%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", burdr[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",burdr[phone]);
#ifdef PRINT_OLD_JUNK
	/* f0segtars */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0msegtars[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0msegtars%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", f0msegtars[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",f0msegtars[phone]);

	/* f0segtars */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0fsegtars[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0fsegtars%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", f0fsegtars[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",f0fsegtars[phone]);
#endif

	/* begtyp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short begtyp[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_begtyp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", begtyp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",begtyp[phone]);

	/* endtyp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short endtyp[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_endtyp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", endtyp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",endtyp[phone]);

	/* place */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short place[500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_place%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", place[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",place[phone]);

	/* featb */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "int featb[200] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const int %s_featb%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES; phone++) {
		CFprintf(fp, " %d, ", featb[phone]);
		CFprintf(fp, "\r\n");
	}
	for (; phone < 100; phone++) {
		CFprintf(fp, " 0, ");
		CFprintf(fp, "\r\n");
	}
	/* MGS fixed space in output 2/24/1998 */
	CFprintf(fp, " 0 };\r\n\r\n");

	/* maltar */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short maltar[700] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_maltar%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < (TOT_ALLOPHONES * 7) - 1; phone++) {
		CFprintf(fp, " %d, ", maltar[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maltar[phone]);

	/* femtar */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femtar[700] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femtar%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < (TOT_ALLOPHONES * 7) - 1; phone++) {
		CFprintf(fp, " %d, ", maltar[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maltar[phone]);

	/* maldip */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short maldip[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_maldip%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < dipcnt - 1; phone++) {
		CFprintf(fp, " %d, ", maldip[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maldip[phone]);

	/* femdip */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femdip[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femdip%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < dipcnt - 1; phone++) {
		CFprintf(fp, " %d, ", maldip[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maldip[phone]);

	/* ptram */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short ptram[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_ptram%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", ptram[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",ptram[phone]);

	#ifdef PRINT_OLD_JUNK

	/* malamp */
	CFprintf(fp, "#ifdef MALAMPISGONE\r\n#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short malamp[7000] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_malamp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < ampcnt; phone++) {
		CFprintf(fp, " %d, ", malamp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n#endif\r\n\r\n",malamp[phone]);

	/* femamp */
	CFprintf(fp, "#ifdef FEMAMPISGONE\r\n#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femamp[7000] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femamp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < ampcnt; phone++) {
		CFprintf(fp, " %d, ", malamp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n#endif\r\n\r\n",malamp[phone]);
#endif

	/* plocu */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short plocu[500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_plocu%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < (TOT_ALLOPHONES * LOCAMP) - 1; phone++) {
		CFprintf(fp, " %d, ", plocu[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",plocu[phone]);

	/* maleloc */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short maleloc[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_maleloc%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < loccnt; phone++) {
		CFprintf(fp, " %d, ", maleloc[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maleloc[phone]);

	/* femloc */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femloc[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femloc%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < loccnt; phone++) {
		CFprintf(fp, " %d, ", maleloc[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maleloc[phone]);

#ifdef PRINT_OLD_JUNK

	/* f0glstp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0glstp[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0glstp[8] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 5; phone++) {
		CFprintf(fp, " %d, ", f0glstp[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0glstp[phone]);

	/* f0_phrase_position */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_mphrase_position[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_mphrase_position%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_mphrase_position[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_mphrase_position[phone]);

	/* f0_phrase_position */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_fphrase_position[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_fphrase_position%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_fphrase_position[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_fphrase_position[phone]);

	/* f0_stress_level */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_mstress_level[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_mstress_level%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_mstress_level[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_mstress_level[phone]);

	/* f0_stress_level */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_fstress_level[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_fstress_level%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_fstress_level[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_fstress_level[phone]);
#endif

#ifdef PRINT_OLD_JUNK
	CFprintf(fp,"/* {{PHROMDUMP%04X%04X}} */\r\n",rand(),rand());
#endif
	CFprintf(fp,"\r\n");
	return TRUE;
}

BOOL PHFileIO::SaveROM(CArchive &ar, phone_type_struct base1, phone_type_struct base2, char *pLang, char *pSuffix) {
	BOOL carry;
	RevisionStruct *revs;
	U32 rev, revcnt;
	U32 CommentChecksum;
	U32 seed;
	U32 nameSum;
	U32 cnt;

	BuildROMData(&base1);
	if (FemaleBuildROMData(&base2, &base1) == FALSE) {
		printf("Fatal error during compile.\n");
		return FALSE;
	}

	CFile *fp = ar.GetFile();
	int phone;

	if (base1.phoneme_count != base2.phoneme_count) {
		printf("Two bases do not contain the same number of phonemes... Unable to compile.\n");
		return FALSE;
	}

	/* Seed random number */
	srand((unsigned)time(NULL)); 


		/* Write out copyright data */
	CFprintf(fp, "/* PH Rom file\r\n * \r\n");
	CFprintf(fp, " * Copyright Information:\r\n");
	CFCopyright(fp);
	CFprintf(fp, " * \r\n * Based on Dennis Klatt's PHRom File Format  Copyright (c) 1988 by Dennis Klatt\r\n");
	CFprintf(fp, " *\r\n");
	CFprintf(fp, " * Compile Type: Compiled from (%d/%d)\r\n",base1.type_id, base2.type_id);	// [101]
	CFprintf(fp, " * Program: PHEdit(2)\r\n");
	CFprintf(fp, " * Author: Kevin Bruckert\r\n");
	CFprintf(fp, " *\r\n");

#ifdef PRINT_OLD_JUNK
	revs = (RevisionStruct*) base1.lpReserved;

	/* Seed random number */
	seed = (U32) time(NULL);
	srand(seed); 
	
	CFprintf(fp, " * {{START_COMMENT_BLOCK}}\r\n");
	CommentChecksum = 0xA55AA55A;
	if (revs == NULL) {
		CFprintf(fp, " * NULL BLOCK\r\n");
	} else {
		revcnt = base1.dwReserved / sizeof(RevisionStruct);
		for (rev = 0; rev < revcnt; rev++) {
			CFprintf(fp, " * %s - %s\r\n",revs[rev].name, revs[rev].reason);
			nameSum = 0;
			for (cnt = 0; cnt < strlen((char*)revs[rev].name); cnt++) {
				nameSum += (cnt * (U32) revs[rev].name[cnt]) + ((U32) revs[rev].name[cnt] << 16);
			}

			carry = ((CommentChecksum & 0x80000000) ? TRUE : FALSE);
			CommentChecksum = ((CommentChecksum << 1) + carry) ^ nameSum;
		}
	}
	revs = (RevisionStruct*) base2.lpReserved;
	if (revs == NULL) {
		CFprintf(fp, " * NULL BLOCK\r\n");
	} else {
		revcnt = base2.dwReserved / sizeof(RevisionStruct);
		for (rev = 0; rev < revcnt; rev++) {
			CFprintf(fp, " * %s - %s\r\n",revs[rev].name, revs[rev].reason);
			nameSum = 0;
			for (cnt = 0; cnt < strlen((char*)revs[rev].name); cnt++) {
				nameSum += (cnt * (U32) revs[rev].name[cnt]) + ((U32) revs[rev].name[cnt] << 16);
			}

			carry = ((CommentChecksum & 0x80000000) ? TRUE : FALSE);
			CommentChecksum = ((CommentChecksum << 1) + carry) ^ nameSum;
		}
	}

	revcnt += base1.dwReserved / sizeof(RevisionStruct);

	CommentChecksum = (CommentChecksum << 1) ^ rand();
	revcnt ^= rand();
	CFprintf(fp, " * {{END_COMMENT_BLOCK}}\r\n");
	CFprintf(fp, " * {{COMMENT_BLOCK %04X %04X %04X %04X %04X}}\r\n *\r\n", (seed >> 16), (seed & 0x0000FFFF), (CommentChecksum >> 16), (CommentChecksum & 0x0000FFFF), revcnt);

	CFprintf(fp, " * {{%04X %04X %04X %04X %04X %04X %04X %04X}}\r\n",(base1.type_id << 8) + base2.type_id, (base1.phoneme_count << 8) + base2.phoneme_count,rand(),rand(),rand(),rand(),rand(),rand());
#endif
	CFprintf(fp, " */\r\n");

	/* inhdr */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short inhdr[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_inhdr%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", inhdr[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n", inhdr[phone]);

	/* mindur */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short mindur[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_mindur%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", mindur[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",mindur[phone]);

	/* burdr */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short burdr[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_burdr%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", burdr[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",burdr[phone]);
#ifdef PRINT_OLD_JUNK

	/* f0segtars */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0msegtars[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0msegtars%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", f0msegtars[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",f0msegtars[phone]);

	/* f0segtars */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0fsegtars[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0fsegtars%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", f0fsegtars[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",f0fsegtars[phone]);
#endif
	/* begtyp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short begtyp[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_begtyp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", begtyp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",begtyp[phone]);

	/* endtyp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short endtyp[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_endtyp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", endtyp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",endtyp[phone]);

	/* place */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short place[500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_place%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", place[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",place[phone]);

	/* featb */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "int featb[200] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const int %s_featb%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES; phone++) {
		CFprintf(fp, " %d, ", featb[phone]);
		CFprintf(fp, "\r\n");
	}
	for (; phone < 100; phone++) {
		CFprintf(fp, " 0, ");
		CFprintf(fp, "\r\n");
	}
	/* MGS fixed space in output 2/24/1998 */
	CFprintf(fp, "0 };\r\n\r\n");

	/* maltar */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short maltar[700] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_maltar%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < (TOT_ALLOPHONES * 7) - 1; phone++) {
		CFprintf(fp, " %d, ", maltar[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maltar[phone]);

	/* femtar */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femtar[700] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femtar%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < (TOT_ALLOPHONES * 7) - 1; phone++) {
		CFprintf(fp, " %d, ", femtar[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",femtar[phone]);

	/* maldip */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short maldip[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_maldip%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < dipcnt - 1; phone++) {
		CFprintf(fp, " %d, ", maldip[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maldip[phone]);

	/* femdip */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femdip[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femdip%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < femdipcnt - 1; phone++) {
		CFprintf(fp, " %d, ", femdip[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",femdip[phone]);

	/* ptram */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short ptram[100] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_ptram%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < TOT_ALLOPHONES - 1; phone++) {
		CFprintf(fp, " %d, ", ptram[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",ptram[phone]);
#ifdef PRINT_OLD_JUNK

	/* malamp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short malamp[7000] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_malamp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < ampcnt; phone++) {
		CFprintf(fp, " %d, ", malamp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",malamp[phone]);

	/* femamp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femamp[7000] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femamp%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < ampcnt; phone++) {
		CFprintf(fp, " %d, ", femamp[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",femamp[phone]);
#endif
	/* plocu */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short plocu[500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_plocu%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < (TOT_ALLOPHONES * LOCAMP) - 1; phone++) {
		CFprintf(fp, " %d, ", plocu[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",plocu[phone]);

	/* maleloc */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short maleloc[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_maleloc%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < loccnt; phone++) {
		CFprintf(fp, " %d, ", maleloc[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",maleloc[phone]);

	/* femloc */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short femloc[3500] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_femloc%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < loccnt; phone++) {
		CFprintf(fp, " %d, ", femloc[phone]);
		CFprintf(fp, "\r\n");
	}
	CFprintf(fp," %d };\r\n\r\n",femloc[phone]);
#ifdef PRINT_OLD_JUNK

	/* f0glstp */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0glstp[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0glstp%s[8] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 5; phone++) {
		CFprintf(fp, " %d, ", f0glstp[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0glstp[phone]);

	/* f0_phrase_position */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_mphrase_position[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_mphrase_position%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_mphrase_position[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_mphrase_position[phone]);

	/* f0_phrase_position */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_fphrase_position[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_fphrase_position%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_fphrase_position[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_fphrase_position[phone]);

	/* f0_stress_level */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_mstress_level[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_mstress_level%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_mstress_level[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_mstress_level[phone]);

	/* f0_stress_level */
	CFprintf(fp, "#ifdef PHEDIT2\r\n");
	CFprintf(fp, "short f0_fstress_level[8] = {\r\n", pLang);
	CFprintf(fp, "#else\r\n");
	CFprintf(fp, "const short %s_f0_fstress_level%s[] = {\r\n", pLang, pSuffix);
	CFprintf(fp, "#endif\r\n");
	for (phone = 0; phone < 7; phone++) {
		CFprintf(fp, " %d, ", f0_fstress_level[phone]);
	}
	CFprintf(fp," %d };\r\n\r\n",f0_fstress_level[phone]);
#endif

	CFprintf(fp,"const struct rom_data_s %s_rom_data%s = {\r\n", pLang, pSuffix);
	CFprintf(fp,"%s_inhdr%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_mindur%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_burdr%s,\r\n",pLang, pSuffix);
#ifdef PRINT_OLD_JUNK
	CFprintf(fp,"%s_f0msegtars%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_f0fsegtars%s,\r\n",pLang, pSuffix);
#endif
	CFprintf(fp,"%s_begtyp%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_endtyp%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_place%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_featb%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_maltar%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_femtar%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_maldip%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_femdip%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_ptram%s,\r\n",pLang, pSuffix);
#ifdef PRINT_OLD_JUNK
	CFprintf(fp,"%s_malamp%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_femamp%s,\r\n",pLang, pSuffix);
#endif
	CFprintf(fp,"%s_plocu%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_maleloc%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_femloc%s\r\n",pLang, pSuffix);
#ifdef PRINT_OLD_JUNK
	CFprintf(fp,",%s_f0glstp%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_f0_mphrase_position%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_f0_mstress_level%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_f0_fphrase_position%s,\r\n",pLang, pSuffix);
	CFprintf(fp,"%s_f0_fstress_level%s,\r\n",pLang, pSuffix);
#endif
	CFprintf(fp,"};\r\n\r\n");
	
#ifdef PRINT_OLD_JUNK
	
	CFprintf(fp,"/* {{PHROMDUMP%04X%04X}} */\r\n",rand(),rand());
#endif
	CFprintf(fp,"\r\n");

	return TRUE;
}


U16 PHFileIO::NumberOfDips(diphthong_struct *dip) {
	U16 cnt = 0;

	while (dip->diph_tm[cnt] >= 0 && cnt < MAX_DIPHTHONGS)	cnt++;
	if (dip->diph_tm[cnt]!=-1)
	{
		return(cnt);
	}
	return cnt + 1;
}


/* These should never get used, PHEdit2 should not have different versions
 * #ifdef ENGLISH
 * #define AMPS	4
 * #define LOCAMP	3
 * #endif
 * #ifdef GERMAN
 * #define AMPS	5
 * #define LOCAMP	4
 * #endif
 */
BOOL PHFileIO::BuildROMData(phone_type_struct *base) {
	int pho;
	int cur_dipptr;
	int formant;
	int tar, amp, hasamp;
	phonemic_struct *phstruc;

	AMPS = 5;		// Max AMPS
	LOCAMP = 4;		// Max LOCAMP

	/* inhdr, mindur, burdr, f0segtars, begtyp, endtyp, place, featb */
	for (pho = 0; pho < base->phoneme_count; pho++) {
		inhdr[pho] = base->phonemes[pho].inhdr;
		mindur[pho] = base->phonemes[pho].mindur;
		burdr[pho] = base->phonemes[pho].burdur;
		f0msegtars[pho] = base->phonemes[pho].f0segtars;
		begtyp[pho] = base->phonemes[pho].begtype + 1;
		endtyp[pho] = base->phonemes[pho].endtype + 1;
		place[pho] = (S16) base->phonemes[pho].place;
		featb[pho] = (S32) base->phonemes[pho].featb;
	}

	/* maltar */
	cur_dipptr = 2;
	tar = 0;
	for (formant = 0; formant < 3; formant++) {				// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				maltar[tar] = -(cur_dipptr);
				cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
			} else {
				maltar[tar] = phstruc->diphthongs[formant].diph[0];
			}
			tar++;
		}
	}
#ifdef HAVE_B1_B3
	for (formant = 4; formant < 7; formant++) {				// B1 - B3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				maltar[tar] = -(cur_dipptr);
				cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
			} else {
				maltar[tar] = phstruc->diphthongs[formant].diph[0];
			}
			tar++;
		}
	}

	formant = 8;	// AV
#else
	formant = 4;	// AV
#endif

	for (pho = 0; pho < base->phoneme_count; pho++) {		// AV
		phstruc = &base->phonemes[pho];
		if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
			maltar[tar] = -(cur_dipptr);
			cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
		} else {
			maltar[tar] = phstruc->diphthongs[formant].diph[0];
		}
		tar++;
	}

	/* maldip */
	cur_dipptr = 2;
	for (formant = 0; formant < 3; formant++) {				// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				tar = 0;
				do {
					maldip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					maldip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					cur_dipptr += 2;
					tar++;
				} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
				if (phstruc->diphthongs[formant].diph_tm[tar-1]!=-1)
				{
					fprintf(stderr,"\a\athe dip table is broken\n");
				}
			}
		}
	}
#ifdef HAVE_B1_B3
	for (formant = 4; formant < 7; formant++) {				// B1 - B3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				tar = 0;
				do {
					maldip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					maldip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					cur_dipptr += 2;
					tar++;
				} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
			}
		}
	}
	formant = 8;		// AV
#else
	formant = 4;		// AV
#endif
	for (pho = 0; pho < base->phoneme_count; pho++) {		// AV
		phstruc = &base->phonemes[pho];
		if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
			tar = 0;
			do {
				maldip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
				maldip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
				cur_dipptr += 2;
				tar++;
			} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
		}
	}
	dipcnt = cur_dipptr;

	/* ptram */
	cur_dipptr = 1;
	tar = 0;
	for (pho = 0; pho < base->phoneme_count; pho++) {
		phstruc = &base->phonemes[pho];
		hasamp = 0;
		for (amp = 0; amp < AMPS; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		if (hasamp) {
			ptram[tar] = cur_dipptr;
			cur_dipptr += (6 * AMPS);
		} else {
			ptram[tar] = 0;
		}
		tar++;
	}

	/* malamp */
	tar = 1;
	for (pho = 0; pho < base->phoneme_count; pho++) {
		phstruc = &base->phonemes[pho];
		hasamp = 0;
		for (amp = 0; amp < AMPS; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		if (hasamp) {
			for (amp = 0; amp < AMPS; amp++) {
				malamp[tar  ] = phstruc->amp[amp].a_A2;
				malamp[tar+1] = phstruc->amp[amp].a_A3;
				malamp[tar+2] = phstruc->amp[amp].a_A4;
				malamp[tar+3] = phstruc->amp[amp].a_A5;
				malamp[tar+4] = phstruc->amp[amp].a_A6;
				malamp[tar+5] = phstruc->amp[amp].a_AB;
				tar += 6;
			}
		}
	}
	ampcnt = tar;

	/* plocu */
	cur_dipptr = 1;
	tar = 0;
	for (amp = 0; amp < LOCAMP; amp++) {		// Front, Back, Round
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			hasamp = 0;
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			if (hasamp) {
				plocu[tar] = cur_dipptr;
				cur_dipptr += (3 * 3);		// F1-F3 * (Locus,Percent,Transdur)
			} else {
				plocu[tar] = 0;
			}
			tar++;
		}
	}

	/* maleloc */
	cur_dipptr = 1;
	tar = 0;
	for (amp = 0; amp < LOCAMP; amp++) {			// Front, Back, Round
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			hasamp = 0;
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			if (hasamp) {
				for (formant = 0; formant < 3; formant++) {
					maleloc[cur_dipptr  ] = phstruc->loc[formant].locus[amp];
					maleloc[cur_dipptr+1] = phstruc->loc[formant].percent[amp];
					maleloc[cur_dipptr+2] = phstruc->loc[formant].transdur[amp];
					cur_dipptr += 3;
				}
			}
		}
	}
	loccnt = cur_dipptr;

	/* f0glstp */
	for (pho = 0; pho < 6; pho++) {
		f0glstp[pho] = base->f0glstp[pho];
	}

	/* f0_stress_level, f0_phrase_position */
	for (pho = 0; pho < 8; pho++) {
		f0_mstress_level[pho] = base->f0_stress_level[pho];
		f0_mphrase_position[pho] = base->f0_phrase_position[pho];
	}

	TOT_ALLOPHONES = base->phoneme_count;
	return TRUE;
}

BOOL PHFileIO::FemaleBuildROMData(phone_type_struct *base, phone_type_struct *male) {
	int pho;
	int cur_dipptr;
	int formant;
	int tar, amp, hasamp;
	int mtar, cur_mdipptr;
	phonemic_struct *phstruc;
	BOOL bSuccess = TRUE;

	AMPS = 5;		// Max AMPS
	LOCAMP = 4;		// Max LOCAMP

	for (pho = 0; pho < base->phoneme_count; pho++) {
		f0fsegtars[pho] = base->phonemes[pho].f0segtars;
	}

#ifdef MAKE_THE_FEMALE_SUBORDINATE_TO_THE_MALE
	/* inhdr, mindur, burdr, f0segtars, begtyp, endtyp, place, featb */
	for (pho = 0; pho < base->phoneme_count; pho++) {
		if (inhdr[pho] != base->phonemes[pho].inhdr) {
			printf("Inherent Duration of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (mindur[pho] != base->phonemes[pho].mindur) {
			printf("Minimum Duration of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (burdr[pho] != base->phonemes[pho].burdur) {
			printf("Burst Duration of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (f0segtars[pho] != base->phonemes[pho].f0segtars) {
			printf("F0 Segmental Target of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (begtyp[pho] != base->phonemes[pho].begtype + 1) {
			printf("Beginning Type of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (endtyp[pho] != base->phonemes[pho].endtype + 1) {
			printf("End Type of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (place[pho] != (S16) base->phonemes[pho].place) {
			printf("Place of Articulation of phone %s [%d] does not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
		if (featb[pho] != (S32) base->phonemes[pho].featb) {
			printf("Feature Bits phone %s [%d] do not match\n", base->phonemes[pho].name, pho);
			bSuccess = FALSE;
		}
	}
#endif

	/* femtar */
	cur_dipptr = 2;
	tar = 0;
	for (formant = 0; formant < 3; formant++) {				// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				femtar[tar] = -(cur_dipptr);
				cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
			} else {
				femtar[tar] = phstruc->diphthongs[formant].diph[0];
			}
			tar++;
		}
	}
#ifdef HAVE_B1_B3
	for (formant = 4; formant < 7; formant++) {				// B1 - B3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				femtar[tar] = -(cur_dipptr);
				cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
			} else {
				femtar[tar] = phstruc->diphthongs[formant].diph[0];
			}
			tar++;
		}
	}

	formant = 8;	// AV
#else
	formant = 4;	// AV
#endif
	for (pho = 0; pho < base->phoneme_count; pho++) {		// AV
		phstruc = &base->phonemes[pho];
		if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
			femtar[tar] = -(cur_dipptr);
			cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
		} else {
			femtar[tar] = phstruc->diphthongs[formant].diph[0];
		}
		tar++;
	}

	/* femdip */
	cur_dipptr = 2;
	for (formant = 0; formant < 3; formant++) {				// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				tar = 0;
				do {
					femdip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					femdip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					cur_dipptr += 2;
					tar++;
				} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
			}
		}
	}

#ifdef HAVE_B1_B3
	for (formant = 4; formant < 7; formant++) {				// B1 - B3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				tar = 0;
				do {
					femdip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					femdip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					cur_dipptr += 2;
					tar++;
				} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
			}
		}
	}
	formant = 8;		// AV
#else
	formant = 4;		// AV
#endif
	for (pho = 0; pho < base->phoneme_count; pho++) {		// AV
		phstruc = &base->phonemes[pho];
		if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
			tar = 0;
			do {
				femdip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
				femdip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
				cur_dipptr += 2;
				tar++;
			} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
		}
	}
	femdipcnt = cur_dipptr;

	/* ptram - Rebuild AMP table for both male and female */
	cur_dipptr = 1;
	tar = 0;
	for (pho = 0; pho < base->phoneme_count; pho++) {
		phstruc = &base->phonemes[pho];
		hasamp = 0;
		for (amp = 0; amp < AMPS; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		phstruc = &male->phonemes[pho];
		for (amp = 0; amp < AMPS; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		if (hasamp) {
			ptram[tar] = cur_dipptr;
			cur_dipptr += (6 * AMPS);
		} else {
			ptram[tar] = 0;
		}
		tar++;
	}

	/* malamp, femamp */
	tar = 1;					// [102]
	mtar = 1;
	malamp[0] = 0;
	femamp[0] = 0;
	for (pho = 0; pho < base->phoneme_count; pho++) {
		phstruc = &base->phonemes[pho];
		hasamp = 0;
		for (amp = 0; amp < AMPS; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		phstruc = &male->phonemes[pho];
		for (amp = 0; amp < AMPS; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		if (hasamp) {
			phstruc = &base->phonemes[pho];
			hasamp = 0;
			for (amp = 0; amp < AMPS; amp++) {
				if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
			}
			if (hasamp) {		// Has female amp
				for (amp = 0; amp < AMPS; amp++) {
					femamp[tar  ] = phstruc->amp[amp].a_A2;
					femamp[tar+1] = phstruc->amp[amp].a_A3;
					femamp[tar+2] = phstruc->amp[amp].a_A4;
					femamp[tar+3] = phstruc->amp[amp].a_A5;
					femamp[tar+4] = phstruc->amp[amp].a_A6;
					femamp[tar+5] = phstruc->amp[amp].a_AB;
					tar += 6;
				}
			} else {			// Has no female amp
				printf("Using female amp filler for %s.\n",phstruc->name);
				printf(" A6: %d  AB: %d\n",base->phonemes[pho].amp[0].a_A6,phstruc->amp[0].a_AB);
				for (amp = 0; amp < AMPS; amp++) {
					femamp[tar  ] = 0;
					femamp[tar+1] = 0;
					femamp[tar+2] = 0;
					femamp[tar+3] = 0;
					femamp[tar+4] = 0;
					femamp[tar+5] = 0;
					tar += 6;
				}
			}
			phstruc = &male->phonemes[pho];
			hasamp = 0;
			for (amp = 0; amp < AMPS; amp++) {
				if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
				if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
			}
			if (hasamp) {		// Has male amp
				for (amp = 0; amp < AMPS; amp++) {
					malamp[mtar  ] = phstruc->amp[amp].a_A2;
					malamp[mtar+1] = phstruc->amp[amp].a_A3;
					malamp[mtar+2] = phstruc->amp[amp].a_A4;
					malamp[mtar+3] = phstruc->amp[amp].a_A5;
					malamp[mtar+4] = phstruc->amp[amp].a_A6;
					malamp[mtar+5] = phstruc->amp[amp].a_AB;
					mtar += 6;
				}
			} else {
				printf("Using male amp filler for %s.\n",phstruc->name);
				printf(" A6: %d  AB: %d\n",base->phonemes[pho].amp[0].a_A6,phstruc->amp[0].a_AB);
				for (amp = 0; amp < AMPS; amp++) {
					malamp[mtar  ] = 0;
					malamp[mtar+1] = 0;
					malamp[mtar+2] = 0;
					malamp[mtar+3] = 0;
					malamp[mtar+4] = 0;
					malamp[mtar+5] = 0;
					mtar += 6;
				}
			}
		}
	}
	ampcnt = tar;

	/* plocu */
	cur_dipptr = 1;
	tar = 0;
	for (amp = 0; amp < LOCAMP; amp++) {		// Front, Back, Round
		for (pho = 0; pho < base->phoneme_count; pho++) {
			hasamp = 0;
			phstruc = &base->phonemes[pho];
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			phstruc = &male->phonemes[pho];
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			if (hasamp) {
				plocu[tar] = cur_dipptr;
				/* MGS 02/25/1998 fixed locus problem */
//				cur_dipptr += LOCAMP * 3;		// F1-F3 * (Locus,Percent,Transdur)
				cur_dipptr += 3 * 3;		// F1-F3 * (Locus,Percent,Transdur)
			} else {
				plocu[tar] = 0;
			}
			tar++;
		}
	}

	/* maleloc, femloc */
	cur_dipptr = 1;
	cur_mdipptr = 1;
	tar = 0;
	for (amp = 0; amp < LOCAMP; amp++) {			// Front, Back, Round
		for (pho = 0; pho < base->phoneme_count; pho++) {
			hasamp = 0;
			phstruc = &base->phonemes[pho];
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			phstruc = &male->phonemes[pho];
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			if (hasamp) {
				hasamp = 0;
				phstruc = &base->phonemes[pho];
				for (formant = 0; formant < 3; formant++) {			// F1 - F3
					if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
				}
				if (hasamp) {		// Has female loc
					for (formant = 0; formant < 3; formant++) {
						femloc[cur_dipptr  ] = phstruc->loc[formant].locus[amp];
						femloc[cur_dipptr+1] = phstruc->loc[formant].percent[amp];
						femloc[cur_dipptr+2] = phstruc->loc[formant].transdur[amp];
						cur_dipptr += 3;
					}
				} else {
					for (formant = 0; formant < 3; formant++) {
						femloc[cur_dipptr  ] = -1;
						femloc[cur_dipptr+1] = -1;
						femloc[cur_dipptr+2] = -1;
						cur_dipptr += 3;
					}
				}
				hasamp = 0;
				phstruc = &male->phonemes[pho];
				for (formant = 0; formant < 3; formant++) {			// F1 - F3
					if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
				}
				if (hasamp) {		// Has male loc
					for (formant = 0; formant < 3; formant++) {
						maleloc[cur_mdipptr  ] = phstruc->loc[formant].locus[amp];
						maleloc[cur_mdipptr+1] = phstruc->loc[formant].percent[amp];
						maleloc[cur_mdipptr+2] = phstruc->loc[formant].transdur[amp];
						cur_mdipptr += 3;
					}
				} else {
					for (formant = 0; formant < 3; formant++) {
						maleloc[cur_mdipptr  ] = -1;
						maleloc[cur_mdipptr+1] = -1;
						maleloc[cur_mdipptr+2] = -1;
						cur_mdipptr += 3;
					}
				}
			}
		}
	}
	loccnt = cur_dipptr;

	/* f0glstp */
	for (pho = 0; pho < 6; pho++) {
		if (f0glstp[pho] != base->f0glstp[pho]) {
			printf("F0 Glottal Steps do not match\n");
			bSuccess = FALSE;
		}
	}

	/* f0_stress_level, f0_phrase_position */
	for (pho = 0; pho < 8; pho++) {
		f0_fstress_level[pho] = base->f0_stress_level[pho];
		f0_fphrase_position[pho] = base->f0_phrase_position[pho];
	}

	TOT_ALLOPHONES = base->phoneme_count;
	return bSuccess;
}

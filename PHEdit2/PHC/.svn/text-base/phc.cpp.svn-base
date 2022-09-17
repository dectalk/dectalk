/*
 * (PH C)ompiler - PHC - Version 1.0  Kevin Bruckert
 *
 * Author: Kevin Bruckert
 *
 * For use with PHD file format - PHEdit² v2.0 File Format
 *
 * Compile two PHD's into one PHR file
 *
 * Note: PHD file format v2.0 does not support dual-voiceprint PHD files
 *
 */

/* Revision History:
 *
 *  Dec 9, 1997 - Initial Creation
 *   Compile Status:	Errors
 *   Link Status:		Unknown
 *   Run Status:		Unknown
 *
 *  Dec 9, 1997 - Fixed compile bugs
 *   Compile Status:	Success
 *   Link Status:		Success
 *   Run Status:		Failure: argv[0] forgotten in USAGE area [100]
 *
 *  Dec 9, 1997 - Fixed [100]
 *   Compile Status:	Success
 *   Link Status:		Success
 *   Run Status:		Failure: PHRom.C file lists DIRECT as file type (PHR_io.CPP[101])
 *
 * Dec 9, 1997 - Fixed (PHR_io.CPP[101])
 *   Compile Status:	Success
 *   Link Status:		Success
 *   Run Status:		Missed padded 0 in malamp and femamp, possible in maleloc and femloc as well (PHR_io.CPP[102])
 *
 * Dec 9, 1997 - Fixed (PHR_io.CPP[102])
 *   Compile Status:	Success
 *   Link Status:		Success
 *   Run Status:		Femamp padding with 0's for unknown reason (PHR_io.CPP[103])
 *
 * Dec 9, 1997 - Fixed (PHR_io.CPP[103])
 *   Compile Status:	Success
 *   Link Status:		Success
 *   Run Status:		Success
 *
 * Apr 9, 2000 - Added lang abbr. to make rom files for each language Maybe simplify later so
 *               it is the only param needed at runtime
 *   Compile Status:	Success
 *	 Link Status:		Success
 *   Run Status:		Success
 *
 * Jan 5, 2004 - Added suffix to make rom files for multiple data files
 *               it is the only param needed at runtime
 *   Compile Status:	Success
 *	 Link Status:		Success
 *   Run Status:		Success
 *
 * End of revision history
 */

#include "stdafx.h"
#include "..\phedit2\ph_struc.h"
#include "..\phedit2\phfileio.h"

phone_type_struct base1, base2;

void main(int argc, char *argv[]) {
	CFile InFile1;
	CFile InFile2;
	CFile OutFile;

	char *pLang = "us";
	char *pSuffix = "";

	if (argc < 5) {
		printf("Usage: %s [PHDfile1] [PHDfile2] [PHRfile] [Lang] [Suffix]\n", argv[0]);// [100]
		printf("  PHDfile1, PHDfile2 - Input PHEdit² PHD v2.0 Files\n");
		printf("  PHRfile - Output PHROM file\n");
		printf("  Lang - two letter language code\n");
		return;
	}


	if (InFile1.Open(argv[1], CFile::modeRead | CFile::shareExclusive) == 0) {
		printf("Unable to open %s\n",argv[1]);
		return;
	}
	if (InFile2.Open(argv[2], CFile::modeRead | CFile::shareExclusive) == 0) {
		printf("Unable to open %s\n",argv[2]);
		return;
	}

	if (OutFile.Open(argv[3], CFile::modeCreate | CFile::modeReadWrite | CFile::shareExclusive) == 0) {
		printf("Unable to open %s for writing\n",argv[3]);
		return;
	}

	pLang = argv[4];
	pLang[0] = tolower(pLang[0]);
	pLang[1] = tolower(pLang[1]);
	
	if (strlen(pLang) != 2)
	{
		printf("Invalid language code. Choices: us uk sp la gr it jp ch kr\n");
		return;
	}

	if (argc>=6)
	{
		pSuffix=argv[5];
	}


	CArchive loadArchive1(&InFile1, CArchive::load);
	CArchive loadArchive2(&InFile2, CArchive::load);
	CArchive saveArchive(&OutFile, CArchive::store | CArchive::bNoFlushOnDelete);

	loadArchive1.m_pDocument = NULL;
	loadArchive1.m_bForceFlat = FALSE;
	loadArchive2.m_pDocument = NULL;
	loadArchive2.m_bForceFlat = FALSE;
	saveArchive.m_pDocument = NULL;
	saveArchive.m_bForceFlat = FALSE;

	PHFileIO fileio;

	if (fileio.LoadPHD(loadArchive1, &base1) == 0) {
		printf("Unable to load archive 1...\n");
		return;
	}
	if (fileio.LoadPHD(loadArchive2, &base2) == 0) {
		printf("Unable to load archive 2...\n");
		return;
	}
		
	if (fileio.SaveROM(saveArchive, base1, base2, pLang,pSuffix) == 0) {
		printf("Unable to save archive...\n");
		return;
	}
	saveArchive.Flush();
	saveArchive.Close();

	printf("Compile completed successfully...\n");
	return;
}

/*
File: eh.h

Purpose: Defines for eh (exe->hex) utility

Edits:

001 28-Aug-1991 RAO Creation
002 29-Aug-1991 RAO Added intel hex structure definition
003 09-Sep-1991 RAO CodeStr added

*/

#define IH_DATA		00	/* length data bytes */
#define IH_END		01	/* no data bytes */
#define IH_EXT		02	/* 2 data bytes */
#define IH_START	03	/* 4 data bytes cs:ip for start */

struct exehdr
	{
	unsigned int	exSig;		/* EXE file signature */
	unsigned int	exExtra;	/* bytes in last page */
	unsigned int	exPages;	/* pages in file (inc partials) */
	unsigned int	exRelocs;	/* ptrs in reloc tbl */
	unsigned int	exHdrSize;	/* size of header, in paras */
	unsigned int	exMinAlloc;	/* minimum allocation */
	unsigned int	exMaxAlloc;	/* maximum allocation */
	unsigned int	exInitSS;	/* initial ss val */
	unsigned int	exInitSP;	/* initial sp val */
	unsigned int	exCheck;	/* checksum (complemented) */
	unsigned int	exInitIP;	/* initial ip */
	unsigned int	exInitCS;	/* initial cs */
	unsigned int	exRelocTbl;	/* byte offset to reloc table */
	unsigned int	exOverlay;	/* overlay number */
	};

struct intel_hex
	{
	unsigned char length;
	unsigned int addr;
	unsigned char type;
	unsigned char data[256];
	unsigned char sum;
	};

struct CodeStr
	{
	unsigned int	Loc;
	unsigned int	Len;
	unsigned char	Code[256];
	};


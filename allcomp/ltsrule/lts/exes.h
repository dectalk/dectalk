

/* Phar-lap executable formats.. */

#define USHORT unsigned short int
#define ULONG unsigned long int
#pragma pack(1)
struct EXP {
	USHORT	signature;
	USHORT	flag1;
	USHORT	hdr_size;
	ULONG	file_size;
	USHORT	checksum;
	ULONG	rtpb_off;
	ULONG	rtpb_size;
	USHORT	fill1[9];
	ULONG	image_off;
	ULONG	image_size;
	ULONG	symbol_off;
	ULONG	symbol_size;
	USHORT	fill2[16];
	ULONG	minextrabytes;
	ULONG	maxextrabytes;
	ULONG	base_offset;
	ULONG	initial_esp;
	USHORT	fill3;
	ULONG	initial_EIP;
	USHORT	fill4[3];
	USHORT	LoadImageFlags;
	ULONG	LoadedImageSize;
	ULONG	undefined1;
	ULONG	InitialStackSize;
	/* there is reserved space after this */

	};

#pragma pack()	/* restore default */

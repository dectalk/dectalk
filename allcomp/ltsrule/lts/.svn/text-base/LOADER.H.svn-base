/* dos exe header info.. */
/*
 *  msdos .exe files will look like ...
 */

struct dos_exe_header {
	unsigned int	id;			/* Linker's signature, must be 0x5a4d	*/
	unsigned int	rem;			/* length of image mod 512		*/
	unsigned int	pages;		/* length of image in pages of 512 bytes*/
	unsigned int	relen;		/* number of relocation items		*/
	unsigned int	hsize;		/* header size in paragraphs of 16 bytes*/
	unsigned int	hmin;			/* min # of paragraphs above prog end	*/
	unsigned int	hmax;
	unsigned int	ssval;
	unsigned int	spval;		/* to be loaded in sp			*/
	unsigned int	checksum;
	unsigned int	ipval;		/* to be loaded in ip			*/
	unsigned int	csval;  		/* segment offset to code		*/
	unsigned int	reloc;		/* location of relocation items		*/
	unsigned int	ovrlay;		/* overlay number			*/
};

/*  a dos relocation element looks like */

struct dos_reloc {
	short int	offset;
	short int	segment;
};

/* flags for the ROM directory entries */
#define ROM_VALID  	0x02
#define ROM_COMP   	0x04
#define ROM_DICT   	0x08

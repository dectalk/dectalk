/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995,1999. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	udic_com.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  User dictionary compiler ... This is the common code for all langs.
 *
 ***********************************************************************
 *    Revision History:
 *	31mar99		tek		New file: contains the common header info.
 *	28mar01		mgs		Change for osf
 */

/*
 * general defines ...
 */

#define	true    1
#define	false   0
#define	failure 1
#define	success 0  
#define DOS_TAG "DOS"
#define DOS_TAG_CHAR 'D'
#define WIN_TAG "WIN"          
#define WIN_TAG_CHAR 'W' 
#define DOS_TYPE 1
#define WIN_TYPE 2

/* things in here may be platform-specific; caveat emptor */
#if defined __linux__  || defined __osf__ /* gcc on linux x86, actually.. */
#define STRNICMP(x,y,z) strncasecmp(x,y,z)
#endif /*__linux__*/
#ifdef _MSC_VER /* msvc */
#define STRNICMP(x,y,z) _strnicmp(x,y,z)
#endif /*_MSC_VER*/


struct listup{
	unsigned char *word;
	struct listup *left;
	struct listup *right;
};

/* #define DEBUG1 */

/*
 *  User dictionary structure and size defines ...
 */

#define	UDICT_MAX_ENTS		(3*1024)  
#define	UDICT_MAX_TEXT		(31*1054)

struct	dict_link	{
	unsigned int	text;
	unsigned int	link;
};

/* tek 11feb98 Use this union to build the seg:off pair that goes into
 * the index table. This is specific to the segmented-mode x86 target
 * (dtpc/dtex) that use these values as "far pointers".
 */
typedef union FarPointerTag {
	struct  {
		unsigned short offset;
		unsigned short segment;
	} segoff;
	unsigned long target;
} FarPointer;

/* tek 11feb99 prototypes would be a nice thing to have.. */

void to_ascky();
void lookup_ascky(unsigned char ph);
void to_arpabet();
int lookup_arpabet(unsigned char p1,unsigned char p2);
void push_entry(unsigned char c);
unsigned char non_white();
unsigned char get_alpha();
void ReadAndAlphabetize(char *szFilename);
void scan_entry();
void sort_entry();
void scan_error(char *es);
int legal_alpha(char c);

int get_Aentry(unsigned char word[256]);
struct listup *save_up(struct listup *head,unsigned char *word);
unsigned char *sort_up(unsigned char *word,struct listup *head);
void write_up(struct listup *head);
unsigned char *strsave(unsigned char *word);

/* from udic_com.c */
void scan_entry();
void sort_entry();

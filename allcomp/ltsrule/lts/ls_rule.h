

/*
   This file has been move to Tools area
   GL  02/06/1998
   This file is being used again.
   MGS 05/07/2004
*/

#ifndef _LS_RULE_H_
#define _LS_RULE_H_
/* GL 09/24/1997 for BATS#470 change the LDS rule table handling */
#if defined (VMS) || defined (LDS_BUILD)
	extern unsigned char     lsbtab[];              /* Byte array.*/
	extern unsigned short   lswtab[];               /* Word array.*/                 

#define wtab(n)         ((unsigned short)lswtab[(n)]&0xFFFF)
#define btabb(n)        ((unsigned char)lsbtab[(n)]&0xFF)
#define btabw(n)        ((((unsigned char)lsbtab[(n)+1]&0xFF)<<8) |((unsigned char)lsbtab[(n)]&0xFF))

#ifdef ACNA
#define	LSBUMP	7				/* 7 word entries		*/
#else
#define	LSBUMP	6				/* 6 word entries		*/
#endif
	short	rline;						/* Rule: line			*/

#else
#if defined (ENGLISH) || defined (GERMAN)
#ifdef ACNA
#define	LSBUMP	5				/* 6 word entries		*/
#define	wtab(n)		((U16)acna_lswtab[(n)]&0xFFFF)
#define	btabb(n)	((U16)acna_lsbtab[(n)]&0xFF)
#define	btabw(n)	(((U16)(acna_lsbtab[(n)+1]&0xFF)<<8)|((U16)acna_lsbtab[(n)]&0xFF))

#else
#define	wtab(n)		((U16)lswtab[(n)]&0xFFFF)

#define	btabb(n)	((U16)lsbtab[(n)]&0xFF)
	
#define	btabw(n)	(((U16)lsbtab[(n)+1])<<8) |((U16)(lsbtab[(n)]))
#define	LSBUMP	4				/* 4 word entries		*/
#endif
#endif
#endif

#endif // _LS_RULE_H_

/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	ldr.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-PC TSR structures and defines ...
 *
 ***********************************************************************
 *    Revision History:
 * 22-DEC-1994 Carl Leeber, Removed include	of ldr_prot.h
 * 20-JAN-1995 Carl Leeber, Added includes to dos.h/stdio.h.
 * 01-mar-1995 Carl Leeber, Prevent loading multiple same language .dics.
 * 18-jul-1995 ...tek		enlarge READ_BUFF_SIZE
 * 02-feb-1996 ...gl	    add new variables declaraion for local language.
 * 06-AUG-1997	DR			Add british dic found global integer.
 * 07-Jul-1997	GL/TK		BATS#681 fix GERMAN 16 bits code loading problem
 *
 */


#ifndef LDRH
#define LDRH 1

#include	"tsr.h"
#include	<dos.h>
#include	<stdio.h>

extern unsigned int	verbose;
extern int				load_module;
extern int				wants_reset;
   
/* commented out as unneeded statement - 9/1/95  JDB
extern int kernel_found; */    	/* mark kernel.sys not found */

extern int english_dic_found;	/* mark English .dic not found */
extern int spanish_dic_found;	/* mark Spanish .dic not found */
extern int german_dic_found;	/* mark Spanish .dic not found */
extern int french_dic_found;	/* mark Spanish .dic not found */
extern int british_dic_found;	/* mark Spanish .dic not found */
extern int english_u_dic_found;	/* mark User .dtu not found */
extern int spanish_u_dic_found;	/* mark User .dtu not found */
extern int german_u_dic_found;	/* mark User .dtu not found */
extern int french_u_dic_found;	/* mark User .dtu not found */
extern int british_u_dic_found;	/* mark User .dtu not found */
extern int abbr_dic_found;	/* mark Abbreviated .dta not found */

/*
 *  The malloc() buffer sizes ... note the the read buff size must be
 *  large enough to contain the whole kernel ...
 */

#define	READ_BUFF_SIZE		(1024*30)		/* chars in read buffer */
#define	MAX_FIXUPS			512	  			/* maximum fixups per exe */

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
/* 07/07/1998 GL/TK, BATS#681 need to use unsigned short */
struct dos_reloc {
	unsigned short int offset;
	unsigned short int segment;
};

#endif


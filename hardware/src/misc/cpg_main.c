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
 *    File Name:	cpg_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * language code page switching ...  this module is designed to be linked
 * with multiple lng_xxx.c modules that represent the various dos code pages
 * that are supported.  Each lng_xxx.c module defines code_page_number and
 * code page table for that particular code page ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include        "cpg_def.h"

extern  int     code_page_number;
extern   unsigned char code_page_table[];

struct  dtpc_code_pages ncp;

main(data_seg,stack_start)
unsigned int data_seg;
unsigned int stack_start;
{
	volatile struct dtpc_code_pages _far *cp;
	int     i;

/*
 *  fill structure ...
 */

	ncp.dos_id = code_page_number;
	ncp.translation_page = &code_page_table[0];
	ncp.link = NULL_CP;

/*
 *  thread on chain ...
 */

	cp = KS.loaded_code_pages;
	if(cp == NULL_CP)
		KS.loaded_code_pages = &ncp;
	else
		{
		while((*cp).link != NULL_CP)
			cp = (*cp).link;
		(*cp).link = &ncp;
		}
/*
 *  make this the default ...
 */

	for(i=0;i<256;i++)
		KS.code_page[i] = ncp.translation_page[i];
}       


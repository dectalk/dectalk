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
 *    File Name:	dedemo.h
 *    Author:		Carl Leeber
 *    Creation Date:14-JUN-95
 *
 *    Functionality:
 * To hold external declarations of common varaibles for
 *		xDTDEMO.C and DTCOMMON.C
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#ifndef DTDEMOH
#define DTDEMOH 1

#define CHARARRAYSIZL 1024
#define CHARARRAYSIZM 512
#define CHARARRAYSIZS 256

extern unsigned char setup[];
extern unsigned char list[];
extern unsigned char freset[];
extern unsigned char typing[];
extern unsigned char rate[];
extern FILE *voc;
extern unsigned char nopen2[];
extern unsigned char invol[];
extern unsigned char volset[];
extern unsigned char setting[];
extern unsigned char editbuf[];
extern unsigned char edit[];
extern unsigned char reset[];
extern unsigned char incr[];
extern unsigned char decr[];
extern unsigned char name[];
extern unsigned char nopen[];
extern unsigned char getbuf[];
extern unsigned char voices[];
extern unsigned char sync[];
extern unsigned char paul[];
extern unsigned char harry[];
extern unsigned char frank[];
extern unsigned char dennis[];
extern unsigned char betty[];
extern unsigned char ursula[];
extern unsigned char rita[];
extern unsigned char wendy[];
extern unsigned char kit[];
extern unsigned char song[];
extern unsigned char song2[];
extern unsigned char song3[];
extern unsigned char voicesetup[];
extern unsigned char next[];
extern unsigned char valid[];
extern unsigned char canned1[];
extern unsigned char canned2[];
extern unsigned char dexit[];
extern unsigned char clist[];
extern unsigned char defalt[];
extern int icnt;
extern unsigned char *bufptr;
extern int phonemode;
extern unsigned char outbuf[];
extern int outi;
extern int quit;
extern int nindx;
extern int lindx;
extern unsigned int outj[];
extern int parse;
extern int phmode;
extern unsigned char sil[];
extern int inphodur;
extern int isent;
extern int inpdur;
extern int gotsq;
extern int insquare;
extern long safetycnt;
extern int voc_module;
extern unsigned int frame_data[];
extern unsigned char sb_data[];
extern long pcount;
extern int read_size;
extern unsigned char outb[];
extern unsigned char tmp[];
extern int next_byte; 
extern int next_sample; 

extern unsigned char warning[];
extern unsigned char recieved[];
extern unsigned char nonew[];
extern unsigned char indexnum[];
extern unsigned char sayl[];
extern unsigned char backs[];
extern unsigned char space[];
extern unsigned char dels[];

#endif

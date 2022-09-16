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
 *    File Name:	voc_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  File \dtpc\tsr\src\protos.h
 *  Created on : 10/27/92 at 13:41:44
 *
 ***********************************************************************
 *    Revision History:
 */ 

int main(int argc,unsigned char **argv );
extern	unsigned int dtpc_cmd(unsigned char cmd,unsigned char value);
extern	int usage(void);
extern	int play_wave(void);
extern	void play_sb(void);
extern	unsigned char get_byte(void);
extern	void pack_buff(long count);
extern	void zero_buff(unsigned int count);
extern	int send_frame(void);

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
 *    File Name:	com_phon.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  common control phonemes that must be present in all 
 *  languages at these values ...
 *
 ***********************************************************************
 *    Revision History:
 */
#ifndef COM_PHONH
#define COM_PHONH 1

#define	BLOCK_RULES		(100)			/* Block allophone substitutes.	*/
#define	S3					(100+ 1)		/* Tertiary stress */
#define	S2					(100+ 2)		/* Secondary stress		*/
#define	S1					(100+ 3)		/* Primary stress		*/
#define	SEMPH				(100+ 4)		/* Emphatic stress		*/
#define	HAT_RISE			(100+ 5)		/* Explicit hat rise		*/
#define	HAT_FALL			(100+ 6)		/* Explicit hat fall		*/
#define	HAT_RF			(100+ 7)		/* Explicit hat rise-fall	*/
#define	SBOUND			(100+ 8)		/* Syllable boundary		*/
#define	MBOUND			(100+ 9)		/* Morpheme boundary		*/
#define	HYPHEN			(100+10)		/* For noun compounds		*/
#define	WBOUND			(100+11)		/* Word boundary		*/
#define	PPSTART			(100+12)		/* Prep phrase start		*/
#define	VPSTART			(100+13)		/* Verb phrase start		*/
#define	RELSTART			(100+14)		/* Intro. to sentence or clause	*/
#define	COMMA				(100+15)		/* end of clause		*/
#define	PERIOD			(100+16)		/* End of sentence		*/
#define	QUEST				(100+17)		/* End of question		*/
#define	EXCLAIM			(100+18)		/* End of exclamatory sentence!	*/
#define	NEW_PARAGRAPH	(100+19)		/* Explicit new paragraph	*/
#define	SPECIALWORD		(100+20)    /* Special word in citation mode */

#endif

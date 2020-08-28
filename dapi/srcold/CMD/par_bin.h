/*
 ***********************************************************************
 *
 *                           Copyright © 
 *    Copyright © 2001 Force Computers Inc. A Solectron company. All rights reserved.
 *    (c) Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	par_bin.h
 *    Author:       Matthew Schnee
 *    Creation Date:11/20/1997
 *
 *    Functionality:
 * 		Text preprocessor main file
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	---------------------------------------
 *	001	MGS		05/20/1998	Added BIN_COMP_BREAK state
 *	002	MGS		05/18/2001	VxWorks porting BATS#972
 * 	003	CAB		05/25/2001	Added copyright info
 *	016	MGS		06/19/2001	Solaris Port BATS#972
 */

/* defines for the the binary format */

/* Operations */
#define BIN_OPERATION_MASK	0x1F

#define BIN_END_OF_RULE			0x00
#define BIN_ALPHANUMERIC		0x01
#define BIN_ANY_ALPHABET		0x02
#define BIN_ANY_CHARACTER		0x03
#define BIN_CLAUSE_BOUNDRY		0x04
#define	BIN_CONSONANT			0x05
#define BIN_LOWER				0x06
#define BIN_NON_ALPHABET		0x07
#define BIN_NUMBER				0x08
#define	BIN_PUNCT_SOME			0x09
#define BIN_PUNCTUATION			0x0A
#define BIN_UPPER				0x0B
#define BIN_VOWEL				0x0C
#define BIN_VOWEL_NON_Y			0x0D
#define BIN_WHITESPACE			0x0E
#define BIN_DIGIT				0x0F
#define BIN_EXACT				0x10
#define BIN_HEXADECIMAL			0x11
#define BIN_RESTORE				0x12
#define BIN_SETS				0x13
#define BIN_COPY				0x14
#define BIN_DELETE				0x15
#define BIN_OPTIONAL			0x16
#define BIN_SAVE				0x17
#define BIN_MACRO				0x18
#define BIN_REPLACE				0x19
#define BIN_INSERT				0x1A
#ifdef GERMAN_COMPOUND_NOUNS
#define BIN_COMP_BREAK			0x1B
/* removed to make room for BIN_COMP_BREAK */
//#define BIN_AFTER				0x1B
//#define BIN_BEFORE				0x1C
#else
#define BIN_AFTER				0x1B
#define BIN_BEFORE				0x1C
#endif
#define BIN_DICTIONARY			0x1D
#define BIN_STATUS				0x1E
#define BIN_WORD				0x1F

/* operation flags */
#define BIN_OPERATION_FLAG_MASK	0xE0
#define BIN_LOOK_TO_DISABLE		0x80
#define BIN_LOOK_FROM_DISABLE	0x40
#define BIN_DIGIT_RANGE			0x20 /* this is a shared bit with different meanings */
#define BIN_CASE_INSEN			0x20 /* depending on the opertaion */
#define BIN_DICT_HIT_FAIL		0x80
#define BIN_DICT_MISS_FAIL		0x40
#define BIN_CONDITIONAL_REPLACE	0x80

#ifdef GERMAN_COMPOUND_NOUNS
/* added to make room for BIN_COMP_BREAK */
#define BIN_AFTER_FLAG			0x40
#define BIN_BEFORE_FLAG			0x20
#endif

/* number of size descriptor flags */
#define BIN_SIZE_DESC_MASK		0x3F
#define BIN_SIZE_DESC_FLAG_MASK	0xC0
#define BIN_COMPLIMENT			0x80
#define BIN_LARGE_DESC			0x40


/* size descriptor flags */
#define BIN_MAX_SMALL_DESC		0x3F
#define BIN_SMALL_DESC_FLG_MASK	0xC0
#define BIN_SMALL_ANY_NUMBER	0x80
#define BIN_SMALL_CONTINUE		0x40

#define BIN_MAX_LARGE_DESC		0x3FFF
#define BIN_LARGE_DESC_FLG_MASK	0xC000
#define BIN_LARGE_ANY_NUMBER	0x8000
#define BIN_LARGE_CONTINUE		0x4000

/* rule header values */
#define BIN_SPECIAL_RULE_MASK	0xE000
#define BIN_IS_SPECIAL			0x8000
#define BIN_STOP				0x2000
#define BIN_RETURN				0x4000
#define BIN_GOTO				0xA000
#define BIN_GORET				0xC000


#define BIN_NEXT_HIT			0x1000
#define BIN_NEXT_MISS			0x0800
#define BIN_GORET_HIT			0x0400
#define BIN_GORET_MISS			0x0200
#define BIN_COPY_HIT			0x0100
#define BIN_DICT_HIT			0x0080
#define BIN_DICT_MISS			0x0040


#ifdef _BIGENDIAN_
#define get_short(ptr) ((U16)\
                       ((((U8 *)(ptr))[0] << 8)  | \
                        (((U8 *)(ptr))[1])))


#define get_long(ptr) ((U32)\
                       ((((U8 *)(ptr))[0] << 24)  | \
                        (((U8 *)(ptr))[1] << 16)  | \
                        (((U8 *)(ptr))[2] << 8)  | \
                        (((U8 *)(ptr))[3])))

#else
#define get_short(ptr) ((U16)\
                       ((((U8 *)(ptr))[1] << 8)  | \
                        (((U8 *)(ptr))[0])))


#define get_long(ptr) ((U32)\
                       ((((U8 *)(ptr))[3] << 24)  | \
                        (((U8 *)(ptr))[2] << 16)  | \
                        (((U8 *)(ptr))[1] << 8)  | \
                        (((U8 *)(ptr))[0])))
#endif

#ifndef PARSER_DEBUG
#define  par_copy_return_value(dest,src) memcpy(dest,src,sizeof(return_value_t))
#endif


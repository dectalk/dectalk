;+
;***********************************************************************
;*
;*                           Coryright (c)
;*    © Digital Equipment Corporation 1995. All rights reserved.
;*
;*    Restricted Rights: Use, duplication, or disclosure by the U.S.
;*    Government is subject to restrictions as set forth in subparagraph
;*    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
;*    52.227-14 Alt. III, as applicable.
;*
;*    This software is proprietary to and embodies the confidential
;*    technology of Digital Equipment Corporation and other parties.
;*    Possession, use, or copying of this software and media is authorized
;*    only pursuant to a valid written license from Digital or an
;*    authorized sublicensor.
;*
;***********************************************************************
;*    File Name:	servs.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  Definitions used by loadhelp.asm to access the protected-mode services.
;*
;***********************************************************************
;*    Revision History:
;*
;* 13dec95	...tek		initial for merge of DTEX

;IFDEF   DTEX
; much as I hate to, I'm going to define the pm_vec function
; calls here. I really wish there was an easy way to do this from
; the c .h file..
ABORT		equ	0
READROM		equ	1
READROMWORD	equ	2
GETBUFFER	equ	4

;                   was 0e8000h
LAST_USER_ADDR	equ	0ec000h		; boot code uses ram above this.

PIC0		equ	020h		; interrupt controllers.
PIC1		equ	080h

pm_vector	equ	030h		; the protected mode helper trap


dataseg	MACRO
	dseg	SEGMENT PARA PUBLIC USE32 'DATA'
	ENDM

codeseg	MACRO
	cseg	SEGMENT PARA PUBLIC USE32 'CODE'
	ENDM

BIT0	equ	001h
BIT1	equ	002h
BIT2	equ	004h
BIT3	equ	008h
BIT4	equ	010h
BIT5	equ	020h
BIT6	equ	040h
BIT7	equ	080h
BIT8	equ	0100h
BIT9	equ	0200h
BIT10	equ	0400h
BIT11	equ	0800h
BIT12	equ	01000h
BIT13	equ	02000h
BIT14	equ	04000h
BIT15	equ	08000h
;ENDIF ; dtex

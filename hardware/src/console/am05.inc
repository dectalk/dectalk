;+
; File: am05.inc
;
; Purpose: macros, definitions for character and string ops
;
; Edits:
;
; 001 27-Jun-1991 RAO Creation
; 002 28-Jun-1991 RAO Added jisnl
; 003 22-Nov-1991 RAO Bug: CR_LF was assigned code for FF
; 004 08-Dec-1991 RAO Shorter versions (CR,LF)
; 005 19-Dec-1991 RAO Remove ESC from the jisattn list
; 006 20-Dec-1991 RAO Added control O
; 007 16-Jan-1992 RAO Added C_CSI
; 008 22-Jan-1992 RAO Added comment char
;-
	subttl	Macro Definitions, Character and string ops
	page

C_A	equ	'A'
C_al	equ	'a'
C_B	equ	'B'
C_bl	equ	'b'
C_D	equ	'D'
C_dl	equ	'd'
C_I	equ	'I'
C_il	equ	'i'
C_U	equ	'U'
C_ul	equ	'u'
C_W	equ	'W'
C_wl	equ	'w'

C_SPACE	equ	20h
C_BS	equ	8h
C_TAB	equ	9h
C_ESC	equ	1bh
C_CSI	equ	9bh
C_ENTER	equ	0dh
CR	equ	0dh

C_LF	equ	0ah
LF	equ	0ah

C_CTRLC	equ	3h
C_BEL	equ	7h
C_CTRLX	equ	18h
C_CTRLY	equ	19h
C_RUBOUT equ	7fh
C_CTRLO	equ	0fh

XON	equ	11h
XOFF	equ	13h

CMNT_CHAR	equ	';'

jiswhite	MACRO	target
;
; Input:	al		ascii character
;
; Side effects:
;	if al is in the set of white space characters, then jmp to target
;
	cmp	al,C_SPACE	; is it a space?
	je	target
	cmp	al,C_TAB	; a tab?
	je	target
ENDM
	page

jisnotwhite	MACRO	target
;
; Input:	al		ascii character
;
; Side effects:
;	if al is *not* in the set of white space characters, then jmp to target
;
	cmp	al,C_SPACE	; is it a space?
	je	@f		; yes
	cmp	al,C_TAB	; a tab?
	je	@f		; yes
;
; neither one, jmp now
;
	jmp	target
@@:
ENDM
	page

jisnotnl	MACRO	target
;
; Input:	al		ascii character
;
; Side effects:
;	if al is *not* a nl character, then jmp to target
;
	cmp	al,C_ENTER	; is it an enter?
	jne	target		; no
ENDM
	page

jisnl	MACRO	target
;
; Input:	al		ascii character
;
; Side effects:
;	if al is a nl character, then jmp to target
;
	cmp	al,C_ENTER	; is it an enter?
	je	target		; no
ENDM
	page

jisattn	MACRO	target
;
; Input:	al		ascii character
;
; Side effects:
;	if al is an attention char, then jmp to target
;
	cmp	al,C_CTRLC	; is it from a large collection of break keys?
	je	target		; yes, quit
	cmp	al,C_CTRLX
	je	target		; yes, quit
	cmp	al,C_CTRLY
	je	target		; yes, quit
ENDM

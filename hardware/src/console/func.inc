;+
; File: func.inc
;
; Purpose: Constants for accessing microPOST base functions from loadable
;		code (with int linkage)
;
; Edits:
;
; 001 24-Jan-1992 RAO Creation
; 002 25-Jan-1992 RAO Added more function codes
; 003 28-Jan-1992 RAO More added
; 004 07-Feb-1992 RAO Added F_HEXBIN32
;-
	subttl	Data definitions

F_PUTSTR	equ	0000h		; call putstr
F_GO_BASE	equ	0001h		; get last GO address
F_PUTC		equ	0002h		; call putc
F_PUTDEC8	equ	0003h		; call putdec8
F_PUTDEC16	equ	0004h		; call putdec16
F_PUTHEX2	equ	0005h		; call puthex2
F_PUTHEX4	equ	0006h		; call puthex4
F_PUTHEX8	equ	0007h		; call puthex8
F_CLS		equ	0008h		; call cls
F_CRLF		equ	0009h		; call crlf
F_GETHEX2	equ	000ah		; call gethex2
F_GETHEX4	equ	000bh		; call gexthex4
F_GETC		equ	000ch		; call getc
F_GETCMDLINE	equ	000dh		; call getcmdline
F_KBHIT		equ	000eh		; call kbhit
F_SPACE		equ	000fh		; call space
F_STRICMP	equ	0010h		; call stricmp
F_STRLEN	equ	0011h		; call strlen
F_STRCPY	equ	0012h		; call strcpy
F_TOKENIZE	equ	0013h		; call tokenize
F_NEXTNULL	equ	0014h		; call nextnull
F_HEXBIN32	equ	0015h		; call hexbin32

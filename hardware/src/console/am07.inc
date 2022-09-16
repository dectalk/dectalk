;+
; File: am07.inc
;
; Purpose: Field definitions
;
; Edits:
;
; 001 16-Oct-1991 RAO Creation
; 002 01-Nov-1991 RAO Changed csrs, CbusII spec changes
; 003 21-Nov-1991 RAO Fixed nasty bug in Rselector
; 004 04-Dec-1991 RAO Added gate descriptor fields
; 005 09-Jan-1992 RAO Added debug register fields
;-
	subttl	Field definitions

RCsrBase	record		\
	CsrB_01:2,		\	; always 01
	CsrB_Element:5,		\	; Element Id field
	CsrB_fill:13,		\	; constant bit field
	CsrB_reg:12			; register offset field

RSegToAbs	record		\
	sta_0:12,		\	; high order 0
	sta_seg:16,		\	; segment value goes here
	sta_00:4			; shifted up x 4 bits

Rselector	record		\
	sel_idx:13,		\	; index
	sel_ti:1,		\	; table indicator; 0=>gdt,1=>ldt
	sel_rpl:2			; requestor priv level

;+
; descriptor: segment base and limit
;-

Rgdt_a	record gdt_base15_00:16,	\	; lowest order base address
	gdt_seg15_00:16			; segment limit 15..00

;+
; descriptor: segment base, limit and lots of other fields
;-
 
Rgdt_b	record gdt31_24:8,	\	; high order base address
	gdt_g:1,		\	; G bit - granularity
	gdt_d:1,		\	; D bit - Default op size 1=>32bit
	gdt_0:1,		\	; must be zero
	gdt_avl:1,		\	; we can use this
	gdt_seg19_16:4,		\	; segment limit 19..16
	gdt_p:1,		\	; P bit - segment present
	gdt_dpl:2,		\	; DPL - descrip priv level
	gdt_s:1,		\	; S bit - 0=>system;1=>application
	gdt_typ:3,		\	; Type bits
	gdt_acc:1,		\	; accessed
	gdt_base23_16:8			; middle order base address

;+
; gate descriptor (a is low order, b is high order)
;-
Rgate_a record			\
	gatea_selector:16,	\	; selector
	gatea_off15_00:16		; low order offset

Rgate_b record			\
	gateb_off31_16:16,	\	; high order offset
	gateb_p:1,		\	; valid contents
	gateb_dpl:2,		\
	gateb_0:1,		\	; must be 0
	gateb_type:4,		\
	gateb_000:3,		\	; must be 0
	gateb_wcount:5			; word count


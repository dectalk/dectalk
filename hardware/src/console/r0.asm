;+
; File: r0.asm
;
; Purpose: microPOST, real mode int handlers
;
; Edits:
;
; 001 08-Dec-1991 RAO Creation
;-
	title	microPOST r0
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass16.inc
	include	com.inc
	include	hdt.inc

	.list

rint	MACRO	rvalue

	dw	offset	@CatStr(<rh>,<%(rvalue)>)
	dw	0f000h
	ENDM

rint_table	MACRO	howmany
idx = 0
	repeat	howmany
	dw	offset	@CatStr(<rh>,<%(idx)>)
	dw	0f000h
idx = idx + 1
	ENDM
	ENDM

rdisp	MACRO	rvalue

@CatStr(<rh>,<%(rvalue)>):
	mov	ax,rvalue
	jmp	rint_common

	ENDM
rdisp_all MACRO	rvalue
idx = 0
	repeat	rvalue
@CatStr(<rh>,<%(idx)>):
	mov	ax,idx
	jmp	rint_common
idx = idx + 1
	ENDM
	ENDM
;+
; used to generate temporary label names
;-
tcount = 0
ghcount = 0
ghhcount = 0
ghspcount = 0
phcount = 0

	public	real_int_table,rdisp_start

ROM_Code	SEGMENT
;+
; simple table for converting hex to binary and back
;-
binhextab	db '0','1','2','3','4','5','6','7','8','9',	\
			'A','B','C','D','E','F'

;+
; Generate int handler dispatch code
;-
rdisp_start:
	rdisp_all	256

rint_error:
	db	' *** real int handler, fatal ***',C_ENTER,C_LF,0

;+
; In case of interrupt dispatch, all handlers arrive here with int
; number in ax...
;-
ROM_Code	ENDS
ROM_Code	SEGMENT

rint_common:
	mov	di,ax			; save int number in di
	xor	eax,eax
	mov	ax,gs
	mov	ds,ax			; restore for putstr
	mov	ax,di			; get int number back
	mov	ecx,4			; number of digits

	puthex				; print value of int number
	putstr	rint_error		; and a little message

here:
	jmp	here			; hang	

;+
; Generate (in rom space) the idt for real mode operations, looks like:
;
;	dw	offset	rh0
;	dw	0f000h
;
;	dw	offset	rh1
;	dw	0f000h
;
;	dw	offset	rh2
;	dw	0f000h
;
;	.
;	.
;	.
;	dw	offset	rh255
;	dw	0f000h
;-
real_int_table:
	rint_table	256

ROM_Code	ENDS
	end

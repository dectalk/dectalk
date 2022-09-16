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
;*    File Name:	startup.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;* Module init
;*
;***********************************************************************
;*    Revision History:
;* 14dec95	...tek		merge dtex
;*
;-

	NAME	Mod_init

	dosseg


	.xlist
	include os_macs.asm
	include c_macs.asm
	include 186_macs.asm
	.list
IFDEF DTEX
IRQ0_VEC	equ	020h		; irq0 vector..

PIC0		equ	020h		; interrupt controllers.
PIC1		equ	080h

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

ENDIF ;dtex
	_186_regs
	mem_map
	kernel_data

	.stack

	.code

        extrn  _dectalk_main:near


;
; DECtalk-pc kernel init ..
;
		public       _main
_main		proc 	near

;
;  init all non-zero system wide variables ... note that
;  this will have to change if we can start up without clearing
;  all ram ...
;

IFNDEF DTEX
        mov     _r186_io_base,0ff00h
ENDIF ;DTEX
	mov	si,offset DGROUP:ram_queue
;
;  free ram is the kernel size, plus the vector area, less the top 16k
;  where the bios rom is ...  assume ss:end_of_stack is the last byte of the
;  kernel ... 
;;dtex comment
;; on the express, the top 16k is just control stuff (I think..)
;
	mov	ax,sp				; dgroup size in bytes
	shr	ax,4				;   paras
	add	ax,DGROUP			; Whole cgroup size
	inc	ax				; Guard band
;
;  first block segment is number of paras
;
	mov	word ptr ds:[si],0h		; offset
	mov	ds:[si+2],ax			; segment
;
;  size is 32kb rom space in paras less the kernel size ...
;;dtex comments
;; there is 96KB blocked off at the top where various protected mode and
;; bootup stuff lives.
;
IFDEF DTEX
	mov	dx, 0e800h
ELSE
	mov	dx,0f800H			
ENDIF ;dtex
	sub	dx,ax
	mov	word ptr ds:[si+4],dx
;
;  zero out the end of the queue ...
;
	lds	si,ds:[si]

	xor	ax,ax
	mov	ds:[si],ax
	mov	ds:[si+2],ax
	mov	ds:[si+4],ax
IFDEF DTEX
; have to initialize a few more things here..
; set up the guts of the interrupt controller.

	;/* set up the interrupt controller to interrupt */
	mov	al, 011h
	out	PIC0, al	;/* ICW1: ICW4 needed*/
	
	;/* figure out the offset bits t7-t3 */
	mov	al, IRQ0_VEC
	and	al, 0f8h
	out	PIC0+1, al	;/* ICW2: set offset */

	;/* define the cascade IRQ */
	mov	al, BIT2
	out	PIC0+1, al	;/* ICW3: slave on irq2 */

	;/* set the mode.. */
	mov	al, BIT0
	out	PIC0+1, al	;/* ICW4: this is an 8086 */


	;/* same for the slave.. */
	;/* set up the interrupt controller to interrupt */
	mov	al, 011h
	out	PIC1, al	;/* ICW1: ICW4 needed*/
	
	;/* figure out the offset bits t7-t3 */
	mov	al, IRQ0_VEC+8
	and	al, 0f8h
	out	PIC1+1, al	;/* ICW2: set offset */

	;/* define the slave's IRQ */
	mov	al, 02h
	out	PIC1+1, al	;/* ICW3: slave on irq2 */

	;/* set the mode.. */
	mov	al, BIT0
	out	PIC1+1, al	;/* ICW4: this is an 8086 */


	;/* mask everything */
	mov	al, 0ffh
	out	PIC0+1, al
	out	PIC1+1, al

 	;/* this leaves us in fully-nested mode, so we can use */
	;/* a non-specific EOI. Set the master to have IRQ4 as the */
	;/* lowest priority so that the serial line is always highest */
	;/* priority */
	; that doesn't work. Need to set the timer tick to the 
	; lowest priority, which then makes the serial line highest
	; and DMA second.
	; hello, that's a lie too. The way this works is that the next
	; higher interrupt is the highest priority. Set IRQ2 to be
	; the lowest, making IRQ3 the highest.
	mov	al, 0C2h
	out	PIC0, al

ENDIF ;DTEX

;
;  Handle the rest of the initialization from 'c' ...
;
	mov	ax,DGROUP
	mov	ds,ax
	mov	es,ax
	call	_dectalk_main
	hlt

_main	endp
	END 

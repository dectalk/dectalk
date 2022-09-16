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
;*    File Name:	kernel.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  Kernel system entry routines
;*
;***********************************************************************
;*    Revision History:
;* 14dec95	...tek		merge dtex. 
;*
;-

;+
;* notes on the DECtalk Express:
;* The express does kernel calls a little differently than the PC;
;* the PC just uses the INT n mechanism directly; however, on the 
;* express that requires us to punt back to protected mode, figure out
;* what happened, fake the stacks, and fall back into V86 mode - this
;* takes a fair amount of time, and these calls happen VERY often. 
;* So, what we do is fake the interrupt stack right here; it's a little
;* but trust me, it all works..
;-

	title   Kernel system entry routines


	.xlist
	include os_macs.asm
	include c_macs.asm
	.list

_TEXT   segment word PUBLIC 'CODE'
_TEXT   ends
_DATA   segment word PUBLIC 'DATA'
_DATA   ends    
CONST   segment word PUBLIC 'CONST'
CONST   ends    
_BSS    segment word PUBLIC 'BSS'
_BSS    ends    
STACK   segment para STACK 'STACK'
STACK   ends

end_stack       segment para PUBLIC     'STACK'

		public  end_of_stack
end_of_stack    label   word

end_stack       ends


DGROUP  group   _DATA,CONST,_BSS,STACK,end_stack

	.data
	
	extrn   _edata:word

	.data?

	extrn   _end:word

		public  _kernel_share
_kernel_share   dw      2 dup (?)
task_block      dw      2 dup (?)


;+
;  msc externals that are needed to do huge in line math but are seldom
;  used ...
;-

	public  __acrtused
	public  __ahincr
	public  __ahshift

__acrtused      equ     0ffffh
__ahincr        equ     01000h
__ahshift       equ     12
	


	.code


;
;  Each task, including the kernel, starts here.   This file is the 
;  only common .obj file that needs to be linked with each task.
;
		extrn   _main:near
		extrn   _get_share:near


c_far_entry     task_start,do_kernel,tb_off,tb_seg

;
;  zero fill the the bss segment ...
;
	push    es
	mov     ax,DGROUP
	mov     es,ax
	mov     cx,offset DGROUP:_end   ; End of dgroup
	sub     cx,offset DGROUP:_edata ; End of const/initialized data
	mov     di,offset DGROUP:_edata
	xor     ax,ax
	cld
	rep     stosb                   ; Zero fill segment
	pop     es

	cmp     do_kernel,0             ; Kernel start (true or false)
	je      start_task              ; Nope
;
;  set the kernel context ...
;
	cli
	mov     ax,DGROUP
	mov     ds,ax
	mov     es,ax
	mov     ss,ax
	mov     sp,offset DGROUP:end_of_stack
	jmp     _main                   ; Yep

;
;  tasks startup assumes ds, mapped to the task segment, caller stack, and
;  es just about anything ...  (use es==ds, for cleanliness) ...
;

start_task:

	push    es
	mov     ax,DGROUP
	mov     ds,ax
	mov     es,ax

	call    _get_share
	mov     _kernel_share,ax
	mov     _kernel_share+2,dx

	mov     ax,tb_off
	mov     task_block,ax
	mov     ax,tb_seg
	mov     task_block+2,ax

	push    offset DGROUP:end_of_stack
	push    DGROUP
	call    _main
	add     sp,4

	pop     es

exit    task_start

	extern  _free:far
	extern  _kill_process:far

c_far_entry     task_exit

	cli                             ; Block interrupts

	push    task_block+2            ; Free memory block                     
	push    task_block
	call    _free
	add     sp,4
	call    _kill_process           ; Kill this process


exit            task_exit

;
;  Kernel services are basically a small model entry mode without
;  having to save the bp.  The kernel dispatch code automatically
;  saves ds,es,si,di ...
;

	option language:c
	entry = 0

service macro   pname

pname   proc    near

	push    bp
	mov     bp,sp
IFDEF DTEX
; rather than directly use the INT n mechanism, fake the interrupt here. 
; Takes more space, but avoids the actual interrupt which would send
; us back into protected mode to do essentially the same thing in a much
; more convoluted way.. (note that the non-express code will *work*, but
; they aren't fast enough to deal with the huge call rate caused by all
; those single-character get_/put_/read_/write_ calls..
;
;; on the 386 system, passing the interrupt through is a slow process. So,
;; we'll hack this to make it just do a far call that looks like an interrupt.
;; unfortunately, that's not so easy. to be completely undetectable, we have
;; to build a stack frame and retf to do the call; otherwise we end up with
;; a seg reg and/or an index reg that we've stepped on.

	pushf	; for the eventual iret
	push	di
	push	es

	mov	di, ks_vector*4
	xor	bx, bx
	mov	es, bx	; point to low memory
	push	es:[di+2]	; get vector onto stack.
	push	es:[di]
	; that put the vector at TOS, so when we retf we'll jump there.

	; restore es, di
	mov	bx, [bp-6]
	mov	es, bx
	mov	bx, [bp-4]
	mov	di, bx

	; now, flub up the stack so that the IRET at the end of the ISR
	; lands back here. We already put the flags where they belong..
	mov	bx, cs
	mov	[bp-4],bx
	mov	bx, offset back
	mov	[bp-6],bx
	mov	bx,entry
	; ok, what do we have here on the stack?
	; SP-> 	ip(handler)
	;	cs(handler)
	;	ip(back)
	;	cs(back)
	;	flags
	; BP->

	; an INT n instruction clear ints, so we do same..
	cli

	retf

back:	pop	bp
	ret

ELSE ;DTEX
	mov     bx,entry
	int     ks_vector       

	pop     bp
	ret
ENDIF ;dtex
pname   endp

	entry = entry +2

		endm


;
;  Note, the service macro is redefined from the isr routine to allow
;  the same table to be copied to the kernel module, the order in the
;  table defines the dispatch value ...
;

	include servs.asm

	
	end     task_start

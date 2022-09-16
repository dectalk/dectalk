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
;*    File Name:	os.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Kernel system routines
;*
;***********************************************************************
;*    Revision History:
;* 14dec95	...tek		merge dtex
;*
;-

	title	Kernel system routines

	.xlist
	include os_macs.asm
	include c_macs.asm
	.list

	pcb_defs
	queue_defs
	kernel_data

	.stack
	.code

;+
;  init_pcbs is used to link all the pcb onto the free list.
;-

c_near_entry	_init_pcbs


	mov	ax,seg run_list
	mov	ds,ax
	mov	di,offset run_list
	xor	ax,ax
	mov	cx,16
	cld

init_runlist:
	stosw
	loop	init_runlist

	mov	si,offset run_list
	stosw
	stosw

	mov	si,offset free_list
	stosw
	stosw

	mov	bx,seg pcbs
	mov	es,bx
	mov	bx,offset pcbs
	mov	cx,pcb_count

init_loop:

	mov	ax,seg free_list
	mov	ds,ax
	mov	si,offset free_list

	call	enqueue 

	add	bx,pcb_size
	loop	init_loop

exit		_init_pcbs

;+
; schedule restores the highest priority process to run state.  This always
; assumes there is atleast the null process ready to run.  Interrupts are 
; assumed to be blocked at this point.
;-

		public	schedule
		public	context_restore

schedule	proc

	mov	ax,seg run_list
	mov	ds,ax
	mov	si,offset run_list		; Point to the run list
find_job:
	cmp	word ptr [si],0			; Is there a process ready
	jne	context_restore			; Yep, start it up
	cmp	word ptr [si+2],0
	jne	context_restore
	add	si,4
	jmp	short find_job			; Find a non-empty queue


context_restore	proc	near

	call	dequeue				; Get the first process
	mov	sp,pcb$saved_sp			; Restore stack fram
	mov	ax,pcb$saved_ss
	mov	ss,ax

	mov	ax,SEG current_process		; Make it current
	mov	ds,ax
	mov	si,offset current_process

	mov	ax,es
	mov	ds:[si],bx
	mov	ds:[si+2],ax

	pop	bp				; Restore context frame
	ret					; Back to caller

context_restore	endp
schedule	endp

;+
;  start up the kernel ...
;-

c_near_entry	_start_kernel

	pushf
	cli
	jmp	schedule     			; Go do a schedule

exit		_start_kernel

;+
;  block is used to place the current process on the desired queue and
;  run a scheduler pass ... if no queue is specified, the process is
;  placed back on it's own run list ...
;-

which_queue	equ	<dword ptr ss:[bp+4]>

c_sys_entry	block,q_off,q_seg

	cmp	q_off,0
	jne	user_queue
	cmp	q_seg,0
	jne	user_queue

	pcb_pointer
	lds	si,pcb$priority
	jmp	do_block

user_queue:

	lds	si,which_queue

do_block:

	call	context_switch

exit	block

;+
; context_switch is used to save the context of the current process and
; start running the next highest priority process
;-

		public	context_switch
context_switch	proc	near	

	push	bp				; Save context frame

	mov	bx,SEG current_process
	mov	es,bx
	les	bx,es:current_process

	mov	pcb$saved_sp,sp
	mov	ax,ss
	mov	pcb$saved_ss,ax

	mov	ax,DGROUP
	mov	ss,ax
	mov	sp,offset DGROUP:end_of_stack

	call	enqueue
	jmp	schedule

context_switch 	endp

;
;  simple null task ...
;

c_far_entry	_null

null_loop:
IFDEF DTEX
	; we can put the cpu into snooze mode here..
	; the ensysck bit is controlled by the DSP
	; sleep/wake functions.. it has to be 1 whenever 
	; the DSP is doing DMA..
	nop
	mov	dx, 0ech
	mov	ax, 013h
	pushf			; interrupts off.
	cli
	out	dx, al
	mov	dx, 0edh
	in	al, dx
	and	al, 087h	; mask out the divider..
	or	al, 0b9h	; sleep bit | ensysclk | /256

	out	dx, al
			; put back a dummy value..
	mov	dx, 0ech
	mov	ax, 01ch
	out	dx, al		; so nobody accidentally steps on it..
	popf			; interrupts back.
	nop
	nop
ENDIF
	jmp	null_loop

exit		_null


;
;  cross segment pointer call
;

routine		equ	<dword ptr ss:[bp+4]>
c_near_entry	_do_call,r_off,r_seg

	call	routine

exit		_do_call

;
;  allow a process to adjust it's priority ...
;

c_sys_entry	adjust_priority,proc_pri

	pcb_pointer
	mov	ax,seg run_list
	mov	pcb$pque_seg,ax
	mov	ax,proc_pri
	shl	ax,2
	mov	cx,offset run_list+28
	sub	cx,ax
	mov	pcb$pque_off,cx

exit	adjust_priority



	end

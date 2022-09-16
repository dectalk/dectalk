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
;*    File Name:	isr.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Interrupts and dispatchers
;*
;***********************************************************************
;*    Revision History:
;* 14dec95	...tek		merge dtex
;* 09apr96	...tek		fix no-sem interrupt dismiss.
;*
;-

	title	Interrupts and dispatchers

	.xlist
	include os_macs.asm
	include c_macs.asm
	include 186_macs.asm
	.list

	pcb_defs
	_186_regs
	queue_defs
	process_defs
	mem_map

	.stack
	.code


	extrn	block:near
	extrn	signal_semaphore:near
	extrn	kernel_dispatch:near

;
;  local macros ...
;

set_disp	macro	servnum,loc	

	mov	word ptr es:[bx+servnum],offset _text:loc

	endm

bld_disp	macro	cnt

	val = 0
	rept	cnt
	  push	es
	  push	ds
	  pusha
	  mov	cx,val
	  jmp	isr_dispatch
	  val = val + 1
	endm
		endm

	even
;
;  place the dispatch table up front ...
;

isr_table:

	bld_disp vector_size


c_near_entry	_init_dispatch

;
;  Set up the low vector space to point at the default dispatcher ...
;
	cld
	xor	di,di
	mov	es,di
	mov	bx,seg isr_table
	mov	dx,offset isr_table
	mov	cx,vector_size

set_vector_space:

	mov	ax,dx
	stosw	
	mov	ax,bx
	stosw
	add	dx,9
	loop	set_vector_space

;
;  set up the hardwired interrupt routines ...
;
	
	xor	bx,bx
	mov	word ptr es:[bx+ks_vector*4],offset kernel_dispatch
	mov	word ptr es:[bx+ks_vector*4+2],seg kernel_dispatch


;
;  init the dispatch table, the connected isr table, and the connected
;  semaphore table ...
;
	xor	ax,ax
	cld

	mov	di,seg conn_isr_table
	mov	es,di
	mov	di,offset conn_isr_table
	mov	cx,isr_table_size
	rep	stosw

	mov	di,seg conn_sem_table
	mov	es,di
	mov	di,offset conn_sem_table
	mov	cx,sem_table_size
	rep	stosw

exit	_init_dispatch


;
;  _connect_int is used to connect an interrupt service routine
;  to a harware interrupt ...  isrs are dispatched to on the kernel
;  stack with ds set to the startup data segement (pcb$saved_ds)
;  for the process, if current_process is 0, then assume kernel
;  default data segment ...
;

c_sys_entry	connect_int,vect,routine_off,routine_seg


	mov	bx,seg current_process
	mov	es,bx
	mov	bx,offset current_process
	cmp	word ptr es:[bx],0
	jne	get_ds
	cmp	word ptr es:[bx+2],0
	jne	get_ds
	mov	dx,DGROUP
	jmp	load_isr

get_ds:

	les	bx,es:[bx]
	mov	dx,pcb$saved_ds

load_isr:


	mov	bx,SEG conn_isr_table
	mov	es,bx
	mov	bx,offset conn_isr_table

	mov	ax,vect
	shl	ax,2
	add	ax,vect
	add	ax,vect
	add	bx,ax

	mov	ax,routine_off
	mov	word ptr es:[bx],ax
	mov	ax,routine_seg
	mov	word ptr es:[bx+2],ax
	mov	word ptr es:[bx+4],dx

exit	connect_int

;
;  connect_sem is used to connect a semaphore to a harware interrupt ...
;

c_sys_entry	connect_sem,vect,sem_off,sem_seg


	mov	bx,SEG conn_sem_table
	mov	es,bx
	mov	bx,offset conn_sem_table

	mov	ax,vect
	shl	ax,2
	add	bx,ax

	mov	ax,sem_off
	mov	word ptr es:[bx],ax
	mov	ax,sem_seg
	mov	word ptr es:[bx+2],ax


exit	connect_sem


;
;  isr_dispatch is used to dispatch to a user isr or to signal a
;  semaphore on an interrupt.  Assume the stack is set as follows:
;
;      sp --> 
;             di
;             si
;             bp
;             <temp>
;             bx
;             dx
;             cx
;             ax
;	      ds
;             es
;             ip
;             cs
;
;  cx == which isr
;
		extrn	isr_signal:near
		public	isr_dispatch
isr_dispatch	proc

;
;  Switch to the kernel stack ...  save callers frame pointer on stack
;

	push	offset isr_exit
	push	bp

	pcb_pointer
	mov	pcb$saved_sp,sp

	mov	ax,DGROUP
	mov	ss,ax
	mov	sp,offset dgroup:end_of_stack

IFNDEF DTEX
;
;  hack, hack, hack, hack ... do a special release on int 13 for now ...
;
	cmp	cx,13			; Is this the special one
	jne	check_conn_isr
	port_out	RAM_ENABLE,0	
ENDIF ;DTEX
;
;  check the isr table ...
;

check_conn_isr:

	mov	ax,seg conn_isr_table
	mov	es,ax
	mov	si,offset conn_isr_table

;
;  compute the table offsets ... ax == bx*6, cx == bx*4
;
	shl	cx,1		; cx = vect*2
	mov	bx,cx		; bx = vect*2
	shl	cx,1		; cx = vect*4
	add	bx,cx		; bx = vect*6

	cmp	word ptr es:[si+bx],0
	jne	do_isr
	cmp	word ptr es:[si+bx+2],0
	je	check_sem


;
;  if there is an isr, call it with all registers preserved.  Check
;  to see it a context switch is needed on return.  If more than a 
;  non-specific eoi is needed, then the isr must do it ...
;

do_isr:

	mov	ax,word ptr es:[si+bx+4]
	mov	ds,ax
	call	dword ptr es:[si+bx]
IFDEF DTEX
        port_outb  020h,020h
ELSE
        port_out        _186_eoi,08000h
ENDIF ;DTEX
	jmp	do_switch

;
;  if no isr, check for a semaphore to signal ...
;

check_sem:

	mov	ax,seg conn_sem_table
	mov	es,ax
	mov	si,offset conn_sem_table

	mov	bx,cx
	cmp	word ptr es:[si+bx],0
	jne	do_sem
	cmp	word ptr es:[si+bx+2],0
	jne	do_sem
;
;  if no sem either, then just do an dismiss this ...
;
IFDEF DTEX
        port_outb  020h,020h
ELSE	
	port_out	_186_eoi,08000H
ENDIF	;DTEX*/

	pcb_pointer
	mov	ss,pcb$saved_ss
	mov	sp,pcb$saved_sp
	; 040996
	pop	bp
	ret
;
;  This address is pushed on the stack when the routine is first
;  entered, it is called when a) no isr or sem is found, b) no
;  switch is needed or c) after a blocked process switches back
;  in.

isr_exit:

	popa
	pop	ds
	pop	es
	iret

;
;  if there is a semaphore to signal, go do the signal.  If a 
;  higher priority process has become runable, block the current
;  and start the higher.
;

do_sem:

	lds	si,es:[si+bx]
	call	isr_signal
IFDEF DTEX
        port_outb  020h,020h
ELSE
	port_out	_186_eoi,08000h
ENDIF ;/*DTEX*/

;
;  do_switch is used to block the currently running process and
;  switch to a higher priority one that may be running.
;

do_switch:

	pcb_pointer			; es:[bx] --> pcb

	mov	ax,seg run_list
	mov	ds,ax
	mov	si,offset run_list

find_higher:
	
	cmp	pcb$pque_off,si
	je	no_switch

	cmp	word ptr [si],0
	jne	switch_it
	cmp	word ptr [si+2],0
	jne	switch_it

	add	si,4
	jmp	find_higher

no_switch:

	mov	ss,pcb$saved_ss
	mov	sp,pcb$saved_sp
	pop	bp
	ret

switch_it:

;
;  if we need to switch out here, save the thread to the new queue
;  save the old process, restore the thread and take off ...
;


	push	ds
	push	si
	lds	si,pcb$priority
	call	enqueue

	pop	si
	pop	ds
	jmp	context_restore

isr_dispatch	endp


end




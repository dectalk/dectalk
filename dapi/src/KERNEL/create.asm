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
;*    File Name:	create.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Process/task creation routines 
;*
;* On tasks and processes ...
;*
;* The kernel has been extended to support tasks and processes.  A task
;* is an independently loaded entity that gets ram allocated for it via
;* the kernel.  A process is something that is started by a task and runs
;* out of shared task code and data space.  All processes with-in a task
;* (including the kernels) share common cs,ds,es mapping have have only
;* unique stack segments ...
;*
;*
;***********************************************************************
;*    Revision History:
;*
;-

	title Process/task creation routines 

	.xlist
	include os_macs.asm
	include c_macs.asm
	.list

	pcb_defs
	queue_defs
	process_defs
	.stack

;+
;  create_process_ is used to create a process.  'c' calling conventions are
;  used, so call with ...
;
;              push	<starting off>
;              push	<starting seg>
;              push     <priority>
;	       push	<stack_seg>
;              push     <stack_size>
;              push     <number of parameters>
;              push     <parameter 0>
;                .
;                .
;                .
;              push     <parameter n-1>
;              call	create_process_
;              add	sp,n+8
;
;  The function returns true (address of pcb) if the process is created 
;  and false (0) if no pcb's were available to start the process.  The 
;  process is linked on the run list but is not started by this call.
;
;  Processes differ from tasks in that a process owns only the ram associated
;  with its stack, where as a process own all the code and data ram as well
;  as the stack ram. 
;-
;-

	extrn	_malloc:near
	extrn	_free:near

c_sys_entry	create_process,proc_off,proc_seg,proc_pri,stack_seg,ssize,nparams

	push	dx			; Save the callers ds ... passed via
					;   kernel in dx

	mov	ax,seg free_list
	mov	ds,ax
	mov	si,offset free_list
	call	dequeue

	pop	dx			; Recover the ds

	mov	ax,es			; If no pcb available, then exit
	and	ax,ax
	jnz	get_stack
	and	bx,bx
	jnz	get_stack

	mov	ax,1			; No pcb ...
	jmp	done_create

;
;  Now, the caller can either get a stack segment allocated (call with
;  stack_seg=0, or use one ...
;

get_stack:

	mov	pcb$saved_ds,dx		; Initial ds 
	mov	ax,stack_seg		; See if there is a default segment
	and	ax,ax			; If not, allocate one for the caller.
	jz	allocate_stack

	mov	pcb$saved_ss,ax
	mov	ax,ssize
	mov	pcb$saved_sp,ax
	xor	ax,ax
	mov	pcb$mem_seg,ax
	mov	pcb$mem_off,ax
	jmp	fill_pcb

allocate_stack:

 	mov	ax,ssize		; Get the stack size
	add	ax,64			; Add room for start, exit, etc.
	mov	pcb$saved_sp,ax		; Save the very tos

	push	es			; Save the pcb address
	push	bx

;
; Now, allocate the paras
;
	shr	ax,4			; Make into paras
	push	ax

	call	_malloc
	add	sp,2

	pop	bx			; Recover pcb
	pop	es

	mov	pcb$mem_off,ax
	mov	pcb$mem_seg,dx
	mov	pcb$saved_ss,dx		; Allocated segment is stack maybe
	and	dx,dx			; Was there  ??
	jnz	fill_pcb	

	mov	ax,seg free_list	; No, return pcb
	mov	ds,ax
	mov	si,offset free_list
	call	enqueue

	mov	ax,2			; Set reason for fail
	jmp	done_create


;
; Place the process on the proper run list ...
;

fill_pcb:

	mov	ax,seg run_list
	mov	pcb$pque_seg,ax
	mov	ax,proc_pri
	shl	ax,2
	mov	cx,offset run_list+28
	sub	cx,ax
	mov	pcb$pque_off,cx	   

;
;  Point es:[di] at the processes stack ... pcb pointer is held in
;  dx:bx for the time being
;				    
	mov	dx,es
	mov	ax,pcb$saved_ss
	mov	di,pcb$saved_sp
	mov	es,ax
	sub	di,2
;
; Copy callers stack parameters to the new processes ...
;
	mov	cx,nparams	  	; Load up the param count
	jcxz	set_stack	  	;   if none, skip the load

	mov	ax,ss			; Point at callers stack
	mov	ds,ax
	lea	si,nparams	  	; Point to the first param-2
	add	si,cx		  	; Point to the last
	add	si,cx			;   (always words)
	std				; Push the stuff down
	rep movsw			; Move the words	
;
;  Set the return address to the delete_proc routine and push the rest of
;  the start up data onto the stack
;  

set_stack:

	mov	word ptr es:[di],seg delete_process
	mov	word ptr es:[di-2],offset delete_process
	mov	word ptr es:[di-4],200H		; Push the flag word
	mov	ax,proc_seg
	mov	es:[di-6],ax			; Push the segment
	mov	ax,proc_off			; Get and 
	mov	es:[di-8],ax			;   push the start address
	sub	di,10				; Bump up di
	std					; Set the storage direction

	push	es				; Get back default es,ds
	mov	es,dx
	mov	ax,pcb$saved_ds	
	pop	es

set_segs:

	stosw					;   so that es=ds!=ss on
	stosw					;      call (compact model)
	mov	cx,8				;    and init the register
	xor	ax,ax				;      storage area to zero
	rep stosw				
	mov	ax,offset process_start		; Process start point
	stosw
	xor	ax,ax				; Fake the bp frame
	stosw
	add	di,2		  		; Adjust back for stack address

;
;  Now recover the pcb pointer and set the starting stack offset 
;  into it, then link the pcb onto the proper run list ...
;

	mov	es,dx
	mov	pcb$saved_sp,di
	lds	si,pcb$priority
	call	enqueue
	mov	ax,0				

done_create:

exit	create_process


;+
;  load_task_ is used to call the initialization routine of a task to
;  allow it to create processes, pipe, semaphore, initialize local 
;  data, etc.
;
;              push	cs
;	       push	ip
;	       push	ss
;	       push	sp
;              call	load_task_
;              add	sp,8
;
;  The task init process runs a kernel priority with its own stack (to
;-


c_sys_entry	load_task,tsk_cs,tsk_ip,tsk_ss,tsk_sp

	mov	ax,tsk_cs
	mov	bx,tsk_ip
	mov	cx,tsk_ss
	mov	sp,tsk_sp
	mov	ss,cx

	push	cs
	push	offset done_load
	push	ax
	push	cx
	retf

done_load:

exit		load_task

;+
; kill_process frees the current pcb ... the process is assumed to have
; freed all of its resources by this point ...
;-

c_sys_entry	kill_process

	cli		     			; Block interrupts
	mov	ax,DGROUP
	mov	ss,ax
	mov	sp,offset DGROUP:end_of_stack
	pcb_pointer
	mov	ax,seg free_list
	mov	ds,ax
	mov	si,offset free_list
	call	enqueue
	jmp	schedule

exit	kill_process



;+
;  delete_process is used to remove the current process from the run list
;  and start the next highest priority process.
;-

		public	delete_process
delete_process	proc	far

	cli		     			; Block interrupts

;
;  Switch to kernel stack ...
;

	mov	ax,DGROUP
	mov	ss,ax
	mov	sp,offset DGROUP:end_of_stack

;
;  Free the stack space ...
;

	pcb_pointer
	mov	ax,pcb$mem_seg
	and	ax,ax
	jz	free_pcb

free_mem:
	
	push	pcb$mem_seg
	push	pcb$mem_off
	call	_free
	add	sp,4
;
;   ... and the pcb ...
;

free_pcb:

	pcb_pointer
	mov	ax,seg free_list
	mov	ds,ax
	mov	si,offset free_list
	call	enqueue

;
;  .... and do what ever is next ....
;

	jmp	schedule

delete_process	endp


;
;  Stub to start the process for the first time ...
;

process_start	proc	near

	popa
	pop	es
	pop	ds
	iret

process_start	endp


	end

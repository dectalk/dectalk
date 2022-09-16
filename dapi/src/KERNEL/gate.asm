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
;*    File Name:	gate.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Process gate control
;*
;***********************************************************************
;*    Revision History:
;*
;-

	title	Process gate control

	.xlist
	include	os_macs.asm
	include	c_macs.asm
	.list

	pcb_defs
	gate_defs
	queue_defs
	process_defs

	.code

;+
;  process control gates are sort of like fancy semaphores but cause all
;  registered gate users to be collected so that the caller can ensure
;  some process synchronization of multiple tasks.  This is done via a
;  kernel call to all some non specific number of tasks to attach to a
;  gate.
;-

gate_pointer	equ	<dword ptr ss:[bp+4]>

;
;  init the gate data structure ...
;

c_sys_entry	gate_init

	lds	si,gate_pointer
	mov	gate$state,GATE_IS_OPEN
	mov	gate$value,0
	mov	gate$block_off,0
	mov	gate$block_seg,0
	mov	gate$wait_off,0
	mov	gate$wait_seg,0

exit		gate_init

;
;  gate_register is used to say you'll play the gate game ...
;

c_sys_entry	gate_register

	lds	si,gate_pointer
	inc	gate$value

exit		gate_register

;
;  undo the above
;

c_sys_entry	gate_deregister

	lds	si,gate_pointer
	dec	gate$value

exit		gate_deregister


;
;  if you enter a closed gate, you block if not you run ...
;

c_sys_entry	gate_entry

	lds	si,gate_pointer
	cmp	gate$state,GATE_IS_OPEN
	je	entry_exit
;
;  if the gate was closed, decrement the value and wake up the first
;  sleeper on the blocked queue ...
;
	dec	gate$value
	jnz	entry_wait

	add	si,gate_b_off	       		; Point at the closer list
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			; Pick up the run lis			
	call	enqueue				;     queue it		
;
;  block now on the wait queue  
;

entry_wait:

	lds	si,gate_pointer			; Point back at qate
	add	si,gate_w_off			;   now queue
	call	context_switch			;     block
	lds	si,gate_pointer			; back to the gate
	inc	gate$value			;   bump back the value

entry_exit:

exit		gate_entry

;
;   Open a closed gate ... if the block queue is empty (only one close
;   request, open the gate and let every one run, if not, unblock the
;   head of whoever is there and block this process back on wait queue.
;

c_sys_entry	gate_open

	lds	si,gate_pointer
	cmp	gate$block_off,0
	jne	no_open
	cmp	gate$block_seg,0
	jne	no_open
;
;  open the gate by unblocking the entire wait queue ...
;
	mov	gate$state,GATE_IS_OPEN

open_the_gate:

	lds	si,gate_pointer
	cmp	gate$wait_off,0
	jne	open_unblock
	cmp	gate$wait_seg,0
	je	open_exit

open_unblock:

	add	si,gate_w_off
	call	dequeue
	lds	si,pcb$priority
	call	enqueue
	jmp	open_the_gate
;
;  if we still stay closed, then unblock some waiter on the close queue
;  and place this caller on the waiter queue ...
;
	
no_open:

	add	si,gate_b_off	       		; Point at the closer list
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			; Pick up the run lis			
	call	enqueue				;     queue it		
	lds	si,gate_pointer			; Point back at qate
	add	si,gate_w_off			;   now queue
	call	context_switch			;     block
	lds	si,gate_pointer
;
;  when we exit place the gate value back up by one 
;

open_exit:
	
	inc	gate$value			;   bump back the value

exit		gate_open

;
;  finally, when we close a gate the calling process goes on the block
;  queue and the state is set to shut ...  note that an open call must
;  be done to restore the gate values to their proper state
;

c_sys_entry	gate_close

	lds	si,gate_pointer
	mov	gate$state,GATE_IS_CLOSED
	add	si,gate_b_off
	call	context_switch

exit		gate_close

	end


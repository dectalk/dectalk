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
;*    File Name:	sema.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Semaphore manipulation routines
;*
;***********************************************************************
;*    Revision History:
;*
;-

	title	Semaphore manipulation routines

	.xlist
	include	os_macs.asm
	include	c_macs.asm
	.list

	pcb_defs
	semaphore_defs
	queue_defs
	process_defs

	.code
;
;  _wait_semaphore is the 'c' compatable wait_semaphore call.
;


sem_pointer	equ	<dword ptr ss:[bp+4]>

c_sys_entry	wait_semaphore

	lds	si,sem_pointer

	cmp	sem$value,0H		; Do I need to switch out 
	je	switch_out		; Yep
	dec	sem$value		; Nope, decrement and just
	jmp	done_wait
	
switch_out:

	add	si,sem_off
	call	context_switch

done_wait:


exit	wait_semaphore


;+
;  _signal_semaphore is the 'c' compatable signal semaphore routine.
;-
		public	isr_signal
c_sys_entry	signal_semaphore

	lds	si,sem_pointer

isr_signal	proc	near

	inc	sem$value		; Do the signal
	jnz	de_queue       		; If no roll, check queue
	dec	sem$value		;   if so, set it back

de_queue:

	cmp	sem$seg,0H 	 	; Something there ???
	jne	un_block	    	; Yep, dequeue and enqueue
	cmp	sem$off,0H
	jne	un_block
	jmp	done_signal

un_block:

	dec	sem$value
	add	si,sem_off	       		; Point at the waiter
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			
	call	enqueue				;     queue it		

done_signal:

isr_signal	endp
exit		signal_semaphore

	end



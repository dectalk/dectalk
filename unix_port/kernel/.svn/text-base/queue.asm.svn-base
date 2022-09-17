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
;*    File Name:	queue.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Kernel system queue routines
;*
;***********************************************************************
;*    Revision History:
;*
;-

	title	Kernel system queue routines

	.xlist
	include os_macs.asm
	include c_macs.asm
	.list

	pcb_defs
	semaphore_defs
	process_defs


	.code

;
;  kernel_enqueue(queue,entry) does a 32bit queue operation based
;  on far pointers ...
;

queue_pointer	equ	<dword ptr ss:[bp+4]>
entry_pointer	equ	<dword ptr ss:[bp+8]>

c_sys_entry	kernel_enqueue

	les	bx,entry_pointer
	lds	si,queue_pointer
	call	enqueue

exit		kernel_enqueue


;
;  helper routines ...
;
		public	enqueue
enqueue		proc	near

	xor	ax,ax
	mov	es:[bx],ax
	mov	es:2[bx],ax

;
;  search queue to end ...
;

queue_search:

	cmp	word ptr ds:[si],0h
	jne	queue_next
	cmp	word ptr ds:[si+2],0h 		; Insert here ?
	je	queue_insert			; Yep, go insert

queue_next:

	lds	si,dword ptr ds:[si]		; No, get the next pointer
	jmp	short queue_search		;    and check

queue_insert:

	mov	ds:[si],bx
	mov	ax,es
	mov	ds:[si+2],ax 

	ret

enqueue	endp

;
;  kernel_dequeue(queue) gets the first entry off the queue ...
;


c_sys_entry	kernel_dequeue


	lds	si,queue_pointer
	call	dequeue
	mov	dx,es
	mov	ax,bx

exit	kernel_dequeue


		public	dequeue
dequeue		proc	near

	les	bx,ds:[si]
	mov	ax,es:[bx]
	mov	ds:[si],ax
	mov	ax,es:2[bx]
	mov	ds:2[si],ax
	ret

dequeue		endp


;
;  _wait_queue(queue_sem) waits until there is a packet available in the
;  packet queue ...
;

qs_head			equ	0
qs_tail			equ	4
qs_process		equ	8

c_sys_entry	wait_queue

;
;  see if we can take a packet ...
;

check_take:

	lds	si,queue_pointer
	cmp	word ptr ds:[si],0
	jne	take_packet
	cmp	word ptr ds:2[si],0
	jne	take_packet

	add	si,qs_process
	call	context_switch
	jmp	check_take

take_packet:

	les	bx,dword ptr ds:[si]	; es:bx --> packet

;
;  now the update the head
;

	mov	ax,es:[bx]	   
	mov	ds:[si],ax
	mov	dx,es:[bx+2]
	mov	ds:[si+2],dx

	and	ax,ax
	jnz	take_done
	and	dx,dx
	jnz	take_done

;
;  if queue empty, point the tail at the head ...
;

	mov	ds:[si+4],si
	mov	ds:[si+6],ds

take_done:

	mov	ax,bx
	mov	dx,es

exit		wait_queue

;
; _signal_queue(queue_sem) is used to put a packet back on the packet
; queue ...
;

c_sys_entry	signal_queue

	lds	si,queue_pointer
	les	bx,entry_pointer
	mov	ax,0		       		; Assume no unblock
;
;  check to see if we unblock ...
;
	cmp	word ptr ds:qs_process[si],0
	jne	signal_unblock
	cmp	word ptr ds:qs_process+2[si],0
	je	add_packet

signal_unblock:

	add	si,qs_process
	call	dequeue
	lds	si,pcb$priority			
	call	enqueue

	mov	ax,1
	lds	si,queue_pointer
	les	bx,entry_pointer

add_packet:

	mov	es:[bx],si  		; store head here for now 
	mov	es:[bx+2],ds		;

	lds	si,dword ptr ds:[si+4]	; ds:si --> old tail

	mov	ds:[si],bx		; thread on 
	mov	ds:[si+2],es		;   new packet

	lds	si,dword ptr es:[bx]	; ds:si --> head

	mov	ds:[si+4],bx		; Update tail
	mov	ds:[si+6],es

	mov	word ptr es:[bx],0	; end queue
	mov	word ptr es:[bx+2],0

exit		signal_queue

	end

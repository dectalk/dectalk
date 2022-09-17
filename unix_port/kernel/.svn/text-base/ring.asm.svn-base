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
;*    File Name:	ring.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  rings are similar to pipes except that pipes deal with blocks of words
;*  and rings deal with a single character at a time ...
;*
;***********************************************************************
;*    Revision History:
;* 14dec95	...tek		merge DTEX (this mostly involves making
;*				things interrupt-safe..)
;*
;-

	title	Ring support routines

        dosseg

	.xlist
	include os_macs.asm
	include c_macs.asm
	include 186_macs.asm
	.list

	_186_regs
	mem_map
	kernel_data
	ring_defs
	process_defs
	pcb_defs
	queue_defs

        .code

;
;  create_ring(bytes) creates a byte ring of size bytes ...
;

	extrn	_malloc:near

c_sys_entry	create_ring,make_size

	mov	ax,make_size
	add	ax,ring_bytes		; Add in the control head
	shr	ax,4			; Now paras
	inc	ax			;  with slop

	push	ax
	call	_malloc
	add	sp,2

	and	dx,dx	   		; If there wasn't enough
	jne	init_ring		;   ram return null
	and	ax,ax
	je	done_create

init_ring:

	mov	ds,dx
	mov	si,ax
	xor	ax,ax

	mov	ring$get_off,ax
	mov	ring$get_seg,ax
	mov	ring$put_off,ax
	mov	ring$put_seg,ax
	mov	ring$lock_off,ax
	mov	ring$lock_seg,ax
	mov	ring$count,ax
	mov	ring$head,ax
	mov	ring$tail,ax
	mov	ring$key,ax
	mov	ax,make_size
	mov	ring$size,ax

	mov	dx,ds
	mov	ax,si

done_create:

exit	create_ring



;
;  get a character from the input ring buffer ...
;

ring_pointer	equ	<dword ptr ss:[bp+4]>
a_char		equ	<dword ptr ss:[bp+8]>
	
c_sys_entry	get_ring

get_lock:

	lds	si,ring_pointer
	cmp	ring$key,0
	je	wait_char
	add	si,ring_lock_off
	call	context_switch
	jmp	short get_lock
	
wait_char:

	cmp	ring$count,0			; Any there
	jne	return_char			; Yep, take it
	add	si,ring_get_off			; Nope, block
	call	context_switch
	jmp	short get_lock

return_char:
	; remember the int flag so we can tell if we have to turn
	; ints back on..
	pushf
	cli			; NO INTERRUPTS!!
	dec	ring$count			; One less now
	mov	bx,ring$tail	 		; Point at tail
	inc	ring$tail			; New tail
	mov	ax,ring$tail			;   get it
	cmp	ax,ring$size	 		; At max ?
	jne	get_char			; Nope
	mov	ring$tail,0			; Yep, wrap back

get_char:

	mov	al,ring$char			; Get the character
	les	bx,a_char			; Point at where it goes
	popf			; interrupts are back..
	mov	es:[bx],al			; Return it


;
;  get if there is someone waiting to write in ...
;


	cmp	ring$put_off,0
	jne	get_unblock
	cmp	ring$put_seg,0
	je	get_done

get_unblock:

	add	si,ring_put_off	       		; Point at the waiter
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			
	call	enqueue				;     queue it

get_done:

	lds	si,ring_pointer			; Return full count
	mov	ax,ring$count

exit		get_ring

;
; put a character into the ring buffer ...
;

c_sys_entry	put_ring


put_lock:

	lds	si,ring_pointer			; Point at ring
	cmp	ring$key,0			; Locked ?
	je	put_check
	add	si,ring_lock_off
	call	context_switch
	jmp	short put_lock

put_check:
	; have to turn off interrupts here, because we could overflow
	; between the check and the add.. 
	pushf
	cli			; NO INTERRUPTS!
	mov	ax,ring$size
	cmp	ax,ring$count
	jne	put_start
	; we have to restore ints here..
	popf			; interrupts back on..
	add	si,ring_put_off
	call	context_switch
	jmp	short put_lock

put_start:

	les	bx,a_char			;   and char
	mov	dl,es:[bx]			; Char lives in dl

	inc	ring$count
	mov	bx,ring$head
	inc	ring$head
	mov	ax,ring$head
	cmp	ax,ring$size
	jne	put_char
	mov	ring$head,0

put_char:

	mov	ring$char,dl
	popf			; interrupts back on..
;
;  Now see if there is a waiter ...
;

	cmp	ring$get_off,0
	jne	put_unblock
	cmp	ring$get_seg,0
	je	put_done

;
;  unblock a waiter here ...
;

put_unblock:

	add	si,ring_get_off	       		; Point at the waiter
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			
	call	enqueue				;     queue it		

put_done:			   		; Return the free count

	lds	si,ring_pointer
	mov	ax,ring$count

exit		put_ring


;
;  flush_ring() is used to flush the data from the ring ...
;

c_sys_entry	flush_ring

	pushf
	cli			; no interrupts please
	lds	si,ring_pointer
	mov	ring$count,0
	mov	ring$head,0
	mov	ring$tail,0


flush_check_put:

	lds	si,ring_pointer
	cmp	ring$put_off,0
	jne	flush_unblock_put
	cmp	ring$put_seg,0
	je	flush_done

flush_unblock_put:

	add	si,ring_put_off	       		; Point at the waiter
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			
	call	enqueue				;     queue it
	jmp	short flush_check_put

flush_done:
	popf			; interrupts back on..

exit		flush_ring

;
;  test_ring() is used to return the count value for the ring buffer ...
;

ring_pointer	equ	<dword ptr ss:[bp+4]>
	
c_sys_entry	test_ring

	lds	si,ring_pointer
	mov	ax,ring$count

exit		test_ring


;
;  lock_ring() is used to lock the ring for sequential output ...
;

c_sys_entry	lock_ring


wait_lock:

	lds	si,ring_pointer
	cmp	ring$key,0
	je	got_lock
	add	si,ring_lock_off
	call	context_switch
	jmp	wait_lock

got_lock:
	mov	ring$key,1

exit		lock_ring

;
;  unlock_ring() is used to unlock a locked ring ... note that is unlike
;  a semaphore lock in the all waiting processes are unlocked here so that
;  the highest priority process can grab the ring next ...
;

c_sys_entry	unlock_ring


unlock_spin:

	lds	si,ring_pointer
	cmp	ring$lock_seg,0H
	jne	un_block
	cmp	ring$lock_off,0H
	je	done_unlock

un_block:

	add	si,ring_lock_off
	call	dequeue
	lds	si,pcb$priority
	call	enqueue
	jmp	unlock_spin

done_unlock:

	mov	ring$key,0

exit		unlock_ring

IFDEF DTEX
;*****
; potentially unblock a ring. This is used by the interrupt handler 
; in cases where the ring may have blocked (receive empty or 
; transmit full..)

c_near_entry	_unblock_ring


	lds	si,ring_pointer			; Point at ring


	cmp	ring$get_off,0
	jne	unblock_unblock
	cmp	ring$get_seg,0
	je	unblock_done

;
;  unblock a waiter here ...
;

unblock_unblock:

	add	si,ring_get_off	       		; Point at the waiter
	call	dequeue	       			; Remove the first guy
	lds	si,pcb$priority			
	call	enqueue				;     queue it		

unblock_done:			   		; Return the free count

	lds	si,ring_pointer
	mov	ax,ring$count

exit		_unblock_ring

ENDIF
	end

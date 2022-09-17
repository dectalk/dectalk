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
;*    File Name:	pipe.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*	Pipe read/write/create routines 
;*
;***********************************************************************
;*    Revision History:
;*
;-

 	title	Pipe read/write/create routines 

	.xlist
	include os_macs.asm
	include c_macs.asm
	.list

	queue_defs
	pipe_defs
	pcb_defs
	process_defs

	.code

	extrn	_malloc:near

;
; create_pipe(words) create and initializes a pipe with a buffer
; size of words.
;

c_sys_entry	create_pipe,id,words

	mov	si,seg pipe_queue
	mov	ds,si
	mov	si,offset pipe_queue

find_pipe:

	cmp	word ptr ds:[si],0h
	jne	check_id
	cmp	word ptr ds:[si+2],0h
	je	make_pipe

check_id:

	lds	si,ds:[si]
	mov	ax,pipe$id
	cmp	ax,id
	je	done_create
	jne	find_pipe	

make_pipe:	

	mov	ax,words		; Get the buffer size
	shl	ax,1			; Make bytes
	add	ax,pipe_bytes		; Add in the control head
	shr	ax,4			; Now paras
	inc	ax			;  with slop

	push	ax
	call	_malloc
	add	sp,2

	and	dx,dx	   		; If there wasn't enough
	jne	init_pipe		;   ram return null
	and	ax,ax
	je	done_create

init_pipe:

	mov	ds,dx
	mov	si,ax

	mov	pipe$g_off,0
	mov	pipe$g_seg,0
	mov	pipe$p_off,0
	mov	pipe$p_seg,0
	mov	pipe$count,0
	mov	pipe$head,0
	mov	pipe$tail,0
	mov	cx,words
	mov	pipe$size,cx
	mov	cx,id
	mov	pipe$id,cx

	push	ds
	push	si

	mov	es,dx
	mov	bx,ax

	mov	si,seg pipe_queue
	mov	ds,si
	mov	si,offset pipe_queue
	call	enqueue

	pop	si
	pop	ds 

done_create:

	mov	dx,ds
	mov	ax,si

exit	create_pipe

;
;  test_pipe() is used to determine the number of used words in a pipe
;

which_pipe	equ	<dword ptr ss:[bp+4]>
c_sys_entry	test_pipe

	lds	si,which_pipe
	mov	ax,pipe$count

exit		test_pipe

;
;  pipe_free() is used to determine the number of free words in a pipe
;

c_sys_entry	pipe_free

	lds	si,which_pipe
	mov	ax,pipe$size
	sub	ax,pipe$count

exit		pipe_free

;
;  flush all data from the pipe ... and write waiters are unblocked ...
;

c_sys_entry	flush_pipe   

flush_loop:

	lds	si,which_pipe
	cmp	pipe$count,0
	je	flush_done

	mov	pipe$count,0
	mov	pipe$head,0
	mov	pipe$tail,0
	call	write_check
	jmp	flush_loop

flush_done: 
		
exit		flush_pipe

;
;  read_pipe(pipe,buffer,count) reads <count> bytes from <pipe>
;  into <buffer> ... bytes are taken out of the pipe first, if
;  there are not enough bytes in the pipe to satisfy the request
;  then the write queue is checked for processes blocked there 
;  waiting to write, if there are still not enough bytes, the
;  process is blocked on the read queue ...
;  

which_pipe	equ	<dword ptr ss:[bp+4]>
buffer		equ	<dword ptr ss:[bp+8]>

c_sys_entry	read_pipe,p_off,p_seg,b_off,b_seg,count

;
;  reads to null pipe return garbage ...
;
	cmp	p_off,0
	jne	read_pipe_start
	cmp	p_seg,0
	jne	read_pipe_start
	jmp	read_exit
;
;  'c' does not guarantee segment aligned pointers ... so to make life
;  easier, force the pointers to be segment aligned ...	(note: the
;  pipe pointer is since it is created by a kernel call so leave that
;  alone)
;

read_pipe_start:

	mov	ax,b_off
	and	b_off,0Fh
	shr	ax,4
	add	b_seg,ax		
;
;  point at the pipe and see what we can do ...	if there are characters
;  in the pipe, suck them out ... 
;

	lds	si,which_pipe
 
get_start:

	les	di,buffer		; es:[di] == buffer next
	mov	cx,count		; cx == buffer count

	call	pipe_get		; Get what ever we can
	jcxz	took_some		; Took all I could, check writers

;
;  If I didn't finish the read, check to see if there are waiting 
;  writers, if so let them stuff the pipe for me ...
;
	mov	count,cx
	mov	b_off,di
	mov	b_seg,es
	call	write_check

	cmp	pipe$count,0		; Any there now ??
	jne	get_start		; Yep, go get them


;	
;  if the request can not be satisified, the current pointers are
;  saved in the pcb then the process is blocked to be unblocked when
;  some subsequent write finishes the request ...
;


	pcb_pointer			; Set up pcb pointer

	mov	ax,count
	mov	pcb$scratch_0,ax
	mov	ax,b_off
	mov	pcb$scratch_1,ax
	mov	ax,b_seg
	mov	pcb$scratch_2,ax

	add	si,pipe_g_que
	call	context_switch
	jmp	read_done

;
;  If we took some and finished the request, check to see if we took
;  enough to free up a writer ...
;

took_some:

	call	write_check

;
;  exit here when the read is finshed ...
; 

read_done:

	lds	si,which_pipe 			; Return call remain size
	mov	ax,pipe$count

read_exit:

exit	read_pipe

;
;  write_pipe(pipe,buffer,count) writes <count> bytes from <buffer>
;  into <pipe>
;

c_sys_entry		write_pipe

;
; writes to null pipes throw away the data
;
	
	cmp	p_off,0
	jne	write_pipe_start
	cmp	p_seg,0
	jne	write_pipe_start
	jmp	write_exit

;
;  'c' does not guarantee segment aligned pointers ... so to make life
;  easier, force the pointers to be segment aligned ...	(note: the
;  pipe pointer is since it is created by a kernel call so leave that
;  alone)
;

write_pipe_start:

	mov	ax,b_off
	and	b_off,0Fh
	shr	ax,4
	add	b_seg,ax		
;
;  point at the pipe and see what we can do ...	if there any free
;  slots in the pipe, fill them in ...
;

	lds	si,which_pipe

put_start:

	les	di,buffer		; Point es:[di] at buffer
	mov	cx,count		; cx == count
	call	pipe_put		; put what ever
	jcxz	put_some		; if done, update any readers

;
;   if we didn't finish, attemp to get some room in the pipe by unblocking
;   any readers here ...
;

	mov	count,cx
	mov	b_off,di
	mov	b_seg,es

	call	read_check

	mov	ax,pipe$count		; See if the pipe is still full
	cmp	ax,pipe$size
	jne	put_start		; Nope, put in some more

;
; if there was no where to put the data, then block until some reader
; takes some ...
;

	pcb_pointer			; Set up pcb pointer

	mov	ax,count
	mov	pcb$scratch_0,ax
	mov	ax,b_off
	mov	pcb$scratch_1,ax
	mov	ax,b_seg
	mov	pcb$scratch_2,ax

	add	si,pipe_p_que
	call	context_switch
	jmp	write_done	 

;
;  if all that we had, then unblock all the readers that we can ...
;

put_some:

	call	read_check

;
;  We all exit here on writes ...
;

write_done:
write_exit:
 
exit		write_pipe


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;  write_check is a helper routine that is called when ever something
;  is taken from the read pipe ... this routine finishes any writes that
;  may have been block due to pipe full conditions
;
;   ds:[si] --> pipe structure 
;
;  return
;
;   ds:[si] --> pipe structure 
;
;  ss:[bp] is preserved ... all other registers destroyed


		public	write_check
write_check	proc	near

; 
;  See if there is a pcb blocked on the write queue ...	if not just
;  return ...
;
	cmp	pipe$p_off,0
	jnz	write_some
	cmp	pipe$p_seg,0
	jnz	write_some
	ret
;
;  If so, take what ever we can from this process ... note that es, must
;  be loaded last since es:[bx] is being used to point at the pcb
;

write_some:

	les	bx,pipe$put		; pcb pointer

	mov	cx,pcb$scratch_0	 ;   cx == count left 
	mov	di,pcb$scratch_1
	mov	es,pcb$scratch_2	 ;   es:[di] --> next char

	call	pipe_put
	jcxz	next_writer		; Done with this process ?	

;
;  pipe became full while attempting to empty this process, so just
;  restore the pointers in the pipe structure and pcb and return
;

	mov	ax,es
	les	bx,pipe$put
	mov	pcb$scratch_0,cx
	mov	pcb$scratch_1,di
	mov	pcb$scratch_2,ax
	ret
;
;  we emptied the process buffer, so unblock it and look for another
;  process ...
;

next_writer:

	push	ds
	push	si

	add	si,pipe_p_que
	call	dequeue
	lds	si,pcb$priority
	call	enqueue

	pop	si
	pop	ds
	jmp	write_check

write_check	endp

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;  read_check is a helper routine that is called when ever something
;  has been or needs to be written into the pipe.  This routine will
;  attempt to finish any reads that were blocked ...  call with ...
;
;    ds:[si] --> pipe structure
;
;  return
;
;    ds:[si] --> pipe structure
;
;  ss:[bp] preserved ... all others destroyed
;

		public	read_check
read_check	proc	near

; 
;  See if there is a pcb blocked on the read queue ...	if not just
;  return ...
;
	cmp	pipe$g_off,0
	jnz	read_some
	cmp	pipe$g_seg,0
	jnz	read_some
	ret
;
;  If so, take what ever we can from this process ... note that es, must
;  be loaded last since es:[bx] is being used to point at the pcb
;

read_some:

	les	bx,pipe$get		; pcb pointer

	mov	cx,pcb$scratch_0	;   cx == count left 
	mov	di,pcb$scratch_1
	mov	es,pcb$scratch_2	;   es:[di] --> next slot

	call	pipe_get
	jcxz	next_reader		; Done with this process ?	

;
;  pipe became full while attempting to empty this process, so just
;  restore the pointers in the pipe structure and pcb and return
;

	mov	ax,es
	les	bx,pipe$get
	mov	pcb$scratch_0,cx
	mov	pcb$scratch_1,di
	mov	pcb$scratch_2,ax
	ret

;
;  we emptied the process buffer, so unblock it and look for another
;  process ...
;

next_reader:

	push	ds
	push	si
	
	add	si,pipe_g_que
	call	dequeue
	lds	si,pcb$priority
	call	enqueue

	pop	si
	pop	ds
	jmp	read_check

read_check	endp


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;  pipe_put copys as many words as possible from writers buffer into
;  the pipe ... calll with ...
;
;    ds:[si] --> pipe structure
;    es:[di] --> buffer
;    cx == count
;
;  returns ....
;
;    ds:[si] --> pipe structure
;    es:[di] --> next byte in buffer
;    cx == remaining count
;
;  ss:[bp] preserved ... all other registers destroyed
;

		public	pipe_put
pipe_put	proc	near

	mov	bx,pipe$head
	mov	dx,pipe$size
	shl	dx,1

put_byte:

	mov	ax,pipe$size		; Make sure the pipe
	cmp	ax,pipe$count		;  gets no more than it's
	je	put_done		;    max   

	inc	pipe$count		; Say we have one more byte
	mov	ax,es:[di]		; grab a byte
	mov	pipe_buff[si][bx],ax	;   put it in pipe
	add	di,2			;     next buffer slot
	add	bx,2			;       next pipe slot
	cmp	bx,dx			;         wrap pipe ?
	jne	put_next		;           no
	xor	bx,bx			;            yes

put_next:

	loop	put_byte

put_done:

	mov	pipe$head,bx
	ret

pipe_put	endp

;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;  pipe_get gets as many wordss as possible from the pipe and places
;  them in the user buffer ... call with ...
;
;    ds:[si] --> pipe structure
;    es:[di] --> next user buffer byte
;    cx == number of bytes to move
;
;  return
;
;    ds:[si] --> pipe structure
;    es:[di] --> next user buffer bytes
;    cx == number of bytes left to move
;
;  ss:[bp] preserved ... all other registers destroyed ...
;
;

		public	pipe_get
pipe_get	proc	near

	mov	bx,pipe$tail
	mov	dx,pipe$size
	shl	dx,1

get_byte:

	cmp	pipe$count,0
	je	get_done

	dec	pipe$count		; I'm taking one ...
	mov	ax,pipe_buff[si][bx]	;   Now
	stosw				;     write it into the buffer
	add	bx,2			;      next pipe slot
	cmp	bx,dx			;        wrap the tail ??
	jne	get_next		; Nope
	xor	bx,bx			; Yep

get_next:

	loop	get_byte

get_done:

	mov	pipe$tail,bx
	ret

pipe_get	endp	

	end

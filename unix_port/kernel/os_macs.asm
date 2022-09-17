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
;*    File Name:	os_macs.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  os_macs.asm is the os include file ...
;*
;***********************************************************************
;*    Revision History:
;*
;-

	.model	small,syscall,nearstack
	.186
	.dosseg
	option offset:group


vector_size		equ	40h
pcb_size		equ	20h
pcb_count		equ	30h
isr_table_size		equ	<vector_size*3>
sem_table_size		equ	<vector_size*2>



;+
; pcb_defs define the packet offsets used in the pcb code
;- 

pcb_defs	macro

link		equ	0      		; Link/thread
priority	equ	4      		; Priority queue
saved_sp	equ	8      		; Offset to sp save area 
saved_ss	equ	10
saved_ds	equ	12
mem_off		equ	14		
mem_seg		equ	16
;
;  pcb scratch words are used by various kernel services when processes
;  are blocked ...
;
scratch_0	equ	18     		; Scratch
scratch_1	equ	20
scratch_2	equ	22
scratch_3	equ	24
scratch_4	equ	26
scratch_5	equ	28
scratch_6	equ	30

pcb$link	equ	<dword ptr es:[bx]>
pcb$priority	equ	<dword ptr es:[bx+priority]>
pcb$pque_off	equ	<word ptr es:[bx+priority]>
pcb$pque_seg	equ	<word ptr es:[bx+priority+2]>
pcb$saved_sp	equ	<word ptr es:[bx+saved_sp]>
pcb$saved_ss	equ	<word ptr es:[bx+saved_ss]>
pcb$saved_ds	equ	<word ptr es:[bx+saved_ds]>
pcb$mem_seg	equ	<word ptr es:[bx+mem_seg]>
pcb$mem_off	equ	<word ptr es:[bx+mem_off]>
pcb$scratch_0	equ	<word ptr es:[bx+scratch_0]>
pcb$scratch_1	equ	<word ptr es:[bx+scratch_1]>
pcb$scratch_2	equ	<word ptr es:[bx+scratch_2]>
pcb$scratch_3	equ	<word ptr es:[bx+scratch_3]>
pcb$scratch_4	equ	<word ptr es:[bx+scratch_4]>
pcb$scratch_5	equ	<word ptr es:[bx+scratch_5]>
pcb$scratch_6	equ	<word ptr es:[bx+scratch_6]>


	endm

;
;  things that routines needing access to process control
;  variables ...
;

process_defs	macro

	kernel_data

	.code

	extrn	schedule:near
	extrn	context_switch:near
	extrn	context_restore:near
	
		endm

kernel_data	macro

	.data

	extrn	ram_queue:dword
	extrn	ram_size:word
	extrn	run_list:word
	extrn	free_list:word
	extrn	current_process:dword
	extrn	pcbs:word
	extrn	conn_isr_table:word
	extrn	conn_sem_table:word
	extrn	timer_queue:dword
	extrn	clock_on:word
	extrn	low_time:word
	extrn	high_time:word
        extrn  _r186_io_base:word
        extrn  _gpio_image:word
	extrn	pipe_queue:word
	extrn	_kernel_share:word
	extrn	debug_data:word

end_stack	segment	para PUBLIC	'STACK'
		extrn	end_of_stack:word
end_stack	ends

		endm
	
memory_defs	macro

mem$pointer	equ	<dword ptr ds:[si]>
mem$off		equ	<word ptr ds:[si]>
mem$seg		equ	<word ptr ds:[si+2]>
mem$size	equ	<word ptr ds:[si+4]>

		endm



;+
;  semaphore_def is used to define the structure of a semaphore
;-

semaphore_defs	macro

	sem_value	equ	0
	sem_off		equ	2
	sem_seg		equ	4

sem$value	equ	<word ptr ds:[si]>
sem$queue	equ	<dword ptr ds:[si+sem_seg]>
sem$seg		equ	<word ptr ds:[si+sem_seg]>
sem$off		equ	<word ptr ds:[si+sem_off]>

		endm


;+
;  gate_defs is used to define the structure of a gate
;-

gate_defs	macro

	gate_value	equ	0
	gate_state	equ	2
	gate_b_off	equ	4
	gate_b_seg	equ	6
	gate_w_off	equ	8
	gate_w_seg	equ	10

gate$value	equ	<word ptr ds:[si]>
gate$state	equ	<word ptr ds:[si+gate_state]>
gate$block	equ	<dword ptr ds:[si+gate_b_off]>
gate$block_off	equ	<word ptr ds:[si+gate_b_off]>
gate$block_seg	equ	<word ptr ds:[si+gate_b_seg]>
gate$wait	equ	<dword ptr ds:[si+gate_w_off]>
gate$wait_off	equ	<word ptr ds:[si+gate_w_off]>
gate$wait_seg	equ	<word ptr ds:[si+gate_w_seg]>

	GATE_IS_OPEN	equ	0
	GATE_IS_CLOSED	equ	1

		endm
;+
;  ring_defs is used to define the structure of a ring
;-

ring_defs	macro

	ring_put_queue	equ	0
	ring_put_off	equ	0
	ring_put_seg	equ	2
	ring_get_queue	equ	4
	ring_get_off	equ	4
	ring_get_seg	equ	6
	ring_lock_queue	equ	8
	ring_lock_off	equ	8
	ring_lock_seg	equ	10
	ring_size	equ	12
	ring_head	equ	14
	ring_tail	equ	16
	ring_count	equ	18
	ring_key	equ	20
	ring_buff	equ	22
	ring_bytes	equ	22

ring$char	equ	<byte ptr ds:[si+bx+ring_buff]>

ring$put_queue	equ	<dword ptr ds:[si+ring_put]>
ring$put_off	equ	<word ptr ds:[si+ring_put_off]>
ring$put_seg	equ	<word ptr ds:[si+ring_put_seg]>

ring$get_queue	equ	<dword ptr ds:[si+ring_get]>
ring$get_off	equ	<word ptr ds:[si+ring_get_off]>
ring$get_seg	equ	<word ptr ds:[si+ring_get_seg]>

ring$lock_queue	equ	<dword ptr ds:[si+ring_lock]>
ring$lock_off	equ	<word ptr ds:[si+ring_lock_off]>
ring$lock_seg	equ	<word ptr ds:[si+ring_lock_seg]>

ring$size	equ	<word ptr ds:[si+ring_size]>
ring$head	equ	<word ptr ds:[si+ring_head]>
ring$tail	equ	<word ptr ds:[si+ring_tail]>
ring$count	equ	<word ptr ds:[si+ring_count]>
ring$key	equ	<word ptr ds:[si+ring_key]>

		endm




;+
;  pipe_defs is used to define a pipe structure ...
;-

pipe_defs	macro

	pipe_link	equ	0
	pipe_g_que	equ	4	; Get queue
	pipe_p_que	equ	8	; Put queue
	pipe_size	equ	12	; Size of pipe buffer
	pipe_id		equ	14	; ID of pipe
	pipe_count	equ	16	; Number of data in buffer
	pipe_head	equ	18	; Number of data in buffer
	pipe_tail	equ	20	; Number of data in buffer
	pipe_buff	equ	22	; Start of buffer

	pipe_bytes	equ	22	; Bytes excluding buffer size

pipe$link	equ	<dword ptr ds:[si+pipe_link]>
pipe$get	equ	<dword ptr ds:[si+pipe_g_que]>
pipe$g_off	equ	<word ptr ds:[si+pipe_g_que]>
pipe$g_seg	equ	<word ptr ds:[si+pipe_g_que+2]>
pipe$put	equ	<dword ptr ds:[si+pipe_p_que]>
pipe$p_off	equ	<word ptr ds:[si+pipe_p_que]>
pipe$p_seg	equ	<word ptr ds:[si+pipe_p_que+2]>
pipe$size	equ	<word ptr ds:[si+pipe_size]>
pipe$id		equ	<word ptr ds:[si+pipe_id]>
pipe$count	equ	<word ptr ds:[si+pipe_count]>
pipe$head	equ	<word ptr ds:[si+pipe_head]>
pipe$tail	equ	<word ptr ds:[si+pipe_tail]>
pipe$buff	equ	<word ptr ds:[si+pipe_buff]>

	endm
;
;  external call references ...
;

queue_defs	macro

	extrn	enqueue:near
	extrn	dequeue:near

		endm
;+
;  pcb_pointer is used to make es:[bx] point at the pcb ...
;-

pcb_pointer	macro

	mov	bx,seg current_process
	mov	es,bx
	mov	bx,offset current_process
	les	bx,es:[bx]

		endm


;+
;  kernel services from macro level ...
;-

ks_vector	equ	31H
shared_vector	equ	32H

kernel_entry	macro

	int	ks_vector

		endm


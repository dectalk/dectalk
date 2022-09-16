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
;*    File Name:	data.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  kernel data storage is grouped in a single module so that
;*  it is easier to place at link time ...
;*
;***********************************************************************
;*    Revision History:
;*
;-

	title	Kernel data storage 

	.xlist
	include os_macs.asm
	.list

	.data?


	public  ram_queue
	public	ram_size
	public	run_list
	public	free_list
	public	current_process
	public	pcbs
        public	conn_isr_table
        public	conn_sem_table
	public	timer_queue
	public	low_time
	public	high_time
	public	clock_on
        public  _r186_io_base
        public  _gpio_image
	public	pipe_queue
	public	debug_data
	public	clk_rate
	public	spc_ticks
	public	timer_ticks
;
;  ram_queue is used to be the head of the free ram list ...
;

debug_data	dw	4 dup (?)	; Debug storage 
 
ram_queue       dd      ?		; First free ram block 
ram_size	dw	?		;   and it's size
 

run_list	dd	8 dup (?)      	; Queues of jobs ready to run
free_list	dd	?	     	; Queue of free pcb
current_process	dd	?	     	; Pointer to running process

pipe_queue	dd	?		; Queue of allocated pipes
timer_queue   	dd	?  		; Queue of timed waiters
clock_on      	dw	?  		; Timer control word
low_time      	dw	?  		; Low timer and high
high_time     	dw	?  		; 


pcbs		dw	pcb_size*pcb_count	dup (?)

conn_isr_table	dw	isr_table_size dup (?)
conn_sem_table	dw	sem_table_size dup (?)

;
;  Now some global variables that need to be set at boot time ...
;

_r186_io_base	dw      ?               ; Base address for i/o registers	
_gpio_image	dw      ?               ; Copy of gpio latch ...
clk_rate	dw	?		; Default module clock rate
spc_ticks	dw	?		; Clock ticks for default spc time
timer_ticks	dw	?		; 10ms ticks value	
	
	end

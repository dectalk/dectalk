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
;*    File Name:	servs.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*  this file is an include file to the kernel.asm routines that disp.asm
;*  routine ... it correctly locates and adds kernel services as needed 
;*
;***********************************************************************
;*    Revision History:
;*
;* 25oct95	...tek		no gpio routines on dtpc2.
;* 30oct95	...tek		make port_in_186, port_out_186 lib calls.
;* 13dec95	...tek		merge dtex
;-

	service	block
	service	create_process
	service	kill_process
	service	load_task
	service	signal_semaphore
	service	wait_semaphore
	service	kernel_enqueue
	service	kernel_dequeue
	service	wait_queue
	service	signal_queue
	service	malloc
	service	free
	service	max_block
	service	create_pipe
	service	read_pipe
	service	write_pipe
	service	test_pipe
	service	flush_pipe
	service	connect_int
	service	connect_sem
	service	sleep
	service	start_clock
	service	stop_clock
	service	get_clock
	service	module_clocks
	service	spc_rate
IFNDEF DTPC2
IFNDEF DTEX
	service	set_gpio
	service	clr_gpio
ENDIF
ENDIF
;	service	port_out_186
;	service	port_in_186
	service	error_hang	
	service	pcdt_init
	service	create_ring
	service	get_ring
	service	put_ring
	service	flush_ring
	service	test_ring
	service	lock_ring
	service	unlock_ring
	service	get_share
	service	gate_open
	service	gate_init
	service	gate_close
	service	gate_entry
	service	gate_register
	service	gate_deregister
	service	adjust_priority

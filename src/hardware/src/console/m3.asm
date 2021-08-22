; +
; File: m3.asm
;
; Purpose: microPOST, main, protected mode operation
;
; Edits:
;
; 19jul93	...tek		initial for PD
; 03mar95	...tek		added panic console access.
; 				(ground pin 40, 42, or 43 of the uart
;				 and then apply power)
; 20mar96	...tek		document panic access (above)
; 17may95	...tek		remove lca_version_string.
; -
	title	microPOST main module
	.xlist
	include am00.inc
	include	am05.inc
	include	am07.inc
	include	amsegs32.inc
	include	limits.inc
	include	segass32.inc
	include	proto.inc
	include	com.inc
        include 82C315a.inc
	.list

;+
; **** WARNINGS:
;
; Linker and MASM bugs caused CS gdt[1] selector to be based at FFFF0000
; which means you'll have a great time with symbols. Use relative offsets
; or get bad code.
;
; DS selector gdt[2] is based at 00000000 and can access all of the 486
; protected mode address space
;
; Use CS gdt[3] for loadable code
;
; Use CS gdt[4] for code/data based on the ROM_CodeP segments
;
;-

	extrn	xon_flag:near,last_addr:near,addr_low:near,\
		addr_high:near,length_val:near,history_idx:near,chip_id:near
	extrn	load_adder:near, loader_error:near, load_offset:near
	extrn	history_len:near
	extrn	trace_value:near
	extrn	parse_top:near, cmd_talk:near
;	extrn	lca_version_string:near
	extrn	guard1:near,guard2:near,guard3:near,guard4:near,guard5:near
	extrn	guard6:near,guard7:near,guard8:near,guard9:near,guard10:near
	extrn	guard11:near,guard12:near,guard13:near,guard14:near
	extrn	symidx:near

ROM_CodeP	SEGMENT
	public	start_prot
	public	m_new_stuff
	public	check_loop
        public  do_prot_comset
        public  greet

	assume	ds:ROM_DataP
start_prot:
;+
; Init data segment registers
;-
	mov	ax,Rselector <2,0,0>	; gdt[2]; data segment, rpl 0
	mov	ds,ax
	mov	es,ax
	mov	fs,ax
	mov	gs,ax
	mov	ss,ax
	mov	esp,STACK_TOP		; set stack top

do_prot_comset:
	; set the console port up.

	invoke	Comset,COM_INIT_DEFAULT

	jmp	greet
;+
; local messages
;-

main_message	db	' . ',0
m_star		db	' * ',0

;+
; For the Help New command, the following text will be output. Edit as
; needed for code changes...
;-

m_new_stuff	db	CR,LF
	db	'New features/changes for this version of POST:',CR,LF
	db	'none.',CR,LF

	db	0		;	*MUST* be last

proc_dev_id	db	'[comp_id: ',0
proc_step_id	db	' rev_id: ',0
m_checksum	db	' ROM checksum: ',0
m_copyright	db	'Copyright (C)1993-1996 Digital Equipment Corporation - All Rights Reserved',0

greet:
	mov	eax,RSIGN			; signature
	mov	dword ptr guard1,eax		; mark
	mov	dword ptr guard2,eax		; mark
	mov	dword ptr guard3,eax		; mark
	mov	dword ptr guard4,eax		; mark
	mov	dword ptr guard5,eax		; mark
	mov	dword ptr guard6,eax		; mark
	mov	dword ptr guard7,eax		; mark
	mov	dword ptr guard8,eax		; mark
	mov	dword ptr guard9,eax		; mark
	mov	dword ptr guard10,eax		; mark
	mov	dword ptr guard11,eax		; mark
	mov	dword ptr guard12,eax		; mark
	mov	dword ptr guard13,eax		; mark
	mov	dword ptr guard14,eax		; mark
	mov	ebx,STACK_TOP

	mov	dword ptr ss:[ebx],eax		; mark in case of underflow
	sub	ebx,STACK_SIZE
	mov	dword ptr ss:[ebx],eax		; mark in case of overflow

	invoke	putstr_cs,addr main_message	; say hello
;;	invoke	putstr_cs,addr proc_dev_id	; start formatting chip id
;;	mov	eax,dword ptr chip_id		; and show proc id
;;	mov	ebx,eax
;;	movzx	eax,bh				; device id
;;	invoke	puthex4,eax
;;	invoke	putstr_cs,addr proc_step_id
;;	movzx	eax,bl				; device step
;;	invoke	puthex4,eax
;;	invoke	putc,']'

	invoke	putstr_cs,addr m_checksum

	mov	ebx,0ffff0000h			; base of rom
	xor	ecx,ecx				; loop counter
	mov	edx,ecx				; clear sum
	mov	edi,10000h/4			; count of dwords (loop limit)

check_loop:
@@:
	mov	eax,[ebx][ecx*4]		; get one dword
	add	dl,al				; add byte
	shr	eax,8
	add	dl,al
	shr	eax,8
	add	dl,al
	shr	eax,8
	add	dl,al
	inc	ecx				; bump loop counter
	cmp	ecx,edi
	jl	@b

	invoke	puthex2,edx			; write checksum

	invoke	crlf				; write copyright string
	invoke	putstr_cs,addr m_copyright

	; tek 3/25/96
	; move this up here..
;+ (tek) 
;       turn on the rest of memory (a0000-fffff)
;-
        write315        C_ABAXS, 0ffh
        write315        C_CAXS, 0ffh
        write315        C_DAXS, 0ffh
        write315        C_FEAXS, 0ffh
	; don't clear the last of memory if this is a reset (see below)
	; decide what to do.
	mov	edx,092h	; reset port. ('port A')
	in	al,dx
	and	al,1
	jnz	mem_noinit

	mov	edx,COMPORT+com_modem_status
	in	al,dx		; read the msr
	and	al,MSR_RI	; look at RI
	jnz	mem_noinit


	invoke	putstr_cs, addr m_star		; flag a clear..
	; clear out the last 64 k..
	mov	ebx,0f0000h			; first loc
	xor	ecx,ecx				; loop counter
	mov	edx,ecx				; clear sum
	mov	edi,08000h/4			; count of dwords (loop limit)

@@:
	mov	dword ptr [ebx][ecx*4],0   	; zilch one dword
	inc	ecx				; bump loop counter
	cmp	ecx,edi
	jl	@b



mem_noinit:


;+
; init some data structures
;-
	xor	eax,eax			; get a zero value
	mov	dword ptr history_idx,eax
	mov	dword ptr history_len,eax
	mov	dword ptr load_adder, eax 	; for the hex loader..
	mov	dword ptr load_offset, eax
	mov	dword ptr loader_error, eax
	mov	byte ptr xon_flag,al
	mov	dword ptr last_addr,eax
	mov	dword ptr addr_low,eax
	mov	dword ptr addr_high,eax
	mov	dword ptr symidx,eax
	mov	dword ptr trace_value,eax ; trace OFF (default)
	inc	eax			; get a one value
	mov	dword ptr length_val,eax
	invoke	init_history


	; now, we could have gotten here in one of two ways; we *could*
	; have powered-up, in which case we want to go directly to the
	; DECtalk code (with the non-verbose flag set); OR, we *could* have
	; taken a reset from the running code via port 092h. If we took
	; a reset, we want to go to the command parser instead of 
	; straight to the code.

	; we now have a trap door as well. Go peek at the RI input at the UART
	; and see if it's been grounded; if so, head for the console..

	mov	edx,COMPORT+com_modem_status
	in	al,dx		; read the msr
	and	al,MSR_RI	; look at RI
	jnz	parse_top
	; a magic cookie is at location 0x3FE. If this location is set
	; to 0xFEED, then the verbose debug printouts in the DECtalk code
	; will happen; if not, they won't. (that's taken care of in 
	; main.c)

	; decide what to do.
	mov	edx,092h	; reset port. ('port A')
	in	al,dx
	and	al,1
	jz	cold_start

	; ok, this was a console request...
	jmp	parse_top		; start monitor

cold_start:
	; clear out the reset bit
	in	al,dx
	and	al,0FEh
	out	dx,al

	; kill off verbosity..
	mov	ebx,03feh
	xor	ax,ax
	mov	[ebx],ax

	; and jump to the dectalk code
	jmp	cmd_talk


ROM_CodeP	ENDS
	end

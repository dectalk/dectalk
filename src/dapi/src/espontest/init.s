;;; Copyright ARM Ltd 2001. All rights reserved.
;
; This module performs ROM/RAM remapping (if required), initializes stack 
; pointers and interrupts for each mode, and finally branches to __main in 
; the C library (which eventually calls main()).
;
; On reset, the ARM core starts up in Supervisor (SVC) mode, in ARM state, 
; with IRQ and FIQ disabled.


        AREA    Init, CODE, READONLY
        
; --- Set up if ROM/RAM remapping required

;                GBLL ROM_RAM_REMAP
;ROM_RAM_REMAP   SETL {TRUE} ; change to {FALSE} if remapping not required


; --- ensure no functions that use semihosting SWIs are linked in from the C library

                IMPORT __use_no_semihosting_swi
        
; --- Standard definitions of mode bits and interrupt (I & F) flags in PSRs

Mode_USR        EQU     0x10
Mode_FIQ        EQU     0x11
Mode_IRQ        EQU     0x12
Mode_SVC        EQU     0x13
Mode_ABT        EQU     0x17
Mode_UND        EQU     0x1B
Mode_SYS        EQU     0x1F ; available on ARM Arch 4 and later

I_Bit           EQU     0x80 ; when I bit is set, IRQ is disabled
F_Bit           EQU     0x40 ; when F bit is set, FIQ is disabled


; --- System memory locations

CM_ctl_reg      EQU     0x1000000C          ; Address of Core Module Control Register
Remap_bit       EQU     0x04                ; Bit 2 is remap bit of CM_ctl

; --- Amount of memory (in bytes) allocated for stacks

Len_FIQ_Stack    EQU     0
Len_IRQ_Stack    EQU     256
Len_ABT_Stack    EQU     0
Len_UND_Stack    EQU     0
Len_SVC_Stack    EQU     1024
; Len_USR_Stack  EQU     1024

; Add lengths >0 for FIQ_Stack, ABT_Stack, UND_Stack if you need them.
; Offsets will be loaded as immediate values.
; Offsets must be 8 byte aligned.

Offset_FIQ_Stack         EQU     0
Offset_IRQ_Stack         EQU     Offset_FIQ_Stack + Len_FIQ_Stack
Offset_ABT_Stack         EQU     Offset_IRQ_Stack + Len_IRQ_Stack
Offset_UND_Stack         EQU     Offset_ABT_Stack + Len_ABT_Stack
Offset_SVC_Stack         EQU     Offset_UND_Stack + Len_UND_Stack
; Offset_USR_Stack       EQU     Offset_SVC_Stack + Len_SVC_Stack



        ENTRY

; --- Perform ROM/RAM remapping, if required
    IF :DEF: ROM_RAM_REMAP

; On reset, an aliased copy of ROM is at 0x0.
; Continue execution from 'real' ROM rather than aliased copy
        LDR     pc, =Instruct_2
        
Instruct_2        

; Remap by setting Remap bit of the CM_ctl register
        LDR     r1, =CM_ctl_reg
        LDR     r0, [r1]
        ORR     r0, r0, #Remap_bit
        STR     r0, [r1]
        
; RAM is now at 0x0.
; The exception vectors (in vectors.s) must be copied from ROM to the RAM
; The copying is done later by the C library code inside __main

    ENDIF

        EXPORT  Reset_Handler

Reset_Handler

; --- Initialize stack pointer registers

; Enter each mode in turn and set up the stack pointer

        IMPORT  top_of_stacks       ; defined in stack.s and located by scatter file
        LDR     r0, =top_of_stacks

;       MSR     CPSR_c, #Mode_FIQ:OR:I_Bit:OR:F_Bit ; No interrupts
;       SUB     sp, r0, #Offset_FIQ_Stack

        MSR     CPSR_c, #Mode_IRQ:OR:I_Bit:OR:F_Bit ; No interrupts
        SUB     sp, r0, #Offset_IRQ_Stack

;       MSR     CPSR_c, #Mode_ABT:OR:I_Bit:OR:F_Bit ; No interrupts
;       SUB     sp, r0, #Offset_ABT_Stack

;       MSR     CPSR_c, #Mode_UND:OR:I_Bit:OR:F_Bit ; No interrupts
;       SUB     sp, r0, #Offset_UND_Stack

        MSR     CPSR_c, #Mode_SVC:OR:I_Bit:OR:F_Bit ; No interrupts
        SUB     sp, r0, #Offset_SVC_Stack


; --- Initialize memory system
    IF :DEF: CACHE
        IMPORT  Clock_Speed     ; in CMclocks.s
        IMPORT  Cache_Init      ; in the core-specific files e.g. 940T.s
        BL      Clock_Speed
        BL      Cache_Init
    ENDIF


; --- Initialize critical IO devices
        ; ...


; --- Now change to User mode and set up User mode stack, if needed
;        MSR     CPSR_c, #Mode_USR:OR:I_Bit:OR:F_Bit ; No interrupts
;        SUB     sp, r0, #Offset_USR_Stack
                
        IMPORT  __main

; --- Now enter the C code
        B       __main   ; note use B not BL, because an application will never return this way

        END


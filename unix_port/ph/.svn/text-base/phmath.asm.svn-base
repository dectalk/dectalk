;+
;***********************************************************************
;*
;*                           Coryright (c)
;*    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
;*    File Name:	phmath.asm
;*    Author:
;*    Creation Date:
;*
;*    Functionality:
;*
;***********************************************************************
;*    Revision History:
;*
;* Rev  Who     Date            Description
;* ---  -----   -----------     -------------------------------------------- 
;
;  01 	CJL		05/11/1995 		Added copyright statement, moved from TS list to OK.
;  02 	MGS		03/30/1996 		Modified muldv mlsh1 mlsh2 mlsh3 to take arguments, not 
;				    			global variables.
;
;-

	NAME    KLMCH

	.xlist
	include os_macs.asm
	include c_macs.asm
	include 186_macs.asm
	.list

;+
; SYNTHESIZER TASK.
; MACHINE CODE.
; NOTE THAT THE OPERATOR ROUTINES
; LIKE "LLMUL" ARE PREFIXED BY THE CODE
; GROUP PREFIX STRING.
;
;-


	.data?

;	EXTRN   _arg1:WORD
;	EXTRN   _arg2:WORD
;	EXTRN   _arg3:WORD


	.code

	PUBLIC  _KLRMUL
	PUBLIC  _KLLMUL
	PUBLIC  _KLRDIV
	PUBLIC  _KLLDIV

;+
; LONG
; KLRMUL(A, B)
; LONG  A;
; LONG  B;
;
; LONG
; KLLMUL(A, P)
; LONG  A;
; LONG  *P;
;-

_KLXMUL PROC    NEAR
_KLRMUL LABEL   NEAR

	PUSH    SI                      ; STANDARD
	PUSH    DI                      ; C
	PUSH    BP                      ; FUNCTION
	MOV     BP, SP                  ; LINKAGE

	MOV     CX, WORD PTR [BP+14]    ; LOAD UP THE
	MOV     BX, WORD PTR [BP+12]    ; RIGHT HAND OPERAND AND
	JMP     SHORT L0                ; GO DO THE MULTIPLY.

_KLLMUL LABEL   NEAR

	PUSH    SI                      ; STANDARD
	PUSH    DI                      ; C
	PUSH    BP                      ; FUNCTION
	MOV     BP, SP                  ; LINKAGE

	MOV     BX, WORD PTR [BP+12]    ; BX=ADDRESS OF RIGHT OPERAND.
	MOV     CX, WORD PTR [BX+2]     ; LOAD UP THE
	MOV     BX, WORD PTR [BX]       ; RIGHT HAND OPERAND.

L0:     SUB     SI, SI                  ; ASSUME POSITIVE.
	OR      CX, CX                  ; RIGHT OPERAND LESS THAN ZERO ?
	JNS     SHORT L1                ; JUMP IF IT ISN'T.
	NEG     CX                      ; NEGATE THE
	NEG     BX                      ; RIGHT HAND OPERAND
	SBB     CX, 0                   ; OP THE MULTIPLY, AND
	INC     SI                      ; FLIP THE SIGN.

L1:     MOV     AX, WORD PTR [BP+10]    ; PICK UP MSW OF LEFT.
	OR      AX, AX                  ; IS THIS WORD LESS THEN ZERO ?
	JNS     SHORT L2                ; JUMP IF IT ISN'T.
	NEG     WORD PTR [BP+10]        ; NEGATE THE RIGHT OPERAND,
	NEG     WORD PTR [BP+8]         ; AS IT SITS ON
	SBB     WORD PTR [BP+10], 0     ; THE STACK, AND
	INC     SI                      ; FLIP THE SIGN FLAG.

L2:     MOV     AX, WORD PTR [BP+10]    ; HIGH HALF OF THE LEFT
	MUL     BX                      ; TIMES THE LOW HALF OF THE RIGHT.
	MOV     DI, AX                  ; SAVE LOW HALF OF PRODUCT.

	MOV     AX, WORD PTR [BP+8]     ; LOW HALF OF THE LEFT
	MUL     CX                      ; TIMES THE HIGH HALF OF THE RIGHT.
	ADD     DI, AX                  ; ACCUMULATE.

	MOV     AX, WORD PTR [BP+8]     ; LOW HALF OF THE LEFT
	MUL     BX                      ; TIMES THE LOW HALF OF THE RIGHT.
	ADD     DX, DI                  ; FINISH 32 BIT PRODUCT.

	SHR     SI, 1                   ; PULL SIGN FLAG TO CARRY, AND
	JNC     SHORT L3                ; JUMP IF RESULT IS POSITIVE.
	NEG     DX                      ; NEGATE
	NEG     AX                      ; THE FINAL
	SBB     DX, 0                   ; PRODUCT.

L3:     POP     BP                      ; STANDARD
	POP     DI                      ; C
	POP     SI                      ; FUNCTION
	RET                             ; RETURN.

_KLXMUL ENDP

;+
; LONG
; KLRDIV(A, B)
; LONG  A;
; LONG  B;
;
; LONG
; KLLDIV(A, P)
; LONG  A;
; LONG  *P;
;-

_KLXDIV PROC    NEAR
_KLRDIV LABEL   NEAR

	PUSH    SI                      ; STANDARD
	PUSH    DI                      ; C
	PUSH    BP                      ; FUNCTION
	MOV     BP, SP                  ; LINKAGE.

	MOV     DX, WORD PTR [BP+14]    ; SCOOP UP THE
	MOV     AX, WORD PTR [BP+12]    ; RIGHT OPERAND AND
	JMP     SHORT L4                ; FINISH IN COMMON CODE.

_KLLDIV LABEL   NEAR

	PUSH    SI                      ; STANDARD
	PUSH    DI                      ; C
	PUSH    BP                      ; FUNCTION
	MOV     BP, SP                  ; LINKAGE

	MOV     BX, WORD PTR [BP+12]    ; BX=POINTER TO RIGHT.
	MOV     DX, WORD PTR [BX+2]     ; GRAB THE
	MOV     AX, WORD PTR [BX]       ; RIGHT OPERAND.

L4:     SUB     BX, BX                  ; BX HOLDS THE SIGN FLAG
	OR      DX, DX                  ; IS THE DIVISOR LESS THEN ZERO ?
	JNS     SHORT L5                ; JUMP IF NOT.
	NEG     DX                      ; NEGATE
	NEG     AX                      ; THE
	SBB     DX, 0                   ; DIVISOR.
	INC     BX                      ; FLIP SIGN FLAG.

L5:     PUSH    DX                      ; PUSH THE DIVISOR ONTO
	PUSH    AX                      ; THE STACK (NOT ENOUGH REGISTERS)

	MOV     DX, WORD PTR [BP+10]    ; PICK UP THE
	MOV     AX, WORD PTR [BP+8]     ; DIVIDEND.
	OR      DX, DX                  ; IS IT LESS THEN ZERO ?
	JNS     SHORT L6                ; JUMP IF IT ISN'T.
	NEG     DX                      ; NEGATE
	NEG     AX                      ; THE
	SBB     DX, 0                   ; DIVIDEND.
	INC     BX                      ; FLIP SIGN FLAG.

L6:     SUB     SI, SI                  ; CLEAR OUT THE
	SUB     DI, DI                  ; TOP HALF OF THE "MQ"

	MOV     CX, 32                  ; CX IS THE STEP COUNTER.

L7:     SHL     AX, 1                   ; SHIFT
	RCL     DX, 1                   ; ONE
	RCL     DI, 1                   ; BIT
	RCL     SI, 1                   ; LEFT

	CMP     SI, WORD PTR [BP-2]     ; COMPARE DIVISOR HIGH
	JB      SHORT L9                ; NOPE.
	JA      SHORT L8                ; YES.
	CMP     DI, WORD PTR [BP-4]     ; COMPARE DIVISOR LOW.
	JB      SHORT L9                ; NOPE.

L8:     SUB     DI, WORD PTR [BP-4]     ; SUBTRACT IT OUT
	SBB     SI, WORD PTR [BP-2]     ; AND
	INC     AX                      ; ADD A BIT TO THE QUOTIENT.

L9:     LOOP    L7                      ; LOOP 32 TIMES.

	SHR     BX, 1                   ; CHECK THE SIGN FLAG.
	JNC     SHORT L10               ; POSITIVE.
	NEG     DX                      ; NEGATE
	NEG     AX                      ; THE
	SBB     DX, 0                   ; QUOTIENT.

L10:    MOV     SP, BP                  ; MOVE THE STACK BACK.
	POP     BP                      ; STANDARD
	POP     DI                      ; C
	POP     SI                      ; FUNCTION
	RET                             ; RETURN.

_KLXDIV ENDP


;+
; EXTERN INT    arg1, arg2, arg3;
;
; WITH ALL 32 BIT INTERMEDIATES.
;
; muldv()
; {
;       RETURN ((arg1*arg2) / arg3);
; }
;
; MULSH1()
; {
;       RETURN ((arg1*arg2) << 2);
; }
;
; MULSH2()
; {
;       RETURN ((arg1*arg2) << 3);
; }
;
; MULSH3()
; {
;       RETURN ((arg1*arg2) << 4);
; }
;
; FRAC4MUL(A, B)
; {
;       RETURN (((A*B)<<4) >> 16);
; }
;
; FRAC1MUL(A, B)
; {
;       RETURN (((A*B)<<1) >> 16);
; }
;-
	PUBLIC  _muldv
	PUBLIC  _mlsh1
	PUBLIC  _MLSH2
	PUBLIC  _MLSH3
	PUBLIC  _frac4mul
	PUBLIC  _FRAC1MUL

_muldv  PROC    NEAR

	MOV		BX,SP
	MOV     AX,WORD PTR [BX+2]
;	MOV     AX,_arg1
	IMUL	WORD PTR [BX+4]
;	IMUL    _arg2
	IDIV	WORD PTR [BX+6]
;	IDIV    _arg3
	RET

_muldv  ENDP

_mlsh1  PROC    NEAR

	MOV		BX,SP
	MOV     AX,WORD PTR [BX+2]
;	MOV     AX,_arg1
	IMUL	WORD PTR [BX+4]
;	IMUL    _arg2
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1          
	XCHG    AX,DX
	RET

_mlsh1  ENDP

_MLSH2  PROC    NEAR

	MOV		BX,SP
	MOV     AX,WORD PTR [BX+2]
;	MOV     AX,_arg1
	IMUL	WORD PTR [BX+4]
;	IMUL    _arg2
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	XCHG    AX,DX
	RET

_MLSH2  ENDP

_MLSH3  PROC    NEAR

	MOV		BX,SP
	MOV     AX,WORD PTR [BX+2]
;	MOV     AX,_arg1
	IMUL	WORD PTR [BX+4]
;	IMUL    _arg2
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	XCHG    AX,DX
	RET

_MLSH3  ENDP

_frac4mul PROC  NEAR

	MOV     BX,SP
	MOV     AX,WORD PTR [BX+2]
	IMUL    WORD PTR [BX+4]
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	SHL     AX,1
	RCL     DX,1
	XCHG    AX,DX
	RET

_frac4mul ENDP

_FRAC1MUL PROC  NEAR

	MOV     BX,SP
	MOV     AX,WORD PTR [BX+2]
	IMUL    WORD PTR [BX+4]
	SHL     AX,1
	RCL     DX,1
	XCHG    AX,DX
	RET

_FRAC1MUL ENDP


	END

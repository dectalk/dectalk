;+
; File: proto.inc
;
; Purpose: microPOST prototypes for functions
;
; Edits:
;
; 001 08-Dec-1991 RAO Creation
; 002 10-Dec-1991 RAO More protos
; 003 11-Dec-1991 RAO Add all the st module protos as well
; 004 14-Dec-1991 RAO Add xmitidle
; 005 16-Dec-1991 RAO Added strlen, comset
; 006 17-Dec-1991 RAO Added dmptokens
; 007 24-Dec-1991 RAO Added putdec16
; 008 03-Jan-1992 RAO Added getmsr, setmcr
; 009 08-Jan-1992 RAO Added bindec8,putdec8
; 010 09-Jan-1992 RAO Added show_bkpts
; 011 14-Jan-1992 RAO Added cls,decbin32,init_history,edit_history,add_history
; 012 15-Jan-1992 RAO Added erase_line, up_line
; 013 18-Jan-1992 RAO Added show_eflags, show_1_field, strncpy, stricmp
; 014 22-Jan-1992 RAO Added symlook
; 015 23-Jan-1992 RAO Added hexload,gethex2,gethex4
;-

add_history	PROTO	NEAR32 src:DWORD
addrprompt	PROTO	NEAR32 aval:DWORD

bindec8		PROTO	NEAR32 buffer:DWORD,value:DWORD
bindec16	PROTO	NEAR32 buffer:DWORD,value:DWORD
binhex32	PROTO	NEAR32 buffer:DWORD,value:DWORD
binhex16	PROTO	NEAR32 buffer:DWORD,value:DWORD
binhex8		PROTO	NEAR32 buffer:DWORD,value:DWORD

cls		PROTO	NEAR32
comset		PROTO	NEAR32 initword:WORD
crlf		PROTO	NEAR32

decbin32	PROTO	NEAR32 buffer:DWORD
dmptokens	PROTO	NEAR32

edit_history	PROTO	NEAR32
erase_line	PROTO	NEAR32

gethex2		PROTO	NEAR32 buffer:DWORD
gethex4		PROTO	NEAR32 buffer:DWORD

fetch_history	PROTO	NEAR32 target:DWORD,val:DWORD

getaddr_range	PROTO	NEAR32 lsize:DWORD
getc		PROTO	NEAR32
getcmdline	PROTO	NEAR32 target:DWORD
getcmd_pline	PROTO	NEAR32 target:DWORD,prompt:DWORD
getmsr		PROTO	NEAR32

hexbin32	PROTO	NEAR32 buffer:DWORD
hexload		PROTO	NEAR32 buffer:DWORD,val:DWORD

init_history	PROTO	NEAR32

kbhit		PROTO	NEAR32

nextnull	PROTO	NEAR32 arg1:DWORD

putc		PROTO	NEAR32 one_char:DWORD
putdec8		PROTO	NEAR32 aval:DWORD
putdec16	PROTO	NEAR32 aval:DWORD
puthex2		PROTO	NEAR32 aval:DWORD
puthex4		PROTO	NEAR32 aval:DWORD
puthex8		PROTO	NEAR32 aval:DWORD
putstr		PROTO	NEAR32 msgstr:DWORD
putstr_cs	PROTO	NEAR32 msgstr:DWORD

setmcr		PROTO	NEAR32 mcrbits:DWORD
show_bkpts	PROTO	NEAR32
show_eflags	PROTO	NEAR32 val:DWORD
show_1_field	PROTO	NEAR32 va1:DWORD,val2:DWORD
space		PROTO	NEAR32
stopme		PROTO	NEAR32
strcat		PROTO	NEAR32 arg1:DWORD,arg2:DWORD
strcmp		PROTO	NEAR32 arg1:DWORD,arg2:DWORD
strcmp_cs	PROTO	NEAR32 arg1:DWORD,arg2:DWORD
stricmp		PROTO	NEAR32 arg1:DWORD,arg2:DWORD
stricmp_cs	PROTO	NEAR32 arg1:DWORD,arg2:DWORD
strcpy		PROTO	NEAR32 arg1:DWORD,arg2:DWORD
strcpy_cs	PROTO	NEAR32 arg1:DWORD,arg2:DWORD
strlen		PROTO	NEAR32 arg1:DWORD
strncpy		PROTO	NEAR32 arg1:DWORD,arg2:DWORD,slen:DWORD
symlook		PROTO	NEAR32 sptr:DWORD
tokenize	PROTO	NEAR32 arg1:DWORD,arg2:DWORD
toupper		PROTO	NEAR32

up_line		PROTO	NEAR32

xmitidle	PROTO	NEAR32


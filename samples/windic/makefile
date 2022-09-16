# Nmake macros for building Windows 32-Bit apps

!IFDEF claxp
Compiler=claxp
cuserdefs = $(cuserdefs) -Ox
!ELSE
Compiler=acc
!ENDIF

!include <ntwin32.mak>

all: windic.exe

# Update the object files if necessary


!IFDEF claxp
windic.obj: windic.c windic.h
    $(cc) $(cflags) $(cvars) windic.c
usedic.obj: usedic.c 
    $(cc) $(cflags) $(cvars) /I \work\us\dtalk44\sdk\include usedic.c
!ELSE
windic.obj: windic.c windic.h
    $(cc) $(cflags) $(cvars) windic.c
usedic.obj: usedic.c 
    $(cc) $(cflags) $(cvars) /I \work\us\dtalk44\sdk\include usedic.c

#    a2coff dtsample.o
#    rename dtsample.o dtsample.obj
!ENDIF

# Update the executable file if necessary.
# If so, add the resource back in.

windic.exe: windic.obj usedic.obj dectalk.lib  windic.rbj
    $(link) $(guiflags) -out:windic.exe windic.obj usedic.obj dectalk.lib $(guilibs) shell32.lib windic.rbj

windic.res: windic.rc windic.h
    $(rc) $(rcvars) -r windic.rc

windic.rbj: windic.res
    cvtres -$(CPU) windic.res -o windic.rbj

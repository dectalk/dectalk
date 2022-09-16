# Nmake macros for building Windows 32-Bit apps

!IFDEF claxp
Compiler=claxp
cuserdefs = $(cuserdefs) -Ox
!ELSE
Compiler=acc
!ENDIF

!include <ntwin32.mak>

all: dtsample.exe

# Update the object files if necessary


!IFDEF claxp
dtsample.obj: dtsample.c
    $(cc) $(cflags) $(cvars) dtsample.c
!ELSE
dtsample.obj: dtsample.c
    $(cc) $(cflags) $(cvars) dtsample.c
#    a2coff dtsample.o
#    rename dtsample.o dtsample.obj
!ENDIF

# Update the resources if necessary

dtsample.res: dtsample.rc dtsample.h
    $(rc) $(rcvars) -r dtsample.rc

dtsample.rbj: dtsample.res
    cvtres -$(CPU) dtsample.res -o dtsample.rbj

# Update the executable file if necessary.
# If so, add the resource back in.

dtsample.exe: dtsample.obj dectalk.lib dtsample.rbj
    $(link) $(guiflags) -out:dtsample.exe dtsample.obj dectalk.lib dtsample.rbj $(guilibs) shell32.lib

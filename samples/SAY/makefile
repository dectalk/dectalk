# Nmake macros for building Windows 32-Bit apps

!include <ntwin32.mak>

all: say.exe

# Update the object files if necessary

say.obj: say.c
    $(cc) $(cflags) $(cvars) -Oi -Ob1 -Op-  say.c

# Update the resources if necessary

#say.res: say.rc say.h
#    $(rc) $(rcvars) -r say.rc

#say.rbj: say.res
#    cvtres -$(CPU) say.res -o say.rbj

# Update the executable file if necessary.
# If so, add the resource back in.

say.exe: say.obj dectalk.lib
    $(link) $(conflags) -out:say.exe say.obj dectalk.lib $(conlibsmt) shell32.lib

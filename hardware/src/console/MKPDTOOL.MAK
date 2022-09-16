#
# make the tools used to build the DECtalk Express ROM
#
!INCLUDE dtpcmacr.mak

all: fixup.exe mkpdrom.exe bin2flr.exe getver.exe
	
fixup.exe : fixup.c 
        cl -AC fixup.c

mkpdrom.exe : mkpdrom.c loader.h implode.h pdrom.h implode.lib
        cl -AC -c mkpdrom.c
        link mkpdrom.obj,,,implode.lib;

bin2flr.exe : bin2flr.c exes.h
        cl -AC bin2flr.c

getver.exe : getver.c version.h
        cl -AC getver.c

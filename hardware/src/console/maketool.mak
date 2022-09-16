#
# make the tools used in the express rom build..
#
all : mkdate.exe exp2flr.exe eh.exe




mkdate.exe : mkdate.c 
	cl -AC mkdate.c


exp2flr.exe : exp2flr.c exes.h
	cl -AC exp2flr.c


eh.exe : eh.c eh.h
	cl -AC eh.c

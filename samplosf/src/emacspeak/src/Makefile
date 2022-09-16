
CC=cc
RM=rm -f
LN=ln

API_DIR=../../../../dapi/src/api
INCLUDE_DIR=../../../../dapi/src/include


INCLUDES= -I$(API_DIR) -I$(INCLUDE_DIR)
CDEBUGFLAGS=-O2 -Olimit 2000 -threads
LINKFLAGS = -O2 -Olimit 2000 -threads

EMACSPEAK_SRC=dtk.c phoneme.c mme.c queue.c

EMACSPEAK_OBJ=$(EMACSPEAK_SRC:.c=.o)

LIBS= -lmme -lttsmme -ltts -llmf -lpthreads -lc_r -lmach -lm -lrt

all:links

links:dtk-mme
	$(LN) -fs `pwd`/$? ../emacsMacros

dtk-mme:$(EMACSPEAK_OBJ)
	$(CC) -o $@ $? $(LINKFLAGS) $(LIBS)

.c.o:
	$(CC) -c $(CDEBUGFLAGS) $(INCLUDES) -o $@ $<

clean:
	$(RM) *.o dtk-mme *~ "#"* core


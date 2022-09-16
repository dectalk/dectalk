
CC=cc
RM=rm -f
LD=ld

INLCUDE_DIR=../../../dapi/src/include
API_DIR=    ../../../dapi/src/api
MME_DIR=    /usr/include/mme

INCLUDES= -I$(INLCUDE_DIR) -I$(API_DIR) -I$(MME_DIR)

CDEBUGFLAGS = $(DEBUG_FLAGS) -std0 -threads
LINKFLAGS=  $(DEBUG_FLAGS) -threads

CFLAGS= $(INCLUDES) $(CDEBUGFLAGS) 

DT_LIB= -lttsmme

LIBS=-lmme -ldnet_stub -lpthreads -lc_r -lmach -lrt -llmf

XLIBS= -lMrm -lXm -lXt -lXext -lX11 


SPEAK_SRCS = speak.c loadgif.o

SPEAK_OBJS= $(OUTPUT_DIR)/link/speak.o $(OUTPUT_DIR)/link/loadgif.o

all: $(OUTPUT_DIR)/speak $(OUTPUT_DIR)/speak.uid

$(OUTPUT_DIR)/speak:$(SPEAK_OBJS) ../../../dtalkml/build/$(OS_VERSION)/$(ML_OUT)/libttsmme.so
	$(RM) $@
	$(CC) -o $@ $(SPEAK_OBJS) $(LINKFLAGS) $(XLIBS) $(DT_LIB) $(LIBS)

$(OUTPUT_DIR)/speak.uid:speak.uil
	/usr/bin/X11/uil -o $@ $?

$(OUTPUT_DIR)/link/speak.o:speak.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/link/loadgif.o:loadgif.c
	$(CC) -c $(CFLAGS) -o $@ $?

clean:
	$(RM) $(OUTOUT_DIR)/link/*.o
	$(RM) $(OUTOUT_DIR)/speak
	$(RM) $(OUTOUT_DIR)/core
	$(RM) core *~
	





#
#
# 001 MGS 05/22/1998 added include for dectalkf.h
#

CC=cc
RM=rm -f
LD=ld

INLCUDE_DIR=../../../dapi/src/include
API_DIR=    ../../../dapi/src/api
NT_DIR=     ../../../dapi/src/nt
MME_DIR=    /usr/include/mme
DECTALKF_DIR = ../../../

INCLUDES= -I$(INLCUDE_DIR) -I$(API_DIR) -I$(NT_DIR) -I$(MME_DIR) -I$(DECTALKF_DIR)

CDEBUGFLAGS = $(DEBUG_FLAGS) -std0 -threads
LINKFLAGS=  $(DEBUG_FLAGS) -threads

CFLAGS= $(INCLUDES) $(CDEBUGFLAGS) -D$(LANGUAGE)

DT_LIB= -lttsmme

LIBS=-lmme -ldnet_stub -lpthreads -lc_r -lmach -lrt -llmf

XLIBS= -lMrm -lXm -lXt -lXext -lX11 


WINDICT_SRCS = windict.c loadgif.o compile_dict.c

WINDICT_OBJS= $(OUTPUT_DIR)/link/windict.o $(OUTPUT_DIR)/link/loadgif.o \
              $(OUTPUT_DIR)/link/compile_dict.o

all: $(OUTPUT_DIR)/windict $(OUTPUT_DIR)/windict.uid

$(OUTPUT_DIR)/windict:$(WINDICT_OBJS) $(DT_LIB_DIR)/libttsmme_$(LANG_CODE).so
	$(RM) $@
	$(CC) -o $@ $(WINDICT_OBJS) $(LINKFLAGS) $(XLIBS) $(DT_LIB) $(LIBS)

$(OUTPUT_DIR)/windict.uid:windict.uil
	/usr/bin/X11/uil -o $@ $?

$(OUTPUT_DIR)/link/windict.o:windict.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/link/loadgif.o:../speak/loadgif.c
	$(CC) -c $(CFLAGS) -o $@ $?

$(OUTPUT_DIR)/link/compile_dict.o:compile_dict.c
	$(CC) -c $(CFLAGS) -o $@ $?


clean:
	$(RM) $(OUTPUT_DIR)/link/*.o
	$(RM) $(OUTPUT_DIR)/windict
	$(RM) $(OUTPUT_DIR)/core
	$(RM) core *~


